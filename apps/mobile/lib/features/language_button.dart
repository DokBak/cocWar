import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/providers.dart';
import '../l10n/app_localizations.dart';

/// 언어 선택 항목. 언어 이름은 해당 언어로 적어, 어떤 언어로 보고 있어도 알아볼 수 있게 한다.
List<(Locale?, String)> languageOptions(AppLocalizations l10n) => [
  (null, l10n.languageSystem),
  (const Locale('ko'), '한국어'),
  (const Locale('en'), 'English'),
  (const Locale('ja'), '日本語'),
];

/// AppBar에 두는 언어 변경 버튼.
class LanguageButton extends ConsumerWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final current = ref.watch(settingsProvider).locale;
    return PopupMenuButton<Locale?>(
      tooltip: l10n.languageTooltip,
      icon: const Icon(Icons.translate),
      initialValue: current,
      onSelected: ref.read(settingsProvider.notifier).setLocale,
      itemBuilder: (_) => [
        for (final (value, label) in languageOptions(l10n))
          CheckedPopupMenuItem<Locale?>(
            value: value,
            checked: value == current,
            child: Text(label),
          ),
      ],
    );
  }
}
