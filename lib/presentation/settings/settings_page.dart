import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pencatatan_keuangan/core/core.dart';
import 'package:pencatatan_keuangan/shared/shared.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final themeModeAsync = ref.watch(themeControllerProvider);
    final themeMode = themeModeAsync.valueOrNull ?? ThemeMode.system;
    final padding = ResponsiveBreakpoints.pagePadding(context);

    return ListView(
      padding: padding,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.settingsThemeTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.settingsThemeDescription,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                if (themeModeAsync.isLoading) ...[
                  const SizedBox(height: 16),
                  const LinearProgressIndicator(),
                ],
                const SizedBox(height: 24),
                SegmentedButton<ThemeMode>(
                  key: const Key('settings_theme_mode_segmented'),
                  segments: <ButtonSegment<ThemeMode>>[
                    ButtonSegment<ThemeMode>(
                      value: ThemeMode.system,
                      label: Text(l10n.themeModeSystem),
                      icon: const Icon(Icons.brightness_auto_outlined),
                    ),
                    ButtonSegment<ThemeMode>(
                      value: ThemeMode.light,
                      label: Text(l10n.themeModeLight),
                      icon: const Icon(Icons.wb_sunny_outlined),
                    ),
                    ButtonSegment<ThemeMode>(
                      value: ThemeMode.dark,
                      label: Text(l10n.themeModeDark),
                      icon: const Icon(Icons.nightlight_round),
                    ),
                  ],
                  selected: <ThemeMode>{themeMode},
                  onSelectionChanged: (selection) {
                    if (selection.isEmpty) {
                      return;
                    }
                    final selectedMode = selection.first;
                    ref
                        .read(themeControllerProvider.notifier)
                        .setThemeMode(selectedMode);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
