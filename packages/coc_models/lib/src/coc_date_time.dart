import 'package:json_annotation/json_annotation.dart';

/// CoC API 날짜 형식(`20241013T120000.000Z`)과 [DateTime] 사이를 변환한다.
class CocDateTimeConverter implements JsonConverter<DateTime?, String?> {
  const CocDateTimeConverter();

  static final _pattern = RegExp(
    r'^(\d{4})(\d{2})(\d{2})T(\d{2})(\d{2})(\d{2})(?:\.(\d{1,3}))?Z$',
  );

  @override
  DateTime? fromJson(String? json) {
    if (json == null) return null;
    final m = _pattern.firstMatch(json);
    if (m == null) return DateTime.tryParse(json)?.toUtc();
    return DateTime.utc(
      int.parse(m[1]!),
      int.parse(m[2]!),
      int.parse(m[3]!),
      int.parse(m[4]!),
      int.parse(m[5]!),
      int.parse(m[6]!),
      m[7] == null ? 0 : int.parse(m[7]!.padRight(3, '0')),
    );
  }

  @override
  String? toJson(DateTime? object) {
    if (object == null) return null;
    final u = object.toUtc();
    String p(int v, [int w = 2]) => v.toString().padLeft(w, '0');
    return '${p(u.year, 4)}${p(u.month)}${p(u.day)}T'
        '${p(u.hour)}${p(u.minute)}${p(u.second)}.${p(u.millisecond, 3)}Z';
  }
}
