import 'package:coc_models/coc_models.dart';

/// 테스트용 클랜전 데이터. 2 vs 2, 1인당 공격 2회.
///
/// 우리(Alpha Clan, 5별 83.5%, 공격 3회): Ann(1번)은 상대 2번에게 3별, 상대 1번에게 1별,
/// Bo(2번)는 공격하지 않았다. 상대(Beta Clan, 2별 80%, 공격 1회): Cy(1번)가 우리 1번 Ann을 2별로 공격.
CurrentWar makeWar({
  WarState state = WarState.inWar,
  DateTime? startTime,
  DateTime? endTime,
  int ourStars = 5,
  int theirStars = 2,
  double ourDestruction = 83.5,
  double theirDestruction = 80,
}) {
  const annAttack1 = WarAttack(
    attackerTag: '#A1',
    defenderTag: '#B2',
    stars: 3,
    destructionPercentage: 100,
    order: 1,
    duration: 95,
  );
  const annAttack2 = WarAttack(
    attackerTag: '#A1',
    defenderTag: '#B1',
    stars: 1,
    destructionPercentage: 50,
    order: 3,
    duration: 180,
  );
  const cyAttack = WarAttack(
    attackerTag: '#B1',
    defenderTag: '#A1',
    stars: 2,
    destructionPercentage: 80,
    order: 2,
    duration: 120,
  );

  return CurrentWar(
    state: state,
    teamSize: 2,
    attacksPerMember: 2,
    battleModifier: 'none',
    preparationStartTime: DateTime.utc(2026, 10, 12, 10),
    startTime: startTime ?? DateTime.utc(2026, 10, 13, 10),
    endTime: endTime ?? DateTime.utc(2026, 10, 14, 10),
    clan: CurrentWarClan(
      tag: '#AAA2',
      name: 'Alpha Clan',
      clanLevel: 20,
      attacks: 3,
      stars: ourStars,
      destructionPercentage: ourDestruction,
      members: const [
        WarMember(
          tag: '#A1',
          name: 'Ann',
          townHallLevel: 16,
          mapPosition: 1,
          opponentAttacks: 1,
          bestOpponentAttack: cyAttack,
          attacks: [annAttack1, annAttack2],
        ),
        WarMember(
          tag: '#A2',
          name: 'Bo',
          townHallLevel: 15,
          mapPosition: 2,
          opponentAttacks: 0,
        ),
      ],
    ),
    opponent: CurrentWarClan(
      tag: '#BBB2',
      name: 'Beta Clan',
      clanLevel: 18,
      attacks: 1,
      stars: theirStars,
      destructionPercentage: theirDestruction,
      members: const [
        WarMember(
          tag: '#B1',
          name: 'Cy',
          townHallLevel: 16,
          mapPosition: 1,
          opponentAttacks: 1,
          bestOpponentAttack: annAttack2, // 우리가 이 기지에 얻은 최고 기록 (1별)
          attacks: [cyAttack],
        ),
        WarMember(
          tag: '#B2',
          name: 'Di',
          townHallLevel: 14,
          mapPosition: 2,
          opponentAttacks: 1,
          bestOpponentAttack: annAttack1, // 3별 (더 얻을 별 없음)
        ),
      ],
    ),
  );
}
