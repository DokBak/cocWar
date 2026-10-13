import 'package:coc_models/coc_models.dart';
import 'package:cocwar_mobile/features/clan/clan_members.dart';
import 'package:flutter_test/flutter_test.dart';

ClanMember m(String name, String? role, int? th, {String? tag}) =>
    ClanMember(tag: tag ?? '#$name', name: name, role: role, townHallLevel: th);

List<String?> names(List<ClanMember> list) => [for (final e in list) e.name];

void main() {
  group('sortMembers', () {
    test('직책 순서: 리더 → 공동 리더 → 장로 → 멤버', () {
      final sorted = sortMembers([
        m('member', 'member', 18),
        m('elder', 'admin', 10),
        m('co', 'coLeader', 5),
        m('leader', 'leader', 1),
      ]);
      expect(names(sorted), ['leader', 'co', 'elder', 'member']);
    });

    test('직책이 같으면 타운홀이 높은 순', () {
      final sorted = sortMembers([
        m('a', 'member', 15),
        m('b', 'member', 18),
        m('c', 'member', 16),
      ]);
      expect(names(sorted), ['b', 'c', 'a']);
    });

    test('직책과 타운홀이 같으면 이름 순(대소문자 무시, 영문·숫자 다음 한글)', () {
      final sorted = sortMembers([
        m('쓰리고후독박', 'member', 18),
        m('가나다', 'member', 18),
        m('bob', 'member', 18),
        m('Amy', 'member', 18),
        m('1등', 'member', 18),
      ]);
      expect(names(sorted), ['1등', 'Amy', 'bob', '가나다', '쓰리고후독박']);
    });

    test('한글끼리는 가나다 순', () {
      final sorted = sortMembers([
        m('다람쥐', 'member', 18),
        m('가방', 'member', 18),
        m('나비', 'member', 18),
      ]);
      expect(names(sorted), ['가방', '나비', '다람쥐']);
    });

    test('이름까지 같으면 태그 순이라 항상 같은 결과', () {
      final a = sortMembers([
        m('same', 'member', 18, tag: '#BBB'),
        m('same', 'member', 18, tag: '#AAA'),
      ]);
      expect(a.map((e) => e.tag), ['#AAA', '#BBB']);
    });

    test('직책을 모르면 맨 뒤, 타운홀을 모르면 같은 직책 안에서 맨 뒤', () {
      final sorted = sortMembers([
        m('unknownRole', null, 18),
        m('noTh', 'member', null),
        m('th', 'member', 3),
        m('leader', 'leader', null),
      ]);
      expect(names(sorted), ['leader', 'th', 'noTh', 'unknownRole']);
    });

    test('원본 목록은 바꾸지 않는다', () {
      final original = [m('b', 'member', 1), m('a', 'leader', 1)];
      sortMembers(original);
      expect(names(original), ['b', 'a']);
    });

    test('빈 목록', () {
      expect(sortMembers(const []), isEmpty);
    });
  });
}
