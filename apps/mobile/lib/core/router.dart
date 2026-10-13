import 'package:coc_models/coc_models.dart';
import 'package:go_router/go_router.dart';

import '../features/clan/clan_page.dart';
import '../features/home/home_page.dart';
import '../features/player/player_page.dart';
import '../features/settings/settings_page.dart';
import '../features/war/war_page.dart';

/// URL에는 `#` 없이 태그만 넣는다 (`/clan/2PP`). 웹 딥링크로도 그대로 열린다.
GoRouter buildRouter() => GoRouter(
  routes: [
    GoRoute(path: '/', builder: (_, _) => const HomePage()),
    GoRoute(path: '/settings', builder: (_, _) => const SettingsPage()),
    GoRoute(
      path: '/clan/:tag/war',
      builder: (_, state) =>
          WarPage(tag: normalizeTag(state.pathParameters['tag']!)),
    ),
    GoRoute(
      path: '/clan/:tag',
      builder: (_, state) =>
          ClanPage(tag: normalizeTag(state.pathParameters['tag']!)),
    ),
    GoRoute(
      path: '/player/:tag',
      builder: (_, state) =>
          PlayerPage(tag: normalizeTag(state.pathParameters['tag']!)),
    ),
  ],
);
