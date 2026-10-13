import 'dart:math' as math;

import 'package:coc_models/coc_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api_client.dart';
import '../../core/saved_tag.dart';
import '../../l10n/app_localizations.dart';
import '../error_view.dart';
import '../favorite_button.dart';
import '../language_button.dart';
import '../pagination_bar.dart';
import 'clan_badge.dart';
import 'clan_providers.dart';
import 'war_log_tile.dart';

class ClanPage extends ConsumerWidget {
  const ClanPage({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clan = ref.watch(clanProvider(tag));
    return Scaffold(
      appBar: AppBar(
        title: Text(clan.value?.name ?? tag),
        actions: [
          const LanguageButton(),
          FavoriteButton(tag: SavedTag(TagKind.clan, tag)),
        ],
      ),
      body: clan.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ErrorView(
          error: e,
          onRetry: () => ref.invalidate(clanProvider(tag)),
        ),
        data: (c) => _ClanBody(tag: tag, clan: c),
      ),
    );
  }
}

class _ClanBody extends ConsumerStatefulWidget {
  const _ClanBody({required this.tag, required this.clan});

  final String tag;
  final Clan clan;

  @override
  ConsumerState<_ClanBody> createState() => _ClanBodyState();
}

class _ClanBodyState extends ConsumerState<_ClanBody> {
  final _logTitleKey = GlobalKey();

  /// 현재 전쟁 로그 페이지 (1부터).
  int _page = 1;

  Future<void> _refresh() async {
    setState(() => _page = 1);
    ref.invalidate(clanProvider(widget.tag));
    if (widget.clan.isWarLogPublic != false) {
      ref.invalidate(warLogProvider(widget.tag));
      await ref
          .read(warLogProvider(widget.tag).future)
          .then<void>((_) {}, onError: (_) {});
    }
  }

  void _goTo(int page) {
    setState(() => _page = page);
    // 목록이 짧아지거나 길어져도 새 페이지의 첫 항목이 보이도록 제목 위치로 이동한다.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = _logTitleKey.currentContext;
      if (ctx != null && ctx.mounted) {
        Scrollable.ensureVisible(
          ctx,
          duration: const Duration(milliseconds: 200),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // 비공개로 알려진 로그는 요청하지 않는다.
    final logPublic = widget.clan.isWarLogPublic != false;
    final log = logPublic ? ref.watch(warLogProvider(widget.tag)) : null;
    final items = log?.value ?? const <ClanWarLogEntry>[];
    final totalPages = math.max(1, (items.length / warLogPageSize).ceil());
    final page = math.min(_page, totalPages);
    final visible = items
        .skip((page - 1) * warLogPageSize)
        .take(warLogPageSize);

    return RefreshIndicator(
      onRefresh: _refresh,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            children: [
              _ClanHeader(clan: widget.clan),
              const SizedBox(height: 16),
              Text(
                l10n.warLog,
                key: _logTitleKey,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              if (!logPublic)
                _Notice(text: l10n.errorPrivateLog)
              else if (log == null || log.isLoading && !log.hasValue)
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (log.hasError && !log.hasValue)
                _isPrivate(log.error!)
                    ? _Notice(text: l10n.errorPrivateLog)
                    : ErrorView(
                        error: log.error!,
                        onRetry: () =>
                            ref.invalidate(warLogProvider(widget.tag)),
                      )
              else if (items.isEmpty)
                _Notice(text: l10n.noWarLog)
              else ...[
                for (final e in visible) WarLogTile(entry: e),
                const SizedBox(height: 12),
                PaginationBar(
                  current: page,
                  total: totalPages,
                  onChanged: _goTo,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

bool _isPrivate(Object e) =>
    e is ApiException && e.kind == ApiErrorKind.privateLog;

class _Notice extends StatelessWidget {
  const _Notice({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 24),
    child: Text(text, textAlign: TextAlign.center),
  );
}

class _ClanHeader extends StatelessWidget {
  const _ClanHeader({required this.clan});

  final Clan clan;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    Widget stat(String label, int? value) => Expanded(
      child: Column(
        children: [
          Text('${value ?? '-'}', style: theme.textTheme.titleLarge),
          Text(label, style: theme.textTheme.bodySmall),
        ],
      ),
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                ClanBadge(urls: clan.badgeUrls, size: 64),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        clan.name ?? clan.tag,
                        style: theme.textTheme.titleLarge,
                      ),
                      Text(
                        [
                          clan.tag,
                          if (clan.clanLevel != null)
                            l10n.clanLevel(clan.clanLevel!),
                          if (clan.members != null)
                            l10n.memberCount(clan.members!),
                        ].join(' · '),
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                stat(l10n.warWins, clan.warWins),
                stat(l10n.warTies, clan.warTies),
                stat(l10n.warLosses, clan.warLosses),
                stat(l10n.winStreak, clan.warWinStreak),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
