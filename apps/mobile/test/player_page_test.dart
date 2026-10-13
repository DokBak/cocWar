import 'dart:convert';
import 'dart:io';

import 'package:coc_models/coc_models.dart';
import 'package:cocwar_mobile/app.dart';
import 'package:cocwar_mobile/core/api_client.dart';
import 'package:cocwar_mobile/core/providers.dart';
import 'package:cocwar_mobile/features/player/item_groups.dart';
import 'package:cocwar_mobile/features/player/item_tile.dart';
import 'package:cocwar_mobile/features/player/level_caps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fake_api.dart';

PlayerItem item(
  String name,
  int level,
  int max, {
  String village = 'home',
  bool? superActive,
  List<PlayerItem> equipment = const [],
}) => PlayerItem(
  name: name,
  level: level,
  maxLevel: max,
  village: village,
  superTroopIsActive: superActive,
  equipment: equipment,
);

final testPlayer = Player(
  tag: '#P0Y2LQ9',
  name: 'Chief',
  townHallLevel: 18,
  expLevel: 261,
  trophies: 35,
  bestTrophies: 6171,
  warStars: 3161,
  attackWins: 0,
  defenseWins: 0,
  role: 'coLeader',
  warPreference: 'in',
  donations: 862,
  donationsReceived: 409,
  clanCapitalContributions: 3331946,
  builderHallLevel: 9,
  builderBaseTrophies: 4874,
  bestBuilderBaseTrophies: 4906,
  builderBaseLeague: const League(id: 2, name: 'Platinum League I'),
  clan: const PlayerClan(tag: '#2PP', name: 'Test Clan'),
  // 새 리그 체계: league는 비어 있고 leagueTier에만 값이 있다.
  leagueTier: const League(id: 1, name: 'Electro League 33'),
  heroes: [
    item(
      'Barbarian King',
      110,
      110,
      equipment: [item('Spiky Ball', 27, 27), item('Earthquake Boots', 18, 27)],
    ),
    item('Archer Queen', 105, 110),
    item('Battle Machine', 25, 35, village: 'builderBase'),
    item('Battle Copter', 30, 35, village: 'builderBase'),
  ],
  heroEquipment: [
    item('Giant Gauntlet', 20, 27), // 바바리안 킹
    item('Spiky Ball', 27, 27), // 바바리안 킹
    item('Frozen Arrow', 27, 27), // 아처 퀸
  ],
  troops: [
    item('Barbarian', 13, 13), // 엘릭서
    item('Baby Dragon', 11, 12), // 엘릭서 (장인기지에도 같은 이름의 유닛이 있다)
    item('Wall Breaker', 14, 14), // 엘릭서
    item('Hog Rider', 10, 13), // 다크엘릭서
    item('Battle Blimp', 4, 4), // 시즈머신
    item('L.A.S.S.I', 10, 15), // 펫
    // 실제 API는 슈퍼 부대 레벨을 항상 1로 준다(기본 부대 레벨이 아니다).
    item('Super Barbarian', 1, 9), // 비활성 슈퍼 부대: 목록에 보이면 안 된다
    item('Super Wall Breaker', 1, 10, superActive: true),
    item('Raged Barbarian', 16, 20, village: 'builderBase'),
    item('Baby Dragon', 15, 20, village: 'builderBase'),
  ],
  spells: [item('Rage Spell', 6, 6), item('Poison Spell', 5, 10)],
);

const testClan = Clan(
  tag: '#2PP',
  name: 'Test Clan',
  isWarLogPublic: false,
  memberList: [
    ClanMember(
      tag: '#P0Y2LQ9',
      name: 'Chief',
      role: 'coLeader',
      townHallLevel: 18,
      trophies: 35,
      clanRank: 1,
      donations: 862,
      donationsReceived: 409,
    ),
    ClanMember(tag: '#PPYYLLQ', name: 'Buddy', role: 'admin', clanRank: 2),
  ],
);

/// 앱에 번들되는 실제 최고 레벨 표. 비동기 에셋 로딩 타이밍에 의존하지 않도록 파일에서 바로 읽는다.
final realCaps = LevelCaps.fromJson(
  jsonDecode(File('assets/data/level_caps.json').readAsStringSync())
      as Map<String, dynamic>,
);

/// 앱에 번들되는 실제 분류 데이터(영웅별 장비, 부대·주문 자원 구분).
final realGroups = ItemGroups.fromJson(
  jsonDecode(File('assets/data/item_groups.json').readAsStringSync())
      as Map<String, dynamic>,
);

Future<void> pumpApp(
  WidgetTester tester,
  FakeApi api, {
  String locale = 'en',
}) async {
  SharedPreferences.setMockInitialValues({'settings.locale': locale});
  final prefs = await SharedPreferences.getInstance();
  tester.view.physicalSize = const Size(800, 2400);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        apiClientProvider.overrideWithValue(api),
        levelCapsProvider.overrideWith((ref) async => realCaps),
        itemGroupsProvider.overrideWith((ref) async => realGroups),
      ],
      child: const App(),
    ),
  );
  await tester.pumpAndSettle();
}

/// 이름이 [name]인 아이콘 타일. 이미지를 받아 둔 환경과 아닌 환경에서 모두 같게 동작하도록
/// 이름 텍스트가 아니라 툴팁(`이름 · 레벨/최대`)으로 찾는다.
Finder tip(String name) => find.byWidgetPredicate(
  (w) => w is Tooltip && (w.message ?? '').startsWith('$name ·'),
);

/// [name] 타일 안에서 [matching]을 찾는다.
Finder inTile(String name, Finder matching) =>
    find.descendant(of: tip(name), matching: matching);

/// 홈에서 플레이어 탭을 골라 태그를 검색해 플레이어 화면을 연다.
Future<void> openPlayer(WidgetTester tester, String tag) async {
  await tester.tap(find.text('Player'));
  await tester.pumpAndSettle();
  await tester.enterText(find.byType(TextField), tag);
  await tester.tap(find.byIcon(Icons.search));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('프로필 헤더와 통계를 보여준다', (tester) async {
    final api = FakeApi()..player = testPlayer;
    await pumpApp(tester, api);
    await openPlayer(tester, 'p0y2lq9');

    expect(api.playerCalls, ['#P0Y2LQ9']);
    expect(find.text('Chief'), findsWidgets);
    expect(find.textContaining('Town Hall 18'), findsOneWidget);
    expect(find.textContaining('XP level 261'), findsOneWidget);
    // 새 리그 체계(leagueTier)의 이름이 보인다.
    expect(find.text('Electro League 33'), findsOneWidget);
    expect(find.text('3,161'), findsOneWidget); // 전쟁 별 (천 단위 구분)
    expect(find.text('3,331,946'), findsOneWidget);
    expect(find.text('6,171'), findsOneWidget);
    expect(find.text('0'), findsNWidgets(2)); // 공격/방어 승리
    expect(find.textContaining('Co-leader'), findsOneWidget);
    expect(find.textContaining('Open to wars'), findsOneWidget);
  });

  group('통계 아이콘 (Material 아이콘, 이미지 파일 없음)', () {
    Finder statIcon(String label, IconData icon) => find.descendant(
      of: find
          .ancestor(of: find.text(label), matching: find.byType(Container))
          .first,
      matching: find.byIcon(icon),
    );

    testWidgets('각 통계 칸에 알맞은 아이콘이 있다', (tester) async {
      final api = FakeApi()..player = testPlayer;
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      expect(statIcon('Trophies', Icons.emoji_events), findsOneWidget);
      expect(statIcon('Best', Icons.workspace_premium), findsOneWidget);
      expect(statIcon('War stars', Icons.star), findsOneWidget);
      expect(
        statIcon('Attack wins', Icons.local_fire_department),
        findsOneWidget,
      );
      expect(statIcon('Defense wins', Icons.shield), findsOneWidget);
      expect(statIcon('Donated', Icons.volunteer_activism), findsOneWidget);
      expect(statIcon('Received', Icons.call_received), findsOneWidget);
      expect(
        statIcon('Capital contributions', Icons.account_balance),
        findsOneWidget,
      );
    });
  });

  group('본마을 / 장인기지 탭', () {
    Future<void> openBuilder(WidgetTester tester) async {
      await tester.tap(find.text('Builder Base'));
      await tester.pumpAndSettle();
    }

    testWidgets('기본은 본마을이다', (tester) async {
      final api = FakeApi()..player = testPlayer;
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      expect(tip('Barbarian King'), findsOneWidget);
      expect(tip('Battle Machine'), findsNothing);
      expect(find.text('Home Village'), findsOneWidget);
      expect(find.text('Builder Base'), findsOneWidget);
    });

    testWidgets('장인기지 탭에는 장인기지 영웅과 유닛만 나온다', (tester) async {
      final api = FakeApi()..player = testPlayer;
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');
      await openBuilder(tester);

      // 장인기지 영웅·유닛
      expect(tip('Battle Machine'), findsOneWidget);
      expect(tip('Battle Copter'), findsOneWidget);
      expect(tip('Raged Barbarian'), findsOneWidget);
      expect(find.text('Units'), findsOneWidget);
      // 본마을 항목은 보이지 않는다
      expect(tip('Barbarian King'), findsNothing);
      expect(tip('Barbarian'), findsNothing);
      expect(tip('Rage Spell'), findsNothing);
      expect(find.text('Equipment progress: 91.36%'), findsNothing);
      // 장인기지 통계
      expect(find.text('Builder Hall 9'), findsOneWidget);
      expect(find.text('4,874'), findsOneWidget);
      expect(find.text('4,906'), findsOneWidget);
      expect(find.text('Platinum League I'), findsOneWidget);
      // 본마을 통계(전쟁 별 등)는 보이지 않는다
      expect(find.text('War stars'), findsNothing);
    });

    testWidgets('본마을로 돌아오면 본마을 내용이 복원된다', (tester) async {
      final api = FakeApi()..player = testPlayer;
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');
      await openBuilder(tester);

      await tester.tap(find.text('Home Village'));
      await tester.pumpAndSettle();
      expect(tip('Barbarian King'), findsOneWidget);
      expect(tip('Battle Machine'), findsNothing);
    });

    testWidgets('본마을과 장인기지에 이름이 같은 유닛(Baby Dragon)은 각 탭에 따로 나온다', (
      tester,
    ) async {
      final api = FakeApi()..player = testPlayer;
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      expect(find.byTooltip('Baby Dragon · 11/12'), findsOneWidget); // 본마을
      expect(find.byTooltip('Baby Dragon · 15/20'), findsNothing);

      await openBuilder(tester);
      expect(find.byTooltip('Baby Dragon · 15/20'), findsOneWidget); // 장인기지
      expect(find.byTooltip('Baby Dragon · 11/12'), findsNothing);
    });

    testWidgets('오른쪽 위에 현재 장인 회관의 최고 레벨이 나온다', (tester) async {
      final api = FakeApi()..player = testPlayer; // 장인 회관 9
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');
      await openBuilder(tester);

      // Raged Barbarian 16 / 장인 회관 9 최고 18 (API maxLevel 20이 아님)
      expect(inTile('Raged Barbarian', find.text('16')), findsOneWidget);
      expect(inTile('Raged Barbarian', find.text('18')), findsOneWidget);
      expect(inTile('Raged Barbarian', find.text('20')), findsNothing);
      // Battle Machine 25 / 장인 회관 9 최고 30
      expect(inTile('Battle Machine', find.text('30')), findsOneWidget);
    });

    testWidgets('장인기지 진행률을 보여준다', (tester) async {
      final api = FakeApi()..player = testPlayer;
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');
      await openBuilder(tester);

      // 영웅 (25+30)/(35+35)=78.57, 유닛 (16+15)/(20+20)=77.5
      expect(find.text('Progress: 78.57%'), findsOneWidget);
      expect(find.text('Progress: 77.5%'), findsOneWidget);
    });

    testWidgets('장인기지 정보가 없는 계정은 안내 문구를 보여준다', (tester) async {
      final api = FakeApi()
        ..player = Player(
          tag: '#P0Y2LQ9',
          name: 'Newbie',
          townHallLevel: 3,
          heroes: [item('Barbarian King', 5, 110)],
        );
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');
      await openBuilder(tester);

      expect(find.text('No Builder Base information.'), findsOneWidget);
    });
  });

  group('플레이어 태그', () {
    testWidgets('이름 뒤에 표시되고 부제목(타운홀·경험치)에는 들어 있지 않다', (tester) async {
      final api = FakeApi()..player = testPlayer;
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      final tag = find.text('#P0Y2LQ9');
      expect(tag, findsOneWidget);
      // 앱바 제목이 아니라 헤더 카드 안의 이름
      final name = find.descendant(
        of: find.byType(Card).first,
        matching: find.text('Chief'),
      );
      // 같은 줄에서 이름 오른쪽에 있다.
      expect(
        tester.getTopLeft(tag).dx,
        greaterThan(tester.getTopRight(name).dx),
      );
      expect(
        (tester.getCenter(tag).dy - tester.getCenter(name).dy).abs(),
        lessThan(8),
      );
      // 부제목은 타운홀·경험치만.
      expect(find.text('Town Hall 18 · XP level 261'), findsOneWidget);
    });

    testWidgets('태그를 누르면 클립보드에 복사하고 알려 준다', (tester) async {
      String? copied;
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        (call) async {
          if (call.method == 'Clipboard.setData') {
            copied = (call.arguments as Map)['text'] as String?;
          }
          return null;
        },
      );
      addTearDown(
        () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          SystemChannels.platform,
          null,
        ),
      );

      final api = FakeApi()..player = testPlayer;
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      expect(find.byTooltip('Copy tag'), findsOneWidget);
      await tester.tap(find.text('#P0Y2LQ9'));
      await tester.pump(); // 스낵바 표시

      expect(copied, '#P0Y2LQ9');
      expect(find.text('Copied #P0Y2LQ9'), findsOneWidget);
    });
  });

  testWidgets('영웅·장비·부대·주문을 아이콘 타일로 보여주고 빌더 베이스는 제외한다', (tester) async {
    final api = FakeApi()..player = testPlayer;
    await pumpApp(tester, api);
    await openPlayer(tester, '#P0Y2LQ9');

    expect(tip('Barbarian King'), findsOneWidget);
    expect(find.byTooltip('Barbarian King · 110/110'), findsOneWidget);
    expect(tip('Archer Queen'), findsOneWidget);
    expect(tip('Giant Gauntlet'), findsOneWidget);
    expect(tip('Rage Spell'), findsOneWidget);
    expect(tip('Barbarian'), findsOneWidget);
    // 빌더 베이스 항목은 보이지 않는다.
    expect(tip('Battle Machine'), findsNothing);
    expect(tip('Raged Barbarian'), findsNothing);
    // 타일에는 레벨 배지가 보인다.
    expect(inTile('Barbarian King', find.text('110')), findsOneWidget);
    expect(inTile('Archer Queen', find.text('105')), findsOneWidget);
  });

  testWidgets('영웅·장비·부대·주문 진행률(레벨 합계 / 최대 합계)을 보여준다', (tester) async {
    final api = FakeApi()..player = testPlayer;
    await pumpApp(tester, api);
    await openPlayer(tester, '#P0Y2LQ9');

    expect(
      find.text('Progress: 97.73%'),
      findsOneWidget,
    ); // 영웅 (110+105)/(110+110)
    expect(find.text('Equipment progress: 91.36%'), findsOneWidget); // 장비 74/81
    // 부대 전체 62/71, 주문 전체 11/16
    expect(find.text('Progress: 87.32%'), findsOneWidget);
    expect(find.text('Progress: 68.75%'), findsOneWidget);
  });

  group('영웅 아래에 그 영웅의 장비', () {
    double y(WidgetTester t, String name) => t.getTopLeft(tip(name)).dy;

    testWidgets('각 영웅 바로 아래에 그 영웅의 장비가 있다', (tester) async {
      final api = FakeApi()..player = testPlayer;
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      // 킹 → 킹의 장비 → 퀸 → 퀸의 장비 순서(위에서 아래로)
      expect(
        y(tester, 'Barbarian King'),
        lessThan(y(tester, 'Giant Gauntlet')),
      );
      expect(y(tester, 'Barbarian King'), lessThan(y(tester, 'Spiky Ball')));
      expect(y(tester, 'Giant Gauntlet'), lessThan(y(tester, 'Archer Queen')));
      expect(y(tester, 'Spiky Ball'), lessThan(y(tester, 'Archer Queen')));
      expect(y(tester, 'Archer Queen'), lessThan(y(tester, 'Frozen Arrow')));
      // 별도의 "영웅 장비" 섹션은 없다.
      expect(find.text('Hero equipment'), findsNothing);
    });

    testWidgets('영웅을 확인할 수 없는 장비는 마지막 "기타" 블록에 둔다', (tester) async {
      // Portal Pendant는 미니언 프린스의 장비지만 이 플레이어에게는 프린스가 없다.
      final api = FakeApi()
        ..player = testPlayer.copyWith(
          heroEquipment: [
            item('Giant Gauntlet', 20, 27),
            item('Portal Pendant', 3, 27),
          ],
        );
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      expect(find.text('Other'), findsOneWidget);
      final otherY = tester.getTopLeft(find.text('Other')).dy;
      expect(y(tester, 'Archer Queen'), lessThan(otherY));
      expect(
        tester.getTopLeft(find.text('Other')).dy,
        lessThan(y(tester, 'Portal Pendant')),
      );
    });

    testWidgets('데이터에 영웅 정보가 있으면 그 영웅 아래에 둔다(Portal Pendant → 미니언 프린스)', (
      tester,
    ) async {
      final api = FakeApi()
        ..player = testPlayer.copyWith(
          heroes: [
            item('Barbarian King', 110, 110),
            item('Minion Prince', 91, 95),
          ],
          heroEquipment: [item('Portal Pendant', 3, 27)],
        );
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      expect(find.text('Other'), findsNothing);
      expect(y(tester, 'Minion Prince'), lessThan(y(tester, 'Portal Pendant')));
    });

    testWidgets('데이터에 없어도 API가 알려주는 장착 정보로 영웅을 찾는다', (tester) async {
      final api = FakeApi()
        ..player = testPlayer.copyWith(
          heroes: [
            item(
              'Barbarian King',
              110,
              110,
              equipment: [item('Brand New Thing', 1, 18)],
            ),
            item('Archer Queen', 105, 110),
          ],
          heroEquipment: [item('Brand New Thing', 1, 18)],
        );
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      expect(find.text('Other'), findsNothing);
      expect(
        y(tester, 'Barbarian King'),
        lessThan(y(tester, 'Brand New Thing')),
      );
      expect(y(tester, 'Brand New Thing'), lessThan(y(tester, 'Archer Queen')));
    });
  });

  group('부대·주문 소제목', () {
    double y(WidgetTester t, Finder f) => t.getTopLeft(f).dy;

    // 소제목은 `이름   진행률` 한 줄이다.
    Finder heading(String text) => find.text(text);

    testWidgets('부대는 엘릭서 → 다크엘릭서 → 시즈머신 → 펫 순서로 알맞은 소제목 아래에 있다', (
      tester,
    ) async {
      final api = FakeApi()..player = testPlayer;
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      final elixir = heading('Elixir   Progress: 97.44%'); // 부대 쪽(엘릭서 38/39)
      final dark = heading('Dark Elixir   Progress: 76.92%');
      final siege = heading('Siege machines   Progress: 100%');
      final pets = heading('Pets   Progress: 66.67%');
      expect(dark, findsOneWidget);
      expect(siege, findsOneWidget);
      expect(pets, findsOneWidget);

      double at(Finder f) => y(tester, f);
      // 소제목 순서
      expect(at(elixir), lessThan(at(dark)));
      expect(at(dark), lessThan(at(siege)));
      expect(at(siege), lessThan(at(pets)));
      // 각 부대는 자기 소제목 아래, 다음 소제목 위
      expect(at(elixir), lessThan(y(tester, tip('Barbarian'))));
      expect(y(tester, tip('Barbarian')), lessThan(at(dark)));
      expect(at(dark), lessThan(y(tester, tip('Hog Rider'))));
      expect(y(tester, tip('Hog Rider')), lessThan(at(siege)));
      expect(at(siege), lessThan(y(tester, tip('Battle Blimp'))));
      expect(y(tester, tip('Battle Blimp')), lessThan(at(pets)));
      expect(at(pets), lessThan(y(tester, tip('L.A.S.S.I'))));
    });

    testWidgets('슈퍼 부대가 활성화된 기본 부대는 기본 부대의 소제목(엘릭서) 아래에 있다', (tester) async {
      final api = FakeApi()
        ..player = testPlayer; // Wall Breaker + Super Wall Breaker
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      final elixir = heading('Elixir   Progress: 97.44%');
      final dark = heading('Dark Elixir   Progress: 76.92%');
      final wallBreaker = y(tester, tip('Wall Breaker'));
      expect(y(tester, elixir), lessThan(wallBreaker));
      expect(wallBreaker, lessThan(y(tester, dark)));
    });

    testWidgets('주문은 엘릭서 → 다크엘릭서 소제목으로 나뉜다', (tester) async {
      final api = FakeApi()..player = testPlayer;
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      // 같은 이름의 소제목이 부대 쪽에도 있으므로 주문 쪽(두 번째 엘릭서)을 쓴다.
      final spellElixir = heading('Elixir   Progress: 100%').last;
      final spellDark = heading('Dark Elixir   Progress: 50%');
      expect(spellDark, findsOneWidget);
      expect(y(tester, spellElixir), lessThan(y(tester, tip('Rage Spell'))));
      expect(y(tester, tip('Rage Spell')), lessThan(y(tester, spellDark)));
      expect(y(tester, spellDark), lessThan(y(tester, tip('Poison Spell'))));
    });

    testWidgets('항목이 없는 소제목은 보이지 않는다', (tester) async {
      final api = FakeApi()
        ..player = testPlayer.copyWith(
          troops: [item('Barbarian', 13, 13)],
          spells: [item('Rage Spell', 6, 6)],
        );
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      expect(find.textContaining('Dark Elixir'), findsNothing);
      expect(find.textContaining('Siege machines'), findsNothing);
      expect(find.textContaining('Pets'), findsNothing);
      expect(find.textContaining('Elixir'), findsNWidgets(2)); // 부대, 주문
    });

    testWidgets('분류를 모르는 부대는 마지막 "기타" 소제목에 둔다', (tester) async {
      final api = FakeApi()
        ..player = testPlayer.copyWith(
          troops: [item('Barbarian', 13, 13), item('Brand New Troop', 1, 10)],
        );
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      final other = find.textContaining('Other   Progress');
      expect(other, findsOneWidget);
      expect(
        y(tester, heading('Elixir   Progress: 100%').first),
        lessThan(y(tester, other)),
      );
      expect(y(tester, other), lessThan(y(tester, tip('Brand New Troop'))));
    });
  });

  testWidgets('활성 슈퍼 부대는 기본 부대 타일에 빨간 별과 기본 레벨로 표시된다', (tester) async {
    final api = FakeApi()..player = testPlayer;
    await pumpApp(tester, api);
    await openPlayer(tester, '#P0Y2LQ9');

    // 기본 부대 타일에 별이 붙고, 레벨은 슈퍼 부대의 1이 아니라 기본 부대의 14다.
    expect(inTile('Wall Breaker', find.byIcon(Icons.star)), findsOneWidget);
    expect(inTile('Wall Breaker', find.text('14')), findsOneWidget);
    expect(inTile('Wall Breaker', find.text('1')), findsNothing);
    expect(
      find.byTooltip('Wall Breaker · 14/14 · Super Wall Breaker'),
      findsOneWidget,
    );
    // 슈퍼 부대가 별도 타일이나 섹션으로 또 나오지 않는다.
    expect(tip('Super Wall Breaker'), findsNothing);
    expect(find.text('Active super troops'), findsNothing);
  });

  testWidgets('비활성 슈퍼 부대는 숨기고 해당 기본 부대에는 별이 없다', (tester) async {
    final api = FakeApi()..player = testPlayer;
    await pumpApp(tester, api);
    await openPlayer(tester, '#P0Y2LQ9');

    expect(tip('Super Barbarian'), findsNothing);
    expect(inTile('Barbarian', find.byIcon(Icons.star)), findsNothing);
    // 타일 안의 빨간 별은 활성 슈퍼 부대 하나뿐 (통계의 전쟁 별 아이콘은 타일이 아니다)
    expect(
      find.descendant(
        of: find.byType(ItemTile),
        matching: find.byIcon(Icons.star),
      ),
      findsOneWidget,
    );
  });

  testWidgets('기본 부대를 목록에서 못 찾는 활성 슈퍼 부대는 그 자체로 표시한다', (tester) async {
    final api = FakeApi()
      ..player = testPlayer.copyWith(
        troops: [item('Super Miner', 1, 8, superActive: true)],
      );
    await pumpApp(tester, api);
    await openPlayer(tester, '#P0Y2LQ9');

    expect(tip('Super Miner'), findsOneWidget);
    expect(inTile('Super Miner', find.byIcon(Icons.star)), findsOneWidget);
  });

  group('오른쪽 위 현재 타운홀 최고 레벨', () {
    testWidgets('레벨이 최고보다 낮으면 최고 레벨을, 같으면 표시하지 않는다', (tester) async {
      final api = FakeApi()..player = testPlayer; // TH18
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      // Archer Queen 105 / TH18 최고 110 → 왼쪽 아래 105, 오른쪽 위 110
      expect(inTile('Archer Queen', find.text('105')), findsOneWidget);
      expect(inTile('Archer Queen', find.text('110')), findsOneWidget);
      // Barbarian King 110 == 최고 110 → 레벨 배지 하나만
      expect(inTile('Barbarian King', find.text('110')), findsOneWidget);
    });

    testWidgets('낮은 타운홀은 그 홀의 최고 레벨을 보여준다(API maxLevel이 아니다)', (tester) async {
      // 실제 API는 TH16 계정에도 maxLevel 110을 준다. 하지만 TH16의 바바리안 킹 최고는 95다.
      final api = FakeApi()
        ..player = testPlayer.copyWith(
          townHallLevel: 16,
          heroes: [item('Barbarian King', 81, 110)],
        );
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      expect(inTile('Barbarian King', find.text('81')), findsOneWidget);
      expect(inTile('Barbarian King', find.text('95')), findsOneWidget);
      expect(inTile('Barbarian King', find.text('110')), findsNothing);
    });

    testWidgets('이 홀에서 이미 한계까지 올렸으면 표시하지 않는다', (tester) async {
      final api = FakeApi()
        ..player = testPlayer.copyWith(
          townHallLevel: 16,
          heroes: [item('Barbarian King', 95, 110)],
        );
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      expect(inTile('Barbarian King', find.text('95')), findsOneWidget);
    });

    testWidgets('데이터에 없는 항목(예: 신규 장비)은 표시하지 않는다', (tester) async {
      final api = FakeApi()
        ..player = testPlayer.copyWith(
          heroEquipment: [item('Portal Pendant', 3, 27)],
        );
      await pumpApp(tester, api);
      await openPlayer(tester, '#P0Y2LQ9');

      expect(inTile('Portal Pendant', find.text('3')), findsOneWidget);
      expect(inTile('Portal Pendant', find.text('27')), findsNothing);
    });
  });

  testWidgets('이미지가 없는 항목은 대체 이미지로 표시한다', (tester) async {
    final api = FakeApi()
      ..player = testPlayer.copyWith(
        heroEquipment: [item('Portal Pendant', 3, 27)],
      );
    await pumpApp(tester, api);
    await openPlayer(tester, '#P0Y2LQ9');

    expect(
      inTile('Portal Pendant', find.byIcon(Icons.image_not_supported_outlined)),
      findsOneWidget,
    );
  });

  testWidgets('없는 플레이어는 오류 화면을 보여주고 다시 시도할 수 있다', (tester) async {
    final api = FakeApi()
      ..playerError = const ApiException(
        ApiErrorKind.notFound,
        statusCode: 404,
      );
    await pumpApp(tester, api);
    await openPlayer(tester, '#P0Y2LQ9');
    expect(find.text('Not found.'), findsOneWidget);

    api
      ..playerError = null
      ..player = testPlayer;
    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();
    expect(tip('Barbarian King'), findsOneWidget);
  });

  testWidgets('소속 클랜을 누르면 클랜 화면으로 이동한다', (tester) async {
    final api = FakeApi()
      ..player = testPlayer
      ..clan = testClan;
    await pumpApp(tester, api);
    await openPlayer(tester, '#P0Y2LQ9');

    await tester.tap(find.text('Test Clan'));
    await tester.pumpAndSettle();
    expect(find.text('War log'), findsOneWidget); // 클랜 화면의 탭
    expect(find.text('Members'), findsOneWidget);
  });

  testWidgets('클랜 멤버 탭에서 멤버를 누르면 그 플레이어 프로필로 이동한다', (tester) async {
    final api = FakeApi()
      ..player = testPlayer
      ..clan = testClan;
    await pumpApp(tester, api);
    await tester.enterText(find.byType(TextField), '2pp'); // 클랜 탭이 기본
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Members'));
    await tester.pumpAndSettle();
    expect(find.text('Chief'), findsOneWidget);
    expect(find.text('Buddy'), findsOneWidget);
    expect(find.textContaining('Elder'), findsOneWidget); // API의 admin = 장로
    expect(find.textContaining('Town Hall 18'), findsOneWidget);

    await tester.tap(find.text('Chief'));
    await tester.pumpAndSettle();
    expect(api.playerCalls, ['#P0Y2LQ9']);
    expect(tip('Barbarian King'), findsOneWidget);
  });

  for (final (locale, heroes, troops) in [
    ('ko', '영웅', '부대'),
    ('ja', 'ヒーロー', '兵'),
  ]) {
    testWidgets('$locale: 섹션 제목이 해당 언어로 표시된다', (tester) async {
      final api = FakeApi()..player = testPlayer;
      await pumpApp(tester, api, locale: locale);
      await tester.tap(find.byIcon(Icons.person_outline).first);
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), '#P0Y2LQ9');
      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();
      expect(find.text(heroes), findsOneWidget);
      expect(find.text(troops), findsOneWidget);
    });
  }
}
