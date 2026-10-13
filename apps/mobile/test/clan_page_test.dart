import 'package:coc_models/coc_models.dart';
import 'package:cocwar_mobile/core/api_client.dart';
import 'package:cocwar_mobile/core/providers.dart';
import 'package:cocwar_mobile/features/clan/clan_page.dart';
import 'package:cocwar_mobile/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FakeApi extends ApiClient {
  FakeApi() : super(baseUrl: 'http://fake');

  Clan? clan;
  Object? clanError;
  Object? logError;
  List<ClanWarLogEntry> log = [];
  int warLogCalls = 0;

  @override
  Future<Clan> getClan(String tag) async {
    if (clanError != null) throw clanError!;
    return clan!;
  }

  @override
  Future<ClanWarLog> getWarLog(String tag, {int? limit, String? after}) async {
    warLogCalls++;
    if (logError != null) throw logError!;
    return ClanWarLog(items: log);
  }
}

ClanWarLogEntry entry(
  String opponent, {
  WarResult? result = WarResult.win,
  int attacksPerMember = 2,
}) => ClanWarLogEntry(
  result: result,
  endTime: DateTime.utc(2026, 10, 13, 12),
  teamSize: 15,
  attacksPerMember: attacksPerMember,
  clan: const WarClan(stars: 42, destructionPercentage: 96.5),
  opponent: WarClan(name: opponent, stars: 38, destructionPercentage: 90),
);

List<ClanWarLogEntry> entries(int n) => [
  for (var i = 1; i <= n; i++) entry('Opp$i'),
];

Future<void> pumpClan(
  WidgetTester tester,
  FakeApi api, {
  String locale = 'en',
  double textScale = 1.0,
}) async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  tester.view.physicalSize = const Size(800, 1400);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        apiClientProvider.overrideWithValue(api),
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
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(textScale)),
          child: child!,
        ),
        home: const ClanPage(tag: '#2PP'),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

const publicClan = Clan(
  tag: '#2PP',
  name: 'Test Clan',
  clanLevel: 12,
  members: 40,
  warWins: 120,
  warTies: 2,
  warLosses: 40,
  warWinStreak: 3,
  isWarLogPublic: true,
);

void main() {
  setUpAll(initializeDateFormatting);

  testWidgets('헤더와 전쟁 로그 항목을 보여준다', (tester) async {
    final api = FakeApi()
      ..clan = publicClan
      ..log = [
        entry('Alpha'),
        entry('Bravo', result: WarResult.lose),
        entry('Charlie', result: WarResult.tie),
        entry('Delta', result: null, attacksPerMember: 1),
      ];
    await pumpClan(tester, api);

    expect(find.text('Test Clan'), findsWidgets);
    expect(find.textContaining('Level 12'), findsOneWidget);
    expect(find.text('120'), findsOneWidget);
    expect(find.text('Win streak'), findsOneWidget);
    for (final name in ['Alpha', 'Bravo', 'Charlie']) {
      expect(find.text(name), findsOneWidget);
    }
    // CWL 기록은 목록에서 제외된다.
    expect(find.text('Delta'), findsNothing);
    expect(find.text('CWL'), findsNothing);
    expect(find.text('Win'), findsOneWidget);
    expect(find.text('Loss'), findsOneWidget);
    expect(find.text('Draw'), findsOneWidget);
    expect(find.text('★ 42  96.5%'), findsWidgets);
    expect(find.text('★ 38  90%'), findsWidgets);
    expect(api.warLogCalls, 1);
  });

  group('날짜 표시 (연도 포함)', () {
    Future<void> expectDate(
      WidgetTester tester,
      String locale,
      String text,
    ) async {
      final api = FakeApi()
        ..clan = publicClan
        ..log = [entry('Alpha')];
      await pumpClan(tester, api, locale: locale);
      expect(find.textContaining(text), findsOneWidget);
    }

    testWidgets('영어', (t) => expectDate(t, 'en', "Oct 13, '26"));
    testWidgets('한국어', (t) => expectDate(t, 'ko', '26년 10월 13일'));
    testWidgets('일본어', (t) => expectDate(t, 'ja', '26年10月13日'));
  });

  testWidgets('로그가 비어 있으면 안내 문구를 보여준다', (tester) async {
    final api = FakeApi()..clan = publicClan;
    await pumpClan(tester, api);
    expect(find.text('No war log entries yet.'), findsOneWidget);
  });

  testWidgets('비공개 로그는 요청하지 않고 안내만 보여준다', (tester) async {
    final api = FakeApi()..clan = publicClan.copyWith(isWarLogPublic: false);
    await pumpClan(tester, api);
    expect(find.text("This clan's war log is private."), findsOneWidget);
    expect(api.warLogCalls, 0);
    expect(find.text('Test Clan'), findsWidgets); // 헤더는 보인다
  });

  testWidgets('공개로 표시됐지만 서버가 403을 주면 비공개 안내를 보여준다', (tester) async {
    final api = FakeApi()
      ..clan = publicClan
      ..logError = const ApiException(ApiErrorKind.privateLog, statusCode: 403);
    await pumpClan(tester, api);
    expect(find.text("This clan's war log is private."), findsOneWidget);
  });

  testWidgets('클랜을 찾을 수 없으면 오류 화면을 보여주고 재시도할 수 있다', (tester) async {
    final api = FakeApi()
      ..clanError = const ApiException(ApiErrorKind.notFound, statusCode: 404)
      ..log = [entry('Alpha')];
    await pumpClan(tester, api);
    expect(find.text('Not found.'), findsOneWidget);

    api
      ..clanError = null
      ..clan = publicClan;
    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();
    expect(find.text('Alpha'), findsOneWidget);
    expect(find.text('Test Clan'), findsWidgets);
  });

  group('번호 페이지 (10개씩)', () {
    Finder pageButton(String n) =>
        find.widgetWithText(TextButton, n, skipOffstage: false);

    testWidgets('23개면 1페이지에 10개, 총 3페이지', (tester) async {
      final api = FakeApi()
        ..clan = publicClan
        ..log = entries(23);
      await pumpClan(tester, api);

      expect(find.byType(Card, skipOffstage: false), findsNWidgets(1 + 10));
      expect(find.text('Opp1'), findsOneWidget);
      expect(find.text('Opp10', skipOffstage: false), findsOneWidget);
      expect(find.text('Opp11', skipOffstage: false), findsNothing);
      expect(pageButton('2'), findsOneWidget);
      expect(pageButton('3'), findsOneWidget);
      expect(api.warLogCalls, 1);
    });

    testWidgets('번호를 눌러 이동하고 마지막 페이지에는 나머지만 보인다', (tester) async {
      final api = FakeApi()
        ..clan = publicClan
        ..log = entries(23);
      await pumpClan(tester, api);

      await tester.ensureVisible(pageButton('3'));
      await tester.tap(pageButton('3'));
      await tester.pumpAndSettle();

      expect(find.text('Opp21', skipOffstage: false), findsOneWidget);
      expect(find.text('Opp23', skipOffstage: false), findsOneWidget);
      expect(find.text('Opp20', skipOffstage: false), findsNothing);
      expect(find.byType(Card, skipOffstage: false), findsNWidgets(1 + 3));
      // 페이지를 넘겨도 서버를 다시 부르지 않는다.
      expect(api.warLogCalls, 1);
    });

    testWidgets('이전/다음 버튼으로 이동한다', (tester) async {
      final api = FakeApi()
        ..clan = publicClan
        ..log = entries(23);
      await pumpClan(tester, api);

      final prev = find.widgetWithIcon(
        IconButton,
        Icons.chevron_left,
        skipOffstage: false,
      );
      final next = find.widgetWithIcon(
        IconButton,
        Icons.chevron_right,
        skipOffstage: false,
      );
      expect(tester.widget<IconButton>(prev).onPressed, isNull);

      await tester.ensureVisible(next);
      await tester.tap(next);
      await tester.pumpAndSettle();
      expect(find.text('Opp11', skipOffstage: false), findsOneWidget);
      expect(find.text('Opp1', skipOffstage: false), findsNothing);

      await tester.ensureVisible(prev);
      await tester.tap(prev);
      await tester.pumpAndSettle();
      expect(find.text('Opp1', skipOffstage: false), findsOneWidget);
    });

    testWidgets('10개 이하면 페이지 바를 보여주지 않는다', (tester) async {
      final api = FakeApi()
        ..clan = publicClan
        ..log = entries(10);
      await pumpClan(tester, api);
      expect(
        find.widgetWithIcon(
          IconButton,
          Icons.chevron_right,
          skipOffstage: false,
        ),
        findsNothing,
      );
    });
  });

  testWidgets('CWL 기록은 페이지 수 계산에서도 제외된다', (tester) async {
    final api = FakeApi()
      ..clan = publicClan
      ..log = [
        ...entries(13),
        for (var i = 1; i <= 10; i++)
          entry('Cwl$i', result: null, attacksPerMember: 1),
      ];
    await pumpClan(tester, api);

    // 일반 13건 → 2페이지(10 + 3). CWL까지 세면 3페이지가 된다.
    expect(
      find.widgetWithText(TextButton, '2', skipOffstage: false),
      findsOneWidget,
    );
    expect(
      find.widgetWithText(TextButton, '3', skipOffstage: false),
      findsNothing,
    );
    expect(find.textContaining('Cwl', skipOffstage: false), findsNothing);
  });

  testWidgets('전부 CWL이면 기록 없음 안내를 보여준다', (tester) async {
    final api = FakeApi()
      ..clan = publicClan
      ..log = [entry('Cwl1', result: null, attacksPerMember: 1)];
    await pumpClan(tester, api);
    expect(find.text('No war log entries yet.'), findsOneWidget);
  });

  group('결과 라벨은 줄바꿈되지 않는다', () {
    // 같은 스타일의 짧은 라벨(승리)과 가장 긴 라벨(무승부)의 높이가 같으면 한 줄이다.
    Future<void> expectSingleLine(
      WidgetTester tester,
      String locale,
      double scale,
    ) async {
      final l10n = await AppLocalizations.delegate.load(Locale(locale));
      final api = FakeApi()
        ..clan = publicClan
        ..log = [
          entry('A', result: WarResult.win),
          entry('B', result: WarResult.lose),
          entry('C', result: WarResult.tie),
        ];
      await pumpClan(tester, api, locale: locale, textScale: scale);

      final heights = [
        for (final label in [l10n.resultWin, l10n.resultLose, l10n.resultTie])
          tester.getSize(find.text(label)).height,
      ];
      expect(
        heights.toSet(),
        hasLength(1),
        reason: '$locale x$scale: 라벨 높이가 다르면 줄바꿈된 것 $heights',
      );
      // 칸 너비가 같아서 세 행의 배지(이미지/아이콘) 시작 위치도 같다.
      final lefts = [
        for (final name in ['A', 'B', 'C'])
          tester.getTopLeft(find.text(name)).dx,
      ];
      expect(lefts.toSet(), hasLength(1), reason: '$locale x$scale: $lefts');
    }

    for (final locale in ['ko', 'en', 'ja']) {
      for (final scale in [1.0, 1.5]) {
        testWidgets(
          '$locale 글자 배율 $scale',
          (t) => expectSingleLine(t, locale, scale),
        );
      }
    }
  });
}
