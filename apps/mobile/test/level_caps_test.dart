import 'dart:convert';

import 'package:cocwar_mobile/features/player/game_assets.dart';
import 'package:cocwar_mobile/features/player/level_caps.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final caps = LevelCaps.fromJson({
    'maxTownHall': 3,
    'heroes': {
      'barbarian-king': [0, 10, 20],
    },
    'equipment': {
      'giant-gauntlet': [0, 0, 12],
    },
    'troops': {
      'pekka': [0, 5, 6],
      'lassi': [1, 2, 3],
    },
    'spells': {
      'rage-spell': [1, 1, 2],
    },
  });

  group('capFor', () {
    test('타운홀별 최고 레벨', () {
      expect(caps.capFor(ItemKind.hero, 'Barbarian King', 2), 10);
      expect(caps.capFor(ItemKind.hero, 'Barbarian King', 3), 20);
      expect(caps.capFor(ItemKind.equipment, 'Giant Gauntlet', 3), 12);
      expect(caps.capFor(ItemKind.spell, 'Rage Spell', 3), 2);
    });

    test('API 이름의 점·공백을 이미지와 같은 규칙으로 정리한다', () {
      expect(caps.capFor(ItemKind.troop, 'P.E.K.K.A', 3), 6);
      expect(caps.capFor(ItemKind.troop, 'L.A.S.S.I', 1), 1);
    });

    test('아직 해금되지 않은 홀(0)은 null', () {
      expect(caps.capFor(ItemKind.hero, 'Barbarian King', 1), isNull);
      expect(caps.capFor(ItemKind.equipment, 'Giant Gauntlet', 2), isNull);
    });

    test('표에 없는 항목·범위 밖 타운홀·입력 없음은 null', () {
      expect(caps.capFor(ItemKind.equipment, 'Portal Pendant', 3), isNull);
      expect(caps.capFor(ItemKind.hero, 'Barbarian King', 4), isNull);
      expect(caps.capFor(ItemKind.hero, 'Barbarian King', 0), isNull);
      expect(caps.capFor(ItemKind.hero, 'Barbarian King', null), isNull);
      expect(caps.capFor(ItemKind.hero, null, 3), isNull);
      // 종류가 다르면 같은 이름이라도 찾지 않는다.
      expect(caps.capFor(ItemKind.spell, 'Barbarian King', 3), isNull);
    });

    test('빈 표는 항상 null', () {
      expect(
        const LevelCaps().capFor(ItemKind.hero, 'Barbarian King', 18),
        isNull,
      );
    });
  });

  // 앱에 실제로 번들되는 표(tool/gen_game_data.sh 결과)가 쓸 수 있는 상태인지 확인한다.
  group('번들된 level_caps.json', () {
    late LevelCaps real;

    setUpAll(() async {
      final raw = await rootBundle.loadString('assets/data/level_caps.json');
      real = LevelCaps.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    });

    test('최대 타운홀은 18', () => expect(real.maxTownHall, 18));

    test('알려진 값', () {
      // TH18 / TH16 / TH17 (실제 계정 데이터로 검증한 값)
      expect(real.capFor(ItemKind.hero, 'Barbarian King', 18), 110);
      expect(real.capFor(ItemKind.hero, 'Barbarian King', 17), 100);
      expect(real.capFor(ItemKind.hero, 'Barbarian King', 16), 95);
      expect(real.capFor(ItemKind.troop, 'Barbarian', 18), 13);
      expect(real.capFor(ItemKind.equipment, 'Giant Gauntlet', 18), 27);
      expect(real.capFor(ItemKind.spell, 'Rage Spell', 18), 7);
    });

    test('점이 들어간 이름과 펫·공성 병기도 찾는다', () {
      expect(real.capFor(ItemKind.troop, 'P.E.K.K.A', 18), isNotNull);
      expect(real.capFor(ItemKind.troop, 'L.A.S.S.I', 18), isNotNull);
      expect(real.capFor(ItemKind.troop, 'Battle Blimp', 18), isNotNull);
    });

    test('장인기지: 최대 장인 회관은 10, 알려진 값', () {
      expect(real.maxBuilderHall, 10);
      // 장인 회관 10에서 배틀 머신 35, 레이지드 바바리안 20 (실제 계정으로 검증한 값)
      expect(real.capFor(ItemKind.builderHero, 'Battle Machine', 10), 35);
      expect(real.capFor(ItemKind.builderTroop, 'Raged Barbarian', 10), 20);
      expect(real.capFor(ItemKind.builderTroop, 'Raged Barbarian', 9), 18);
      // 아직 열리지 않은 장인 회관 레벨의 영웅은 null
      expect(real.capFor(ItemKind.builderHero, 'Battle Machine', 1), isNull);
    });

    test('장인기지 Baby Dragon은 본마을 Baby Dragon과 다른 표를 쓴다', () {
      expect(real.capFor(ItemKind.builderTroop, 'Baby Dragon', 10), 20);
      expect(real.capFor(ItemKind.troop, 'Baby Dragon', 18), isNot(20));
      expect(real.capFor(ItemKind.builderTroop, 'Baby Dragon', 4), 8);
    });

    test('같은 항목의 최고 레벨은 타운홀이 올라갈수록 줄지 않는다', () {
      for (final entry in real.tables.entries) {
        for (final item in entry.value.entries) {
          final caps = item.value;
          for (var i = 1; i < caps.length; i++) {
            expect(
              caps[i] >= caps[i - 1],
              isTrue,
              reason: '${entry.key} ${item.key}: ${caps[i - 1]} -> ${caps[i]}',
            );
          }
        }
      }
    });
  });
}
