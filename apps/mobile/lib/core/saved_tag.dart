enum TagKind { clan, player }

/// 최근 검색/즐겨찾기에 저장하는 태그 한 건.
class SavedTag {
  const SavedTag(this.kind, this.tag);

  final TagKind kind;

  /// `#2PP` 형태로 정규화된 태그.
  final String tag;

  String get encoded => '${kind.name}:$tag';

  static SavedTag? decode(String s) {
    final i = s.indexOf(':');
    if (i < 0) return null;
    final kind = TagKind.values.where((k) => k.name == s.substring(0, i));
    if (kind.isEmpty) return null;
    return SavedTag(kind.first, s.substring(i + 1));
  }

  /// URL 경로용 (`#` 없는 태그).
  String get location =>
      '/${kind.name}/${tag.startsWith('#') ? tag.substring(1) : tag}';

  @override
  bool operator ==(Object other) =>
      other is SavedTag && other.kind == kind && other.tag == tag;

  @override
  int get hashCode => Object.hash(kind, tag);
}
