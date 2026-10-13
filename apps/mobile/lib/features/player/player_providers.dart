import 'package:coc_models/coc_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import 'game_assets.dart';
import 'item_groups.dart';

final playerProvider = FutureProvider.autoDispose.family<Player, String>(
  (ref, tag) => ref.watch(apiClientProvider).getPlayer(tag),
);

/// 슈퍼 부대. API는 활성 여부와 관계없이 슈퍼 부대를 부대 목록에 모두 넣어 주므로,
/// 일반 부대 목록에서는 이 이름들을 빼고, 활성화된 것은 기본 부대 타일에 별로 표시한다.
/// 새 슈퍼 부대가 추가되면 여기에 이름을 더한다 (빠지면 일반 부대로 보일 뿐 오류는 아니다).
const superTroopNames = {
  'Super Barbarian',
  'Super Archer',
  'Super Wall Breaker',
  'Super Giant',
  'Sneaky Goblin',
  'Super Miner',
  'Rocket Balloon',
  'Inferno Dragon',
  'Super Valkyrie',
  'Super Witch',
  'Ice Hound',
  'Super Bowler',
  'Super Dragon',
  'Super Wizard',
  'Super Minion',
  'Super Hog Rider',
  'Super Yeti',
};

bool isHome(PlayerItem i) => i.village == null || i.village == 'home';

bool isBuilder(PlayerItem i) => i.village == 'builderBase';

/// 화면에 그릴 항목 하나. [superName]은 이 부대의 슈퍼 부대가 활성화된 경우 그 이름이다.
class ItemEntry {
  const ItemEntry(this.item, {this.superName});

  final PlayerItem item;
  final String? superName;
}

/// 영웅 한 명과 그 영웅의 장비. [hero]가 null이면 어느 영웅의 것인지 모르는 장비들이다.
class HeroBlock {
  const HeroBlock(this.hero, this.equipment);

  final PlayerItem? hero;
  final List<PlayerItem> equipment;
}

/// 같은 그룹의 항목들. [group]이 null이면 분류를 모르는 항목들이다.
class GroupSection {
  const GroupSection(this.group, this.entries);

  final TroopGroup? group;
  final List<ItemEntry> entries;
}

/// 소제목 표시 순서. 분류 불명(null)은 맨 뒤.
const _groupOrder = [
  TroopGroup.elixir,
  TroopGroup.dark,
  TroopGroup.siege,
  TroopGroup.pet,
  null,
];

List<GroupSection> _sectionsOf(
  List<ItemEntry> entries,
  TroopGroup? Function(PlayerItem) groupOf,
) => [
  for (final g in _groupOrder)
    if (entries.where((e) => groupOf(e.item) == g).toList() case final list
        when list.isNotEmpty)
      GroupSection(g, list),
];

extension PlayerViews on Player {
  List<PlayerItem> get homeHeroes => heroes.where(isHome).toList();
  List<PlayerItem> get homeEquipment => heroEquipment.where(isHome).toList();
  List<PlayerItem> get homeSpells => spells.where(isHome).toList();

  /// 장인기지 영웅(Battle Machine, Battle Copter)과 유닛. 장인기지에는 주문·장비가 없다.
  List<PlayerItem> get builderHeroes => heroes.where(isBuilder).toList();
  List<PlayerItem> get builderTroops => troops.where(isBuilder).toList();

  /// 장인기지 정보가 있는 계정인지 (장인 회관을 아직 열지 않은 계정은 없다).
  bool get hasBuilderBase =>
      builderHallLevel != null ||
      builderHeroes.isNotEmpty ||
      builderTroops.isNotEmpty;

  /// 일반 부대 (슈퍼 부대 제외).
  List<PlayerItem> get homeTroops => troops
      .where((t) => isHome(t) && !superTroopNames.contains(t.name))
      .toList();

  /// 부대 목록. 슈퍼 부대가 활성화된 기본 부대에는 [ItemEntry.superName]이 붙는다.
  ///
  /// API는 슈퍼 부대 레벨을 항상 1로 주지만 게임에서는 기본 부대 레벨을 그대로 쓰므로,
  /// 슈퍼 부대를 따로 그리지 않고 기본 부대 타일에 표시한다.
  List<ItemEntry> get homeTroopEntries {
    final activeByBase = {
      for (final t in troops)
        if (t.superTroopIsActive == true && t.name != null)
          superTroopBaseName(t.name!) ?? t.name!: t.name!,
    };
    final entries = [
      for (final t in homeTroops)
        ItemEntry(t, superName: activeByBase.remove(t.name)),
    ];
    // 기본 부대를 목록에서 찾지 못한 활성 슈퍼 부대는 그 자체로 보여준다(드문 경우).
    for (final t in troops) {
      if (t.superTroopIsActive == true &&
          t.name != null &&
          activeByBase.containsValue(t.name)) {
        entries.add(ItemEntry(t, superName: t.name));
      }
    }
    return entries;
  }

  /// 영웅별로 장비를 묶는다. 영웅 순서는 API 순서다.
  /// 어느 영웅의 장비인지는 분류 데이터 → API의 장착 정보 순으로 찾고, 그래도 모르면 마지막 블록에 둔다.
  List<HeroBlock> heroBlocks(ItemGroups groups) {
    final heroes = homeHeroes;
    final byHero = {
      for (final h in heroes) gameSlug(h.name ?? ''): <PlayerItem>[],
    };
    final equippedBy = {
      for (final h in heroes)
        for (final e in h.equipment)
          if (e.name != null) e.name!: gameSlug(h.name ?? ''),
    };
    final unknown = <PlayerItem>[];
    for (final e in homeEquipment) {
      final owner = groups.heroOfEquipment(e.name) ?? equippedBy[e.name];
      (byHero[owner] ?? unknown).add(e);
    }
    return [
      for (final h in heroes) HeroBlock(h, byHero[gameSlug(h.name ?? '')]!),
      if (unknown.isNotEmpty) HeroBlock(null, unknown),
    ];
  }

  /// 부대를 엘릭서 → 다크엘릭서 → 시즈머신 → 펫 순으로 나눈다. 비어 있는 그룹은 뺀다.
  List<GroupSection> troopSections(ItemGroups groups) =>
      _sectionsOf(homeTroopEntries, (t) => groups.troopGroupOf(t.name));

  /// 주문을 엘릭서 → 다크엘릭서 순으로 나눈다.
  List<GroupSection> spellSections(ItemGroups groups) => _sectionsOf([
    for (final s in homeSpells) ItemEntry(s),
  ], (s) => groups.spellGroupOf(s.name));

  /// 새 리그 체계(`leagueTier`)를 우선하고, 없으면 구 `league`를 쓴다.
  League? get currentLeague => leagueTier ?? league;
}
