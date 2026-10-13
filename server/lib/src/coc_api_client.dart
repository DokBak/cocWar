import 'dart:convert';

import 'package:http/http.dart' as http;

/// CoC API가 오류를 돌려줬을 때 던지는 예외.
class CocApiException implements Exception {
  CocApiException(this.statusCode, {this.reason, this.message});

  final int statusCode;
  final String? reason;
  final String? message;

  @override
  String toString() => 'CocApiException($statusCode, $reason, $message)';
}

/// CoC API 호출 인터페이스. 테스트에서는 fake로 교체한다.
///
/// 응답은 모델로 다시 만들지 않고 JSON 그대로 전달한다
/// (모델에 없는 필드도 앱에서 쓸 수 있게 하기 위해서).
abstract class CocApiClient {
  Future<Map<String, dynamic>> getClan(String tag);

  Future<Map<String, dynamic>> getWarLog(
    String tag, {
    int? limit,
    String? after,
    String? before,
  });

  Future<Map<String, dynamic>> getCurrentWar(String tag);

  /// 캐피탈 레이드 시즌 목록(최근 시즌부터). 멤버별 공격 수는 최근 시즌에만 들어 있다.
  Future<Map<String, dynamic>> getCapitalRaidSeasons(String tag, {int? limit});

  /// 리그 목록(아이콘 주소 포함). 클랜전 리그는 이름이 같은 이 목록의 아이콘을 쓴다.
  Future<Map<String, dynamic>> getLeagues();

  Future<Map<String, dynamic>> getPlayer(String tag);
}

class HttpCocApiClient implements CocApiClient {
  HttpCocApiClient({
    required this.token,
    http.Client? client,
    this.baseUrl = 'https://api.clashofclans.com/v1',
  }) : _client = client ?? http.Client();

  final String token;
  final String baseUrl;
  final http.Client _client;

  @override
  Future<Map<String, dynamic>> getClan(String tag) =>
      _get('/clans/${_enc(tag)}');

  @override
  Future<Map<String, dynamic>> getWarLog(
    String tag, {
    int? limit,
    String? after,
    String? before,
  }) => _get(
    '/clans/${_enc(tag)}/warlog',
    query: {
      if (limit != null) 'limit': '$limit',
      'after': ?after,
      'before': ?before,
    },
  );

  @override
  Future<Map<String, dynamic>> getCurrentWar(String tag) =>
      _get('/clans/${_enc(tag)}/currentwar');

  @override
  Future<Map<String, dynamic>> getCapitalRaidSeasons(
    String tag, {
    int? limit,
  }) => _get(
    '/clans/${_enc(tag)}/capitalraidseasons',
    query: {if (limit != null) 'limit': '$limit'},
  );

  @override
  Future<Map<String, dynamic>> getLeagues() =>
      _get('/leagues', query: {'limit': '100'});

  @override
  Future<Map<String, dynamic>> getPlayer(String tag) =>
      _get('/players/${_enc(tag)}');

  static String _enc(String tag) => Uri.encodeComponent(tag);

  Future<Map<String, dynamic>> _get(
    String path, {
    Map<String, String> query = const {},
  }) async {
    // path에는 이미 %23 인코딩이 들어 있어 Uri.parse로 이중 인코딩을 피한다.
    final qs = query.isEmpty ? '' : '?${Uri(queryParameters: query).query}';
    final res = await _client.get(
      Uri.parse('$baseUrl$path$qs'),
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );
    Map<String, dynamic>? body;
    try {
      final decoded = jsonDecode(utf8.decode(res.bodyBytes));
      if (decoded is Map<String, dynamic>) body = decoded;
    } on FormatException {
      // 본문이 JSON이 아니면 아래에서 상태 코드만으로 처리한다.
    }
    if (res.statusCode == 200 && body != null) return body;
    throw CocApiException(
      res.statusCode,
      reason: body?['reason'] as String?,
      message: body?['message'] as String?,
    );
  }
}
