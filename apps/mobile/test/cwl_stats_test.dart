import 'package:coc_models/coc_models.dart';
import 'package:cocwar_mobile/features/cwl/cwl_stats.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/cwl_fixture.dart';
import 'support/war_fixture.dart';

void main() {
  group('orientTo', () {
    test('우리 클랜이 opponent에 있으면 맞바꾼다', () {
      final war = orientTo(round2War, ourTag);
      expect(war.clan?.tag, ourTag);
      expect(war.opponent?.name, 'Gamma Clan');
    });

    test('이미 왼쪽이면 그대로 둔다', () {
      expect(orientTo(round1War, ourTag).clan?.tag, ourTag);
    });

    test('리그전은 1인 1회 공격으로 채운다', () {
      expect(round1War.attacksPerMember, isNull);
      expect(orientTo(round1War, ourTag).attacksPerMember, 1);
      // 값이 있으면 덮어쓰지 않는다.
      expect(orientTo(makeWar(), ourTag).attacksPerMember, 2);
    });
  });

  group('cwlStandings', () {
    final rows = cwlStandings(leagueGroup, [round1War, round2War]);

    test('끝난 경기의 승리에 +10, 진행 중 경기는 별만 더한다', () {
      final alpha = rows.first;
      expect(alpha.clan.tag, ourTag);
      expect(alpha.stars, 10);
      expect(alpha.wins, 1);
      expect(alpha.points, 20);
    });

    test('점수가 같으면 총 파괴율(파괴율 × 팀 크기)로 가른다', () {
      // Beta 2점·160, Gamma 2점·180
      expect(rows.map((r) => r.clan.name), [
        'Alpha Clan',
        'Gamma Clan',
        'Beta Clan',
      ]);
      expect(rows[1].destruction, 180);
      expect(rows[2].destruction, 160);
    });

    test('준비일 경기와 경기가 없는 클랜도 순위표에 나온다', () {
      final rows = cwlStandings(leagueGroup, [
        round1War.copyWith(state: WarState.preparation),
      ]);
      expect(rows, hasLength(3));
      expect(rows.every((r) => r.points == 0), isTrue);
    });

    test('별과 파괴율이 모두 같으면 무승부로 보너스가 없다', () {
      final tie = makeWar(
        state: WarState.warEnded,
        ourStars: 3,
        theirStars: 3,
        ourDestruction: 50,
        theirDestruction: 50,
      );
      final rows = cwlStandings(leagueGroup, [tie]);
      expect(rows.every((r) => r.wins == 0), isTrue);
    });
  });

  group('cwlMemberStats', () {
    final stats = cwlMemberStats(ourTag, [round1War, round2War]);

    test('출전 라운드·공격·별·3성·평균 파괴율', () {
      final ann = stats.first;
      expect(ann.name, 'Ann');
      expect(ann.rounds, 2);
      expect(ann.attacks, 4);
      expect(ann.stars, 8);
      expect(ann.threeStars, 2);
      expect(ann.averageDestruction, 75);
    });

    test('공격하지 않은 멤버도 출전 라운드가 남는다', () {
      final bo = stats.last;
      expect(bo.name, 'Bo');
      expect(bo.rounds, 2);
      expect(bo.attacks, 0);
      expect(bo.averageDestruction, 0);
    });

    test('준비일 경기와 우리 클랜이 없는 경기는 세지 않는다', () {
      final other = round1War.copyWith(
        clan: round1War.clan!.copyWith(tag: '#CCC2'),
      );
      final s = cwlMemberStats(ourTag, [
        round2War.copyWith(state: WarState.preparation),
        other,
      ]);
      expect(s, isEmpty);
    });
  });
}
