import 'package:coc_models/coc_models.dart';
import 'package:cocwar_mobile/core/api_client.dart';
import 'package:cocwar_mobile/core/providers.dart';
import 'package:cocwar_mobile/core/router.dart';
import 'package:cocwar_mobile/features/cwl/cwl_war_page.dart';
import 'package:cocwar_mobile/features/error_view.dart';
import 'package:cocwar_mobile/features/war/war_providers.dart';
import 'package:cocwar_mobile/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/cwl_fixture.dart';
import 'support/fake_api.dart';

FakeApi cwlApi() => FakeApi()
  ..leagueGroup = leagueGroup
  ..cwlWars = cwlWars;

/// 실제 라우터로 [path]를 연다.
Future<void> pumpPath(WidgetTester tester, FakeApi api, String path) async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  tester.view.physicalSize = const Size(800, 1400);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  final router = buildRouter()..go(path);
  await tester.pumpWidget(
    ProviderScope(
      retry: noAutoRetry,
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        apiClientProvider.overrideWithValue(api),
        // 전투일 남은 시간이 고정되도록 시각을 고정한다.
        clockProvider.overrideWithValue(() => DateTime.utc(2026, 10, 13, 20)),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        locale: const Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('순위 탭: 시즌 제목, 순위, 승리 보너스 안내', (tester) async {
    final api = cwlApi();
    await pumpPath(tester, api, '/clan/AAA2/cwl');

    expect(find.text('Clan War League · 2026-11'), findsOneWidget);
    final alpha = tester.getTopLeft(find.text('Alpha Clan')).dy;
    final gamma = tester.getTopLeft(find.text('Gamma Clan')).dy;
    final beta = tester.getTopLeft(find.text('Beta Clan')).dy;
    expect(alpha < gamma && gamma < beta, isTrue);
    expect(find.text('20'), findsOneWidget); // 10별 + 승리 보너스 10
    expect(find.text('1 W · 334%'), findsOneWidget);
    expect(find.text('Stars include the win bonus (+10 per win).'), findsOne);
    // 정해지지 않은 경기(#0)는 요청하지 않고, 각 경기는 한 번만 받는다.
    expect(api.cwlWarCalls..sort(), ['#8LUC2', '#8LUC3']);
    expect(api.leagueGroupCalls, 1);
  });

  testWidgets('라운드 탭: 결과, 진행 상태, 대진 미정', (tester) async {
    await pumpPath(tester, cwlApi(), '/clan/AAA2/cwl');
    await tester.tap(find.text('Rounds'));
    await tester.pumpAndSettle();

    expect(find.text('Round 1 · Beta Clan'), findsOneWidget);
    expect(find.text('War ended'), findsOneWidget);
    // 2라운드는 우리가 opponent 쪽이지만 우리 점수가 앞에 온다.
    expect(find.text('Round 2 · Gamma Clan'), findsOneWidget);
    expect(find.text('Battle day'), findsOneWidget);
    expect(find.text('★ 5 : 2'), findsNWidgets(2));
    expect(find.text('Round 3'), findsOneWidget);
    expect(find.text('Not scheduled yet'), findsOneWidget);
  });

  testWidgets('라운드를 누르면 경기 상세로 가고 우리 클랜이 왼쪽에 온다', (tester) async {
    await pumpPath(tester, cwlApi(), '/clan/AAA2/cwl');
    await tester.tap(find.text('Rounds'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Round 2 · Gamma Clan'));
    await tester.pumpAndSettle();

    expect(find.byType(CwlWarPage), findsOneWidget);
    final us = tester.getCenter(find.text('Alpha Clan').last).dx;
    final them = tester.getCenter(find.text('Gamma Clan')).dx;
    expect(us, lessThan(them));
    expect(find.text('Attacks 3/2'), findsOneWidget); // 1인 1회 × 2명
  });

  testWidgets('멤버 성적 탭', (tester) async {
    await pumpPath(tester, cwlApi(), '/clan/AAA2/cwl');
    await tester.tap(find.text('Members'));
    await tester.pumpAndSettle();

    expect(find.text('Ann'), findsOneWidget);
    expect(find.text('Attacks 4/2 · Avg 75% · 3★ 2'), findsOneWidget);
    expect(find.text('Attacks 0/2 · Avg - · 3★ 0'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
  });

  testWidgets('리그전 기간이 아니면(404) 안내를 보여 준다', (tester) async {
    final api = FakeApi(); // leagueGroup이 없으면 notFound
    await pumpPath(tester, api, '/clan/AAA2/cwl');
    expect(
      find.text('This clan is not in a Clan War League right now.'),
      findsOneWidget,
    );
    expect(api.leagueGroupCalls, 1);
  });

  testWidgets('그 밖의 오류는 오류 화면을 보여 준다', (tester) async {
    final api = FakeApi()
      ..leagueGroupError = const ApiException(ApiErrorKind.maintenance);
    await pumpPath(tester, api, '/clan/AAA2/cwl');
    expect(
      find.text('This clan is not in a Clan War League right now.'),
      findsNothing,
    );
    expect(find.byType(ErrorView), findsOneWidget);
  });

  testWidgets('그룹 상태가 notInWar여도 안내를 보여 준다', (tester) async {
    final api = FakeApi()
      ..leagueGroup = const ClanWarLeagueGroup(
        state: LeagueGroupState.notInWar,
      );
    await pumpPath(tester, api, '/clan/AAA2/cwl');
    expect(
      find.text('This clan is not in a Clan War League right now.'),
      findsOneWidget,
    );
  });
}
