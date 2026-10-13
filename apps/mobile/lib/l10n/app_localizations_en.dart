// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'War Report';

  @override
  String get kindClan => 'Clan';

  @override
  String get kindPlayer => 'Player';

  @override
  String get tagLabel => 'Tag';

  @override
  String get tagHint => '#2PP';

  @override
  String get search => 'Search';

  @override
  String get invalidTag => 'That is not a valid tag.';

  @override
  String get recentSearches => 'Recent searches';

  @override
  String get favorites => 'Favorites';

  @override
  String get clearAll => 'Clear all';

  @override
  String get emptyHint => 'Enter a clan or player tag to get started.';

  @override
  String get addFavorite => 'Add to favorites';

  @override
  String get removeFavorite => 'Remove from favorites';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get languageSystem => 'System default';

  @override
  String get theme => 'Theme';

  @override
  String get themeSystem => 'System default';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get comingSoon => 'This screen is coming soon.';

  @override
  String get disclaimer =>
      'This is an unofficial fan project. It is not affiliated with, endorsed, sponsored, or specifically approved by Supercell, and Supercell is not responsible for it.';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String get errorNotFound => 'Not found.';

  @override
  String get errorPrivateLog => 'This clan\'s war log is private.';

  @override
  String get errorRateLimited => 'Too many requests. Please try again shortly.';

  @override
  String get errorMaintenance => 'The Clash of Clans API is under maintenance.';

  @override
  String get errorNetwork => 'Could not reach the server.';

  @override
  String get retry => 'Retry';

  @override
  String clanLevel(int level) {
    return 'Level $level';
  }

  @override
  String memberCount(int count) {
    return '$count members';
  }

  @override
  String get warWins => 'Wins';

  @override
  String get warTies => 'Ties';

  @override
  String get warLosses => 'Losses';

  @override
  String get winStreak => 'Win streak';

  @override
  String get warLog => 'War log';

  @override
  String get noWarLog => 'No war log entries yet.';

  @override
  String get resultWin => 'Win';

  @override
  String get resultLose => 'Loss';

  @override
  String get resultTie => 'Draw';

  @override
  String get unknownOpponent => 'Unknown clan';

  @override
  String teamSizeVs(int size) {
    return '$size vs $size';
  }

  @override
  String get previousPage => 'Previous page';

  @override
  String get nextPage => 'Next page';

  @override
  String pageN(int page) {
    return 'Page $page';
  }

  @override
  String get languageTooltip => 'Change language';
}
