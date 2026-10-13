import 'package:coc_models/coc_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/app_localizations.dart';
import 'game_assets.dart';
import 'item_groups.dart';
import 'item_tile.dart';
import 'player_providers.dart';

/// 소제목 문구. 분류를 모르는 항목은 "기타".
String groupTitle(AppLocalizations l10n, TroopGroup? group) => switch (group) {
  TroopGroup.elixir => l10n.groupElixir,
  TroopGroup.dark => l10n.groupDarkElixir,
  TroopGroup.siege => l10n.groupSiege,
  TroopGroup.pet => l10n.groupPets,
  null => l10n.groupOther,
};

String? _progressText(AppLocalizations l10n, Iterable<PlayerItem> items) {
  final pct = progressPercent(items);
  return pct == null ? null : l10n.progressPct('$pct%');
}

/// 플레이어 프로필의 영웅·부대·주문 구역. 분류 데이터를 읽는 동안에는 자리만 잡는다.
class ProfileSections extends ConsumerWidget {
  const ProfileSections({super.key, required this.player});

  final Player player;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groups = ref.watch(itemGroupsProvider);
    return groups.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: CircularProgressIndicator()),
      ),
      // 분류 파일을 못 읽어도 화면은 보여준다(분류 불명 항목은 "기타").
      error: (_, _) => _Body(player: player, groups: ItemGroups.empty),
      data: (g) => _Body(player: player, groups: g),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.player, required this.groups});

  final Player player;
  final ItemGroups groups;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final heroBlocks = player.heroBlocks(groups);
    final troops = player.troopSections(groups);
    final spells = player.spellSections(groups);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heroBlocks.isNotEmpty)
          Section(
            title: l10n.sectionHeroes,
            subtitles: [
              ?_progressText(l10n, player.homeHeroes),
              if (progressPercent(player.homeEquipment) case final pct?)
                l10n.equipmentProgressPct('$pct%'),
            ],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final b in heroBlocks)
                  _HeroBlock(block: b, townHall: player.townHallLevel),
              ],
            ),
          ),
        if (troops.isNotEmpty)
          Section(
            title: l10n.sectionTroops,
            subtitles: [?_progressText(l10n, player.homeTroops)],
            child: _Groups(
              sections: troops,
              kind: ItemKind.troop,
              townHall: player.townHallLevel,
            ),
          ),
        if (spells.isNotEmpty)
          Section(
            title: l10n.sectionSpells,
            subtitles: [?_progressText(l10n, player.homeSpells)],
            child: _Groups(
              sections: spells,
              kind: ItemKind.spell,
              townHall: player.townHallLevel,
            ),
          ),
      ],
    );
  }
}

/// 장인기지 영웅과 유닛. 최고 레벨은 장인 회관 레벨 기준이다.
class BuilderSections extends StatelessWidget {
  const BuilderSections({super.key, required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final heroes = player.builderHeroes;
    final troops = player.builderTroops;
    final hall = player.builderHallLevel;

    Widget grid(List<PlayerItem> items, ItemKind kind) => ItemGrid(
      entries: [for (final i in items) ItemEntry(i)],
      kind: kind,
      townHall: hall,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heroes.isNotEmpty)
          Section(
            title: l10n.sectionHeroes,
            subtitles: [?_progressText(l10n, heroes)],
            child: grid(heroes, ItemKind.builderHero),
          ),
        if (troops.isNotEmpty)
          Section(
            title: l10n.sectionUnits,
            subtitles: [?_progressText(l10n, troops)],
            child: grid(troops, ItemKind.builderTroop),
          ),
      ],
    );
  }
}

/// 영웅 한 명 + 그 아래에 그 영웅의 장비.
class _HeroBlock extends StatelessWidget {
  const _HeroBlock({required this.block, required this.townHall});

  final HeroBlock block;
  final int? townHall;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final hero = block.hero;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (hero != null) ...[
                ItemTile(item: hero, kind: ItemKind.hero, townHall: townHall),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: Text(
                  hero?.name ?? l10n.groupOther,
                  style: theme.textTheme.titleSmall,
                ),
              ),
            ],
          ),
          if (block.equipment.isNotEmpty) ...[
            const SizedBox(height: 8),
            ItemGrid(
              entries: [for (final e in block.equipment) ItemEntry(e)],
              kind: ItemKind.equipment,
              townHall: townHall,
            ),
          ],
        ],
      ),
    );
  }
}

/// 소제목(엘릭서, 다크엘릭서, 시즈머신, 펫 …)마다 타일을 나열한다.
class _Groups extends StatelessWidget {
  const _Groups({
    required this.sections,
    required this.kind,
    required this.townHall,
  });

  final List<GroupSection> sections;
  final ItemKind kind;
  final int? townHall;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final s in sections)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: groupTitle(l10n, s.group),
                        style: theme.textTheme.titleSmall,
                      ),
                      if (_progressText(l10n, [
                            for (final e in s.entries) e.item,
                          ])
                          case final text?)
                        TextSpan(
                          text: '   $text',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                ItemGrid(entries: s.entries, kind: kind, townHall: townHall),
              ],
            ),
          ),
      ],
    );
  }
}

/// 제목, 진행률 줄들, 내용으로 이루어진 구역.
class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.title,
    required this.child,
    this.subtitles = const [],
  });

  final String title;
  final List<String> subtitles;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleMedium),
          for (final line in subtitles)
            Text(
              line,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
