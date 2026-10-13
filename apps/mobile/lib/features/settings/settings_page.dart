import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import '../../l10n/app_localizations.dart';
import '../language_button.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final settings = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);

    final languages = languageOptions(l10n);
    final themes = <(ThemeMode, String)>[
      (ThemeMode.system, l10n.themeSystem),
      (ThemeMode.light, l10n.themeLight),
      (ThemeMode.dark, l10n.themeDark),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                l10n.language,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              RadioGroup<Locale?>(
                groupValue: settings.locale,
                onChanged: notifier.setLocale,
                child: Column(
                  children: [
                    for (final (value, label) in languages)
                      RadioListTile<Locale?>(
                        contentPadding: EdgeInsets.zero,
                        value: value,
                        title: Text(label),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(l10n.theme, style: Theme.of(context).textTheme.titleSmall),
              RadioGroup<ThemeMode>(
                groupValue: settings.themeMode,
                onChanged: (m) {
                  if (m != null) notifier.setThemeMode(m);
                },
                child: Column(
                  children: [
                    for (final (value, label) in themes)
                      RadioListTile<ThemeMode>(
                        contentPadding: EdgeInsets.zero,
                        value: value,
                        title: Text(label),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
