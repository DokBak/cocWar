import 'package:cocwar_mobile/features/pagination_bar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('pageItems (null은 …)', () {
    test('페이지가 적으면 모두 보여준다', () {
      expect(pageItems(1, 1), [1]);
      expect(pageItems(2, 5), [1, 2, 3, 4, 5]);
    });

    test('앞쪽: 1 2 [3] 4 5 … 12', () {
      expect(pageItems(3, 12), [1, 2, 3, 4, 5, null, 12]);
    });

    test('가운데: 1 … 5 6 [7] 8 9 … 12', () {
      expect(pageItems(7, 12), [1, null, 5, 6, 7, 8, 9, null, 12]);
    });

    test('끝쪽: 1 … 8 9 10 11 [12]', () {
      expect(pageItems(12, 12), [1, null, 10, 11, 12]);
    });

    test('사이가 한 페이지뿐이면 …대신 그 페이지를 보여준다', () {
      expect(pageItems(5, 8), [1, 2, 3, 4, 5, 6, 7, 8]);
      expect(pageItems(1, 6), [1, 2, 3, null, 6]);
    });

    test('페이지가 없으면 빈 목록', () {
      expect(pageItems(1, 0), isEmpty);
    });
  });
}
