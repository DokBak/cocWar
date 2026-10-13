import 'package:coc_models/coc_models.dart';

/// 승리 전망. 승부는 별 → 파괴율 순서로 가른다.
///
/// 상대에게 남은 공격은 반영하지 않는 **추정**이다.
class WarOutlook {
  const WarOutlook({
    required this.ourStars,
    required this.opponentStars,
    required this.ourDestruction,
    required this.opponentDestruction,
    required this.ourAttacksLeft,
    required this.starsAvailable,
  });

  final int ourStars;
  final int opponentStars;
  final double ourDestruction;
  final double opponentDestruction;

  /// 우리에게 남은 공격 횟수.
  final int ourAttacksLeft;

  /// 상대 기지에서 아직 얻을 수 있는 별(기지마다 `3 − 지금까지 얻은 최고 별`의 합).
  final int starsAvailable;

  int get starLead => ourStars - opponentStars;

  /// 별이 같아서 파괴율로 승부가 갈리는 상태.
  bool get tiedOnStars => starLead == 0;

  /// 지금 끝나면 이기는 상태. 별이 같으면 파괴율이 높아야 하고, 둘 다 같으면 이기는 쪽이 없다.
  bool get winning =>
      starLead > 0 || (tiedOnStars && ourDestruction > opponentDestruction);

  /// 별까지 완전히 같은 상태(파괴율도 같음).
  bool get dead => tiedOnStars && ourDestruction == opponentDestruction;

  /// 앞서기 위해 확실하게 필요한 추가 별. 이미 이기고 있으면 0.
  /// (같아지기만 하면 파괴율로 갈릴 수 있어 `차이 + 1`개가 확실한 기준이다.)
  int get starsNeeded {
    if (winning) return 0;
    return opponentStars - ourStars + 1;
  }

  /// 남은 공격과 남은 별로 앞설 가능성이 남아 있는지.
  bool get canStillWin =>
      winning ||
      (ourAttacksLeft > 0 && ourStars + starsAvailable >= opponentStars);
}

/// 진행 중인 전쟁의 승리 전망을 계산한다. 양 클랜 정보가 없으면 null.
WarOutlook? warOutlook(CurrentWar war) {
  final us = war.clan;
  final them = war.opponent;
  if (us == null || them == null) return null;

  final total = (war.teamSize ?? 0) * (war.attacksPerMember ?? 0);
  final used = us.attacks ?? 0;

  // 상대 기지마다 우리가 얻은 최고 별은 상대 멤버의 bestOpponentAttack에 들어 있다.
  var available = 0;
  for (final m in them.members) {
    available += 3 - (m.bestOpponentAttack?.stars ?? 0).clamp(0, 3);
  }

  return WarOutlook(
    ourStars: us.stars ?? 0,
    opponentStars: them.stars ?? 0,
    ourDestruction: us.destructionPercentage ?? 0,
    opponentDestruction: them.destructionPercentage ?? 0,
    ourAttacksLeft: (total - used).clamp(0, total),
    starsAvailable: available,
  );
}
