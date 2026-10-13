import 'package:flutter/material.dart';

import '../core/api_client.dart';
import '../l10n/app_localizations.dart';

String errorMessage(AppLocalizations l10n, Object error) {
  final kind = error is ApiException ? error.kind : ApiErrorKind.unknown;
  return switch (kind) {
    ApiErrorKind.invalidTag || ApiErrorKind.notFound => l10n.errorNotFound,
    ApiErrorKind.privateLog => l10n.errorPrivateLog,
    ApiErrorKind.rateLimited => l10n.errorRateLimited,
    ApiErrorKind.maintenance => l10n.errorMaintenance,
    ApiErrorKind.network => l10n.errorNetwork,
    ApiErrorKind.unknown => l10n.errorGeneric,
  };
}

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.error, this.onRetry});

  final Object error;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 40,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 12),
            Text(errorMessage(l10n, error), textAlign: TextAlign.center),
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              FilledButton.tonal(onPressed: onRetry, child: Text(l10n.retry)),
            ],
          ],
        ),
      ),
    );
  }
}
