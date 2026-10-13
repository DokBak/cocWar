import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'game_assets.dart';

/// 부대·주문의 자원/종류 구분. 주문은 [elixir]와 [dark]만 쓴다.
enum TroopGroup { elixir, dark, siege, pet }

/// 공식 API가 주지 않는 분류: 장비가 어느 영웅의 것인지, 부대·주문이 어느 자원인지.
/// `tool/gen_game_data.sh`가 커뮤니티 데이터로 만든 `assets/data/item_groups.json`을 읽는다.
class ItemGroups {
  const ItemGroups({
    this.equipmentHero = const {},
    this.troopGroup = const {},
    this.spellGroup = const {},
  });

  factory ItemGroups.fromJson(Map<String, dynamic> json) {
    Map<String, String> strings(Object? raw) => {
      for (final e in (raw as Map<String, dynamic>? ?? const {}).entries)
        e.key: e.value as String,
    };
    Map<String, TroopGroup> groups(Object? raw) => {
      for (final e in strings(raw).entries)
        e.key: ?TroopGroup.values.asNameMap()[e.value],
    };
    return ItemGroups(
      equipmentHero: strings(json['equipmentHero']),
      troopGroup: groups(json['troopGroup']),
      spellGroup: groups(json['spellGroup']),
    );
  }

  static const empty = ItemGroups();

  /// 장비 슬러그 → 영웅 슬러그
  final Map<String, String> equipmentHero;
  final Map<String, TroopGroup> troopGroup;
  final Map<String, TroopGroup> spellGroup;

  /// 장비가 속한 영웅의 슬러그(`barbarian-king`). 모르면 null.
  String? heroOfEquipment(String? name) =>
      name == null ? null : equipmentHero[gameSlug(name)];

  /// 부대의 그룹. 슈퍼 부대는 기본 부대의 그룹을 따른다. 모르면 null.
  TroopGroup? troopGroupOf(String? name) {
    if (name == null) return null;
    return troopGroup[gameSlug(superTroopBaseName(name) ?? name)];
  }

  TroopGroup? spellGroupOf(String? name) =>
      name == null ? null : spellGroup[gameSlug(name)];
}

/// 파일을 읽지 못하면 빈 분류를 쓴다(모든 항목이 "기타"로 표시될 뿐 화면은 동작한다).
final itemGroupsProvider = FutureProvider<ItemGroups>((ref) async {
  try {
    final raw = await rootBundle.loadString('assets/data/item_groups.json');
    return ItemGroups.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  } catch (_) {
    return ItemGroups.empty;
  }
});
