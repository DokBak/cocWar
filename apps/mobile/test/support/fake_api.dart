import 'package:coc_models/coc_models.dart';
import 'package:cocwar_mobile/core/api_client.dart';

/// 네트워크 없이 미리 정한 응답을 돌려주는 가짜 API.
class FakeApi extends ApiClient {
  FakeApi() : super(baseUrl: 'http://fake');

  Clan? clan;
  Object? clanError;
  Player? player;
  Object? playerError;
  Object? logError;
  List<ClanWarLogEntry> log = [];
  int warLogCalls = 0;
  final playerCalls = <String>[];

  @override
  Future<Clan> getClan(String tag) async {
    if (clanError != null) throw clanError!;
    return clan!;
  }

  @override
  Future<ClanWarLog> getWarLog(String tag, {int? limit, String? after}) async {
    warLogCalls++;
    if (logError != null) throw logError!;
    return ClanWarLog(items: log);
  }

  @override
  Future<Player> getPlayer(String tag) async {
    playerCalls.add(tag);
    if (playerError != null) throw playerError!;
    return player!;
  }
}
