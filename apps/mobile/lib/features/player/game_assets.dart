import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 이미지가 속한 종류. 에셋 폴더(`assets/game/<종류>/`)와 대응한다.
///
/// 장인기지는 본마을과 이름이 같은 유닛(예: Baby Dragon)이 있어서 종류를 따로 둔다.
enum ItemKind { hero, equipment, troop, spell, builderHero, builderTroop }

/// 번들된 에셋 경로 목록. 이미지를 받지 않았다면(`tool/fetch_game_images.sh`) 비어 있고,
/// 그 경우 화면은 이미지 대신 이름 텍스트를 보여준다.
final gameAssetsProvider = FutureProvider<Set<String>>((ref) async {
  final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
  return manifest
      .listAssets()
      .where((a) => a.startsWith('assets/game/') && a.endsWith('.webp'))
      .toSet();
});

/// API 이름을 에셋 파일 이름으로 바꾼다. `P.E.K.K.A` → `pekka`, `Archer Queen` → `archer-queen`.
String gameSlug(String name) => name
    .toLowerCase()
    .replaceAll('.', '')
    .replaceAll("'", '')
    .replaceAll(RegExp(r'[^a-z0-9]+'), '-')
    .replaceAll(RegExp(r'^-+|-+$'), '');

/// 이름이 `Super X`가 아닌 슈퍼 부대와 그 기본 부대(API 이름).
const _superTroopBase = {
  'Sneaky Goblin': 'Goblin',
  'Rocket Balloon': 'Balloon',
  'Inferno Dragon': 'Baby Dragon',
  'Ice Hound': 'Lava Hound',
};

/// 슈퍼 부대의 기본 부대 이름. 슈퍼 부대가 아니면 null.
/// 예: `Super Barbarian` → `Barbarian`, `Ice Hound` → `Lava Hound`.
String? superTroopBaseName(String name) =>
    _superTroopBase[name] ??
    (name.startsWith('Super ') ? name.substring(6) : null);

/// [name]에 해당하는 이미지 후보 경로. 우선순위 순서다.
List<String> assetCandidates(ItemKind kind, String name) {
  final slug = gameSlug(name);
  const root = 'assets/game';
  switch (kind) {
    case ItemKind.hero:
      return ['$root/heroes/$slug.webp'];
    case ItemKind.equipment:
      return ['$root/equipment/$slug.webp'];
    case ItemKind.spell:
      return ['$root/spells/$slug.webp'];
    case ItemKind.builderHero:
      return ['$root/builder_heroes/$slug.webp'];
    case ItemKind.builderTroop:
      return ['$root/builder_troops/$slug.webp'];
    case ItemKind.troop:
      final superBase = superTroopBaseName(name);
      if (superBase != null) {
        return ['$root/troops/${gameSlug(superBase)}-super.webp'];
      }
      // API는 일반 부대·공성 병기·펫을 모두 troops에 넣어 주므로 폴더를 차례로 찾는다.
      return [
        '$root/troops/$slug.webp',
        '$root/siege/$slug.webp',
        '$root/pets/$slug.webp',
      ];
  }
}

/// 후보 중 실제로 번들된 첫 에셋. 없으면 null.
String? resolveAsset(Set<String> available, ItemKind kind, String? name) {
  if (name == null) return null;
  for (final path in assetCandidates(kind, name)) {
    if (available.contains(path)) return path;
  }
  return null;
}

/// 캐피탈 리그 이름을 에셋 파일 이름으로 바꾼다.
/// `Champion League III` → `champion-iii`, `Legend League` → `legend`, `Unranked` → `unranked`.
///
/// 공식 API는 캐피탈 리그의 이름만 주고 아이콘은 주지 않는다.
String capitalLeagueSlug(String name) => name
    .toLowerCase()
    .replaceAll(' league', '')
    .replaceAll(RegExp(r'[^a-z0-9]+'), '-')
    .replaceAll(RegExp(r'^-+|-+$'), '');

/// 캐피탈 리그 아이콘의 에셋 경로. 이미지를 받지 않았거나(`tool/fetch_game_images.sh`) 이름에 맞는
/// 파일이 없으면 null이라 호출하는 쪽에서 대체 아이콘을 쓴다.
String? capitalLeagueAsset(Set<String> available, String? name) {
  if (name == null) return null;
  final path = 'assets/game/capital_leagues/${capitalLeagueSlug(name)}.webp';
  return available.contains(path) ? path : null;
}
