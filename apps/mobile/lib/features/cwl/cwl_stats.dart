import 'package:coc_models/coc_models.dart';

/// 리그전 한 경기와 그 전쟁 태그. 상세 화면으로 이동할 때 태그가 필요하다.
typedef CwlWarEntry = ({String warTag, CurrentWar war});

/// 리그 그룹과 지금까지 정해진 모든 경기.
class CwlSeason {
  const CwlSeason({required this.group, required this.rounds});

  final ClanWarLeagueGroup group;

  /// 라운드별 경기. 대진이 아직 없는 라운드는 빈 목록이다.
  final List<List<CwlWarEntry>> rounds;

  Iterable<CurrentWar> get wars => rounds.expand((r) => r).map((e) => e.war);

  /// [round]에서 [clanTag]가 치르는 경기. 우리 클랜이 왼쪽(`clan`)에 오도록 맞춘다.
  CwlWarEntry? ourWar(int round, String clanTag) {
    for (final e in rounds[round]) {
      if (e.war.clan?.tag == clanTag || e.war.opponent?.tag == clanTag) {
        return (warTag: e.warTag, war: orientTo(e.war, clanTag));
      }
    }
    return null;
  }
}

/// 리그전 응답은 우리 클랜이 `opponent`에 있을 수 있어 [clanTag]가 `clan`이 되도록 맞바꾼다.
///
/// 리그전 응답에는 `attacksPerMember`가 없다(1인 1회). 일반 전쟁 화면의 남은 공격 계산을
/// 그대로 쓰기 위해 1로 채운다.
CurrentWar orientTo(CurrentWar war, String clanTag) {
  final w = war.opponent?.tag == clanTag
      ? war.copyWith(clan: war.opponent, opponent: war.clan)
      : war;
  return w.attacksPerMember == null ? w.copyWith(attacksPerMember: 1) : w;
}

/// 승부 결과. 별 → 파괴율 순서로 가르고, 둘 다 같으면 무승부(null).
bool? _clanWon(CurrentWarClan us, CurrentWarClan them) {
  final s = (us.stars ?? 0).compareTo(them.stars ?? 0);
  if (s != 0) return s > 0;
  final d = (us.destructionPercentage ?? 0).compareTo(
    them.destructionPercentage ?? 0,
  );
  return d == 0 ? null : d > 0;
}

/// 리그 순위표의 한 줄.
class CwlStanding {
  CwlStanding({required this.clan});

  final LeagueGroupClan clan;
  int stars = 0;
  int wins = 0;

  /// 총 파괴율(경기별 `파괴율 × 팀 크기`의 합).
  double destruction = 0;

  /// 승리 보너스를 더한 점수(승리마다 +10).
  int get points => stars + wins * 10;
}

/// 리그 순위. 점수(별 + 승리 보너스) → 총 파괴율 순서.
List<CwlStanding> cwlStandings(
  ClanWarLeagueGroup group,
  Iterable<CurrentWar> wars,
) {
  final table = {
    for (final c in group.clans)
      if (c.tag != null) c.tag!: CwlStanding(clan: c),
  };
  for (final war in wars) {
    if (war.state != WarState.inWar && war.state != WarState.warEnded) {
      continue;
    }
    final sides = [war.clan, war.opponent];
    for (var i = 0; i < 2; i++) {
      final us = sides[i];
      final them = sides[1 - i];
      final row = table[us?.tag];
      if (us == null || them == null || row == null) continue;
      row.stars += us.stars ?? 0;
      row.destruction += (us.destructionPercentage ?? 0) * (war.teamSize ?? 0);
      if (war.state == WarState.warEnded && _clanWon(us, them) == true) {
        row.wins++;
      }
    }
  }
  return table.values.toList()..sort((a, b) {
    final p = b.points.compareTo(a.points);
    return p != 0 ? p : b.destruction.compareTo(a.destruction);
  });
}

/// 리그전 멤버 한 명의 시즌 성적.
class CwlMemberStats {
  CwlMemberStats({required this.tag, this.name, this.townHallLevel});

  final String tag;
  final String? name;
  final int? townHallLevel;

  /// 출전한 라운드 수(전투일·종료 경기만).
  int rounds = 0;
  int attacks = 0;
  int stars = 0;
  int threeStars = 0;
  double _destruction = 0;

  double get averageDestruction => attacks == 0 ? 0 : _destruction / attacks;
}

/// [clanTag] 멤버들의 시즌 성적. 별 → 평균 파괴율 순서로 정렬한다.
List<CwlMemberStats> cwlMemberStats(String clanTag, Iterable<CurrentWar> wars) {
  final stats = <String, CwlMemberStats>{};
  for (final raw in wars) {
    if (raw.state != WarState.inWar && raw.state != WarState.warEnded) {
      continue;
    }
    if (raw.clan?.tag != clanTag && raw.opponent?.tag != clanTag) continue;
    final war = orientTo(raw, clanTag);
    for (final m in war.clan?.members ?? const <WarMember>[]) {
      if (m.tag == null) continue;
      final s = stats.putIfAbsent(
        m.tag!,
        () => CwlMemberStats(
          tag: m.tag!,
          name: m.name,
          townHallLevel: m.townHallLevel,
        ),
      );
      s.rounds++;
      for (final a in m.attacks) {
        s.attacks++;
        s.stars += a.stars ?? 0;
        if (a.stars == 3) s.threeStars++;
        s._destruction += a.destructionPercentage ?? 0;
      }
    }
  }
  return stats.values.toList()..sort((a, b) {
    final s = b.stars.compareTo(a.stars);
    return s != 0 ? s : b.averageDestruction.compareTo(a.averageDestruction);
  });
}
