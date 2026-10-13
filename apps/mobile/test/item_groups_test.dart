import 'dart:convert';
import 'dart:io';

import 'package:cocwar_mobile/features/player/item_groups.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final groups = ItemGroups.fromJson({
    'equipmentHero': {'giant-gauntlet': 'barbarian-king'},
    'troopGroup': {
      'barbarian': 'elixir',
      'baby-dragon': 'elixir',
      'lava-hound': 'dark',
      'pekka': 'elixir',
      'lassi': 'pet',
      'battle-blimp': 'siege',
      'broken': 'not-a-group', // 알 수 없는 값은 무시한다
    },
    'spellGroup': {'rage-spell': 'elixir', 'poison-spell': 'dark'},
  });

  group('조회', () {
    test('장비가 속한 영웅', () {
      expect(groups.heroOfEquipment('Giant Gauntlet'), 'barbarian-king');
      expect(groups.heroOfEquipment('Unknown'), isNull);
      expect(groups.heroOfEquipment(null), isNull);
    });

    test('부대 그룹 (점이 들어간 이름 포함)', () {
      expect(groups.troopGroupOf('Barbarian'), TroopGroup.elixir);
      expect(groups.troopGroupOf('P.E.K.K.A'), TroopGroup.elixir);
      expect(groups.troopGroupOf('Lava Hound'), TroopGroup.dark);
      expect(groups.troopGroupOf('L.A.S.S.I'), TroopGroup.pet);
      expect(groups.troopGroupOf('Battle Blimp'), TroopGroup.siege);
    });

    test('슈퍼 부대는 기본 부대의 그룹을 따른다', () {
      expect(groups.troopGroupOf('Super Barbarian'), TroopGroup.elixir);
      expect(
        groups.troopGroupOf('Inferno Dragon'),
        TroopGroup.elixir,
      ); // 기본: Baby Dragon
      expect(
        groups.troopGroupOf('Ice Hound'),
        TroopGroup.dark,
      ); // 기본: Lava Hound
    });

    test('주문 그룹', () {
      expect(groups.spellGroupOf('Rage Spell'), TroopGroup.elixir);
      expect(groups.spellGroupOf('Poison Spell'), TroopGroup.dark);
    });

    test('모르는 항목·알 수 없는 값·빈 데이터는 null', () {
      expect(groups.troopGroupOf('Brand New Troop'), isNull);
      expect(groups.troopGroupOf('Broken'), isNull);
      expect(groups.spellGroupOf('New Spell'), isNull);
      expect(ItemGroups.empty.troopGroupOf('Barbarian'), isNull);
      expect(ItemGroups.empty.heroOfEquipment('Giant Gauntlet'), isNull);
    });
  });

  // 앱에 실제로 번들되는 분류(tool/gen_game_data.sh 결과)가 쓸 수 있는 상태인지 확인한다.
  group('번들된 item_groups.json', () {
    final real = ItemGroups.fromJson(
      jsonDecode(File('assets/data/item_groups.json').readAsStringSync())
          as Map<String, dynamic>,
    );

    test('영웅 6명 모두 장비가 있다', () {
      final heroes = real.equipmentHero.values.toSet();
      expect(heroes, {
        'barbarian-king',
        'archer-queen',
        'grand-warden',
        'royal-champion',
        'minion-prince',
        'dragon-duke',
      });
    });

    test('알려진 분류', () {
      expect(real.heroOfEquipment('Giant Gauntlet'), 'barbarian-king');
      expect(real.heroOfEquipment('Frozen Arrow'), 'archer-queen');
      expect(real.troopGroupOf('P.E.K.K.A'), TroopGroup.elixir);
      expect(real.troopGroupOf('Hog Rider'), TroopGroup.dark);
      expect(real.troopGroupOf('L.A.S.S.I'), TroopGroup.pet);
      expect(real.troopGroupOf('Battle Blimp'), TroopGroup.siege);
      expect(real.spellGroupOf('Rage Spell'), TroopGroup.elixir);
      expect(real.spellGroupOf('Poison Spell'), TroopGroup.dark);
    });

    test('패키지에 아직 없는 Portal Pendant는 수동 예외로 미니언 프린스에 속한다', () {
      expect(real.heroOfEquipment('Portal Pendant'), 'minion-prince');
    });

    test('주문은 엘릭서·다크엘릭서만 있다', () {
      expect(real.spellGroup.values.toSet(), {
        TroopGroup.elixir,
        TroopGroup.dark,
      });
    });
  });
}
