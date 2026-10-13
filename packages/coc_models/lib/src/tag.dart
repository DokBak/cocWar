/// 플레이어/클랜 태그를 `#ABC123` 형태로 정규화한다.
///
/// 공백 제거, 대문자화, `#` 보정, 숫자 `0`을 알파벳 `O`로 잘못 입력한 경우
/// (CoC 태그에는 `O`가 없고 `0`만 쓰인다) `O`→`0` 치환을 한다.
String normalizeTag(String input) {
  final body = input
      .trim()
      .replaceAll(RegExp(r'\s'), '')
      .replaceFirst(RegExp(r'^%23'), '')
      .replaceFirst(RegExp(r'^#'), '')
      .toUpperCase()
      .replaceAll('O', '0');
  return '#$body';
}

/// 태그가 CoC 태그 문자 집합(`0289PYLQGRJCUV`)으로만 이루어졌는지 확인한다.
bool isValidTag(String tag) =>
    RegExp(r'^#[0289PYLQGRJCUV]{3,12}$').hasMatch(tag);
