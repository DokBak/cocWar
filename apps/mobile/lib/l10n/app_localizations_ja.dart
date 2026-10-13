// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'War Report';

  @override
  String get kindClan => 'クラン';

  @override
  String get kindPlayer => 'プレイヤー';

  @override
  String get tagLabel => 'タグ';

  @override
  String get tagHint => '#2PP';

  @override
  String get search => '検索';

  @override
  String get invalidTag => '正しいタグではありません。';

  @override
  String get recentSearches => '最近の検索';

  @override
  String get favorites => 'お気に入り';

  @override
  String get clearAll => 'すべて削除';

  @override
  String get emptyHint => 'クランまたはプレイヤーのタグを入力して始めましょう。';

  @override
  String get addFavorite => 'お気に入りに追加';

  @override
  String get removeFavorite => 'お気に入りから削除';

  @override
  String get settings => '設定';

  @override
  String get language => '言語';

  @override
  String get languageSystem => 'システム設定';

  @override
  String get theme => 'テーマ';

  @override
  String get themeSystem => 'システム設定';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get comingSoon => 'この画面は準備中です。';

  @override
  String get disclaimer =>
      '本アプリは非公式のファンプロジェクトであり、Supercell とは提携・後援・承認の関係になく、Supercell は本アプリについて責任を負いません。';

  @override
  String get errorGeneric => '問題が発生しました。もう一度お試しください。';

  @override
  String get errorNotFound => '見つかりません。';

  @override
  String get errorPrivateLog => 'このクランの戦争ログは非公開です。';

  @override
  String get errorRateLimited => 'リクエストが多すぎます。しばらくしてからもう一度お試しください。';

  @override
  String get errorMaintenance => 'Clash of Clans API はメンテナンス中です。';

  @override
  String get errorNetwork => 'サーバーに接続できません。';

  @override
  String get retry => '再試行';
}
