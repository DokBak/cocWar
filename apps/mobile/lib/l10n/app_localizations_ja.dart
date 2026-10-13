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
      '本アプリは非公式のファンプロジェクトであり、Supercell とは提携・後援・承認の関係になく、Supercell は本アプリについて責任を負いません。 ファンコンテンツポリシー: https://supercell.com/en/fan-content-policy/';

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

  @override
  String clanLevel(int level) {
    return 'レベル $level';
  }

  @override
  String memberCount(int count) {
    return 'メンバー $count人';
  }

  @override
  String get warWins => '勝';

  @override
  String get warTies => '分';

  @override
  String get warLosses => '敗';

  @override
  String get winStreak => '連勝';

  @override
  String get warLog => '戦争ログ';

  @override
  String get noWarLog => 'まだ戦争の記録がありません。';

  @override
  String get resultWin => '勝利';

  @override
  String get resultLose => '敗北';

  @override
  String get resultTie => '引き分け';

  @override
  String get unknownOpponent => '不明なクラン';

  @override
  String teamSizeVs(int size) {
    return '$size vs $size';
  }

  @override
  String get previousPage => '前のページ';

  @override
  String get nextPage => '次のページ';

  @override
  String pageN(int page) {
    return '$pageページ';
  }

  @override
  String get languageTooltip => '言語を変更';

  @override
  String townHallN(int level) {
    return 'タウンホール $level';
  }

  @override
  String expLevelN(int level) {
    return '経験値レベル $level';
  }

  @override
  String get statTrophies => 'トロフィー';

  @override
  String get statBestTrophies => '最高記録';

  @override
  String get statWarStars => '戦争の星';

  @override
  String get statDonations => '寄付';

  @override
  String get statDonationsReceived => '受け取り';

  @override
  String get statCapitalContributions => '首都への貢献';

  @override
  String get sectionHeroes => 'ヒーロー';

  @override
  String get sectionTroops => '兵';

  @override
  String get sectionSpells => '呪文';

  @override
  String get roleMember => 'メンバー';

  @override
  String get roleElder => '長老';

  @override
  String get roleCoLeader => 'サブリーダー';

  @override
  String get roleLeader => 'リーダー';

  @override
  String get warPrefIn => '戦争に参加';

  @override
  String get warPrefOut => '戦争に不参加';

  @override
  String get tabMembers => 'メンバー';

  @override
  String get noItems => '表示する項目がありません。';

  @override
  String progressPct(String pct) {
    return '進捗率: $pct';
  }

  @override
  String get groupElixir => 'エリクサー';

  @override
  String get groupDarkElixir => 'ダークエリクサー';

  @override
  String get groupSiege => '攻城兵器';

  @override
  String get groupPets => 'ペット';

  @override
  String get groupOther => 'その他';

  @override
  String equipmentProgressPct(String pct) {
    return '装備の進捗率: $pct';
  }

  @override
  String get copyTag => 'タグをコピー';

  @override
  String tagCopied(String tag) {
    return '$tag をコピーしました';
  }

  @override
  String get tabHomeVillage => 'ホームビレッジ';

  @override
  String get tabBuilderBase => 'ビルダーベース';

  @override
  String get sectionUnits => 'ユニット';

  @override
  String get noBuilderBase => 'ビルダーベースの情報がありません。';

  @override
  String get statLeague => 'リーグ';

  @override
  String builderHallN(int level) {
    return 'ビルダーホール $level';
  }

  @override
  String get splitView => '並べて表示';

  @override
  String get selectMemberHint => 'メンバーを選ぶとここにプロフィールが表示されます。';

  @override
  String get warPageTitle => 'クラン戦';

  @override
  String get warInfoButton => 'クラン戦の情報を見る';

  @override
  String get warStatePreparation => '準備日';

  @override
  String get warStateInWar => '戦闘日';

  @override
  String get warStateEnded => '戦争終了';

  @override
  String get warNone => '進行中の戦争はありません。';

  @override
  String warStartsIn(String time) {
    return '開始まで $time';
  }

  @override
  String warEndsIn(String time) {
    return '終了まで $time';
  }

  @override
  String durationHM(int hours, int minutes) {
    return '$hours時間$minutes分';
  }

  @override
  String durationM(int minutes) {
    return '$minutes分';
  }

  @override
  String warAttacksPerMember(int count) {
    return '1人$count回攻撃';
  }

  @override
  String get tabOurClan => '自クラン';

  @override
  String get tabOpponentClan => '相手クラン';

  @override
  String warAttacksUsed(int used, int total) {
    return '攻撃 $used/$total';
  }

  @override
  String get warUnused => '未使用';

  @override
  String get warDefense => '防衛';

  @override
  String get warNoDefense => '攻撃されていません';

  @override
  String get outlookTitle => '勝利への見通し';

  @override
  String outlookLeadingStars(int n) {
    return '$nスターリードしています';
  }

  @override
  String outlookLeadingDestruction(String us, String them) {
    return 'スター同数、破壊率 $us% 対 $them% でリードしています';
  }

  @override
  String get outlookTied => 'スターも破壊率も同じです';

  @override
  String outlookTrailingStars(int n) {
    return 'リードするにはあと$nスター必要です';
  }

  @override
  String outlookTrailingDestruction(String us, String them) {
    return 'スター同数、破壊率 $them% を超える必要があります (現在 $us%)';
  }

  @override
  String outlookRemainingAttacks(int n) {
    return '残り攻撃 $n回';
  }

  @override
  String outlookAvailableStars(int n) {
    return '獲得可能な残りスター $n個';
  }

  @override
  String get outlookCannotWin => '残りのスターでは逆転が難しいです。';

  @override
  String get outlookNote => '相手の残り攻撃は考慮していない目安です。';

  @override
  String capitalRaidCaption(String period, String state) {
    return 'キャピタルレイド · $period · $state';
  }

  @override
  String get raidStateOngoing => '進行中';

  @override
  String get raidStateEnded => '終了';

  @override
  String capitalAttacksTooltip(int used, int total) {
    return 'キャピタル攻撃 $used/$total';
  }

  @override
  String historyClanSubtitle(String name) {
    return 'クラン : $name';
  }

  @override
  String historyPlayerSubtitle(String name) {
    return 'プレイヤー : $name';
  }

  @override
  String warLeagueTooltip(String name) {
    return 'クラン戦リーグ: $name';
  }

  @override
  String capitalLeagueTooltip(String name, String trophies) {
    return 'キャピタルリーグ: $name · キャピタルトロフィー $trophies';
  }
}
