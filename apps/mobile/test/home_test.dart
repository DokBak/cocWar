import 'package:cocwar_mobile/app.dart';
import 'package:cocwar_mobile/core/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> pumpApp(
  WidgetTester tester, [
  Map<String, Object> initial = const {},
]) async {
  SharedPreferences.setMockInitialValues(initial);
  final prefs = await SharedPreferences.getInstance();
  await tester.pumpWidget(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const App(),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('처음에는 안내 문구가 보인다', (tester) async {
    await pumpApp(tester, {'settings.locale': 'en'});
    expect(
      find.text('Enter a clan or player tag to get started.'),
      findsOneWidget,
    );
  });

  testWidgets('잘못된 태그는 오류를 보여주고 이동하지 않는다', (tester) async {
    await pumpApp(tester, {'settings.locale': 'en'});
    await tester.enterText(find.byType(TextField), 'abc');
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();
    expect(find.text('That is not a valid tag.'), findsOneWidget);
    expect(find.text('War Report'), findsOneWidget);
  });

  testWidgets('올바른 태그는 정규화되어 이동하고 최근 검색에 저장된다', (tester) async {
    await pumpApp(tester, {'settings.locale': 'en'});
    await tester.enterText(find.byType(TextField), '2pp');
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();
    expect(find.text('#2PP'), findsOneWidget); // 클랜 화면의 제목
    expect(find.text('This screen is coming soon.'), findsOneWidget);

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getStringList('recent'), ['clan:#2PP']);
  });

  testWidgets('저장된 즐겨찾기가 홈에 나타난다', (tester) async {
    await pumpApp(tester, {
      'settings.locale': 'en',
      'favorites': ['player:#P1'],
    });
    expect(find.text('Favorites'), findsOneWidget);
    expect(find.text('#P1'), findsOneWidget);
  });

  testWidgets('설정에서 언어를 일본어로 바꾸면 화면이 바뀐다', (tester) async {
    await pumpApp(tester, {'settings.locale': 'en'});
    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.text('日本語'));
    await tester.pumpAndSettle();
    expect(find.text('設定'), findsOneWidget);

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('settings.locale'), 'ja');
  });
}
