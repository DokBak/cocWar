import 'dart:math' as math;

import 'package:coc_models/coc_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api_client.dart';
import '../../core/layout.dart';
import '../../core/saved_tag.dart';
import '../../l10n/app_localizations.dart';
import '../copyable_tag.dart';
import '../error_view.dart';
import '../favorite_button.dart';
import '../home/history_info.dart' show leagueIconsProvider;
import '../language_button.dart';
import '../player/game_assets.dart';
import '../player/player_stats.dart' show formatCount;
import '../remote_image.dart';
import '../player/player_page.dart';
import '../player/role_label.dart';
import '../pagination_bar.dart';
import '../war/war_info_button.dart';
import 'capital_raid_providers.dart';
import 'clan_badge.dart';
import 'clan_members.dart';
import 'clan_providers.dart';
import 'war_log_tile.dart';

class ClanPage extends ConsumerStatefulWidget {
  const ClanPage({super.key, required this.tag});

  final String tag;

  @override
  ConsumerState<ClanPage> createState() => _ClanPageState();
}

class _ClanPageState extends ConsumerState<ClanPage> {
  /// 클랜 본문의 탭·페이지 상태를 나란히 보기를 켜고 끌 때도 유지하기 위한 키.
  final _bodyKey = GlobalKey<_ClanBodyState>();

  /// 확장(나란히 보기) 버튼이 켜져 있는지.
  bool _split = false;

  /// 나란히 보기에서 오른쪽 창에 보여주는 멤버의 태그.
  String? _selected;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tag = widget.tag;
    final clan = ref.watch(clanProvider(tag));
    final wide = MediaQuery.sizeOf(context).width >= splitViewMinWidth;
    final split = _split && wide;

    return Scaffold(
      appBar: AppBar(
        title: Text(clan.value?.name ?? tag),
        actions: [
          const LanguageButton(),
          FavoriteButton(tag: SavedTag(TagKind.clan, tag)),
        ],
      ),
      body: clan.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ErrorView(
          error: e,
          onRetry: () => ref.invalidate(clanProvider(tag)),
        ),
        data: (c) {
          final body = _ClanBody(
            key: _bodyKey,
            tag: tag,
            clan: c,
            splitView: split,
            // 확장 버튼은 클랜 헤더 오른쪽 위에 둔다. 좁은 화면에서는 버튼이 없다(null).
            onToggleSplit: wide ? () => setState(() => _split = !_split) : null,
            splitActive: _split,
            selectedTag: _selected,
            onSelectMember: (t) => setState(() => _selected = t),
          );
          if (!split) return body;
          // 클랜 창과 프로필 창은 전체 화면일 때와 같은 폭(contentMaxWidth)이다.
          return Center(
            child: SizedBox(
              width: contentMaxWidth * 2 + splitDividerWidth,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(width: contentMaxWidth, child: body),
                  const VerticalDivider(width: splitDividerWidth),
                  SizedBox(
                    width: contentMaxWidth,
                    child: _selected == null
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Text(
                                l10n.selectMemberHint,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        // 멤버가 바뀌면 프로필의 탭 선택 등도 처음 상태로 시작한다.
                        : PlayerProfileView(
                            key: ValueKey(_selected),
                            tag: _selected!,
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

enum _ClanTab { members, warLog }

class _ClanBody extends ConsumerStatefulWidget {
  const _ClanBody({
    super.key,
    required this.tag,
    required this.clan,
    this.splitView = false,
    this.selectedTag,
    this.onSelectMember,
    this.onToggleSplit,
    this.splitActive = false,
  });

  final String tag;
  final Clan clan;

  /// 나란히 보기 중이면 멤버를 눌러도 화면을 이동하지 않고 [onSelectMember]로 알린다.
  final bool splitView;
  final String? selectedTag;
  final ValueChanged<String>? onSelectMember;

  /// 헤더의 확장(나란히 보기) 버튼. null이면 버튼을 숨긴다.
  final VoidCallback? onToggleSplit;
  final bool splitActive;

  @override
  ConsumerState<_ClanBody> createState() => _ClanBodyState();
}

class _ClanBodyState extends ConsumerState<_ClanBody> {
  final _logTitleKey = GlobalKey();

  /// 현재 전쟁 로그 페이지 (1부터).
  int _page = 1;

  _ClanTab _tab = _ClanTab.members;

  @override
  void didUpdateWidget(covariant _ClanBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 나란히 보기는 멤버를 훑어보려는 기능이라, 켜면 멤버 탭으로 바꿔 준다.
    if (widget.splitView && !oldWidget.splitView) _tab = _ClanTab.members;
  }

  Future<void> _refresh() async {
    setState(() => _page = 1);
    ref.invalidate(clanProvider(widget.tag));
    ref.invalidate(latestRaidProvider(widget.tag));
    // 전쟁 로그는 그 탭을 보고 있을 때만 받는다.
    if (widget.clan.isWarLogPublic != false && _tab == _ClanTab.warLog) {
      ref.invalidate(warLogProvider(widget.tag));
      await ref
          .read(warLogProvider(widget.tag).future)
          .then<void>((_) {}, onError: (_) {});
    }
  }

  List<Widget> _memberTiles(AppLocalizations l10n) {
    final members = sortMembers(widget.clan.memberList);
    if (members.isEmpty) return [_Notice(text: l10n.noItems)];

    // 가장 최근 캐피탈 레이드 시즌. 없으면(오류·비공개 포함) 공격권 칸을 그리지 않는다.
    final season = ref.watch(latestRaidProvider(widget.tag)).value;
    final raid = season != null && raidMembersAvailable(season) ? season : null;

    return [
      if (raid != null) _RaidCaption(season: raid),
      for (final m in members)
        _MemberTile(
          member: m,
          raid: raid == null ? null : raidUsage(raid, m.tag),
          selected:
              widget.splitView && m.tag != null && m.tag == widget.selectedTag,
          onTap: m.tag == null
              ? null
              : () {
                  if (widget.splitView) {
                    widget.onSelectMember?.call(m.tag!);
                  } else {
                    context.push(SavedTag(TagKind.player, m.tag!).location);
                  }
                },
        ),
    ];
  }

  void _goTo(int page) {
    setState(() => _page = page);
    // 목록이 짧아지거나 길어져도 새 페이지의 첫 항목이 보이도록 제목 위치로 이동한다.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = _logTitleKey.currentContext;
      if (ctx != null && ctx.mounted) {
        Scrollable.ensureVisible(
          ctx,
          duration: const Duration(milliseconds: 200),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // 비공개로 알려진 로그는 요청하지 않는다.
    final logPublic = widget.clan.isWarLogPublic != false;
    final log = logPublic && _tab == _ClanTab.warLog
        ? ref.watch(warLogProvider(widget.tag))
        : null;
    final items = log?.value ?? const <ClanWarLogEntry>[];
    final totalPages = math.max(1, (items.length / warLogPageSize).ceil());
    final page = math.min(_page, totalPages);
    final visible = items
        .skip((page - 1) * warLogPageSize)
        .take(warLogPageSize);

    // 진행 중인 클랜전이 있으면 창 아래 가운데에 "클랜전 정보 보기" 버튼이 뜬다.
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: _refresh,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: contentMaxWidth),
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: [
                  _ClanHeader(
                    clan: widget.clan,
                    onToggleSplit: widget.onToggleSplit,
                    splitActive: widget.splitActive,
                  ),
                  const SizedBox(height: 16),
                  SegmentedButton<_ClanTab>(
                    key: _logTitleKey,
                    segments: [
                      ButtonSegment(
                        value: _ClanTab.members,
                        label: Text(l10n.tabMembers),
                        icon: const Icon(Icons.groups_outlined),
                      ),
                      ButtonSegment(
                        value: _ClanTab.warLog,
                        label: Text(l10n.warLog),
                        icon: const Icon(Icons.history),
                      ),
                    ],
                    selected: {_tab},
                    onSelectionChanged: (s) => setState(() => _tab = s.first),
                  ),
                  const SizedBox(height: 8),
                  if (_tab == _ClanTab.members)
                    ..._memberTiles(l10n)
                  else if (!logPublic)
                    _Notice(text: l10n.errorPrivateLog)
                  else if (log == null || log.isLoading && !log.hasValue)
                    const Padding(
                      padding: EdgeInsets.all(24),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (log.hasError && !log.hasValue)
                    _isPrivate(log.error!)
                        ? _Notice(text: l10n.errorPrivateLog)
                        : ErrorView(
                            error: log.error!,
                            onRetry: () =>
                                ref.invalidate(warLogProvider(widget.tag)),
                          )
                  else if (items.isEmpty)
                    _Notice(text: l10n.noWarLog)
                  else ...[
                    for (final e in visible) WarLogTile(entry: e),
                    const SizedBox(height: 12),
                    PaginationBar(
                      current: page,
                      total: totalPages,
                      onChanged: _goTo,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
        WarInfoButton(clanTag: widget.tag),
      ],
    );
  }
}

/// 카드 안쪽 너비가 이 값 이상이면 공격권 칸을 카드 가로 정중앙에 둔다.
/// 더 좁으면 이름이 너무 좁아지므로, 트로피·기부 열을 고정 너비로 두어 공격권 열이 줄마다 정렬되게 한다.
const _centerRaidMinWidth = 448.0;

/// 좁은 화면에서 트로피·기부 열의 고정 너비.
const _statsFixedWidth = 104.0;

/// 멤버 한 줄: `[이름·직책·타운홀] [캐피탈 공격권] [트로피·기부]`.
class _MemberTile extends StatelessWidget {
  const _MemberTile({
    required this.member,
    this.onTap,
    this.selected = false,
    this.raid,
  });

  final ClanMember member;
  final VoidCallback? onTap;

  /// 나란히 보기에서 오른쪽 창에 열려 있는 멤버.
  final bool selected;

  /// 캐피탈 레이드 공격권 사용 현황. null이면 이 칸을 그리지 않는다.
  final RaidUsage? raid;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurfaceVariant;
    final tag = member.tag;
    final details = [
      ?roleLabel(l10n, member.role),
      if (member.townHallLevel != null) l10n.townHallN(member.townHallLevel!),
    ].join(' · ');

    final identity = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          member.name ?? tag ?? '-',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyLarge,
        ),
        Text(
          details,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyMedium?.copyWith(color: muted),
        ),
      ],
    );
    final stats = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.emoji_events_outlined, size: 16),
            const SizedBox(width: 4),
            Text('${member.trophies ?? '-'}'),
          ],
        ),
        Text(
          '↑${member.donations ?? 0}  ↓${member.donationsReceived ?? 0}',
          style: theme.textTheme.bodySmall,
        ),
      ],
    );

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: selected ? theme.colorScheme.primaryContainer : null,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final raid = this.raid;
              if (raid == null) {
                return Row(
                  children: [
                    Expanded(child: identity),
                    stats,
                  ],
                );
              }
              final cell = _RaidUsageCell(usage: raid);
              if (constraints.maxWidth >= _centerRaidMinWidth) {
                // 이름 영역과 트로피·기부 영역을 같은 비율(flex 1)로 나눠, 공격권 칸이 트로피·기부
                // 글자 길이와 상관없이 항상 카드 가로 정중앙에 오게 한다.
                return Row(
                  children: [
                    Expanded(child: identity),
                    cell,
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: stats,
                      ),
                    ),
                  ],
                );
              }
              return Row(
                children: [
                  Expanded(child: identity),
                  cell,
                  SizedBox(
                    width: _statsFixedWidth,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerRight,
                      child: stats,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/// 이름과 트로피 사이 가운데에 놓이는 캐피탈 공격권 칸 (`6/6`).
/// 모두 사용하면 초록, 하나도 쓰지 않았으면 흐리게 보인다.
class _RaidUsageCell extends StatelessWidget {
  const _RaidUsageCell({required this.usage});

  final RaidUsage usage;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final color = usage.complete
        ? const Color(0xFF43A047)
        : usage.none
        ? theme.colorScheme.outline
        : null;
    return Tooltip(
      message: l10n.capitalAttacksTooltip(usage.used, usage.total),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        // 최소 너비로 줄을 맞추되, 글자가 커지면 내용에 맞게 늘어난다(넘치지 않도록 고정 너비를 쓰지 않는다).
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 56),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_balance, size: 15, color: color),
              const SizedBox(width: 4),
              Text(
                '${usage.used}/${usage.total}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 멤버 목록 위의 안내: 어느 레이드 시즌의 공격권인지(`캐피탈 레이드 · 10/9~10/12 · 종료`).
class _RaidCaption extends StatelessWidget {
  const _RaidCaption({required this.season});

  final CapitalRaidSeason season;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    String md(DateTime d) => '${d.toLocal().month}/${d.toLocal().day}';
    final start = season.startTime;
    final end = season.endTime;
    final period = start != null && end != null
        ? '${md(start)}~${md(end)}'
        : '';
    final state = season.state == RaidState.ongoing
        ? l10n.raidStateOngoing
        : l10n.raidStateEnded;
    // 공격권 칸이 카드 가로 정중앙에 있으므로, 기간 안내도 같은 축(목록 가운데)에 둔다.
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Center(
        child: Text(
          l10n.capitalRaidCaption(period, state),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall
              ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
      ),
    );
  }
}

bool _isPrivate(Object e) =>
    e is ApiException && e.kind == ApiErrorKind.privateLog;

class _Notice extends StatelessWidget {
  const _Notice({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 24),
    child: Text(text, textAlign: TextAlign.center),
  );
}

/// 나란히 보기 토글. 켜지면 주색으로 채우고 꺼지면 테두리만 그려서 상태가 한눈에 구분된다.
class _SplitToggle extends StatelessWidget {
  const _SplitToggle({
    required this.active,
    required this.tooltip,
    required this.onPressed,
  });

  final bool active;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Semantics(
    toggled: active,
    button: true,
    child: active
        ? IconButton.filled(
            tooltip: tooltip,
            isSelected: true,
            icon: const Icon(Icons.view_sidebar),
            onPressed: onPressed,
          )
        : IconButton.outlined(
            tooltip: tooltip,
            isSelected: false,
            icon: const Icon(Icons.view_sidebar_outlined),
            onPressed: onPressed,
          ),
  );
}

/// 헤더 안쪽 폭이 이보다 좁으면 리그 이름을 빼고 아이콘과 숫자만 보여 준다.
const _compactHeaderWidth = 420.0;

/// 헤더의 클랜전 리그·캐피탈 리그 두 줄 (오른쪽 정렬). 정보가 없는 줄은 그리지 않는다.
class _HeaderLeagues extends ConsumerWidget {
  const _HeaderLeagues({required this.clan, required this.compact});

  final Clan clan;
  final bool compact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final style = theme.textTheme.bodySmall;

    final warName = clan.warLeague?.name;
    final capitalName = clan.capitalLeague?.name;
    final capitalPoints = clan.clanCapitalPoints;
    if (warName == null && capitalName == null && capitalPoints == null) {
      return const SizedBox.shrink();
    }

    // 클랜전 리그: 이름이 같은 기존 리그(`/leagues`)의 아이콘.
    final warIcon = warName == null
        ? null
        : ref.watch(leagueIconsProvider).value?[warName];
    // 캐피탈 리그: 로컬에 받아 둔 이미지(없으면 대체 아이콘).
    final assets = ref.watch(gameAssetsProvider).value ?? const <String>{};
    final capitalAsset = capitalLeagueAsset(assets, capitalName);

    Widget line({
      required String tooltip,
      required Widget icon,
      required String text,
    }) => Tooltip(
      message: tooltip,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            if (text.isNotEmpty) ...[
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: style,
                ),
              ),
            ],
          ],
        ),
      ),
    );

    final trophies = capitalPoints == null ? null : formatCount(capitalPoints);
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 4),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 200),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (warName != null)
              line(
                tooltip: l10n.warLeagueTooltip(warName),
                icon: RemoteImage(
                  url: warIcon,
                  size: 24,
                  fallback: Icons.military_tech,
                ),
                text: compact ? '' : warName,
              ),
            if (capitalName != null || trophies != null)
              line(
                tooltip: l10n.capitalLeagueTooltip(
                  capitalName ?? '-',
                  trophies ?? '-',
                ),
                icon: SizedBox(
                  width: 24,
                  height: 24,
                  child: capitalAsset == null
                      ? Icon(
                          Icons.account_balance,
                          size: 20,
                          color: theme.colorScheme.onSurfaceVariant,
                        )
                      : Image.asset(
                          capitalAsset,
                          fit: BoxFit.contain,
                          cacheWidth: 72,
                          errorBuilder: (_, _, _) =>
                              const Icon(Icons.account_balance, size: 20),
                        ),
                ),
                text: compact
                    ? (trophies ?? '')
                    : [?capitalName, ?trophies].join(' · '),
              ),
          ],
        ),
      ),
    );
  }
}

class _ClanHeader extends StatelessWidget {
  const _ClanHeader({
    required this.clan,
    this.onToggleSplit,
    this.splitActive = false,
  });

  final Clan clan;

  /// 확장(나란히 보기) 버튼. null이면 보이지 않는다.
  final VoidCallback? onToggleSplit;
  final bool splitActive;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    Widget stat(String label, int? value) => Expanded(
      child: Column(
        children: [
          Text('${value ?? '-'}', style: theme.textTheme.titleLarge),
          Text(label, style: theme.textTheme.bodySmall),
        ],
      ),
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) => Row(
                children: [
                  ClanBadge(urls: clan.badgeUrls, size: 64),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 이름 뒤에 태그(누르면 복사). 좁은 화면에서는 다음 줄로 내려간다.
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 8,
                          children: [
                            Text(
                              clan.name ?? clan.tag,
                              style: theme.textTheme.titleLarge,
                            ),
                            CopyableTag(tag: clan.tag),
                          ],
                        ),
                        Text(
                          [
                            if (clan.clanLevel != null)
                              l10n.clanLevel(clan.clanLevel!),
                            if (clan.members != null)
                              l10n.memberCount(clan.members!),
                          ].join(' · '),
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  // 나란히 보기 토글의 왼편: 클랜전 리그와 캐피탈 리그(캐피탈 트로피).
                  // 좁은 화면에서는 이름을 빼고 아이콘과 숫자만 보여 이름·태그가 눌리지 않게 한다.
                  _HeaderLeagues(
                    clan: clan,
                    compact: constraints.maxWidth < _compactHeaderWidth,
                  ),
                  if (onToggleSplit != null)
                    _SplitToggle(
                      active: splitActive,
                      tooltip: l10n.splitView,
                      onPressed: onToggleSplit!,
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                stat(l10n.warWins, clan.warWins),
                stat(l10n.warTies, clan.warTies),
                stat(l10n.warLosses, clan.warLosses),
                stat(l10n.winStreak, clan.warWinStreak),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
