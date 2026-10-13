import 'package:coc_models/coc_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/layout.dart';
import '../../core/providers.dart';
import '../../core/saved_tag.dart';
import '../../l10n/app_localizations.dart';
import '../language_button.dart';
import '../remote_image.dart';
import 'history_info.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _controller = TextEditingController();
  TagKind _kind = TagKind.clan;
  bool _invalid = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final tag = normalizeTag(_controller.text);
    if (!isValidTag(tag)) {
      setState(() => _invalid = true);
      return;
    }
    setState(() => _invalid = false);
    final saved = SavedTag(_kind, tag);
    ref.read(recentProvider.notifier).addFirst(saved);
    context.push(saved.location);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final recent = ref.watch(recentProvider);
    final favorites = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          const LanguageButton(),
          IconButton(
            tooltip: l10n.settings,
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: contentMaxWidth),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SegmentedButton<TagKind>(
                segments: [
                  ButtonSegment(
                    value: TagKind.clan,
                    label: Text(l10n.kindClan),
                    icon: const Icon(Icons.shield_outlined),
                  ),
                  ButtonSegment(
                    value: TagKind.player,
                    label: Text(l10n.kindPlayer),
                    icon: const Icon(Icons.person_outline),
                  ),
                ],
                selected: {_kind},
                onSelectionChanged: (s) => setState(() => _kind = s.first),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _controller,
                textCapitalization: TextCapitalization.characters,
                textInputAction: TextInputAction.search,
                autocorrect: false,
                onSubmitted: (_) => _submit(),
                decoration: InputDecoration(
                  labelText: l10n.tagLabel,
                  hintText: l10n.tagHint,
                  errorText: _invalid ? l10n.invalidTag : null,
                  suffixIcon: IconButton(
                    tooltip: l10n.search,
                    icon: const Icon(Icons.search),
                    onPressed: _submit,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              if (favorites.isEmpty && recent.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Text(
                    l10n.emptyHint,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              if (favorites.isNotEmpty) ...[
                _SectionHeader(title: l10n.favorites),
                for (final t in favorites)
                  _TagTile(key: ValueKey('fav-${t.encoded}'), tag: t),
              ],
              if (recent.isNotEmpty) ...[
                _SectionHeader(
                  title: l10n.recentSearches,
                  action: TextButton(
                    onPressed: ref.read(recentProvider.notifier).clear,
                    child: Text(l10n.clearAll),
                  ),
                ),
                for (final t in recent)
                  _TagTile(key: ValueKey('recent-${t.encoded}'), tag: t),
              ],
              const SizedBox(height: 32),
              Text(
                l10n.disclaimer,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, this.action});

  final String title;
  final Widget? action;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Row(
      children: [
        Expanded(
          child: Text(title, style: Theme.of(context).textTheme.titleSmall),
        ),
        ?action,
      ],
    ),
  );
}

class _TagTile extends ConsumerWidget {
  const _TagTile({super.key, required this.tag});

  final SavedTag tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final isFavorite = ref.watch(favoritesProvider).contains(tag);
    final isClan = tag.kind == TagKind.clan;
    // 이름과 리그 아이콘. 받아 오는 동안·실패했을 때는 기본 아이콘과 종류 라벨을 보여준다.
    final info = ref.watch(historyInfoProvider(tag)).value;
    final name = info?.name;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: RemoteImage(
        url: info?.iconUrl,
        size: 40,
        fallback: isClan ? Icons.shield_outlined : Icons.person_outline,
      ),
      title: Text(tag.tag),
      subtitle: Text(
        name == null
            ? (isClan ? l10n.kindClan : l10n.kindPlayer)
            : (isClan
                  ? l10n.historyClanSubtitle(name)
                  : l10n.historyPlayerSubtitle(name)),
      ),
      trailing: IconButton(
        tooltip: isFavorite ? l10n.removeFavorite : l10n.addFavorite,
        icon: Icon(isFavorite ? Icons.star : Icons.star_border),
        onPressed: () => ref.read(favoritesProvider.notifier).toggle(tag),
      ),
      onTap: () {
        ref.read(recentProvider.notifier).addFirst(tag);
        context.push(tag.location);
      },
    );
  }
}
