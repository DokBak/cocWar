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
  CurrentWar? war;
  Object? warError;
  int warCalls = 0;
  CapitalRaidSeasons? raid;
  Object? raidError;
  int raidCalls = 0;
  int? raidLimit;
  List<League>? leagues;
  Object? leaguesError;
  int leagueCalls = 0;
  List<ClanWarLogEntry> log = [];
  int warLogCalls = 0;
  final playerCalls = <String>[];
  final clanCalls = <String>[];

  @override
  Future<Clan> getClan(String tag) async {
    clanCalls.add(tag);
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
  Future<CurrentWar> getCurrentWar(String tag) async {
    warCalls++;
    if (warError != null) throw warError!;
    return war ?? const CurrentWar(state: WarState.notInWar);
  }

  @override
  Future<CapitalRaidSeasons> getCapitalRaidSeasons(
    String tag, {
    int? limit,
  }) async {
    raidCalls++;
    raidLimit = limit;
    if (raidError != null) throw raidError!;
    return raid ?? const CapitalRaidSeasons();
  }

  @override
  Future<List<League>> getLeagues() async {
    leagueCalls++;
    if (leaguesError != null) throw leaguesError!;
    return leagues ?? const [];
  }

  @override
  Future<Player> getPlayer(String tag) async {
    playerCalls.add(tag);
    if (playerError != null) throw playerError!;
    return player!;
  }
}
