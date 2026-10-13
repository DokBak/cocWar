import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

/// 전쟁 종료일을 두 자리 연도까지 포함해서 표시한다.
///
/// ko `26년 10월 13일`, ja `26年10月13日`, en `Oct 13, '26`.
/// ARB가 아닌 코드에 두는 이유: ARB(ICU)에서는 작은따옴표가 이스케이프 문자라 `'26`을 쓸 수 없다.
String formatWarDate(BuildContext context, DateTime date) {
  final locale = Localizations.localeOf(context).languageCode;
  final pattern = switch (locale) {
    'ko' => "yy'년' M'월' d'일'",
    'ja' => "yy'年'M'月'd'日'",
    _ => "MMM d, ''yy",
  };
  final lang = const {'ko', 'ja'}.contains(locale) ? locale : 'en';
  return DateFormat(pattern, lang).format(date.toLocal());
}
