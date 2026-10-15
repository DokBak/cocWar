import 'package:coc_models/coc_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/layout.dart';
import '../../core/saved_tag.dart';
import '../../l10n/app_localizations.dart';
import '../clan/clan_badge.dart';
import '../copyable_tag.dart';
import '../error_view.dart';
import '../favorite_button.dart';
import '../language_button.dart';
import '../war/war_info_button.dart';
import '../remote_image.dart';
import 'player_providers.dart';
import 'village_tabs.dart';
import 'role_label.dart';

class PlayerPage extends ConsumerWidget {
  const PlayerPage({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(playerProvider(tag));
    return Scaffold(
      appBar: AppBar(
        title: Text(player.value?.name ?? tag),
        actions: [
          const LanguageButton(),
          FavoriteButton(tag: SavedTag(TagKind.player, tag)),
        ],
      ),
      body: PlayerProfileView(tag: tag),
    );
  }
}

/// 플레이어 프로필 본문(헤더, 본마을/장인기지 탭). 화면 전체(PlayerPage)로도,
/// 클랜 화면의 나란히 보기 오른쪽 창으로도 쓴다.
class PlayerProfileView extends ConsumerWidget {
  const PlayerProfileView({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(playerProvider(tag));
    return player.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => ErrorView(
        error: e,
        onRetry: () => ref.invalidate(playerProvider(tag)),
      ),
      // 소속 클랜이 클랜전 중이면 창 아래 가운데에 "클랜전 정보 보기" 버튼이 뜬다.
      data: (p) => Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(playerProvider(tag));
              await ref
                  .read(playerProvider(tag).future)
                  .then<void>((_) {}, onError: (_) {});
            },
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: contentMaxWidth),
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  children: [
                    _Header(player: p),
                    const SizedBox(height: 12),
                    VillageTabs(player: p),
                  ],
                ),
              ),
            ),
          ),
          if (p.clan?.tag != null) WarInfoButton(clanTag: p.clan!.tag!),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final league = player.currentLeague;
    final clan = player.clan;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                RemoteImage(
                  url: league?.iconUrls?.small,
                  size: 64,
                  fallback: Icons.emoji_events_outlined,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 이름 뒤에 태그. 좁은 화면에서는 태그가 다음 줄로 내려간다.
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 8,
                        children: [
                          Text(
                            player.name ?? player.tag,
                            style: theme.textTheme.titleLarge,
                          ),
                          CopyableTag(tag: player.tag),
                        ],
                      ),
                      Text(
                        [
                          if (player.townHallLevel != null)
                            l10n.townHallN(player.townHallLevel!),
                          if (player.expLevel != null)
                            l10n.expLevelN(player.expLevel!),
                        ].join(' · '),
                        style: theme.textTheme.bodySmall,
                      ),
                      if (league?.name != null)
                        Text(league!.name!, style: theme.textTheme.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
            if (clan?.tag != null) ...[
              const Divider(height: 24),
              InkWell(
                onTap: () =>
                    context.push(SavedTag(TagKind.clan, clan.tag!).location),
                child: Row(
                  children: [
                    ClanBadge(urls: clan!.badgeUrls, size: 36),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(clan.name ?? clan.tag!),
                          Text(
                            [
                              ?roleLabel(l10n, player.role),
                              ?switch (player.warPreference) {
                                'in' => l10n.warPrefIn,
                                'out' => l10n.warPrefOut,
                                _ => null,
                              },
                            ].join(' · '),
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
