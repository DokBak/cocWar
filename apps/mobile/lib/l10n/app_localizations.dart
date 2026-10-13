import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
    Locale('ko'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'War Report'**
  String get appTitle;

  /// No description provided for @kindClan.
  ///
  /// In en, this message translates to:
  /// **'Clan'**
  String get kindClan;

  /// No description provided for @kindPlayer.
  ///
  /// In en, this message translates to:
  /// **'Player'**
  String get kindPlayer;

  /// No description provided for @tagLabel.
  ///
  /// In en, this message translates to:
  /// **'Tag'**
  String get tagLabel;

  /// No description provided for @tagHint.
  ///
  /// In en, this message translates to:
  /// **'#2PP'**
  String get tagHint;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @invalidTag.
  ///
  /// In en, this message translates to:
  /// **'That is not a valid tag.'**
  String get invalidTag;

  /// No description provided for @recentSearches.
  ///
  /// In en, this message translates to:
  /// **'Recent searches'**
  String get recentSearches;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get clearAll;

  /// No description provided for @emptyHint.
  ///
  /// In en, this message translates to:
  /// **'Enter a clan or player tag to get started.'**
  String get emptyHint;

  /// No description provided for @addFavorite.
  ///
  /// In en, this message translates to:
  /// **'Add to favorites'**
  String get addFavorite;

  /// No description provided for @removeFavorite.
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get removeFavorite;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get languageSystem;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'This screen is coming soon.'**
  String get comingSoon;

  /// No description provided for @disclaimer.
  ///
  /// In en, this message translates to:
  /// **'This is an unofficial fan project. It is not affiliated with, endorsed, sponsored, or specifically approved by Supercell, and Supercell is not responsible for it. Fan Content Policy: https://supercell.com/en/fan-content-policy/'**
  String get disclaimer;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'Not found.'**
  String get errorNotFound;

  /// No description provided for @errorPrivateLog.
  ///
  /// In en, this message translates to:
  /// **'This clan\'s war log is private.'**
  String get errorPrivateLog;

  /// No description provided for @errorRateLimited.
  ///
  /// In en, this message translates to:
  /// **'Too many requests. Please try again shortly.'**
  String get errorRateLimited;

  /// No description provided for @errorMaintenance.
  ///
  /// In en, this message translates to:
  /// **'The Clash of Clans API is under maintenance.'**
  String get errorMaintenance;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Could not reach the server.'**
  String get errorNetwork;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @clanLevel.
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String clanLevel(int level);

  /// No description provided for @memberCount.
  ///
  /// In en, this message translates to:
  /// **'{count} members'**
  String memberCount(int count);

  /// No description provided for @warWins.
  ///
  /// In en, this message translates to:
  /// **'Wins'**
  String get warWins;

  /// No description provided for @warTies.
  ///
  /// In en, this message translates to:
  /// **'Ties'**
  String get warTies;

  /// No description provided for @warLosses.
  ///
  /// In en, this message translates to:
  /// **'Losses'**
  String get warLosses;

  /// No description provided for @winStreak.
  ///
  /// In en, this message translates to:
  /// **'Win streak'**
  String get winStreak;

  /// No description provided for @warLog.
  ///
  /// In en, this message translates to:
  /// **'War log'**
  String get warLog;

  /// No description provided for @noWarLog.
  ///
  /// In en, this message translates to:
  /// **'No war log entries yet.'**
  String get noWarLog;

  /// No description provided for @resultWin.
  ///
  /// In en, this message translates to:
  /// **'Win'**
  String get resultWin;

  /// No description provided for @resultLose.
  ///
  /// In en, this message translates to:
  /// **'Loss'**
  String get resultLose;

  /// No description provided for @resultTie.
  ///
  /// In en, this message translates to:
  /// **'Draw'**
  String get resultTie;

  /// No description provided for @unknownOpponent.
  ///
  /// In en, this message translates to:
  /// **'Unknown clan'**
  String get unknownOpponent;

  /// No description provided for @teamSizeVs.
  ///
  /// In en, this message translates to:
  /// **'{size} vs {size}'**
  String teamSizeVs(int size);

  /// No description provided for @previousPage.
  ///
  /// In en, this message translates to:
  /// **'Previous page'**
  String get previousPage;

  /// No description provided for @nextPage.
  ///
  /// In en, this message translates to:
  /// **'Next page'**
  String get nextPage;

  /// No description provided for @pageN.
  ///
  /// In en, this message translates to:
  /// **'Page {page}'**
  String pageN(int page);

  /// No description provided for @languageTooltip.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get languageTooltip;

  /// No description provided for @townHallN.
  ///
  /// In en, this message translates to:
  /// **'Town Hall {level}'**
  String townHallN(int level);

  /// No description provided for @expLevelN.
  ///
  /// In en, this message translates to:
  /// **'XP level {level}'**
  String expLevelN(int level);

  /// No description provided for @statTrophies.
  ///
  /// In en, this message translates to:
  /// **'Trophies'**
  String get statTrophies;

  /// No description provided for @statBestTrophies.
  ///
  /// In en, this message translates to:
  /// **'Best'**
  String get statBestTrophies;

  /// No description provided for @statWarStars.
  ///
  /// In en, this message translates to:
  /// **'War stars'**
  String get statWarStars;

  /// No description provided for @statDonations.
  ///
  /// In en, this message translates to:
  /// **'Donated'**
  String get statDonations;

  /// No description provided for @statDonationsReceived.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get statDonationsReceived;

  /// No description provided for @statCapitalContributions.
  ///
  /// In en, this message translates to:
  /// **'Capital contributions'**
  String get statCapitalContributions;

  /// No description provided for @sectionHeroes.
  ///
  /// In en, this message translates to:
  /// **'Heroes'**
  String get sectionHeroes;

  /// No description provided for @sectionTroops.
  ///
  /// In en, this message translates to:
  /// **'Troops'**
  String get sectionTroops;

  /// No description provided for @sectionSpells.
  ///
  /// In en, this message translates to:
  /// **'Spells'**
  String get sectionSpells;

  /// No description provided for @roleMember.
  ///
  /// In en, this message translates to:
  /// **'Member'**
  String get roleMember;

  /// No description provided for @roleElder.
  ///
  /// In en, this message translates to:
  /// **'Elder'**
  String get roleElder;

  /// No description provided for @roleCoLeader.
  ///
  /// In en, this message translates to:
  /// **'Co-leader'**
  String get roleCoLeader;

  /// No description provided for @roleLeader.
  ///
  /// In en, this message translates to:
  /// **'Leader'**
  String get roleLeader;

  /// No description provided for @warPrefIn.
  ///
  /// In en, this message translates to:
  /// **'Open to wars'**
  String get warPrefIn;

  /// No description provided for @warPrefOut.
  ///
  /// In en, this message translates to:
  /// **'Not in wars'**
  String get warPrefOut;

  /// No description provided for @tabMembers.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get tabMembers;

  /// No description provided for @noItems.
  ///
  /// In en, this message translates to:
  /// **'Nothing to show.'**
  String get noItems;

  /// No description provided for @progressPct.
  ///
  /// In en, this message translates to:
  /// **'Progress: {pct}'**
  String progressPct(String pct);

  /// No description provided for @groupElixir.
  ///
  /// In en, this message translates to:
  /// **'Elixir'**
  String get groupElixir;

  /// No description provided for @groupDarkElixir.
  ///
  /// In en, this message translates to:
  /// **'Dark Elixir'**
  String get groupDarkElixir;

  /// No description provided for @groupSiege.
  ///
  /// In en, this message translates to:
  /// **'Siege machines'**
  String get groupSiege;

  /// No description provided for @groupPets.
  ///
  /// In en, this message translates to:
  /// **'Pets'**
  String get groupPets;

  /// No description provided for @groupOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get groupOther;

  /// No description provided for @equipmentProgressPct.
  ///
  /// In en, this message translates to:
  /// **'Equipment progress: {pct}'**
  String equipmentProgressPct(String pct);

  /// No description provided for @copyTag.
  ///
  /// In en, this message translates to:
  /// **'Copy tag'**
  String get copyTag;

  /// No description provided for @tagCopied.
  ///
  /// In en, this message translates to:
  /// **'Copied {tag}'**
  String tagCopied(String tag);

  /// No description provided for @tabHomeVillage.
  ///
  /// In en, this message translates to:
  /// **'Home Village'**
  String get tabHomeVillage;

  /// No description provided for @tabBuilderBase.
  ///
  /// In en, this message translates to:
  /// **'Builder Base'**
  String get tabBuilderBase;

  /// No description provided for @sectionUnits.
  ///
  /// In en, this message translates to:
  /// **'Units'**
  String get sectionUnits;

  /// No description provided for @noBuilderBase.
  ///
  /// In en, this message translates to:
  /// **'No Builder Base information.'**
  String get noBuilderBase;

  /// No description provided for @statLeague.
  ///
  /// In en, this message translates to:
  /// **'League'**
  String get statLeague;

  /// No description provided for @builderHallN.
  ///
  /// In en, this message translates to:
  /// **'Builder Hall {level}'**
  String builderHallN(int level);

  /// No description provided for @splitView.
  ///
  /// In en, this message translates to:
  /// **'Side-by-side view'**
  String get splitView;

  /// No description provided for @selectMemberHint.
  ///
  /// In en, this message translates to:
  /// **'Select a member to see their profile here.'**
  String get selectMemberHint;

  /// No description provided for @warPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Clan war'**
  String get warPageTitle;

  /// No description provided for @warInfoButton.
  ///
  /// In en, this message translates to:
  /// **'View clan war info'**
  String get warInfoButton;

  /// No description provided for @warStatePreparation.
  ///
  /// In en, this message translates to:
  /// **'Preparation day'**
  String get warStatePreparation;

  /// No description provided for @warStateInWar.
  ///
  /// In en, this message translates to:
  /// **'Battle day'**
  String get warStateInWar;

  /// No description provided for @warStateEnded.
  ///
  /// In en, this message translates to:
  /// **'War ended'**
  String get warStateEnded;

  /// No description provided for @warNone.
  ///
  /// In en, this message translates to:
  /// **'There is no ongoing war.'**
  String get warNone;

  /// No description provided for @warStartsIn.
  ///
  /// In en, this message translates to:
  /// **'Starts in {time}'**
  String warStartsIn(String time);

  /// No description provided for @warEndsIn.
  ///
  /// In en, this message translates to:
  /// **'Ends in {time}'**
  String warEndsIn(String time);

  /// No description provided for @durationHM.
  ///
  /// In en, this message translates to:
  /// **'{hours}h {minutes}m'**
  String durationHM(int hours, int minutes);

  /// No description provided for @durationM.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m'**
  String durationM(int minutes);

  /// No description provided for @warAttacksPerMember.
  ///
  /// In en, this message translates to:
  /// **'{count} attacks each'**
  String warAttacksPerMember(int count);

  /// No description provided for @tabOurClan.
  ///
  /// In en, this message translates to:
  /// **'Our clan'**
  String get tabOurClan;

  /// No description provided for @tabOpponentClan.
  ///
  /// In en, this message translates to:
  /// **'Opponent'**
  String get tabOpponentClan;

  /// No description provided for @warAttacksUsed.
  ///
  /// In en, this message translates to:
  /// **'Attacks {used}/{total}'**
  String warAttacksUsed(int used, int total);

  /// No description provided for @warUnused.
  ///
  /// In en, this message translates to:
  /// **'Unused'**
  String get warUnused;

  /// No description provided for @warDefense.
  ///
  /// In en, this message translates to:
  /// **'Defense'**
  String get warDefense;

  /// No description provided for @warNoDefense.
  ///
  /// In en, this message translates to:
  /// **'Not attacked'**
  String get warNoDefense;

  /// No description provided for @outlookTitle.
  ///
  /// In en, this message translates to:
  /// **'Outlook'**
  String get outlookTitle;

  /// No description provided for @outlookLeadingStars.
  ///
  /// In en, this message translates to:
  /// **'Leading by {n} stars'**
  String outlookLeadingStars(int n);

  /// No description provided for @outlookLeadingDestruction.
  ///
  /// In en, this message translates to:
  /// **'Tied on stars, leading on destruction ({us}% vs {them}%)'**
  String outlookLeadingDestruction(String us, String them);

  /// No description provided for @outlookTied.
  ///
  /// In en, this message translates to:
  /// **'Tied on both stars and destruction'**
  String get outlookTied;

  /// No description provided for @outlookTrailingStars.
  ///
  /// In en, this message translates to:
  /// **'{n} more stars needed to take the lead'**
  String outlookTrailingStars(int n);

  /// No description provided for @outlookTrailingDestruction.
  ///
  /// In en, this message translates to:
  /// **'Tied on stars, needs more than {them}% destruction (now {us}%)'**
  String outlookTrailingDestruction(String us, String them);

  /// No description provided for @outlookRemainingAttacks.
  ///
  /// In en, this message translates to:
  /// **'Remaining attacks: {n}'**
  String outlookRemainingAttacks(int n);

  /// No description provided for @outlookAvailableStars.
  ///
  /// In en, this message translates to:
  /// **'Stars still available: {n}'**
  String outlookAvailableStars(int n);

  /// No description provided for @outlookCannotWin.
  ///
  /// In en, this message translates to:
  /// **'The remaining stars are not enough to catch up.'**
  String get outlookCannotWin;

  /// No description provided for @outlookNote.
  ///
  /// In en, this message translates to:
  /// **'An estimate that does not include the opponent remaining attacks.'**
  String get outlookNote;

  /// No description provided for @capitalRaidCaption.
  ///
  /// In en, this message translates to:
  /// **'Capital Raid · {period} · {state}'**
  String capitalRaidCaption(String period, String state);

  /// No description provided for @raidStateOngoing.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get raidStateOngoing;

  /// No description provided for @raidStateEnded.
  ///
  /// In en, this message translates to:
  /// **'Ended'**
  String get raidStateEnded;

  /// No description provided for @capitalAttacksTooltip.
  ///
  /// In en, this message translates to:
  /// **'Capital raid attacks {used}/{total}'**
  String capitalAttacksTooltip(int used, int total);

  /// No description provided for @historyClanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Clan : {name}'**
  String historyClanSubtitle(String name);

  /// No description provided for @historyPlayerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Player : {name}'**
  String historyPlayerSubtitle(String name);

  /// No description provided for @warLeagueTooltip.
  ///
  /// In en, this message translates to:
  /// **'Clan war league: {name}'**
  String warLeagueTooltip(String name);

  /// No description provided for @capitalLeagueTooltip.
  ///
  /// In en, this message translates to:
  /// **'Capital league: {name} · {trophies} capital trophies'**
  String capitalLeagueTooltip(String name, String trophies);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
