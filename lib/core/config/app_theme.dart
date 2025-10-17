import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pencatatan_keuangan/shared/preferences/local_preferences.dart';

final appThemeProvider = Provider<AppTheme>((ref) => const AppTheme());

final themeControllerProvider =
    AsyncNotifierProvider<AppThemeController, ThemeMode>(
  AppThemeController.new,
);

const _themeModePreferenceKey = 'theme.mode';

class AppTheme {
  const AppTheme();

  static const Color _seedColor = Color(0xFF1F7A8C);
  static const double _textScaleFactor = 1.02;

  ColorScheme get lightColorScheme => ColorScheme.fromSeed(
        seedColor: _seedColor,
        brightness: Brightness.light,
      );

  ColorScheme get darkColorScheme => ColorScheme.fromSeed(
        seedColor: _seedColor,
        brightness: Brightness.dark,
      );

  ThemeData get light => _buildTheme(lightColorScheme);

  ThemeData get dark => _buildTheme(darkColorScheme);

  ThemeData _buildTheme(ColorScheme colorScheme) {
    final baseTheme = ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      visualDensity: VisualDensity.standard,
    );

    final textTheme = baseTheme.textTheme.apply(
      fontSizeFactor: _textScaleFactor,
      displayColor: colorScheme.onSurface,
      bodyColor: colorScheme.onSurface,
    );

    return baseTheme.copyWith(
      textTheme: textTheme,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        surfaceTintColor: colorScheme.surfaceTint,
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 72,
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.secondaryContainer,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        elevation: 0,
        labelTextStyle: WidgetStatePropertyAll<TextStyle?>(
          textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.secondaryContainer,
        selectedIconTheme:
            IconThemeData(color: colorScheme.onSecondaryContainer),
        selectedLabelTextStyle:
            textTheme.labelLarge?.copyWith(color: colorScheme.onSurface),
        unselectedIconTheme: IconThemeData(color: colorScheme.onSurfaceVariant),
        unselectedLabelTextStyle: textTheme.labelLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      cardTheme: CardTheme(
        margin: EdgeInsets.zero,
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        surfaceTintColor: colorScheme.surfaceTint,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: colorScheme.onSurfaceVariant,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceContainerHigh,
        labelStyle: textTheme.bodyMedium,
        selectedColor: colorScheme.secondaryContainer,
      ),
      dividerColor: colorScheme.outlineVariant,
    );
  }
}

class AppThemeController extends AsyncNotifier<ThemeMode> {
  @override
  Future<ThemeMode> build() async {
    final preferences = ref.watch(localPreferencesProvider);
    final stored = await preferences.getString(_themeModePreferenceKey);
    return _decodeThemeMode(stored);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final preferences = ref.watch(localPreferencesProvider);
    state = AsyncValue.data(mode);
    try {
      await preferences.setString(_themeModePreferenceKey, mode.name);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  ThemeMode _decodeThemeMode(String? raw) {
    if (raw == null) {
      return ThemeMode.system;
    }

    return ThemeMode.values.firstWhere(
      (mode) => mode.name == raw,
      orElse: () => ThemeMode.system,
    );
  }
}
