import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_client.dart';
import 'saved_tag.dart';

/// main()에서 실제 인스턴스로 override한다.
final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('sharedPreferencesProvider를 override하세요'),
);

/// 빌드 시 `--dart-define=API_BASE_URL=...`로 바꾼다.
const apiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://localhost:8080',
);

final apiClientProvider = Provider<ApiClient>(
  (ref) => ApiClient(baseUrl: apiBaseUrl),
);

// ── 설정(언어/테마) ────────────────────────────────────────────

class Settings {
  const Settings({this.locale, this.themeMode = ThemeMode.system});

  /// null이면 기기 언어를 따른다.
  final Locale? locale;
  final ThemeMode themeMode;
}

class SettingsNotifier extends Notifier<Settings> {
  static const _localeKey = 'settings.locale';
  static const _themeKey = 'settings.theme';

  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  @override
  Settings build() {
    final code = _prefs.getString(_localeKey);
    final themeName = _prefs.getString(_themeKey);
    return Settings(
      locale: code == null ? null : Locale(code),
      themeMode: ThemeMode.values.firstWhere(
        (m) => m.name == themeName,
        orElse: () => ThemeMode.system,
      ),
    );
  }

  Future<void> setLocale(Locale? locale) async {
    state = Settings(locale: locale, themeMode: state.themeMode);
    if (locale == null) {
      await _prefs.remove(_localeKey);
    } else {
      await _prefs.setString(_localeKey, locale.languageCode);
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = Settings(locale: state.locale, themeMode: mode);
    await _prefs.setString(_themeKey, mode.name);
  }
}

final settingsProvider = NotifierProvider<SettingsNotifier, Settings>(
  SettingsNotifier.new,
);

// ── 최근 검색 / 즐겨찾기 ───────────────────────────────────────

abstract class TagListNotifier extends Notifier<List<SavedTag>> {
  String get prefsKey;
  int get maxItems;

  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  @override
  List<SavedTag> build() => [
    for (final s in _prefs.getStringList(prefsKey) ?? const <String>[])
      ?SavedTag.decode(s),
  ];

  Future<void> _save() =>
      _prefs.setStringList(prefsKey, [for (final t in state) t.encoded]);

  /// 이미 있으면 맨 앞으로 옮긴다.
  Future<void> addFirst(SavedTag tag) {
    state = [tag, ...state.where((t) => t != tag)].take(maxItems).toList();
    return _save();
  }

  Future<void> remove(SavedTag tag) {
    state = state.where((t) => t != tag).toList();
    return _save();
  }

  Future<void> clear() {
    state = const [];
    return _save();
  }
}

class RecentNotifier extends TagListNotifier {
  @override
  String get prefsKey => 'recent';
  @override
  int get maxItems => 10;
}

class FavoritesNotifier extends TagListNotifier {
  @override
  String get prefsKey => 'favorites';
  @override
  int get maxItems => 100;

  Future<void> toggle(SavedTag tag) =>
      state.contains(tag) ? remove(tag) : addFirst(tag);
}

final recentProvider = NotifierProvider<RecentNotifier, List<SavedTag>>(
  RecentNotifier.new,
);
final favoritesProvider = NotifierProvider<FavoritesNotifier, List<SavedTag>>(
  FavoritesNotifier.new,
);
