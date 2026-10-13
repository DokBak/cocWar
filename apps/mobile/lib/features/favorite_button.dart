import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/providers.dart';
import '../core/saved_tag.dart';
import '../l10n/app_localizations.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({super.key, required this.tag});

  final SavedTag tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final isFavorite = ref.watch(favoritesProvider).contains(tag);
    return IconButton(
      tooltip: isFavorite ? l10n.removeFavorite : l10n.addFavorite,
      icon: Icon(isFavorite ? Icons.star : Icons.star_border),
      onPressed: () => ref.read(favoritesProvider.notifier).toggle(tag),
    );
  }
}
