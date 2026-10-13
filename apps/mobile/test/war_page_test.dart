import 'package:coc_models/coc_models.dart';
import 'package:cocwar_mobile/core/api_client.dart';
import 'package:cocwar_mobile/core/providers.dart';
import 'package:cocwar_mobile/features/war/war_page.dart';
import 'package:cocwar_mobile/features/war/war_providers.dart';
import 'package:cocwar_mobile/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fake_api.dart';
import 'support/war_fixture.dart';

/// 전투일 종료 3시간 20분 전.
final endTime = DateTime.utc(2026, 10, 14, 10);
final now = endTime.subtract(const Duration(hours: 3, minutes: 20));

Future<void> pumpWar(
  WidgetTester tester,
  FakeApi api, {
  DateTime? clock,
  String locale = 'en',
}) async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  tester.view.physicalSize = const Size(800, 2400);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ProviderScope(
      retry: noAutoRetry,
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        apiClientProvider.overrideWithValue(api),
        clockProvider.overrideWithValue(() => clock ?? now),
      ],
      child: MaterialApp(
        locale: Locale(locale),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const WarPage(tag: '#AAA2'),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// 이름이 [name]인 멤버 카드.
Finder card(String name) =>
    find.ancestor(of: find.text(name), matching: find.byType(Card)).first;

void main() {
  group('전투일', () {
    testWidgets('상태, 남은 시간, 팀 규모', (tester) async {
      await pumpWar(tester, FakeApi()..war = makeWar());
      expect(find.text('Battle day'), findsOneWidget);
      expect(find.text('Ends in 3h 20m'), findsOneWidget);
      expect(find.text('2 vs 2 · 2 attacks each'), findsOneWidget);
      expect(find.text('Alpha Clan'), findsWidgets); // 앱바 + 스코어보드
    });

    testWidgets('스코어보드: 양 클랜의 별·파괴율·공격 수', (tester) async {
      await pumpWar(tester, FakeApi()..war = makeWar());
      expect(find.text('Beta Clan'), findsOneWidget);
      expect(find.text('5'), findsOneWidget); // 우리 별
      expect(find.text('2'), findsWidgets); // 상대 별(+ 지도 번호)
      expect(find.text('83.5%'), findsOneWidget);
      expect(find.text('Attacks 3/4'), findsOneWidget);
      expect(find.text('Attacks 1/4'), findsOneWidget);
      expect(find.text('VS'), findsOneWidget);
    });

    testWidgets('승리 전망: 앞서고 있을 때', (tester) async {
      await pumpWar(tester, FakeApi()..war = makeWar());
      expect(find.text('Outlook'), findsOneWidget);
      expect(find.text('Leading by 3 stars'), findsOneWidget);
      expect(find.text('Remaining attacks: 1'), findsOneWidget);
      expect(find.text('Stars still available: 2'), findsOneWidget);
      expect(find.textContaining('does not include'), findsOneWidget);
    });

    testWidgets('승리 전망: 뒤처졌을 때 필요한 별', (tester) async {
      await pumpWar(
        tester,
        FakeApi()..war = makeWar(ourStars: 3, theirStars: 5),
      );
      expect(find.text('3 more stars needed to take the lead'), findsOneWidget);
      expect(
        find.text('The remaining stars are not enough to catch up.'),
        findsNothing,
      );
    });

    testWidgets('승리 전망: 별 동점일 때는 파괴율로 승부', (tester) async {
      await pumpWar(
        tester,
        FakeApi()
          ..war = makeWar(
            ourStars: 4,
            theirStars: 4,
            ourDestruction: 70,
            theirDestruction: 80,
          ),
      );
      expect(
        find.text('Tied on stars, needs more than 80% destruction (now 70%)'),
        findsOneWidget,
      );
    });

    testWidgets('승리 전망: 역전이 어려우면 알려 준다', (tester) async {
      await pumpWar(
        tester,
        FakeApi()..war = makeWar(ourStars: 0, theirStars: 7),
      );
      expect(
        find.text('The remaining stars are not enough to catch up.'),
        findsOneWidget,
      );
    });
  });

  group('멤버 탭 (우리 | 상대)', () {
    testWidgets('우리 클랜: 지도 순서, 타운홀, 공격 내역과 상대 지도 번호', (tester) async {
      await pumpWar(tester, FakeApi()..war = makeWar());

      // 지도 번호 순서(Ann 1번, Bo 2번)
      expect(
        tester.getTopLeft(find.text('Ann')).dy,
        lessThan(tester.getTopLeft(find.text('Bo')).dy),
      );
      final ann = card('Ann');
      expect(
        find.descendant(of: ann, matching: find.text('TH16')),
        findsOneWidget,
      );
      // 첫 공격: 상대 2번에게 3별 100%, 둘째 공격: 상대 1번에게 1별 50%
      expect(
        find.descendant(of: ann, matching: find.text('100%')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: ann, matching: find.text('→ #2')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: ann, matching: find.text('50%')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: ann, matching: find.text('→ #1')),
        findsOneWidget,
      );
      // 방어: 상대가 2별 80%로 공격
      expect(
        find.descendant(of: ann, matching: find.text('80%')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: ann, matching: find.text('Defense')),
        findsOneWidget,
      );
    });

    testWidgets('공격하지 않은 멤버는 남은 공격이 "미사용", 방어 기록 없음', (tester) async {
      await pumpWar(tester, FakeApi()..war = makeWar());
      final bo = card('Bo');
      expect(
        find.descendant(of: bo, matching: find.text('Unused')),
        findsNWidgets(2),
      );
      expect(
        find.descendant(of: bo, matching: find.text('Not attacked')),
        findsOneWidget,
      );
    });

    testWidgets('별 아이콘은 얻은 별만 채워진다', (tester) async {
      await pumpWar(tester, FakeApi()..war = makeWar());
      final ann = card('Ann');
      // 공격 3별 + 1별 + 방어 2별 = 채운 별 6개, 빈 별 3×3−6 = 3개
      expect(
        find.descendant(of: ann, matching: find.byIcon(Icons.star)),
        findsNWidgets(6),
      );
      expect(
        find.descendant(of: ann, matching: find.byIcon(Icons.star_border)),
        findsNWidgets(3),
      );
    });

    testWidgets('상대 클랜 탭: 상대의 공격(우리 지도 번호)과 우리가 얻은 별', (tester) async {
      await pumpWar(tester, FakeApi()..war = makeWar());
      await tester.tap(find.text('Opponent'));
      await tester.pumpAndSettle();

      expect(find.text('Cy'), findsOneWidget);
      expect(find.text('Di'), findsOneWidget);
      expect(find.text('Ann'), findsNothing); // 우리 멤버는 보이지 않는다
      final cy = card('Cy');
      // Cy는 우리 1번(Ann)을 2별 80%로 공격, 남은 공격 1회
      expect(
        find.descendant(of: cy, matching: find.text('→ #1')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: cy, matching: find.text('Unused')),
        findsOneWidget,
      );
      // Di는 공격하지 않았고(2회 남음), 우리가 3별 100%로 무너뜨렸다
      final di = card('Di');
      expect(
        find.descendant(of: di, matching: find.text('Unused')),
        findsNWidgets(2),
      );
      expect(
        find.descendant(of: di, matching: find.text('100%')),
        findsOneWidget,
      );
    });

    testWidgets('우리 탭으로 돌아오면 우리 멤버가 보인다', (tester) async {
      await pumpWar(tester, FakeApi()..war = makeWar());
      await tester.tap(find.text('Opponent'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Our clan'));
      await tester.pumpAndSettle();
      expect(find.text('Ann'), findsOneWidget);
      expect(find.text('Cy'), findsNothing);
    });
  });

  group('다른 상태', () {
    testWidgets('준비일: 시작까지 남은 시간, 전망·미사용 표시 없음', (tester) async {
      final start = now.add(const Duration(hours: 5));
      await pumpWar(
        tester,
        FakeApi()..war = makeWar(state: WarState.preparation, startTime: start),
      );
      expect(find.text('Preparation day'), findsOneWidget);
      expect(find.text('Starts in 5h 0m'), findsOneWidget);
      expect(find.text('Outlook'), findsNothing);
      expect(find.text('Unused'), findsNothing); // 아직 공격할 수 없다
      expect(find.text('Ann'), findsOneWidget);
    });

    testWidgets('1시간 미만이면 분만 표시한다', (tester) async {
      await pumpWar(
        tester,
        FakeApi()..war = makeWar(),
        clock: endTime.subtract(const Duration(minutes: 45)),
      );
      expect(find.text('Ends in 45m'), findsOneWidget);
    });

    testWidgets('종료: 종료일을 보여주고 전망은 없다', (tester) async {
      await pumpWar(tester, FakeApi()..war = makeWar(state: WarState.warEnded));
      expect(find.text('War ended'), findsOneWidget);
      expect(find.textContaining("'26"), findsOneWidget); // 종료일(연도 두 자리)
      expect(find.text('Outlook'), findsNothing);
      expect(find.text('Unused'), findsWidgets); // 남기고 끝난 공격
    });

    testWidgets('전쟁 중이 아니면 안내 문구', (tester) async {
      await pumpWar(
        tester,
        FakeApi()..war = const CurrentWar(state: WarState.notInWar),
      );
      expect(find.text('There is no ongoing war.'), findsOneWidget);
      expect(find.text('Outlook'), findsNothing);
    });

    testWidgets('전쟁 로그가 비공개인 클랜은 오류 안내와 다시 시도', (tester) async {
      final api = FakeApi()
        ..warError = const ApiException(
          ApiErrorKind.privateLog,
          statusCode: 403,
        );
      await pumpWar(tester, api);
      expect(find.text("This clan's war log is private."), findsOneWidget);
      expect(api.warCalls, 1); // 자동 재시도로 같은 요청을 반복하지 않는다

      api
        ..warError = null
        ..war = makeWar();
      await tester.tap(find.text('Retry'));
      await tester.pumpAndSettle();
      expect(find.text('Battle day'), findsOneWidget);
      expect(api.warCalls, 2);
    });
  });

  group('다국어', () {
    testWidgets('한국어', (tester) async {
      await pumpWar(tester, FakeApi()..war = makeWar(), locale: 'ko');
      expect(find.text('전투일'), findsOneWidget);
      expect(find.text('종료까지 3시간 20분'), findsOneWidget);
      expect(find.text('3별 앞서고 있습니다'), findsOneWidget);
      expect(find.text('우리 클랜'), findsOneWidget);
      expect(find.text('미사용'), findsWidgets);
    });

    testWidgets('일본어', (tester) async {
      await pumpWar(tester, FakeApi()..war = makeWar(), locale: 'ja');
      expect(find.text('戦闘日'), findsOneWidget);
      expect(find.text('終了まで 3時間20分'), findsOneWidget);
      expect(find.text('相手クラン'), findsOneWidget);
    });
  });
}
