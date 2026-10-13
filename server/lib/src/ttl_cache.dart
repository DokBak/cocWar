/// 메모리 TTL 캐시. 성공 응답만 저장하는 용도로 쓴다.
class TtlCache<T> {
  TtlCache({this.maxEntries = 1000, DateTime Function()? now})
    : _now = now ?? DateTime.now;

  final int maxEntries;
  final DateTime Function() _now;
  final _entries = <String, ({T value, DateTime expires})>{};

  T? get(String key) {
    final e = _entries[key];
    if (e == null) return null;
    if (!e.expires.isAfter(_now())) {
      _entries.remove(key);
      return null;
    }
    return e.value;
  }

  void set(String key, T value, Duration ttl) {
    if (_entries.length >= maxEntries) _evict();
    _entries[key] = (value: value, expires: _now().add(ttl));
  }

  void _evict() {
    final now = _now();
    _entries.removeWhere((_, e) => !e.expires.isAfter(now));
    // 만료된 항목이 없는데도 가득 찼으면 가장 오래 전에 넣은 항목부터 지운다.
    while (_entries.length >= maxEntries) {
      _entries.remove(_entries.keys.first);
    }
  }
}
