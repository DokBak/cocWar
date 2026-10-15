import 'package:coc_models/coc_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api_client.dart';
import '../../core/layout.dart';
import '../../l10n/app_localizations.dart';
import '../clan/clan_badge.dart';
import '../clan/war_log_tile.dart' show formatPercent;
import '../error_view.dart';
import '../language_button.dart';
import 'cwl_providers.dart';
import 'cwl_stats.dart';

/// 클랜전 리그 화면 (`/clan/:tag/cwl`). 순위 / 라운드 / 멤버 성적 탭.
class CwlPage extends ConsumerWidget {
  const CwlPage({super.key, required this.tag});

  final String tag;

  Future<void> _refresh(WidgetRef ref) async {
    ref.invalidate(cwlWarProvider);
    ref.invalidate(leagueGroupProvider(tag));
    await ref
        .read(cwlSeasonProvider(tag).future)
        .then<void>((_) {}, onError: (_) {});
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final season = ref.watch(cwlSeasonProvider(tag));
    final s = season.value;
    final title = s?.group.season == null
        ? l10n.cwlPageTitle
        : '${l10n.cwlPageTitle} · ${s!.group.season}';

    Widget body(Widget Function(CwlSeason) build) => season.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => e is ApiException && e.kind == ApiErrorKind.notFound
          ? _NotInLeague(onRefresh: () => _refresh(ref))
          : ErrorView(error: e, onRetry: () => _refresh(ref)),
      data: (s) => s.group.state == LeagueGroupState.notInWar
          ? _NotInLeague(onRefresh: () => _refresh(ref))
          : RefreshIndicator(onRefresh: () => _refresh(ref), child: build(s)),
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: const [LanguageButton()],
          bottom: TabBar(
            tabs: [
              Tab(text: l10n.cwlTabStandings),
              Tab(text: l10n.cwlTabRounds),
              Tab(text: l10n.cwlTabMembers),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            body((s) => _StandingsTab(season: s, clanTag: tag)),
            body((s) => _RoundsTab(season: s, clanTag: tag)),
            body((s) => _MembersTab(season: s, clanTag: tag)),
          ],
        ),
      ),
    );
  }
}

/// 본문 폭을 맞춘 당겨서 새로고침 가능한 목록.
class _TabList extends StatelessWidget {
  const _TabList({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: contentMaxWidth),
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: children,
      ),
    ),
  );
}

class _NotInLeague extends StatelessWidget {
  const _NotInLeague({required this.onRefresh});

  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) => RefreshIndicator(
    onRefresh: onRefresh,
    child: _TabList(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: Center(
            child: Text(
              AppLocalizations.of(context).cwlNotInLeague,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ),
  );
}

class _StandingsTab extends StatelessWidget {
  const _StandingsTab({required this.season, required this.clanTag});

  final CwlSeason season;
  final String clanTag;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final rows = cwlStandings(season.group, season.wars);
    return _TabList(
      children: [
        for (final (i, row) in rows.indexed)
          Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            color: row.clan.tag == clanTag
                ? theme.colorScheme.secondaryContainer
                : null,
            child: ListTile(
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 24,
                    child: Text(
                      '${i + 1}',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(width: 8),
                  ClanBadge(urls: row.clan.badgeUrls, size: 36),
                ],
              ),
              title: Text(
                row.clan.name ?? row.clan.tag ?? '-',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: row.clan.tag == clanTag
                    ? const TextStyle(fontWeight: FontWeight.bold)
                    : null,
              ),
              subtitle: Text(
                '${l10n.cwlWins(row.wins)} · '
                '${formatPercent(row.destruction.roundToDouble())}',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, size: 20, color: Color(0xFFFFC107)),
                  const SizedBox(width: 4),
                  Text('${row.points}', style: theme.textTheme.titleMedium),
                ],
              ),
            ),
          ),
        const SizedBox(height: 8),
        Text(
          l10n.cwlStandingsNote,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _RoundsTab extends StatelessWidget {
  const _RoundsTab({required this.season, required this.clanTag});

  final CwlSeason season;
  final String clanTag;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurfaceVariant;
    return _TabList(
      children: [
        for (var i = 0; i < season.rounds.length; i++)
          Builder(
            builder: (context) {
              final entry = season.ourWar(i, clanTag);
              if (entry == null) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    title: Text(l10n.cwlRound(i + 1)),
                    trailing: Text(
                      l10n.cwlRoundUnscheduled,
                      style: TextStyle(color: muted),
                    ),
                  ),
                );
              }
              final war = entry.war;
              final us = war.clan!;
              final them = war.opponent;
              final (label, color) = switch (war.state) {
                WarState.preparation => (l10n.warStatePreparation, Colors.blue),
                WarState.inWar => (l10n.warStateInWar, Colors.red),
                _ => (l10n.warStateEnded, Colors.grey),
              };
              final played = war.state != WarState.preparation;
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  onTap: () => context.push(
                    '/clan/${clanTag.replaceFirst('#', '')}/cwl/war/'
                    '${entry.warTag.replaceFirst('#', '')}',
                  ),
                  leading: ClanBadge(urls: them?.badgeUrls, size: 36),
                  title: Text(
                    '${l10n.cwlRound(i + 1)} · ${them?.name ?? '-'}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    label,
                    style: TextStyle(color: color, fontWeight: FontWeight.bold),
                  ),
                  trailing: played
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '★ ${us.stars ?? 0} : ${them?.stars ?? 0}',
                              style: theme.textTheme.titleSmall,
                            ),
                            Text(
                              '${formatPercent(us.destructionPercentage)} : '
                              '${formatPercent(them?.destructionPercentage)}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: muted,
                              ),
                            ),
                          ],
                        )
                      : const Icon(Icons.chevron_right),
                ),
              );
            },
          ),
      ],
    );
  }
}

class _MembersTab extends StatelessWidget {
  const _MembersTab({required this.season, required this.clanTag});

  final CwlSeason season;
  final String clanTag;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurfaceVariant;
    final members = cwlMemberStats(clanTag, season.wars);
    return _TabList(
      children: [
        for (final m in members)
          Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              title: Row(
                children: [
                  Flexible(
                    child: Text(
                      m.name ?? m.tag,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (m.townHallLevel != null) ...[
                    const SizedBox(width: 8),
                    Text(
                      'TH${m.townHallLevel}',
                      style: theme.textTheme.bodySmall?.copyWith(color: muted),
                    ),
                  ],
                ],
              ),
              subtitle: Text(
                [
                  l10n.cwlMemberAttacks(m.attacks, m.rounds),
                  l10n.cwlAvgDestruction(
                    formatPercent(m.attacks == 0 ? null : m.averageDestruction),
                  ),
                  l10n.cwlThreeStars(m.threeStars),
                ].join(' · '),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, size: 20, color: Color(0xFFFFC107)),
                  const SizedBox(width: 4),
                  Text('${m.stars}', style: theme.textTheme.titleMedium),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
