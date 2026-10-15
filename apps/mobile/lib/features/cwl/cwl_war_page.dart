import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/app_localizations.dart';
import '../error_view.dart';
import '../language_button.dart';
import '../war/war_page.dart';
import 'cwl_providers.dart';
import 'cwl_stats.dart';

/// 리그전 한 경기의 상세 화면 (`/clan/:tag/cwl/war/:warTag`). 우리 클랜이 왼쪽에 온다.
class CwlWarPage extends ConsumerWidget {
  const CwlWarPage({super.key, required this.clanTag, required this.warTag});

  final String clanTag;
  final String warTag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final war = ref.watch(cwlWarProvider(warTag));
    final oriented = war.whenData((w) => orientTo(w, clanTag));

    return Scaffold(
      appBar: AppBar(
        title: Text(oriented.value?.clan?.name ?? l10n.cwlPageTitle),
        actions: const [LanguageButton()],
      ),
      body: oriented.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ErrorView(
          error: e,
          onRetry: () => ref.invalidate(cwlWarProvider(warTag)),
        ),
        data: (w) => WarView(
          war: w,
          onRefresh: () async {
            ref.invalidate(cwlWarProvider(warTag));
            await ref
                .read(cwlWarProvider(warTag).future)
                .then<void>((_) {}, onError: (_) {});
          },
        ),
      ),
    );
  }
}
