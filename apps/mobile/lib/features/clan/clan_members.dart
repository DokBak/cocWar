import 'package:coc_models/coc_models.dart';

/// 직책 순서: 리더 → 공동 리더 → 장로(API 값은 `admin`) → 멤버 → 알 수 없음.
int _roleRank(String? role) => switch (role) {
  'leader' => 0,
  'coLeader' => 1,
  'admin' => 2,
  'member' => 3,
  _ => 4,
};

/// 클랜 멤버 기본 정렬: 직책 → 타운홀(높은 순) → 이름 가나다순.
///
/// API가 주는 순서는 클랜 순위(리그 등급 → 트로피)순이라 직책을 한눈에 보기 어렵다.
/// 이름 순서는 대소문자를 구분하지 않는 문자 코드 순서라 숫자·영문 다음에 한글이 온다.
/// 이름까지 같으면 태그 순서로 정해서 항상 같은 결과가 나온다. 원본 목록은 바꾸지 않는다.
List<ClanMember> sortMembers(List<ClanMember> members) {
  final sorted = [...members];
  sorted.sort((a, b) {
    final byRole = _roleRank(a.role).compareTo(_roleRank(b.role));
    if (byRole != 0) return byRole;

    // 타운홀 높은 순. 타운홀을 모르면 맨 뒤.
    final byTownHall = (b.townHallLevel ?? -1).compareTo(a.townHallLevel ?? -1);
    if (byTownHall != 0) return byTownHall;

    final byName = (a.name ?? '').toLowerCase().compareTo(
      (b.name ?? '').toLowerCase(),
    );
    if (byName != 0) return byName;
    return (a.tag ?? '').compareTo(b.tag ?? '');
  });
  return sorted;
}
