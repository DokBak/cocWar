import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import '../../core/saved_tag.dart';
import '../clan/clan_providers.dart';
import '../player/player_providers.dart';

/// 검색 이력·즐겨찾기 타일에 보여 줄 정보: 이름과 리그 아이콘.
class HistoryInfo {
  const HistoryInfo({this.name, this.iconUrl});

  final String? name;
  final String? iconUrl;
}

/// 리그 이름 → 작은 아이콘 주소. `/leagues`를 세션 동안 한 번만 받는다.
///
/// 클랜 응답의 `warLeague`는 이름만 오고 아이콘 주소가 없다. 클랜전 리그 이름(Champion League III 등)이
/// 기존 리그 이름과 모두 같아서, 이 표로 이름에 맞는 아이콘을 찾는다. 실패하면 빈 표다.
final leagueIconsProvider = FutureProvider<Map<String, String>>((ref) async {
  try {
    final leagues = await ref.watch(apiClientProvider).getLeagues();
    return {
      for (final l in leagues)
        if (l.name != null && (l.iconUrls?.small ?? l.iconUrls?.medium) != null)
          l.name!: (l.iconUrls?.small ?? l.iconUrls?.medium)!,
    };
  } catch (_) {
    return const {};
  }
});

/// [saved]의 이름과 리그 아이콘.
/// - 클랜: 클랜 이름 + **클랜전(리그전) 리그** 아이콘
/// - 플레이어: 플레이어 이름 + **경쟁전 리그**(새 랭크 체계) 아이콘
///
/// 조회에 실패하면 null이고, 타일은 기본 아이콘과 종류 라벨로 대신한다(오류를 띄우지 않는다).
/// 홈 화면이 떠 있는 동안에는 provider가 유지되어 다시 요청하지 않는다.
final historyInfoProvider = FutureProvider.autoDispose
    .family<HistoryInfo?, SavedTag>((ref, saved) async {
      try {
        switch (saved.kind) {
          case TagKind.clan:
            final clan = await ref.watch(clanProvider(saved.tag).future);
            final icons = await ref.watch(leagueIconsProvider.future);
            return HistoryInfo(
              name: clan.name,
              iconUrl: icons[clan.warLeague?.name],
            );
          case TagKind.player:
            final player = await ref.watch(playerProvider(saved.tag).future);
            return HistoryInfo(
              name: player.name,
              iconUrl: player.currentLeague?.iconUrls?.small,
            );
        }
      } catch (_) {
        return null;
      }
    });
