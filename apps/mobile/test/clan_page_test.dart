import 'package:coc_models/coc_models.dart';
import 'package:cocwar_mobile/core/api_client.dart';
import 'package:cocwar_mobile/core/layout.dart';
import 'package:cocwar_mobile/core/providers.dart';
import 'package:cocwar_mobile/features/clan/clan_page.dart';
import 'package:cocwar_mobile/features/player/game_assets.dart';
import 'package:cocwar_mobile/features/player/item_groups.dart';
import 'package:cocwar_mobile/features/remote_image.dart';
import 'package:cocwar_mobile/features/player/level_caps.dart';
import 'package:cocwar_mobile/features/player/player_page.dart';
import 'package:cocwar_mobile/features/player/village_tabs.dart';
import 'package:cocwar_mobile/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fake_api.dart';

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
  Size size = const Size(800, 1400),
  Widget? home,

  /// 기본 탭이 멤버라서, 전쟁 로그를 확인하는 테스트는 `전쟁 로그` 탭을 먼저 연다.
  bool openWarLog = true,

  /// 번들된 에셋 목록을 고정한다(이미지를 받아 둔 환경과 아닌 환경에서 같게 동작하도록).
  Set<String> assets = const {},
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
        gameAssetsProvider.overrideWith((ref) async => assets),
        // 나란히 보기의 프로필 창이 쓰는 데이터를 비동기 로딩 타이밍과 무관하게 고정한다.
        levelCapsProvider.overrideWith((ref) async => const LevelCaps()),
        itemGroupsProvider.overrideWith((ref) async => ItemGroups.empty),
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
        home: home ?? const ClanPage(tag: '#2PP'),
      ),
    ),
  );
  await tester.pumpAndSettle();
  if (openWarLog) {
    final label = (await AppLocalizations.delegate.load(Locale(locale))).warLog;
    if (find.text(label).evaluate().isNotEmpty) {
      await tester.tap(find.text(label));
      await tester.pumpAndSettle();
    }
  }
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
    expect(find.text('Test Clan'), findsWidgets);
    // 오류가 풀리면 기본 탭(멤버)으로 열린다. 전쟁 로그는 탭을 열어야 보인다.
    await tester.tap(find.text('War log'));
    await tester.pumpAndSettle();
    expect(find.text('Alpha'), findsOneWidget);
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

  group('클랜 태그', () {
    testWidgets('클랜 이름 뒤에 표시되고 부제목에는 들어 있지 않다', (tester) async {
      final api = FakeApi()..clan = publicClan;
      await pumpClan(tester, api);

      final header = find.byType(Card).first;
      final name = find.descendant(
        of: header,
        matching: find.text('Test Clan'),
      );
      final tag = find.descendant(of: header, matching: find.text('#2PP'));
      expect(tag, findsOneWidget);
      // 같은 줄에서 이름 오른쪽에 있다.
      expect(
        tester.getTopLeft(tag).dx,
        greaterThan(tester.getTopRight(name).dx),
      );
      expect(
        (tester.getCenter(tag).dy - tester.getCenter(name).dy).abs(),
        lessThan(8),
      );
      // 부제목은 레벨과 멤버 수만.
      expect(find.text('Level 12 · 40 members'), findsOneWidget);
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

      final api = FakeApi()..clan = publicClan;
      await pumpClan(tester, api);

      expect(find.byTooltip('Copy tag'), findsOneWidget);
      await tester.tap(find.text('#2PP'));
      await tester.pump();

      expect(copied, '#2PP');
      expect(find.text('Copied #2PP'), findsOneWidget);
    });
  });

  group('탭 순서와 기본 탭', () {
    testWidgets('탭 순서는 멤버 | 전쟁 로그이고 처음에는 멤버가 열린다', (tester) async {
      final api = FakeApi()
        ..clan = publicClan.copyWith(
          memberList: const [
            ClanMember(tag: '#M1', name: 'Chief', clanRank: 1),
          ],
        )
        ..log = [entry('Alpha')];
      await pumpClan(tester, api, openWarLog: false);

      // 멤버 버튼이 전쟁 로그 버튼의 왼쪽에 있다
      expect(
        tester.getCenter(find.text('Members')).dx,
        lessThan(tester.getCenter(find.text('War log')).dx),
      );
      // 기본으로 멤버 목록이 보이고 전쟁 로그는 보이지 않는다
      expect(find.text('Chief'), findsOneWidget);
      expect(find.text('Alpha'), findsNothing);
    });

    testWidgets('전쟁 로그는 그 탭을 열 때만 요청한다', (tester) async {
      final api = FakeApi()
        ..clan = publicClan
        ..log = [entry('Alpha')];
      await pumpClan(tester, api, openWarLog: false);
      expect(api.warLogCalls, 0);

      await tester.tap(find.text('War log'));
      await tester.pumpAndSettle();
      expect(api.warLogCalls, 1);
      expect(find.text('Alpha'), findsOneWidget);
    });
  });

  group('캐피탈 공격권 (멤버 탭, 이름과 트로피 사이 가운데)', () {
    final members = const [
      ClanMember(
        tag: '#P0Y2LQ9',
        name: 'Chief',
        role: 'coLeader',
        townHallLevel: 18,
        trophies: 1234,
        clanRank: 1,
      ),
      ClanMember(
        tag: '#PPYYLLQ',
        name: 'Buddy',
        role: 'admin',
        townHallLevel: 17,
        trophies: 4321,
        clanRank: 2,
      ),
      ClanMember(
        tag: '#PYLQGRJ',
        name: 'Casual',
        role: 'member',
        townHallLevel: 16,
        trophies: 777,
        clanRank: 3,
      ),
    ];

    CapitalRaidSeasons raidWith({
      RaidState state = RaidState.ended,
      List<CapitalRaidMember>? raidMembers,
      int? totalAttacks,
    }) => CapitalRaidSeasons(
      items: [
        CapitalRaidSeason(
          state: state,
          startTime: DateTime.utc(2026, 10, 9, 7),
          endTime: DateTime.utc(2026, 10, 12, 7),
          totalAttacks: totalAttacks ?? 8,
          members:
              raidMembers ??
              const [
                CapitalRaidMember(
                  tag: '#P0Y2LQ9',
                  attacks: 6,
                  attackLimit: 5,
                  bonusAttackLimit: 1,
                ),
                CapitalRaidMember(
                  tag: '#PPYYLLQ',
                  attacks: 2,
                  attackLimit: 5,
                  bonusAttackLimit: 0,
                ),
              ],
        ),
      ],
    );

    FakeApi api0([CapitalRaidSeasons? raid]) => FakeApi()
      ..clan = publicClan.copyWith(memberList: members)
      ..raid = raid
      ..log = [];

    testWidgets('사용/전체가 보이고, 목록에 없는 멤버는 0/5', (tester) async {
      await pumpClan(tester, api0(raidWith()), openWarLog: false);
      expect(find.text('6/6'), findsOneWidget); // Chief: 5 + 보너스 1
      expect(find.text('2/5'), findsOneWidget); // Buddy
      expect(find.text('0/5'), findsOneWidget); // Casual: 레이드 목록에 없음 = 공격 안 함
    });

    testWidgets('이름과 트로피 사이 가운데에 있다 (같은 줄)', (tester) async {
      await pumpClan(tester, api0(raidWith()), openWarLog: false);
      final nameRight = tester.getTopRight(find.text('Chief')).dx;
      final cell = tester.getCenter(find.text('6/6'));
      final trophyLeft = tester.getTopLeft(find.text('1234')).dx;
      expect(cell.dx, greaterThan(nameRight));
      expect(cell.dx, lessThan(trophyLeft));
      // 같은 줄(이름과 세로 위치가 비슷)
      expect(
        (cell.dy - tester.getCenter(find.text('Chief')).dy).abs(),
        lessThan(20),
      );
    });

    testWidgets('모두 사용=초록, 일부=기본색, 하나도 안 씀=흐리게', (tester) async {
      await pumpClan(tester, api0(raidWith()), openWarLog: false);
      Color? colorOf(String text) =>
          tester.widget<Text>(find.text(text)).style?.color;

      final theme = Theme.of(tester.element(find.byType(ClanPage)));
      final muted = theme.colorScheme.outline;
      const green = Color(0xFF43A047);

      expect(colorOf('6/6'), green);
      expect(colorOf('0/5'), muted);
      // 일부만 사용: 초록도 흐린 색도 아닌 테마 기본 글자색
      expect(colorOf('2/5'), theme.textTheme.bodyMedium?.color);
      expect(colorOf('2/5'), isNot(green));
      expect(colorOf('2/5'), isNot(muted));
    });

    testWidgets('툴팁으로 사용 현황을 알려 준다', (tester) async {
      await pumpClan(tester, api0(raidWith()), openWarLog: false);
      expect(find.byTooltip('Capital raid attacks 6/6'), findsOneWidget);
      expect(find.byTooltip('Capital raid attacks 0/5'), findsOneWidget);
    });

    testWidgets('어느 시즌인지 안내한다: 종료', (tester) async {
      await pumpClan(tester, api0(raidWith()), openWarLog: false);
      String md(DateTime d) => '${d.toLocal().month}/${d.toLocal().day}';
      final period =
          '${md(DateTime.utc(2026, 10, 9, 7))}~${md(DateTime.utc(2026, 10, 12, 7))}';
      expect(find.text('Capital Raid · $period · Ended'), findsOneWidget);
    });

    testWidgets('기간 안내는 멤버 카드·공격권 칸과 같은 가로 중심(가운데)에 있다', (tester) async {
      await pumpClan(tester, api0(raidWith()), openWarLog: false);
      final caption = find.textContaining('Capital Raid');
      final card = find
          .ancestor(of: find.text('Chief'), matching: find.byType(Card))
          .first;
      final cellCenter = tester
          .getCenter(find.byTooltip('Capital raid attacks 6/6'))
          .dx;

      expect(
        tester.getCenter(caption).dx,
        closeTo(tester.getCenter(card).dx, 1),
      );
      expect(tester.getCenter(caption).dx, closeTo(cellCenter, 1));
    });

    testWidgets('진행 중인 시즌이면 진행 중이라고 안내한다', (tester) async {
      await pumpClan(
        tester,
        api0(raidWith(state: RaidState.ongoing)),
        openWarLog: false,
      );
      expect(find.textContaining('In progress'), findsOneWidget);
    });

    testWidgets('한국어 안내', (tester) async {
      await pumpClan(tester, api0(raidWith()), openWarLog: false, locale: 'ko');
      expect(find.textContaining('캐피탈 레이드 ·'), findsOneWidget);
      expect(find.textContaining('· 종료'), findsOneWidget);
      expect(find.byTooltip('캐피탈 공격권 6/6'), findsOneWidget);
    });

    testWidgets('아직 공격이 없는 시즌은 모두 0/5', (tester) async {
      await pumpClan(
        tester,
        api0(raidWith(raidMembers: const [], totalAttacks: 0)),
        openWarLog: false,
      );
      expect(find.text('0/5'), findsNWidgets(3));
    });

    testWidgets('시즌이 없으면 칸과 안내를 그리지 않는다', (tester) async {
      await pumpClan(tester, api0(), openWarLog: false);
      expect(find.byIcon(Icons.account_balance), findsNothing);
      expect(find.textContaining('Capital Raid'), findsNothing);
      expect(find.text('Chief'), findsOneWidget); // 멤버 목록은 정상
    });

    testWidgets('조회 오류여도 멤버 목록은 정상이고 칸만 없다', (tester) async {
      final api = api0()
        ..raidError = const ApiException(
          ApiErrorKind.privateLog,
          statusCode: 403,
        );
      await pumpClan(tester, api, openWarLog: false);
      expect(find.byIcon(Icons.account_balance), findsNothing);
      expect(find.text('Chief'), findsOneWidget);
      expect(api.raidCalls, 1); // 자동 재시도 없음
    });

    testWidgets('멤버 목록이 비어 있는데 공격 기록만 있으면(과거 시즌) 쓰지 않는다', (tester) async {
      await pumpClan(
        tester,
        api0(raidWith(raidMembers: const [], totalAttacks: 126)),
        openWarLog: false,
      );
      expect(find.text('0/5'), findsNothing);
      expect(find.textContaining('Capital Raid'), findsNothing);
    });

    testWidgets('가장 최근 시즌 한 건만 요청한다', (tester) async {
      final api = api0(raidWith());
      await pumpClan(tester, api, openWarLog: false);
      expect(api.raidLimit, 1);
    });

    testWidgets('공격권 칸이 있어도 멤버를 누르면 선택/이동 동작은 그대로다', (tester) async {
      final api =
          _PlayersApi({
              '#P0Y2LQ9': const Player(tag: '#P0Y2LQ9', name: 'Chief'),
            })
            ..clan = publicClan.copyWith(memberList: members)
            ..raid = raidWith()
            ..log = [];
      await pumpClan(
        tester,
        api,
        size: const Size(splitViewMinWidth + 100, 1000),
        openWarLog: false,
      );
      await tester.tap(find.byTooltip('Side-by-side view'));
      await tester.pumpAndSettle();
      // 공격권 칸(6/6)을 눌러도 그 멤버가 선택된다 (행 전체가 눌린다)
      await tester.tap(find.text('6/6'));
      await tester.pumpAndSettle();
      expect(api.playerCalls, ['#P0Y2LQ9']);
    });
  });

  group('멤버 줄 레이아웃: 번호 삭제, 캐피탈 공격권 정중앙', () {
    // 트로피·기부 글자 길이가 서로 다른 멤버들. 예전에는 이 길이 때문에 공격권 칸이 줄마다 밀렸다.
    final members = const [
      ClanMember(
        tag: '#M1',
        name: 'Alpha',
        role: 'leader',
        townHallLevel: 18,
        trophies: 0,
        clanRank: 6,
        donations: 467,
        donationsReceived: 2461,
      ),
      ClanMember(
        tag: '#M2',
        name: 'Bravo',
        role: 'coLeader',
        townHallLevel: 18,
        trophies: 92,
        clanRank: 9,
        donations: 3215,
        donationsReceived: 0,
      ),
      ClanMember(
        tag: '#M3',
        name: 'Charlie',
        role: 'admin',
        townHallLevel: 17,
        trophies: 1234,
        clanRank: 2,
        donations: 5,
        donationsReceived: 5,
      ),
      ClanMember(
        tag: '#M4',
        name: 'Delta',
        role: 'member',
        townHallLevel: 16,
        trophies: 30,
        clanRank: 10,
        donations: 2372,
        donationsReceived: 825,
      ),
    ];
    final raid = CapitalRaidSeasons(
      items: [
        CapitalRaidSeason(
          state: RaidState.ended,
          startTime: DateTime.utc(2026, 10, 9, 7),
          endTime: DateTime.utc(2026, 10, 12, 7),
          totalAttacks: 18,
          members: const [
            CapitalRaidMember(
              tag: '#M2',
              attacks: 6,
              attackLimit: 5,
              bonusAttackLimit: 1,
            ),
            CapitalRaidMember(
              tag: '#M3',
              attacks: 3,
              attackLimit: 5,
              bonusAttackLimit: 0,
            ),
            CapitalRaidMember(
              tag: '#M4',
              attacks: 6,
              attackLimit: 5,
              bonusAttackLimit: 1,
            ),
          ],
        ),
      ],
    );

    FakeApi api0() => FakeApi()
      ..clan = publicClan.copyWith(memberList: members)
      ..raid = raid
      ..log = [];

    Finder cell(String usage) => find.byWidgetPredicate(
      (w) => w is Tooltip && w.message == 'Capital raid attacks $usage',
    );

    // 정렬 순서: Alpha(리더), Bravo, Charlie, Delta. 공격권: 0/5, 6/6, 3/5, 6/6
    final usages = {
      'Alpha': '0/5',
      'Bravo': '6/6',
      'Charlie': '3/5',
      'Delta': '6/6',
    };

    testWidgets('맨 왼쪽 클랜 순위 번호가 없다', (tester) async {
      await pumpClan(tester, api0(), openWarLog: false);
      // (헤더의 승/무/패 숫자와 겹치지 않도록 멤버 카드 안에서만 찾는다.)
      final rankByName = {
        'Alpha': '6',
        'Bravo': '9',
        'Charlie': '2',
        'Delta': '10',
      };
      for (final MapEntry(key: name, value: rank) in rankByName.entries) {
        final card = find
            .ancestor(of: find.text(name), matching: find.byType(Card))
            .first;
        expect(
          find.descendant(of: card, matching: find.text(rank)),
          findsNothing,
          reason: '$name의 순위 번호 $rank',
        );
      }
      // 이름은 카드 왼쪽 가장자리 가까이에서 시작한다 (번호 칸 분량만큼 밀려 있지 않다)
      final card = find
          .ancestor(of: find.text('Alpha'), matching: find.byType(Card))
          .first;
      expect(
        tester.getTopLeft(find.text('Alpha')).dx - tester.getTopLeft(card).dx,
        lessThan(24),
      );
    });

    testWidgets('공격권 칸이 모든 줄에서 같은 위치이고 카드 가로 정중앙이다', (tester) async {
      await pumpClan(tester, api0(), openWarLog: false);

      final centers = <double>[];
      for (final MapEntry(key: name, value: usage) in usages.entries) {
        final card = find
            .ancestor(of: find.text(name), matching: find.byType(Card))
            .first;
        final cardCenter = tester.getCenter(card).dx;
        final cellCenter = tester
            .getCenter(
              cell(usage).evaluate().length > 1
                  ? cell(usage)
                        .at(usages.keys.toList().indexOf(name) == 3 ? 1 : 0)
                  : cell(usage),
            )
            .dx;
        expect(cellCenter, closeTo(cardCenter, 1), reason: '$name: 카드 정중앙');
        centers.add(cellCenter);
      }
      // 모든 줄에서 같은 x
      for (final c in centers) {
        expect(c, closeTo(centers.first, 1));
      }
    });

    testWidgets('좁은 화면에서는 이름이 좁아지지 않도록 열을 고정 정렬한다', (tester) async {
      await pumpClan(
        tester,
        api0(),
        openWarLog: false,
        size: const Size(400, 1400),
      );

      final xs = <double>[
        tester.getCenter(cell('0/5')).dx,
        tester.getCenter(cell('3/5')).dx,
        tester.getCenter(cell('6/6').at(0)).dx,
        tester.getCenter(cell('6/6').at(1)).dx,
      ];
      for (final x in xs) {
        expect(x, closeTo(xs.first, 1));
      }
      // 글자 길이가 달라도 이름은 잘리지 않고 보인다
      expect(find.text('Charlie'), findsOneWidget);
    });

    testWidgets('공격권 데이터가 없으면 칸 없이 기존 레이아웃', (tester) async {
      final api = FakeApi()
        ..clan = publicClan.copyWith(memberList: members)
        ..log = [];
      await pumpClan(tester, api, openWarLog: false);
      expect(find.byIcon(Icons.account_balance), findsNothing);
      expect(find.text('Alpha'), findsOneWidget);
      expect(find.text('1234'), findsOneWidget); // 트로피는 그대로 보인다
    });
  });

  group('헤더: 클랜전 리그·캐피탈 리그(캐피탈 트로피)', () {
    const champion3 = 'https://example.com/leagues/champion3.png';
    const league = League(id: 48000016, name: 'Champion League III');

    FakeApi apiWith(Clan clan) => FakeApi()
      ..clan = clan
      ..leagues = const [
        League(
          id: 29000016,
          name: 'Champion League III',
          iconUrls: IconUrls(small: champion3),
        ),
      ]
      ..log = [];

    final full = publicClan.copyWith(
      warLeague: league,
      capitalLeague: league,
      clanCapitalPoints: 3254,
    );
    Finder header() => find.byType(Card).first;
    Finder inHeader(Finder f) => find.descendant(of: header(), matching: f);

    testWidgets('클랜전 리그 이름과 캐피탈 리그 이름·캐피탈 트로피를 보여준다', (tester) async {
      await pumpClan(tester, apiWith(full), openWarLog: false);
      expect(
        inHeader(find.text('Champion League III')),
        findsOneWidget,
      ); // 클랜전 리그
      expect(
        inHeader(find.text('Champion League III · 3,254')),
        findsOneWidget,
      ); // 캐피탈 리그 + 트로피(천 단위 쉼표)
    });

    testWidgets('클랜전 리그 아이콘은 이름이 같은 리그의 API 아이콘', (tester) async {
      await pumpClan(tester, apiWith(full), openWarLog: false);
      final icons = tester.widgetList<RemoteImage>(
        find.descendant(
          of: header(),
          matching: find.byWidgetPredicate(
            (w) => w is RemoteImage && w.size == 24,
          ),
        ),
      );
      expect(icons.map((i) => i.url), [champion3]);
    });

    // 헤더에는 클랜전 리그의 네트워크 이미지도 있으므로, 번들된 에셋 이미지(캐피탈 리그)만 찾는다.
    final assetImage = find.byWidgetPredicate(
      (w) =>
          w is Image &&
          w.image is ResizeImage &&
          (w.image as ResizeImage).imageProvider is AssetImage,
    );

    testWidgets('캐피탈 리그 아이콘: 이미지를 받지 않았으면 대체 아이콘', (tester) async {
      await pumpClan(tester, apiWith(full), openWarLog: false);
      expect(inHeader(find.byIcon(Icons.account_balance)), findsOneWidget);
      expect(inHeader(assetImage), findsNothing);
    });

    testWidgets('캐피탈 리그 아이콘: 이미지를 받아 뒀으면 그 이미지', (tester) async {
      await pumpClan(
        tester,
        apiWith(full),
        openWarLog: false,
        assets: const {'assets/game/capital_leagues/champion-iii.webp'},
      );
      expect(inHeader(assetImage), findsOneWidget);
      final image = tester.widget<Image>(inHeader(assetImage));
      expect(
        ((image.image as ResizeImage).imageProvider as AssetImage).assetName,
        'assets/game/capital_leagues/champion-iii.webp',
      );
      expect(inHeader(find.byIcon(Icons.account_balance)), findsNothing);
    });

    testWidgets('위치: 이름·태그 오른쪽, 나란히 보기 토글 왼쪽, 같은 줄', (tester) async {
      await pumpClan(
        tester,
        apiWith(full),
        size: const Size(1400, 1000),
        openWarLog: false,
      );
      final leagueText = inHeader(find.text('Champion League III · 3,254'));
      final tag = inHeader(find.text('#2PP'));
      final toggle = find.byTooltip('Side-by-side view');

      expect(
        tester.getTopLeft(leagueText).dx,
        greaterThan(tester.getTopRight(tag).dx),
      );
      expect(
        tester.getTopRight(leagueText).dx,
        lessThan(tester.getTopLeft(toggle).dx),
      );
      // 헤더 윗부분(이름과 같은 줄 근처)에 있다 — 승/무/패 줄보다 위
      expect(
        tester.getTopLeft(leagueText).dy,
        lessThan(tester.getTopLeft(find.text('Wins')).dy),
      );
    });

    testWidgets('나란히 보기 토글이 없는 화면에서도 같은 자리에 보인다', (tester) async {
      await pumpClan(tester, apiWith(full), openWarLog: false); // 800 너비: 토글 없음
      expect(find.byTooltip('Side-by-side view'), findsNothing);
      expect(
        inHeader(find.text('Champion League III · 3,254')),
        findsOneWidget,
      );
    });

    testWidgets('좁은 화면에서는 이름 없이 아이콘과 캐피탈 트로피만', (tester) async {
      await pumpClan(
        tester,
        apiWith(full),
        openWarLog: false,
        size: const Size(400, 1400),
      );
      expect(inHeader(find.text('Champion League III')), findsNothing);
      expect(inHeader(find.text('3,254')), findsOneWidget);
      // 이름은 툴팁으로 확인할 수 있다
      expect(
        find.byTooltip('Clan war league: Champion League III'),
        findsOneWidget,
      );
    });

    testWidgets('툴팁으로 설명한다', (tester) async {
      await pumpClan(tester, apiWith(full), openWarLog: false);
      expect(
        find.byTooltip('Clan war league: Champion League III'),
        findsOneWidget,
      );
      expect(
        find.byTooltip(
          'Capital league: Champion League III · 3,254 capital trophies',
        ),
        findsOneWidget,
      );
    });

    testWidgets('정보가 없는 줄은 그리지 않는다', (tester) async {
      // 캐피탈 정보 없음: 클랜전 리그만
      await pumpClan(
        tester,
        apiWith(publicClan.copyWith(warLeague: league)),
        openWarLog: false,
      );
      expect(inHeader(find.text('Champion League III')), findsOneWidget);
      expect(inHeader(find.byIcon(Icons.account_balance)), findsNothing);

      // 둘 다 없음: 리그 영역 자체가 없다
      await pumpClan(tester, apiWith(publicClan), openWarLog: false);
      expect(inHeader(find.byIcon(Icons.military_tech)), findsNothing);
      expect(inHeader(find.byIcon(Icons.account_balance)), findsNothing);
    });

    testWidgets('캐피탈 트로피만 있어도 보인다', (tester) async {
      await pumpClan(
        tester,
        apiWith(publicClan.copyWith(clanCapitalPoints: 12345)),
        openWarLog: false,
      );
      expect(inHeader(find.text('12,345')), findsOneWidget);
    });

    testWidgets('리그 목록을 받지 못해도 이름은 보이고 기본 아이콘', (tester) async {
      final api = apiWith(full)
        ..leaguesError = const ApiException(
          ApiErrorKind.maintenance,
          statusCode: 503,
        );
      await pumpClan(tester, api, openWarLog: false);
      expect(inHeader(find.text('Champion League III')), findsOneWidget);
      expect(inHeader(find.byIcon(Icons.military_tech)), findsOneWidget);
    });

    testWidgets('한국어 툴팁', (tester) async {
      await pumpClan(tester, apiWith(full), openWarLog: false, locale: 'ko');
      expect(find.byTooltip('클랜전 리그: Champion League III'), findsOneWidget);
      expect(
        find.byTooltip('캐피탈 리그: Champion League III · 캐피탈 트로피 3,254'),
        findsOneWidget,
      );
    });
  });

  group('멤버 기본 정렬: 직책 → 타운홀 → 가나다순', () {
    testWidgets('멤버 탭의 타일이 정렬된 순서로 위에서 아래로 나온다', (tester) async {
      final api = FakeApi()
        ..clan = publicClan.copyWith(
          memberList: const [
            ClanMember(
              tag: '#M1',
              name: '가나',
              role: 'member',
              townHallLevel: 16,
              clanRank: 1,
            ),
            ClanMember(
              tag: '#M2',
              name: 'Cat',
              role: 'member',
              townHallLevel: 16,
              clanRank: 2,
            ),
            ClanMember(
              tag: '#M3',
              name: 'Kim',
              role: 'admin',
              townHallLevel: 17,
              clanRank: 3,
            ),
            ClanMember(
              tag: '#M4',
              name: 'Bob',
              role: 'coLeader',
              townHallLevel: 18,
              clanRank: 4,
            ),
            ClanMember(
              tag: '#M5',
              name: 'Amy',
              role: 'coLeader',
              townHallLevel: 18,
              clanRank: 5,
            ),
            ClanMember(
              tag: '#M6',
              name: 'Zed',
              role: 'leader',
              townHallLevel: 15,
              clanRank: 6,
            ),
          ],
        )
        ..log = [];
      await pumpClan(tester, api);
      await tester.tap(find.text('Members'));
      await tester.pumpAndSettle();

      // API 순서(클랜 순위순)가 아니라 직책 → 타운홀 → 이름 순
      final expected = ['Zed', 'Amy', 'Bob', 'Kim', 'Cat', '가나'];
      final ys = [for (final n in expected) tester.getTopLeft(find.text(n)).dy];
      for (var i = 1; i < ys.length; i++) {
        expect(
          ys[i],
          greaterThan(ys[i - 1]),
          reason: '${expected[i - 1]} 다음에 ${expected[i]}',
        );
      }
    });
  });

  group('폭 통일', () {
    const wide = Size(1400, 1000);

    double listWidth(WidgetTester t, Finder scope) => t
        .getSize(
          find.descendant(of: scope, matching: find.byType(ListView)).first,
        )
        .width;

    testWidgets('클랜 전체 화면과 플레이어 전체 화면의 폭이 같다', (tester) async {
      final api = FakeApi()
        ..clan = publicClan
        ..player = const Player(tag: '#P0Y2LQ9', name: 'Chief')
        ..log = [];
      await pumpClan(tester, api, size: wide);
      final clanWidth = listWidth(tester, find.byType(ClanPage));
      expect(clanWidth, contentMaxWidth);

      await pumpClan(
        tester,
        api,
        size: wide,
        home: const PlayerPage(tag: '#P0Y2LQ9'),
      );
      expect(listWidth(tester, find.byType(PlayerPage)), clanWidth);
    });

    testWidgets('나란히 보기의 클랜 창·프로필 창도 같은 폭이다', (tester) async {
      final api =
          _PlayersApi({
              '#P0Y2LQ9': const Player(tag: '#P0Y2LQ9', name: 'Chief'),
            })
            ..clan = publicClan.copyWith(
              memberList: const [
                ClanMember(
                  tag: '#P0Y2LQ9',
                  name: 'Chief',
                  role: 'coLeader',
                  clanRank: 1,
                ),
              ],
            )
            ..log = [];
      await pumpClan(tester, api, size: wide);
      final fullWidth = listWidth(tester, find.byType(ClanPage));

      await tester.tap(find.byTooltip('Side-by-side view'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Chief'));
      await tester.pumpAndSettle();

      final left = tester.getSize(find.byType(ListView).first).width;
      final right = listWidth(tester, find.byType(PlayerProfileView));
      expect(left, fullWidth);
      expect(right, fullWidth);
      // 두 창이 화면 가운데에 대칭으로 놓인다.
      final leftEdge = tester.getTopLeft(find.byType(ListView).first).dx;
      final rightEdge = tester
          .getTopRight(
            find
                .descendant(
                  of: find.byType(PlayerProfileView),
                  matching: find.byType(ListView),
                )
                .first,
          )
          .dx;
      expect(leftEdge, closeTo(wide.width - rightEdge, 1));
    });
  });

  group('나란히 보기 토글 표시', () {
    const wide = Size(1400, 1000);

    testWidgets('꺼짐은 테두리 버튼, 켜짐은 채워진 버튼이고 아이콘도 다르다', (tester) async {
      final api = FakeApi()
        ..clan = publicClan
        ..log = [];
      await pumpClan(tester, api, size: wide);

      IconButton button() => tester.widget<IconButton>(
        find.ancestor(
          of: find.byTooltip('Side-by-side view'),
          matching: find.byType(IconButton),
        ),
      );
      bool toggled() => tester
          .widgetList<Semantics>(find.byType(Semantics))
          .any((s) => s.properties.toggled == true);

      expect(button().isSelected, isFalse);
      expect(find.byIcon(Icons.view_sidebar_outlined), findsOneWidget);
      expect(find.byIcon(Icons.view_sidebar), findsNothing);
      expect(toggled(), isFalse);
      // 실제로 그려지는 배경색: 꺼짐은 투명(테두리만), 켜짐은 주색으로 채워진다.
      Color? background(IconData icon) => tester
          .widget<Material>(
            find
                .ancestor(
                  of: find.byIcon(icon),
                  matching: find.byType(Material),
                )
                .first,
          )
          .color;
      final primary = Theme.of(tester.element(find.byType(ClanPage)))
          .colorScheme
          .primary;
      final offBackground = background(Icons.view_sidebar_outlined);
      expect(
        offBackground == null || offBackground == Colors.transparent,
        isTrue,
      );

      await tester.tap(find.byTooltip('Side-by-side view'));
      await tester.pumpAndSettle();

      expect(button().isSelected, isTrue);
      expect(find.byIcon(Icons.view_sidebar), findsOneWidget);
      expect(find.byIcon(Icons.view_sidebar_outlined), findsNothing);
      expect(toggled(), isTrue);
      expect(background(Icons.view_sidebar), primary);

      await tester.tap(find.byTooltip('Side-by-side view'));
      await tester.pumpAndSettle();
      expect(button().isSelected, isFalse);
      expect(toggled(), isFalse);
    });

    testWidgets('두 창이 들어가는 최소 너비(경계값)에서만 버튼이 나온다', (tester) async {
      final api = FakeApi()
        ..clan = publicClan
        ..log = [];
      await pumpClan(tester, api, size: Size(splitViewMinWidth - 1, 1000));
      expect(find.byTooltip('Side-by-side view'), findsNothing);

      await pumpClan(tester, api, size: Size(splitViewMinWidth, 1000));
      expect(find.byTooltip('Side-by-side view'), findsOneWidget);
    });
  });

  group('나란히 보기(확장 버튼)', () {
    const wide = Size(1400, 1000);
    final splitClan = publicClan.copyWith(
      memberList: const [
        ClanMember(
          tag: '#P0Y2LQ9',
          name: 'Chief',
          role: 'coLeader',
          clanRank: 1,
        ),
        ClanMember(tag: '#PPYYLLQ', name: 'Buddy', role: 'admin', clanRank: 2),
      ],
    );
    final chief = Player(
      tag: '#P0Y2LQ9',
      name: 'Chief',
      townHallLevel: 18,
      heroes: const [
        PlayerItem(
          name: 'Barbarian King',
          level: 90,
          maxLevel: 110,
          village: 'home',
        ),
      ],
    );
    final buddy = Player(
      tag: '#PPYYLLQ',
      name: 'Buddy',
      townHallLevel: 17,
      heroes: const [
        PlayerItem(
          name: 'Archer Queen',
          level: 80,
          maxLevel: 110,
          village: 'home',
        ),
      ],
    );

    FakeApi apiWithPlayers() =>
        _PlayersApi({'#P0Y2LQ9': chief, '#PPYYLLQ': buddy})
          ..clan = splitClan
          ..log = [];

    Finder tip(String name) => find.byWidgetPredicate(
      (w) => w is Tooltip && (w.message ?? '').startsWith('$name ·'),
    );

    testWidgets('좁은 화면에서는 확장 버튼이 없다', (tester) async {
      final api = apiWithPlayers();
      await pumpClan(tester, api); // 800 너비
      expect(find.byTooltip('Side-by-side view'), findsNothing);
    });

    testWidgets('넓은 화면에는 확장 버튼이 있고, 켜기 전에는 프로필 창이 없다', (tester) async {
      final api = apiWithPlayers();
      await pumpClan(tester, api, size: wide);
      expect(find.byTooltip('Side-by-side view'), findsOneWidget);
      expect(find.byType(PlayerProfileView), findsNothing);
    });

    testWidgets('확장 버튼은 앱바(언어 버튼 옆)가 아니라 클랜 헤더 카드의 오른쪽 위에 있다', (tester) async {
      final api = apiWithPlayers();
      await pumpClan(tester, api, size: wide);

      final button = find.byTooltip('Side-by-side view');
      // 앱바에는 없다
      expect(
        find.descendant(of: find.byType(AppBar), matching: button),
        findsNothing,
      );
      // 헤더 카드 안에 있고, 이름·태그보다 오른쪽, 승/무/패 줄보다 위에 있다
      final header = find.byType(Card).first;
      expect(find.descendant(of: header, matching: button), findsOneWidget);
      final tag = find.descendant(of: header, matching: find.text('#2PP'));
      expect(
        tester.getTopLeft(button).dx,
        greaterThan(tester.getTopRight(tag).dx),
      );
      expect(
        tester.getTopLeft(button).dy,
        lessThan(tester.getTopLeft(find.text('Wins')).dy),
      );
    });

    testWidgets('켜면 멤버 탭으로 바뀌고 오른쪽에 안내 문구가 나온다', (tester) async {
      final api = apiWithPlayers();
      await pumpClan(tester, api, size: wide);

      await tester.tap(find.byTooltip('Side-by-side view'));
      await tester.pumpAndSettle();

      expect(find.text('Chief'), findsOneWidget); // 멤버 목록
      expect(find.text('Buddy'), findsOneWidget);
      expect(
        find.text('Select a member to see their profile here.'),
        findsOneWidget,
      );
    });

    testWidgets('멤버를 누르면 이동하지 않고 오른쪽에 프로필이 나란히 표시된다', (tester) async {
      final api = apiWithPlayers();
      await pumpClan(tester, api, size: wide);
      await tester.tap(find.byTooltip('Side-by-side view'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Chief'));
      await tester.pumpAndSettle();

      expect(api.playerCalls, ['#P0Y2LQ9']);
      // 클랜 화면이 그대로 있고(이동하지 않음) 오른쪽에 프로필이 있다.
      expect(find.byType(ClanPage), findsOneWidget);
      expect(find.text('War log'), findsOneWidget);
      expect(find.byType(PlayerProfileView), findsOneWidget);
      expect(tip('Barbarian King'), findsOneWidget);
      expect(
        find.text('Select a member to see their profile here.'),
        findsNothing,
      );

      // 클랜 목록은 왼쪽, 프로필은 오른쪽에 있다.
      expect(
        tester.getTopLeft(find.byType(PlayerProfileView)).dx,
        greaterThan(tester.getTopRight(find.text('Chief').first).dx),
      );
    });

    testWidgets('오른쪽 프로필 창에서도 본마을/장인기지 탭 버튼이 창의 가운데에 있다', (tester) async {
      final api = apiWithPlayers();
      await pumpClan(tester, api, size: wide);
      await tester.tap(find.byTooltip('Side-by-side view'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Chief'));
      await tester.pumpAndSettle();

      final profile = find.byType(PlayerProfileView);
      final tabs = find.descendant(
        of: profile,
        matching: find.byType(SegmentedButton<Village>),
      );
      final body = find.descendant(
        of: profile,
        matching: find.byType(ListView),
      );
      expect(tabs, findsOneWidget);
      expect(
        tester.getCenter(tabs).dx,
        closeTo(tester.getCenter(body.first).dx, 1),
      );
    });

    testWidgets('선택한 멤버가 강조되고, 다른 멤버를 누르면 프로필이 바뀐다', (tester) async {
      final api = apiWithPlayers();
      await pumpClan(tester, api, size: wide);
      await tester.tap(find.byTooltip('Side-by-side view'));
      await tester.pumpAndSettle();

      // 선택된 멤버는 Card가 primaryContainer 색으로 강조된다.
      final highlight = Theme.of(tester.element(find.byType(ClanPage)))
          .colorScheme
          .primaryContainer;
      bool selected(String name) =>
          tester
              .widget<Card>(
                find
                    .ancestor(of: find.text(name), matching: find.byType(Card))
                    .first,
              )
              .color ==
          highlight;

      await tester.tap(find.text('Chief'));
      await tester.pumpAndSettle();
      expect(selected('Chief'), isTrue);
      expect(selected('Buddy'), isFalse);

      await tester.tap(find.text('Buddy'));
      await tester.pumpAndSettle();
      expect(selected('Buddy'), isTrue);
      expect(selected('Chief'), isFalse);
      expect(api.playerCalls, ['#P0Y2LQ9', '#PPYYLLQ']);
      expect(tip('Archer Queen'), findsOneWidget);
      expect(tip('Barbarian King'), findsNothing);
    });

    testWidgets('끄면 프로필 창이 사라지고 클랜 화면의 탭은 그대로다', (tester) async {
      final api = apiWithPlayers();
      await pumpClan(tester, api, size: wide);
      await tester.tap(find.byTooltip('Side-by-side view'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Chief'));
      await tester.pumpAndSettle();

      await tester.tap(find.byTooltip('Side-by-side view'));
      await tester.pumpAndSettle();

      expect(find.byType(PlayerProfileView), findsNothing);
      // 멤버 탭 상태가 유지된다.
      expect(find.text('Chief'), findsOneWidget);
      expect(find.text('Buddy'), findsOneWidget);
    });
  });
}

/// 태그마다 다른 플레이어를 돌려주는 가짜 API.
class _PlayersApi extends FakeApi {
  _PlayersApi(this.players);

  final Map<String, Player> players;

  @override
  Future<Player> getPlayer(String tag) async {
    playerCalls.add(tag);
    return players[tag]!;
  }
}
