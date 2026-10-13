import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'game_assets.dart';

/// 타운홀별 영웅·장비·부대·주문의 최고 레벨 표.
///
/// 공식 API의 `maxLevel`은 게임 전체 최대 레벨이라 현재 타운홀 기준 최고 레벨을 주지 않는다.
/// 그래서 `tool/gen_game_data.sh`가 커뮤니티 데이터로 계산해 둔 표를 쓴다.
class LevelCaps {
  const LevelCaps({
    this.maxTownHall = 0,
    this.maxBuilderHall = 0,
    this.tables = const {},
  });

  factory LevelCaps.fromJson(Map<String, dynamic> json) {
    Map<String, List<int>> table(Object? raw) => {
      for (final e in (raw as Map<String, dynamic>? ?? const {}).entries)
        e.key: [for (final v in e.value as List) v as int],
    };
    return LevelCaps(
      maxTownHall: json['maxTownHall'] as int? ?? 0,
      maxBuilderHall: json['maxBuilderHall'] as int? ?? 0,
      tables: {
        ItemKind.hero: table(json['heroes']),
        ItemKind.equipment: table(json['equipment']),
        ItemKind.troop: table(json['troops']),
        ItemKind.spell: table(json['spells']),
        ItemKind.builderHero: table(json['builderHeroes']),
        ItemKind.builderTroop: table(json['builderTroops']),
      },
    );
  }

  /// 표에 있는 가장 높은 타운홀 / 장인 회관.
  final int maxTownHall;
  final int maxBuilderHall;
  final Map<ItemKind, Map<String, List<int>>> tables;

  /// [townHall]에서 [name]의 최고 레벨. 표에 없거나 아직 해금되지 않았으면 null.
  /// 장인기지 종류(`builderHero`, `builderTroop`)에서는 [townHall]이 장인 회관 레벨이다.
  int? capFor(ItemKind kind, String? name, int? townHall) {
    if (name == null || townHall == null || townHall < 1) return null;
    final caps = tables[kind]?[gameSlug(name)];
    if (caps == null || townHall > caps.length) return null;
    final cap = caps[townHall - 1];
    return cap > 0 ? cap : null;
  }
}

final levelCapsProvider = FutureProvider<LevelCaps>((ref) async {
  final raw = await rootBundle.loadString('assets/data/level_caps.json');
  return LevelCaps.fromJson(jsonDecode(raw) as Map<String, dynamic>);
});
