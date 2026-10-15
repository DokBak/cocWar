import 'package:coc_models/coc_models.dart';

import 'war_fixture.dart';

/// 테스트용 리그전. 클랜 3개(Alpha가 우리), 라운드 3개.
///
/// - 1라운드 `#8LUC2`: Alpha(5별) vs Beta(2별 80%), **종료**(Alpha 승리)
/// - 2라운드 `#8LUC3`: Gamma(2별 90%) vs Alpha(5별), **전투일**. 우리 클랜이 `opponent` 쪽이다
/// - 3라운드: 대진 미정(`#0`)
///
/// 경기 데이터는 [makeWar]를 쓴다(멤버 Ann·Bo, 2 vs 2). 리그전 응답처럼 `attacksPerMember`는 없다.
const ourTag = '#AAA2';

const leagueGroup = ClanWarLeagueGroup(
  state: LeagueGroupState.inWar,
  season: '2026-11',
  clans: [
    LeagueGroupClan(tag: '#AAA2', name: 'Alpha Clan'),
    LeagueGroupClan(tag: '#BBB2', name: 'Beta Clan'),
    LeagueGroupClan(tag: '#CCC2', name: 'Gamma Clan'),
  ],
  rounds: [
    LeagueRound(warTags: ['#8LUC2']),
    LeagueRound(warTags: ['#8LUC3']),
    LeagueRound(warTags: [unscheduledWarTag]),
  ],
);

CurrentWar get round1War =>
    makeWar(state: WarState.warEnded).copyWith(attacksPerMember: null);

/// Gamma가 `clan`, 우리(Alpha)가 `opponent`.
CurrentWar get round2War {
  final base = makeWar(theirDestruction: 90);
  return base.copyWith(
    attacksPerMember: null,
    clan: base.opponent!.copyWith(tag: '#CCC2', name: 'Gamma Clan'),
    opponent: base.clan,
  );
}

Map<String, CurrentWar> get cwlWars => {
  '#8LUC2': round1War,
  '#8LUC3': round2War,
};
