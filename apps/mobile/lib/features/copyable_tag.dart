import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/app_localizations.dart';

/// 누르면 태그를 클립보드에 복사하고 알려 주는 태그 표시.
class CopyableTag extends StatelessWidget {
  const CopyableTag({super.key, required this.tag});

  final String tag;

  Future<void> _copy(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final text = AppLocalizations.of(context).tagCopied(tag);
    await Clipboard.setData(ClipboardData(text: tag));
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(text), duration: const Duration(seconds: 2)),
      );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.onSurfaceVariant;
    return Tooltip(
      message: AppLocalizations.of(context).copyTag,
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () => _copy(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tag,
                style: theme.textTheme.bodyMedium?.copyWith(color: color),
              ),
              const SizedBox(width: 4),
              Icon(Icons.copy_outlined, size: 14, color: color),
            ],
          ),
        ),
      ),
    );
  }
}
