import 'dart:async';

import 'package:coc_models/coc_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/layout.dart';
import '../../l10n/app_localizations.dart';
import '../clan/clan_badge.dart';
import '../clan/war_date.dart';
import '../clan/war_log_tile.dart' show formatPercent;
import '../error_view.dart';
import '../language_button.dart';
import 'war_outlook.dart';
import 'war_providers.dart';

/// 남은 시간 문구 (`3시간 20분`, `45분`). 이미 지났으면 `0분`.
String formatDuration(AppLocalizations l10n, Duration d) {
  final total = d.inMinutes < 0 ? 0 : d.inMinutes;
  final hours = total ~/ 60;
  final minutes = total % 60;
  return hours > 0 ? l10n.durationHM(hours, minutes) : l10n.durationM(minutes);
}

/// 소수점 없이/한 자리로 줄인 퍼센트 숫자(`96.5`, `100`). `%`는 붙이지 않는다.
String _plainPercent(double v) =>
    v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(1);

enum _Side { ours, theirs }

/// 클랜전 상세 화면 (`/clan/:tag/war`).
class WarPage extends ConsumerWidget {
  const WarPage({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final war = ref.watch(currentWarProvider(tag));

    return Scaffold(
      appBar: AppBar(
        title: Text(war.value?.clan?.name ?? l10n.warPageTitle),
        actions: const [LanguageButton()],
      ),
      body: war.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ErrorView(
          error: e,
          onRetry: () => ref.invalidate(currentWarProvider(tag)),
        ),
        data: (w) => WarView(
          war: w,
          onRefresh: () async {
            ref.invalidate(currentWarProvider(tag));
            await ref
                .read(currentWarProvider(tag).future)
                .then<void>((_) {}, onError: (_) {});
          },
        ),
      ),
    );
  }
}

/// 전쟁 한 경기의 본문(상태·점수·전망·멤버). 일반 클랜전과 리그전 경기가 함께 쓴다.
///
/// 우리 클랜이 `war.clan`이어야 한다(리그전 경기는 `orientTo`로 맞춘 뒤 넘긴다).
class WarView extends StatefulWidget {
  const WarView({super.key, required this.war, required this.onRefresh});

  final CurrentWar war;
  final Future<void> Function() onRefresh;

  @override
  State<WarView> createState() => _WarViewState();
}

class _WarViewState extends State<WarView> {
  _Side _side = _Side.ours;
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    // 남은 시간 문구를 갱신한다. 데이터는 당겨서 새로고침으로 다시 받는다.
    _ticker = Timer.periodic(
      const Duration(minutes: 1),
      (_) => mounted ? setState(() {}) : null,
    );
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => RefreshIndicator(
    onRefresh: widget.onRefresh,
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: contentMaxWidth),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: _content(context, widget.war),
        ),
      ),
    ),
  );

  List<Widget> _content(BuildContext context, CurrentWar war) {
    final l10n = AppLocalizations.of(context);
    final noWar =
        war.state == null ||
        war.state == WarState.notInWar ||
        war.state == WarState.unknown ||
        war.clan == null ||
        war.opponent == null;
    if (noWar) {
      return [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: Center(child: Text(l10n.warNone)),
        ),
      ];
    }

    final outlook = war.state == WarState.inWar ? warOutlook(war) : null;
    final members = _side == _Side.ours
        ? war.clan!.members
        : war.opponent!.members;
    final sorted = [...members]
      ..sort((a, b) => (a.mapPosition ?? 999).compareTo(b.mapPosition ?? 999));
    // 공격 대상 태그를 상대 지도 번호로 바꾸기 위한 표.
    final positions = {
      for (final m in [...war.clan!.members, ...war.opponent!.members])
        if (m.tag != null && m.mapPosition != null) m.tag!: m.mapPosition!,
    };

    return [
      _StateCard(war: war),
      const SizedBox(height: 12),
      _Scoreboard(war: war),
      if (outlook != null) ...[
        const SizedBox(height: 12),
        _OutlookCard(outlook: outlook),
      ],
      const SizedBox(height: 16),
      SegmentedButton<_Side>(
        segments: [
          ButtonSegment(
            value: _Side.ours,
            label: Text(l10n.tabOurClan),
            icon: const Icon(Icons.shield_outlined),
          ),
          ButtonSegment(
            value: _Side.theirs,
            label: Text(l10n.tabOpponentClan),
            icon: const Icon(Icons.flag_outlined),
          ),
        ],
        selected: {_side},
        onSelectionChanged: (s) => setState(() => _side = s.first),
      ),
      const SizedBox(height: 8),
      for (final m in sorted)
        _MemberTile(
          member: m,
          war: war,
          positions: positions,
          // 준비일에는 공격이 없으므로 "미사용" 표시를 하지 않는다.
          showUnused: war.state != WarState.preparation,
        ),
    ];
  }
}

class _StateCard extends ConsumerWidget {
  const _StateCard({required this.war});

  final CurrentWar war;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final now = ref.watch(clockProvider)().toUtc();

    final (label, color) = switch (war.state) {
      WarState.preparation => (l10n.warStatePreparation, Colors.blue),
      WarState.inWar => (l10n.warStateInWar, Colors.red),
      _ => (l10n.warStateEnded, Colors.grey),
    };
    final time = switch (war.state) {
      WarState.preparation when war.startTime != null => l10n.warStartsIn(
        formatDuration(l10n, war.startTime!.difference(now)),
      ),
      WarState.inWar when war.endTime != null => l10n.warEndsIn(
        formatDuration(l10n, war.endTime!.difference(now)),
      ),
      WarState.warEnded when war.endTime != null => formatWarDate(
        context,
        war.endTime!,
      ),
      _ => null,
    };

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    label,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (time != null) ...[
                  const SizedBox(width: 12),
                  Expanded(child: Text(time, style: theme.textTheme.bodyLarge)),
                ],
              ],
            ),
            const SizedBox(height: 8),
            Text(
              [
                if (war.teamSize != null) l10n.teamSizeVs(war.teamSize!),
                if (war.attacksPerMember != null)
                  l10n.warAttacksPerMember(war.attacksPerMember!),
              ].join(' · '),
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _Scoreboard extends StatelessWidget {
  const _Scoreboard({required this.war});

  final CurrentWar war;

  @override
  Widget build(BuildContext context) {
    final total = (war.teamSize ?? 0) * (war.attacksPerMember ?? 0);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _ClanScore(clan: war.clan!, totalAttacks: total),
            ),
            const Padding(padding: EdgeInsets.only(top: 20), child: Text('VS')),
            Expanded(
              child: _ClanScore(clan: war.opponent!, totalAttacks: total),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClanScore extends StatelessWidget {
  const _ClanScore({required this.clan, required this.totalAttacks});

  final CurrentWarClan clan;
  final int totalAttacks;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final tag = clan.tag;
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: tag == null
          ? null
          : () => context.push('/clan/${tag.replaceFirst('#', '')}'),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            ClanBadge(urls: clan.badgeUrls, size: 56),
            const SizedBox(height: 4),
            Text(
              clan.name ?? tag ?? '-',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleSmall,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, size: 20, color: Color(0xFFFFC107)),
                const SizedBox(width: 4),
                Text('${clan.stars ?? 0}', style: theme.textTheme.titleLarge),
              ],
            ),
            Text(formatPercent(clan.destructionPercentage)),
            Text(
              l10n.warAttacksUsed(clan.attacks ?? 0, totalAttacks),
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _OutlookCard extends StatelessWidget {
  const _OutlookCard({required this.outlook});

  final WarOutlook outlook;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final us = _plainPercent(outlook.ourDestruction);
    final them = _plainPercent(outlook.opponentDestruction);

    final headline = outlook.dead
        ? l10n.outlookTied
        : outlook.winning
        ? (outlook.starLead > 0
              ? l10n.outlookLeadingStars(outlook.starLead)
              : l10n.outlookLeadingDestruction(us, them))
        : (outlook.starLead < 0
              ? l10n.outlookTrailingStars(outlook.starsNeeded)
              : l10n.outlookTrailingDestruction(us, them));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.outlookTitle, style: theme.textTheme.titleSmall),
            const SizedBox(height: 6),
            Text(headline, style: theme.textTheme.bodyLarge),
            const SizedBox(height: 4),
            Text(l10n.outlookRemainingAttacks(outlook.ourAttacksLeft)),
            Text(l10n.outlookAvailableStars(outlook.starsAvailable)),
            if (!outlook.canStillWin) ...[
              const SizedBox(height: 4),
              Text(
                l10n.outlookCannotWin,
                style: TextStyle(color: theme.colorScheme.error),
              ),
            ],
            const SizedBox(height: 6),
            Text(
              l10n.outlookNote,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stars extends StatelessWidget {
  const _Stars(this.count);

  final int count;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      for (var i = 0; i < 3; i++)
        Icon(
          i < count ? Icons.star : Icons.star_border,
          size: 14,
          color: i < count
              ? const Color(0xFFFFC107)
              : Theme.of(context).colorScheme.outline,
        ),
    ],
  );
}

class _MemberTile extends StatelessWidget {
  const _MemberTile({
    required this.member,
    required this.war,
    required this.positions,
    required this.showUnused,
  });

  final WarMember member;
  final CurrentWar war;
  final Map<String, int> positions;
  final bool showUnused;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurfaceVariant;
    final attacks = [...member.attacks]
      ..sort((a, b) => (a.order ?? 0).compareTo(b.order ?? 0));
    final unused = showUnused
        ? ((war.attacksPerMember ?? 0) - attacks.length).clamp(0, 99)
        : 0;
    final best = member.bestOpponentAttack;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 28,
              child: Text(
                '${member.mapPosition ?? '-'}',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleSmall,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          member.name ?? member.tag ?? '-',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      if (member.townHallLevel != null) ...[
                        const SizedBox(width: 8),
                        Text(
                          'TH${member.townHallLevel}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: muted,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  for (final a in attacks)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        children: [
                          _Stars(a.stars ?? 0),
                          const SizedBox(width: 8),
                          Text(formatPercent(a.destructionPercentage)),
                          const SizedBox(width: 8),
                          Text(
                            '→ #${positions[a.defenderTag] ?? '-'}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: muted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  for (var i = 0; i < unused; i++)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        l10n.warUnused,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: muted,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  l10n.warDefense,
                  style: theme.textTheme.bodySmall?.copyWith(color: muted),
                ),
                const SizedBox(height: 2),
                if (best == null)
                  Text(
                    l10n.warNoDefense,
                    style: theme.textTheme.bodySmall?.copyWith(color: muted),
                  )
                else ...[
                  _Stars(best.stars ?? 0),
                  Text(formatPercent(best.destructionPercentage)),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
