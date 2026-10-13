import 'package:coc_models/coc_models.dart';
import 'package:cocwar_mobile/features/war/war_outlook.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/war_fixture.dart';

void main() {
  group('warOutlook', () {
    test('별이 앞서면 이기고 있고, 필요한 별은 0', () {
      final o = warOutlook(makeWar())!; // 5 대 2
      expect(o.starLead, 3);
      expect(o.winning, isTrue);
      expect(o.tiedOnStars, isFalse);
      expect(o.starsNeeded, 0);
      expect(o.canStillWin, isTrue);
    });

    test('남은 공격 수: 전체(팀 × 1인당) − 사용', () {
      final o = warOutlook(makeWar())!; // 2 × 2 − 3
      expect(o.ourAttacksLeft, 1);
    });

    test('남은 획득 가능 별: 상대 기지마다 3 − 지금까지의 최고 별', () {
      // Cy 1별 → 2, Di 3별 → 0
      expect(warOutlook(makeWar())!.starsAvailable, 2);
    });

    test('아직 공격받지 않은 기지는 3별이 남아 있다', () {
      final war = makeWar().copyWith(
        opponent: makeWar().opponent!.copyWith(
          members: [
            const WarMember(tag: '#B1', mapPosition: 1),
            const WarMember(tag: '#B2', mapPosition: 2),
          ],
        ),
      );
      expect(warOutlook(war)!.starsAvailable, 6);
    });

    test('별이 뒤처지면 앞서기 위해 차이 + 1별이 필요하다', () {
      final o = warOutlook(makeWar(ourStars: 2, theirStars: 5))!;
      expect(o.winning, isFalse);
      expect(o.starLead, -3);
      expect(o.starsNeeded, 4);
    });

    test('별이 같으면 파괴율로 승부: 파괴율이 높으면 이기고 있다', () {
      final o = warOutlook(
        makeWar(
          ourStars: 4,
          theirStars: 4,
          ourDestruction: 90,
          theirDestruction: 80,
        ),
      )!;
      expect(o.tiedOnStars, isTrue);
      expect(o.winning, isTrue);
      expect(o.dead, isFalse);
      expect(o.starsNeeded, 0);
    });

    test('별이 같고 파괴율이 낮으면 지고 있고, 확실하게 필요한 별은 1', () {
      final o = warOutlook(
        makeWar(
          ourStars: 4,
          theirStars: 4,
          ourDestruction: 70,
          theirDestruction: 80,
        ),
      )!;
      expect(o.tiedOnStars, isTrue);
      expect(o.winning, isFalse);
      expect(o.starsNeeded, 1);
    });

    test('별도 파괴율도 같으면 이기는 쪽이 없다', () {
      final o = warOutlook(
        makeWar(
          ourStars: 4,
          theirStars: 4,
          ourDestruction: 80,
          theirDestruction: 80,
        ),
      )!;
      expect(o.dead, isTrue);
      expect(o.winning, isFalse);
    });

    test('남은 공격이 없고 뒤처지면 역전할 수 없다', () {
      // 공격을 모두 썼고(4/4) 3별 차이로 뒤처짐
      final base = makeWar(ourStars: 2, theirStars: 5);
      final war = base.copyWith(clan: base.clan!.copyWith(attacks: 4));
      final o = warOutlook(war)!;
      expect(o.ourAttacksLeft, 0);
      expect(o.canStillWin, isFalse);
    });

    test('남은 별로도 따라잡을 수 없으면 역전할 수 없다', () {
      // 우리 0별, 상대 7별인데 얻을 수 있는 별은 2 → 불가
      final o = warOutlook(makeWar(ourStars: 0, theirStars: 7))!;
      expect(o.ourAttacksLeft, 1);
      expect(o.canStillWin, isFalse);
    });

    test('남은 별로 따라잡을 수 있으면 아직 가능하다', () {
      final o = warOutlook(makeWar(ourStars: 3, theirStars: 5))!; // 얻을 별 2 → 5
      expect(o.canStillWin, isTrue);
    });

    test('양 클랜 정보가 없으면 null', () {
      expect(warOutlook(const CurrentWar(state: WarState.inWar)), isNull);
    });
  });
}
