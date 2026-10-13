import 'package:coc_models/coc_models.dart';
import 'package:cocwar_mobile/features/player/game_assets.dart';
import 'package:cocwar_mobile/features/player/item_tile.dart';
import 'package:cocwar_mobile/features/player/level_caps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('장인기지 이미지는 본마을과 이름 공간이 다르다', () {
    test('같은 이름(Baby Dragon)도 종류에 따라 다른 폴더를 가리킨다', () {
      expect(
        assetCandidates(ItemKind.troop, 'Baby Dragon').first,
        'assets/game/troops/baby-dragon.webp',
      );
      expect(assetCandidates(ItemKind.builderTroop, 'Baby Dragon'), [
        'assets/game/builder_troops/baby-dragon.webp',
      ]);
    });

    test('장인기지 영웅과 유닛', () {
      const available = {
        'assets/game/builder_heroes/battle-machine.webp',
        'assets/game/builder_troops/power-pekka.webp',
        'assets/game/troops/baby-dragon.webp',
      };
      expect(
        resolveAsset(available, ItemKind.builderHero, 'Battle Machine'),
        'assets/game/builder_heroes/battle-machine.webp',
      );
      expect(
        resolveAsset(available, ItemKind.builderTroop, 'Power P.E.K.K.A'),
        'assets/game/builder_troops/power-pekka.webp',
      );
      // 본마을 이미지만 있을 때 장인기지 유닛이 본마을 이미지를 가져다 쓰지 않는다.
      expect(
        resolveAsset(available, ItemKind.builderTroop, 'Baby Dragon'),
        isNull,
      );
    });
  });

  group('gameSlug', () {
    test('공백·점·아포스트로피를 정리한다', () {
      expect(gameSlug('Archer Queen'), 'archer-queen');
      expect(gameSlug('P.E.K.K.A'), 'pekka');
      expect(gameSlug('L.A.S.S.I'), 'lassi');
      expect(gameSlug("Giant's Gauntlet"), 'giants-gauntlet');
      expect(gameSlug('  Rage Spell '), 'rage-spell');
    });
  });

  group('resolveAsset', () {
    const available = {
      'assets/game/heroes/barbarian-king.webp',
      'assets/game/equipment/giant-gauntlet.webp',
      'assets/game/spells/rage-spell.webp',
      'assets/game/troops/barbarian.webp',
      'assets/game/troops/barbarian-super.webp',
      'assets/game/troops/goblin-super.webp',
      'assets/game/siege/battle-blimp.webp',
      'assets/game/pets/lassi.webp',
    };

    test('영웅·장비·주문', () {
      expect(
        resolveAsset(available, ItemKind.hero, 'Barbarian King'),
        'assets/game/heroes/barbarian-king.webp',
      );
      expect(
        resolveAsset(available, ItemKind.equipment, 'Giant Gauntlet'),
        'assets/game/equipment/giant-gauntlet.webp',
      );
      expect(
        resolveAsset(available, ItemKind.spell, 'Rage Spell'),
        'assets/game/spells/rage-spell.webp',
      );
    });

    test('부대는 일반 부대 → 공성 병기 → 펫 순서로 찾는다', () {
      expect(
        resolveAsset(available, ItemKind.troop, 'Barbarian'),
        'assets/game/troops/barbarian.webp',
      );
      expect(
        resolveAsset(available, ItemKind.troop, 'Battle Blimp'),
        'assets/game/siege/battle-blimp.webp',
      );
      expect(
        resolveAsset(available, ItemKind.troop, 'L.A.S.S.I'),
        'assets/game/pets/lassi.webp',
      );
    });

    test('슈퍼 부대는 기본 부대의 -super 이미지를 쓴다', () {
      expect(
        resolveAsset(available, ItemKind.troop, 'Super Barbarian'),
        'assets/game/troops/barbarian-super.webp',
      );
      // 이름이 `Super`로 시작하지 않는 슈퍼 부대
      expect(
        resolveAsset(available, ItemKind.troop, 'Sneaky Goblin'),
        'assets/game/troops/goblin-super.webp',
      );
    });

    test('이미지가 없으면 null (일반 부대 이미지로 대신하지 않는다)', () {
      expect(resolveAsset(available, ItemKind.troop, 'Super Yeti'), isNull);
      expect(resolveAsset(available, ItemKind.hero, 'Unknown Hero'), isNull);
      expect(resolveAsset(const {}, ItemKind.hero, 'Barbarian King'), isNull);
      expect(resolveAsset(available, ItemKind.hero, null), isNull);
    });
  });

  group('progressPercent', () {
    PlayerItem i(int level, int max) => PlayerItem(level: level, maxLevel: max);

    test('소수 둘째 자리까지, 불필요한 0은 뺀다', () {
      expect(progressPercent([i(110, 110), i(105, 110)]), '97.73');
      expect(progressPercent([i(20, 27)]), '74.07');
      expect(progressPercent([i(13, 13), i(6, 6)]), '100');
      expect(progressPercent([i(1, 2)]), '50');
      expect(progressPercent([i(1, 3)]), '33.33');
      expect(progressPercent([i(21, 40)]), '52.5');
    });

    test('최대 레벨 합계가 0이면 null', () {
      expect(progressPercent(const []), isNull);
      expect(progressPercent([const PlayerItem(name: 'x')]), isNull);
    });
  });

  group('superTroopBaseName', () {
    test('Super X는 X, 이름이 다른 슈퍼 부대는 예외 표로', () {
      expect(superTroopBaseName('Super Barbarian'), 'Barbarian');
      expect(superTroopBaseName('Super Wall Breaker'), 'Wall Breaker');
      expect(superTroopBaseName('Sneaky Goblin'), 'Goblin');
      expect(superTroopBaseName('Rocket Balloon'), 'Balloon');
      expect(superTroopBaseName('Inferno Dragon'), 'Baby Dragon');
      expect(superTroopBaseName('Ice Hound'), 'Lava Hound');
    });

    test('일반 부대는 null', () {
      expect(superTroopBaseName('Barbarian'), isNull);
      expect(superTroopBaseName('Baby Dragon'), isNull);
    });
  });

  group('ItemTile', () {
    // 100 = 모든 타운홀에서 바바리안 킹의 최고 레벨(테스트용 표).
    final fakeCaps = LevelCaps(
      maxTownHall: 18,
      tables: {
        ItemKind.hero: {'barbarian-king': List.filled(18, 100)},
      },
    );

    Future<void> pumpTile(
      WidgetTester tester,
      PlayerItem item,
      ItemKind kind, {
      Set<String> assets = const {},
      int? townHall,
      String? superName,
    }) async {
      await tester.pumpWidget(
        ProviderScope(
          // 같은 테스트에서 여러 번 그려도 override가 새로 적용되도록 매번 새 스코프를 만든다.
          key: UniqueKey(),
          overrides: [
            gameAssetsProvider.overrideWith((ref) async => assets),
            levelCapsProvider.overrideWith((ref) async => fakeCaps),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: ItemTile(
                item: item,
                kind: kind,
                townHall: townHall,
                superName: superName,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    const hero = PlayerItem(name: 'Barbarian King', level: 90, maxLevel: 110);

    testWidgets('이미지가 없으면 대체 이미지(아이콘)와 레벨 배지를 보여준다', (tester) async {
      await pumpTile(tester, hero, ItemKind.hero);
      expect(find.byType(Image), findsNothing);
      expect(find.byIcon(Icons.image_not_supported_outlined), findsOneWidget);
      expect(find.text('Barbarian King'), findsOneWidget); // 대체 이미지 안의 작은 이름
      expect(find.text('90'), findsOneWidget);
    });

    testWidgets('이미지가 있으면 이미지를 그리고 대체 이미지는 없다', (tester) async {
      await pumpTile(
        tester,
        hero,
        ItemKind.hero,
        assets: const {'assets/game/heroes/barbarian-king.webp'},
      );
      expect(find.byType(Image), findsOneWidget);
      expect(find.byTooltip('Barbarian King · 90/110'), findsOneWidget);
    });

    testWidgets('최대 레벨이면 금색 테두리로 강조한다', (tester) async {
      Color? borderOf(WidgetTester t) {
        final box = t.widget<Container>(
          find
              .descendant(
                of: find.byType(ItemTile),
                matching: find.byType(Container),
              )
              .first,
        );
        return ((box.decoration as BoxDecoration).border as Border).top.color;
      }

      await pumpTile(tester, hero, ItemKind.hero);
      final normal = borderOf(tester);

      await pumpTile(
        tester,
        const PlayerItem(name: 'Barbarian King', level: 110, maxLevel: 110),
        ItemKind.hero,
      );
      expect(borderOf(tester), const Color(0xFFFFD54F));
      expect(normal, isNot(const Color(0xFFFFD54F)));
    });

    group('오른쪽 위 현재 홀 최고 레벨', () {
      testWidgets('레벨이 최고보다 낮으면 표시한다', (tester) async {
        await pumpTile(tester, hero, ItemKind.hero, townHall: 16);
        expect(find.text('90'), findsOneWidget); // 현재 레벨
        expect(find.text('100'), findsOneWidget); // 홀 최고 (API maxLevel 110이 아님)
        expect(find.text('110'), findsNothing);
      });

      testWidgets('현재 레벨과 같으면 표시하지 않는다', (tester) async {
        await pumpTile(
          tester,
          const PlayerItem(name: 'Barbarian King', level: 100, maxLevel: 110),
          ItemKind.hero,
          townHall: 16,
        );
        expect(find.text('100'), findsOneWidget); // 레벨 배지 하나뿐
      });

      testWidgets('표에 없거나 타운홀을 모르면 표시하지 않는다', (tester) async {
        await pumpTile(tester, hero, ItemKind.hero); // 타운홀 모름
        expect(find.text('100'), findsNothing);

        await pumpTile(
          tester,
          const PlayerItem(name: 'Portal Pendant', level: 3, maxLevel: 27),
          ItemKind.equipment,
          townHall: 18,
        );
        expect(find.text('27'), findsNothing);
      });

      testWidgets('표의 값이 현재 레벨보다 작으면(데이터 오류) 표시하지 않는다', (tester) async {
        await pumpTile(
          tester,
          const PlayerItem(name: 'Barbarian King', level: 105, maxLevel: 110),
          ItemKind.hero,
          townHall: 16, // 표의 최고는 100 < 현재 105
        );
        expect(find.text('100'), findsNothing);
        expect(find.text('105'), findsOneWidget);
      });
    });

    group('오른쪽 위 배지 색', () {
      Color? badgeColor(WidgetTester t, String text) {
        final container = t.widget<Container>(
          find
              .ancestor(of: find.text(text), matching: find.byType(Container))
              .first,
        );
        return (container.decoration as BoxDecoration).color;
      }

      testWidgets('현재 홀 최고 레벨은 파란색, 현재 레벨 배지는 파란색이 아니다', (tester) async {
        await pumpTile(tester, hero, ItemKind.hero, townHall: 16);
        const blue = Color(0xFF1E88E5);
        expect(badgeColor(tester, '100'), blue); // 오른쪽 위: 홀 최고 100
        expect(badgeColor(tester, '90'), isNot(blue)); // 왼쪽 아래: 현재 레벨 90
      });
    });

    group('슈퍼 부대 빨간 별', () {
      const barbarian = PlayerItem(name: 'Barbarian', level: 13, maxLevel: 13);

      testWidgets('슈퍼 부대가 활성화되면 별과 기본 레벨을 보여준다', (tester) async {
        await pumpTile(
          tester,
          barbarian,
          ItemKind.troop,
          superName: 'Super Barbarian',
        );
        expect(find.byIcon(Icons.star), findsOneWidget);
        expect(find.text('13'), findsOneWidget);
        expect(
          find.byTooltip('Barbarian · 13/13 · Super Barbarian'),
          findsOneWidget,
        );
      });

      testWidgets('활성화되지 않았으면 별이 없다', (tester) async {
        await pumpTile(tester, barbarian, ItemKind.troop);
        expect(find.byIcon(Icons.star), findsNothing);
      });

      testWidgets('슈퍼 이미지가 있으면 그것을, 없으면 기본 이미지를 쓴다', (tester) async {
        // 슈퍼 이미지와 기본 이미지가 모두 있을 때는 슈퍼 이미지
        await pumpTile(
          tester,
          barbarian,
          ItemKind.troop,
          superName: 'Super Barbarian',
          assets: const {
            'assets/game/troops/barbarian.webp',
            'assets/game/troops/barbarian-super.webp',
          },
        );
        var image = tester.widget<Image>(find.byType(Image));
        expect((image.image as ResizeImage).imageProvider, isA<AssetImage>());
        expect(
          ((image.image as ResizeImage).imageProvider as AssetImage).assetName,
          'assets/game/troops/barbarian-super.webp',
        );

        // 슈퍼 이미지가 없으면 기본 부대 이미지
        await pumpTile(
          tester,
          const PlayerItem(name: 'Miner', level: 12, maxLevel: 12),
          ItemKind.troop,
          superName: 'Super Miner',
          assets: const {'assets/game/troops/miner.webp'},
        );
        image = tester.widget<Image>(find.byType(Image));
        expect(
          ((image.image as ResizeImage).imageProvider as AssetImage).assetName,
          'assets/game/troops/miner.webp',
        );
      });
    });
  });
}
