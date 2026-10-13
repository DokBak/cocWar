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
import '../language_button.dart';
import '../player/player_page.dart';
import '../player/role_label.dart';
import '../pagination_bar.dart';
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

enum _ClanTab { warLog, members }

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

  _ClanTab _tab = _ClanTab.warLog;

  @override
  void didUpdateWidget(covariant _ClanBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 나란히 보기는 멤버를 훑어보려는 기능이라, 켜면 멤버 탭으로 바꿔 준다.
    if (widget.splitView && !oldWidget.splitView) _tab = _ClanTab.members;
  }

  Future<void> _refresh() async {
    setState(() => _page = 1);
    ref.invalidate(clanProvider(widget.tag));
    if (widget.clan.isWarLogPublic != false) {
      ref.invalidate(warLogProvider(widget.tag));
      await ref
          .read(warLogProvider(widget.tag).future)
          .then<void>((_) {}, onError: (_) {});
    }
  }

  List<Widget> _memberTiles(AppLocalizations l10n) {
    final members = sortMembers(widget.clan.memberList);
    if (members.isEmpty) return [_Notice(text: l10n.noItems)];
    return [
      for (final m in members)
        _MemberTile(
          member: m,
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
    final log = logPublic ? ref.watch(warLogProvider(widget.tag)) : null;
    final items = log?.value ?? const <ClanWarLogEntry>[];
    final totalPages = math.max(1, (items.length / warLogPageSize).ceil());
    final page = math.min(_page, totalPages);
    final visible = items
        .skip((page - 1) * warLogPageSize)
        .take(warLogPageSize);

    return RefreshIndicator(
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
                    value: _ClanTab.warLog,
                    label: Text(l10n.warLog),
                    icon: const Icon(Icons.history),
                  ),
                  ButtonSegment(
                    value: _ClanTab.members,
                    label: Text(l10n.tabMembers),
                    icon: const Icon(Icons.groups_outlined),
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
    );
  }
}

class _MemberTile extends StatelessWidget {
  const _MemberTile({required this.member, this.onTap, this.selected = false});

  final ClanMember member;
  final VoidCallback? onTap;

  /// 나란히 보기에서 오른쪽 창에 열려 있는 멤버.
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final tag = member.tag;
    final details = [
      ?roleLabel(l10n, member.role),
      if (member.townHallLevel != null) l10n.townHallN(member.townHallLevel!),
    ].join(' · ');
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: selected ? theme.colorScheme.primaryContainer : null,
      child: ListTile(
        selected: selected,
        onTap: onTap,
        leading: SizedBox(
          width: 28,
          child: Text(
            '${member.clanRank ?? '-'}',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleSmall,
          ),
        ),
        title: Text(
          member.name ?? tag ?? '-',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(details),
        trailing: Column(
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
            Row(
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
                if (onToggleSplit != null)
                  _SplitToggle(
                    active: splitActive,
                    tooltip: l10n.splitView,
                    onPressed: onToggleSplit!,
                  ),
              ],
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
