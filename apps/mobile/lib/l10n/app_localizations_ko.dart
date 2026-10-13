// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'War Report';

  @override
  String get kindClan => '클랜';

  @override
  String get kindPlayer => '플레이어';

  @override
  String get tagLabel => '태그';

  @override
  String get tagHint => '#2PP';

  @override
  String get search => '검색';

  @override
  String get invalidTag => '올바른 태그가 아닙니다.';

  @override
  String get recentSearches => '최근 검색';

  @override
  String get favorites => '즐겨찾기';

  @override
  String get clearAll => '모두 지우기';

  @override
  String get emptyHint => '클랜 또는 플레이어 태그를 입력해 시작하세요.';

  @override
  String get addFavorite => '즐겨찾기에 추가';

  @override
  String get removeFavorite => '즐겨찾기에서 제거';

  @override
  String get settings => '설정';

  @override
  String get language => '언어';

  @override
  String get languageSystem => '시스템 설정';

  @override
  String get theme => '테마';

  @override
  String get themeSystem => '시스템 설정';

  @override
  String get themeLight => '라이트';

  @override
  String get themeDark => '다크';

  @override
  String get comingSoon => '이 화면은 준비 중입니다.';

  @override
  String get disclaimer =>
      '이 앱은 비공식 팬 프로젝트이며 Supercell과 제휴, 후원, 승인 관계가 없고 Supercell은 이 앱에 책임을 지지 않습니다. 팬 콘텐츠 정책: https://supercell.com/en/fan-content-policy/';

  @override
  String get errorGeneric => '문제가 발생했습니다. 다시 시도해 주세요.';

  @override
  String get errorNotFound => '찾을 수 없습니다.';

  @override
  String get errorPrivateLog => '이 클랜의 전쟁 로그는 비공개입니다.';

  @override
  String get errorRateLimited => '요청이 너무 많습니다. 잠시 후 다시 시도해 주세요.';

  @override
  String get errorMaintenance => 'Clash of Clans API가 점검 중입니다.';

  @override
  String get errorNetwork => '서버에 연결할 수 없습니다.';

  @override
  String get retry => '다시 시도';

  @override
  String clanLevel(int level) {
    return '레벨 $level';
  }

  @override
  String memberCount(int count) {
    return '멤버 $count명';
  }

  @override
  String get warWins => '승';

  @override
  String get warTies => '무';

  @override
  String get warLosses => '패';

  @override
  String get winStreak => '연승';

  @override
  String get warLog => '전쟁 로그';

  @override
  String get noWarLog => '아직 전쟁 기록이 없습니다.';

  @override
  String get resultWin => '승리';

  @override
  String get resultLose => '패배';

  @override
  String get resultTie => '무승부';

  @override
  String get unknownOpponent => '알 수 없는 클랜';

  @override
  String teamSizeVs(int size) {
    return '$size vs $size';
  }

  @override
  String get previousPage => '이전 페이지';

  @override
  String get nextPage => '다음 페이지';

  @override
  String pageN(int page) {
    return '$page페이지';
  }

  @override
  String get languageTooltip => '언어 변경';

  @override
  String townHallN(int level) {
    return '타운홀 $level';
  }

  @override
  String expLevelN(int level) {
    return '경험치 레벨 $level';
  }

  @override
  String get statTrophies => '트로피';

  @override
  String get statBestTrophies => '최고 기록';

  @override
  String get statWarStars => '전쟁 별';

  @override
  String get statAttackWins => '공격 승리';

  @override
  String get statDefenseWins => '방어 승리';

  @override
  String get statDonations => '기부';

  @override
  String get statDonationsReceived => '받은 기부';

  @override
  String get statCapitalContributions => '캐피탈 기여';

  @override
  String get sectionHeroes => '영웅';

  @override
  String get sectionTroops => '부대';

  @override
  String get sectionSpells => '주문';

  @override
  String get roleMember => '멤버';

  @override
  String get roleElder => '장로';

  @override
  String get roleCoLeader => '공동 리더';

  @override
  String get roleLeader => '리더';

  @override
  String get warPrefIn => '전쟁 참여';

  @override
  String get warPrefOut => '전쟁 불참';

  @override
  String get tabMembers => '멤버';

  @override
  String get noItems => '표시할 항목이 없습니다.';

  @override
  String progressPct(String pct) {
    return '진행률: $pct';
  }

  @override
  String get groupElixir => '엘릭서';

  @override
  String get groupDarkElixir => '다크엘릭서';

  @override
  String get groupSiege => '시즈머신';

  @override
  String get groupPets => '펫';

  @override
  String get groupOther => '기타';

  @override
  String equipmentProgressPct(String pct) {
    return '장비 진행률: $pct';
  }

  @override
  String get copyTag => '태그 복사';

  @override
  String tagCopied(String tag) {
    return '$tag 복사했습니다';
  }

  @override
  String get tabHomeVillage => '본마을';

  @override
  String get tabBuilderBase => '장인기지';

  @override
  String get sectionUnits => '유닛';

  @override
  String get noBuilderBase => '장인기지 정보가 없습니다.';

  @override
  String get statLeague => '리그';

  @override
  String builderHallN(int level) {
    return '장인 회관 $level';
  }

  @override
  String get splitView => '나란히 보기';

  @override
  String get selectMemberHint => '멤버를 선택하면 여기에 프로필이 표시됩니다.';
}
