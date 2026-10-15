import 'package:coc_models/coc_models.dart';
import 'package:cocwar_mobile/app.dart';
import 'package:cocwar_mobile/core/api_client.dart';
import 'package:cocwar_mobile/core/layout.dart';
import 'package:cocwar_mobile/core/providers.dart';
import 'package:cocwar_mobile/features/clan/clan_page.dart';
import 'package:cocwar_mobile/features/player/item_groups.dart';
import 'package:cocwar_mobile/features/player/level_caps.dart';
import 'package:cocwar_mobile/features/player/player_page.dart';
import 'package:cocwar_mobile/features/war/war_page.dart';
import 'package:cocwar_mobile/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fake_api.dart';
import 'support/war_fixture.dart';

const _clan = Clan(
  tag: '#2PP',
  name: 'Test Clan',
  isWarLogPublic: true,
  memberList: [
    ClanMember(tag: '#P0Y2LQ9', name: 'Chief', role: 'coLeader', clanRank: 1),
  ],
);

const _player = Player(
  tag: '#P0Y2LQ9',
  name: 'Chief',
  townHallLevel: 18,
  clan: PlayerClan(tag: '#2PP', name: 'Test Clan'),
);

FakeApi apiWith({
  CurrentWar? war,
  Object? warError,
  Player? player = _player,
}) => FakeApi()
  ..clan = _clan
  ..player = player
  ..war = war
  ..warError = warError
  ..log = [];

/// [home]을 MaterialApp에 올린다 (라우터 없음: 이동하지 않는 확인용).
Future<void> pumpHome(
  WidgetTester tester,
  FakeApi api,
  Widget home, {
  Size size = const Size(800, 1400),
}) async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ProviderScope(
      retry: noAutoRetry,
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        apiClientProvider.overrideWithValue(api),
        levelCapsProvider.overrideWith((ref) async => const LevelCaps()),
        itemGroupsProvider.overrideWith((ref) async => ItemGroups.empty),
      ],
      child: MaterialApp(
        locale: const Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: home,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

final button = find.text('View clan war info');

/// 알약 버튼 전체(아이콘 + 글자 + 상태). 글자만 보면 아이콘과 상태 때문에 중심이 치우쳐 보인다.
Finder pillOf(Finder label) =>
    find.ancestor(of: label, matching: find.byType(InkWell)).first;

void main() {
  group('클랜 창', () {
    testWidgets('전투일이면 버튼과 상태가 보인다', (tester) async {
      await pumpHome(
        tester,
        apiWith(war: makeWar()),
        const ClanPage(tag: '#2PP'),
      );
      expect(button, findsOneWidget);
      expect(find.text('Battle day'), findsWidgets); // 버튼의 상태 표시
    });

    testWidgets('준비일에도 보인다', (tester) async {
      await pumpHome(
        tester,
        apiWith(war: makeWar(state: WarState.preparation)),
        const ClanPage(tag: '#2PP'),
      );
      expect(button, findsOneWidget);
      expect(find.text('Preparation day'), findsOneWidget);
    });

    for (final (name, war) in [
      ('종료된 전쟁', makeWar(state: WarState.warEnded)),
      ('전쟁 중이 아님', const CurrentWar(state: WarState.notInWar)),
    ]) {
      testWidgets('$name이면 보이지 않는다', (tester) async {
        await pumpHome(tester, apiWith(war: war), const ClanPage(tag: '#2PP'));
        expect(button, findsNothing);
      });
    }

    testWidgets('조회 오류(전쟁 로그 비공개 등)여도 화면은 정상이고 버튼만 없다', (tester) async {
      final api = apiWith(
        warError: const ApiException(ApiErrorKind.privateLog, statusCode: 403),
      );
      await pumpHome(tester, api, const ClanPage(tag: '#2PP'));
      expect(button, findsNothing);
      expect(find.text('Test Clan'), findsWidgets); // 클랜 화면은 그대로
      expect(find.text('War log'), findsOneWidget);
      expect(api.warCalls, 1); // 오류에도 같은 요청을 반복하지 않는다
    });

    testWidgets('버튼은 창 아래 가운데에 있고 아래의 목록 터치를 막지 않는다', (tester) async {
      await pumpHome(
        tester,
        apiWith(war: makeWar()),
        const ClanPage(tag: '#2PP'),
        size: const Size(800, 1000),
      );
      final center = tester.getCenter(pillOf(button));
      expect(center.dx, closeTo(400, 2)); // 가운데
      expect(center.dy, greaterThan(1000 * 0.8)); // 아래쪽
      // 탭 전환 같은 위쪽 컨트롤은 버튼이 있어도 동작한다
      await tester.tap(find.text('Members'));
      await tester.pumpAndSettle();
      expect(find.text('Chief'), findsOneWidget);
    });
  });

  group('리그전', () {
    final leagueButton = find.text('View league war');

    testWidgets('일반 전쟁이 없고 리그전 전투일이면 리그전 버튼이 보인다', (tester) async {
      final api = apiWith(war: const CurrentWar(state: WarState.notInWar))
        ..leagueGroup = const ClanWarLeagueGroup(state: LeagueGroupState.inWar);
      await pumpHome(tester, api, const ClanPage(tag: '#2PP'));
      expect(leagueButton, findsOneWidget);
      expect(button, findsNothing);
      expect(find.text('Battle day'), findsOneWidget);
    });

    testWidgets('리그전 준비일에도 보인다', (tester) async {
      final api = apiWith()
        ..leagueGroup = const ClanWarLeagueGroup(
          state: LeagueGroupState.preparation,
        );
      await pumpHome(tester, api, const ClanPage(tag: '#2PP'));
      expect(leagueButton, findsOneWidget);
      expect(find.text('Preparation day'), findsOneWidget);
    });

    testWidgets('리그전이 끝났으면 버튼이 없다', (tester) async {
      final api = apiWith()
        ..leagueGroup = const ClanWarLeagueGroup(state: LeagueGroupState.ended);
      await pumpHome(tester, api, const ClanPage(tag: '#2PP'));
      expect(leagueButton, findsNothing);
    });

    testWidgets('리그전 기간이 아니면(404) 버튼이 없고 요청을 반복하지 않는다', (tester) async {
      final api = apiWith(); // 그룹 없음 → 404
      await pumpHome(tester, api, const ClanPage(tag: '#2PP'));
      expect(leagueButton, findsNothing);
      expect(button, findsNothing);
      expect(api.leagueGroupCalls, 1);
    });

    testWidgets('일반 전쟁 중이면 리그 그룹을 조회하지 않고 클랜전 버튼을 보인다', (tester) async {
      final api = apiWith(war: makeWar())
        ..leagueGroup = const ClanWarLeagueGroup(state: LeagueGroupState.inWar);
      await pumpHome(tester, api, const ClanPage(tag: '#2PP'));
      expect(button, findsOneWidget);
      expect(leagueButton, findsNothing);
      expect(api.leagueGroupCalls, 0);
    });
  });

  group('멤버(플레이어) 창', () {
    testWidgets('소속 클랜이 전쟁 중이면 버튼이 보인다', (tester) async {
      await pumpHome(
        tester,
        apiWith(war: makeWar()),
        const PlayerPage(tag: '#P0Y2LQ9'),
      );
      expect(button, findsOneWidget);
    });

    testWidgets('소속 클랜이 없으면 보이지 않는다', (tester) async {
      await pumpHome(
        tester,
        apiWith(
          war: makeWar(),
          player: const Player(
            tag: '#P0Y2LQ9',
            name: 'Loner',
            townHallLevel: 3,
          ),
        ),
        const PlayerPage(tag: '#P0Y2LQ9'),
      );
      expect(button, findsNothing);
    });

    testWidgets('소속 클랜이 전쟁 중이 아니면 보이지 않는다', (tester) async {
      await pumpHome(
        tester,
        apiWith(war: const CurrentWar(state: WarState.notInWar)),
        const PlayerPage(tag: '#P0Y2LQ9'),
      );
      expect(button, findsNothing);
    });
  });

  testWidgets('나란히 보기에서는 클랜 창과 멤버 창이 각자 버튼을 가진다', (tester) async {
    final api = apiWith(war: makeWar());
    await pumpHome(
      tester,
      api,
      const ClanPage(tag: '#2PP'),
      size: const Size(splitViewMinWidth + 100, 1000),
    );
    expect(button, findsOneWidget); // 클랜 창

    await tester.tap(find.byTooltip('Side-by-side view'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Chief'));
    await tester.pumpAndSettle();

    expect(find.byType(PlayerProfileView), findsOneWidget);
    expect(button, findsNWidgets(2));
    // 두 버튼은 각자 창의 가운데 아래에 있어 좌우로 떨어져 있다.
    final xs = [
      for (final e in button.evaluate())
        tester.getCenter(find.byWidget(e.widget)).dx,
    ]..sort();
    expect(xs.last - xs.first, greaterThan(contentMaxWidth / 2));
  });

  testWidgets('버튼을 누르면 클랜전 화면으로 이동한다', (tester) async {
    final api = apiWith(war: makeWar());
    SharedPreferences.setMockInitialValues({'settings.locale': 'en'});
    final prefs = await SharedPreferences.getInstance();
    tester.view.physicalSize = const Size(800, 1400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      ProviderScope(
        retry: noAutoRetry,
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          apiClientProvider.overrideWithValue(api),
        ],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();

    // 홈에서 클랜 태그를 검색해 클랜 화면을 연다.
    await tester.enterText(find.byType(TextField), '2pp');
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();
    expect(find.byType(WarPage), findsNothing);

    await tester.tap(button);
    await tester.pumpAndSettle();

    expect(find.byType(WarPage), findsOneWidget);
    expect(find.text('Alpha Clan'), findsWidgets);
    expect(find.text('Battle day'), findsOneWidget);
  });
}
