import 'package:coc_models/coc_models.dart';
import 'package:cocwar_mobile/app.dart';
import 'package:cocwar_mobile/core/api_client.dart';
import 'package:cocwar_mobile/core/providers.dart';
import 'package:cocwar_mobile/features/clan/clan_page.dart';
import 'package:cocwar_mobile/features/remote_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fake_api.dart';

const _champion3 = 'https://example.com/leagues/champion3.png';
const _legend = 'https://example.com/leaguetiers/legend3.png';

FakeApi makeApi() => FakeApi()
  ..clan = const Clan(
    tag: '#2PP',
    name: 'Test Clan',
    isWarLogPublic: true,
    warLeague: League(id: 48000016, name: 'Champion League III'),
  )
  ..player = const Player(
    tag: '#P0Y2LQ9',
    name: 'Chief',
    leagueTier: League(
      id: 105000033,
      name: 'Legend III',
      iconUrls: IconUrls(small: _legend),
    ),
  )
  ..leagues = const [
    League(
      id: 29000016,
      name: 'Champion League III',
      iconUrls: IconUrls(small: _champion3),
    ),
    League(
      id: 29000000,
      name: 'Unranked',
      iconUrls: IconUrls(small: 'https://example.com/unranked.png'),
    ),
  ]
  ..log = [];

Future<void> pumpHome(
  WidgetTester tester,
  FakeApi api, {
  List<String> recent = const ['clan:#2PP', 'player:#P0Y2LQ9'],
  List<String> favorites = const [],
  String locale = 'en',
}) async {
  SharedPreferences.setMockInitialValues({
    'settings.locale': locale,
    'recent': recent,
    'favorites': favorites,
  });
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
}

/// 태그가 [tag]인 이력 타일.
Finder tile(String tag) =>
    find.ancestor(of: find.text(tag), matching: find.byType(ListTile)).first;

String? iconUrl(WidgetTester t, String tag) => t
    .widget<RemoteImage>(
      find.descendant(of: tile(tag), matching: find.byType(RemoteImage)),
    )
    .url;

void main() {
  group('클랜 이력', () {
    testWidgets('클랜전 리그 아이콘과 `클랜 : 클랜명`을 보여준다', (tester) async {
      await pumpHome(tester, makeApi());
      expect(iconUrl(tester, '#2PP'), _champion3);
      expect(
        find.descendant(
          of: tile('#2PP'),
          matching: find.text('Clan : Test Clan'),
        ),
        findsOneWidget,
      );
      // 방패 아이콘은 더 이상 쓰지 않는다 (이미지를 불러오는 동안·실패했을 때만 대체로 쓴다)
      expect(iconUrl(tester, '#2PP'), isNotNull);
    });

    testWidgets('리그 이름이 아이콘 표에 없으면 이름만 보이고 기본 방패 아이콘', (tester) async {
      final api = makeApi()
        ..clan = const Clan(
          tag: '#2PP',
          name: 'Test Clan',
          warLeague: League(id: 1, name: 'Brand New League'),
        );
      await pumpHome(tester, api);
      expect(iconUrl(tester, '#2PP'), isNull);
      expect(
        find.descendant(
          of: tile('#2PP'),
          matching: find.byIcon(Icons.shield_outlined),
        ),
        findsOneWidget,
      );
      expect(find.text('Clan : Test Clan'), findsOneWidget);
    });

    testWidgets('리그 목록을 받지 못해도 클랜 이름은 보인다', (tester) async {
      final api = makeApi()
        ..leaguesError = const ApiException(
          ApiErrorKind.maintenance,
          statusCode: 503,
        );
      await pumpHome(tester, api);
      expect(find.text('Clan : Test Clan'), findsOneWidget);
      expect(iconUrl(tester, '#2PP'), isNull);
    });

    testWidgets('클랜 정보를 받지 못하면 기존처럼 종류 라벨과 방패 아이콘', (tester) async {
      final api = makeApi()
        ..clanError = const ApiException(
          ApiErrorKind.notFound,
          statusCode: 404,
        );
      await pumpHome(tester, api);
      expect(
        find.descendant(of: tile('#2PP'), matching: find.text('Clan')),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: tile('#2PP'),
          matching: find.byIcon(Icons.shield_outlined),
        ),
        findsOneWidget,
      );
      expect(api.clanCalls, ['#2PP']); // 자동 재시도 없음
    });
  });

  group('플레이어 이력', () {
    testWidgets('경쟁전 리그 아이콘과 `플레이어 : 플레이어명`을 보여준다', (tester) async {
      await pumpHome(tester, makeApi());
      expect(iconUrl(tester, '#P0Y2LQ9'), _legend);
      expect(
        find.descendant(
          of: tile('#P0Y2LQ9'),
          matching: find.text('Player : Chief'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('리그 정보가 없는 플레이어는 이름만 보이고 기본 사람 아이콘', (tester) async {
      final api = makeApi()
        ..player = const Player(tag: '#P0Y2LQ9', name: 'Newbie');
      await pumpHome(tester, api);
      expect(iconUrl(tester, '#P0Y2LQ9'), isNull);
      expect(
        find.descendant(
          of: tile('#P0Y2LQ9'),
          matching: find.byIcon(Icons.person_outline),
        ),
        findsOneWidget,
      );
      expect(find.text('Player : Newbie'), findsOneWidget);
    });

    testWidgets('플레이어 정보를 받지 못하면 종류 라벨만', (tester) async {
      final api = makeApi()
        ..playerError = const ApiException(
          ApiErrorKind.notFound,
          statusCode: 404,
        );
      await pumpHome(tester, api);
      expect(
        find.descendant(of: tile('#P0Y2LQ9'), matching: find.text('Player')),
        findsOneWidget,
      );
      expect(api.playerCalls, ['#P0Y2LQ9']);
    });
  });

  group('공통 동작', () {
    testWidgets('즐겨찾기 타일도 같은 형식이다', (tester) async {
      await pumpHome(
        tester,
        makeApi(),
        recent: const [],
        favorites: const ['clan:#2PP', 'player:#P0Y2LQ9'],
      );
      expect(find.text('Clan : Test Clan'), findsOneWidget);
      expect(find.text('Player : Chief'), findsOneWidget);
      expect(iconUrl(tester, '#2PP'), _champion3);
    });

    testWidgets('리그 목록은 클랜이 여러 개여도 한 번만 받는다', (tester) async {
      final api = makeApi();
      await pumpHome(
        tester,
        api,
        recent: const ['clan:#2PP', 'clan:#2PP0'],
        favorites: const ['clan:#2PP'],
      );
      expect(api.leagueCalls, 1);
    });

    testWidgets('타일을 누르면 해당 화면으로 이동한다', (tester) async {
      await pumpHome(tester, makeApi());
      // 검색창 힌트도 `#2PP`라서 이력 타일 안의 글자만 누른다.
      await tester.tap(
        find.descendant(of: tile('#2PP'), matching: find.text('#2PP')),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ClanPage), findsOneWidget);
    });

    testWidgets('즐겨찾기 별 토글은 그대로 동작한다', (tester) async {
      await pumpHome(tester, makeApi());
      await tester.tap(
        find.descendant(
          of: tile('#2PP'),
          matching: find.byIcon(Icons.star_border),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Favorites'), findsOneWidget);
    });

    testWidgets('한국어', (tester) async {
      await pumpHome(tester, makeApi(), locale: 'ko');
      expect(find.text('클랜 : Test Clan'), findsOneWidget);
      expect(find.text('플레이어 : Chief'), findsOneWidget);
    });

    testWidgets('일본어', (tester) async {
      await pumpHome(tester, makeApi(), locale: 'ja');
      expect(find.text('クラン : Test Clan'), findsOneWidget);
      expect(find.text('プレイヤー : Chief'), findsOneWidget);
    });
  });
}
