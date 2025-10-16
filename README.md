# Project Bootstrap

A Flutter 3 application scaffolded with Material 3, Riverpod for state
management, Drift for local persistence, modular routing, and localization
support. The template includes opinionated tooling for formatting, linting,
continuous integration, and code generation so new features can be added with a
consistent developer experience.

## Stack at a glance

- **Flutter 3.16.8** with Material 3 theming
- **Riverpod** for dependency injection and state management
- **Go Router** for declarative navigation
- **Drift** with `sqlite3_flutter_libs` for local database access
- **Flutter localization** with ARB files and generated delegates
- **GitHub Actions CI** that enforces formatting, `flutter analyze`, and
  `flutter test`

## Getting started

1. Install the Flutter SDK (3.16.8) and add it to your `PATH`.
2. Fetch dependencies and generate localization files:
   ```bash
   flutter pub get
   flutter gen-l10n
   ```
3. Run Drift code generation whenever you modify database tables:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
4. Launch the application:
   ```bash
   flutter run
   ```

## Project structure

```
lib/
  main.dart                # Entry point calling into bootstrap logic
  src/
    app.dart               # MaterialApp configuration
    bootstrap.dart         # ProviderScope bootstrapping & observers
    core/
      database/            # Drift database & providers
      localization/        # Locale providers
      router/              # GoRouter configuration
      theme/               # Material 3 light/dark themes
    features/
      counter/             # Counter business logic & repository
      home/                # Home screen presentation layer
    l10n/                  # ARB files and generated localizations
```

This organization keeps shared infrastructure inside `core`, while feature
modules live under `features/` with their own sub-folders for presentation,
application, data, and domain layers.

## Localization workflow

- Source strings live in `lib/src/l10n/*.arb`.
- Run `flutter gen-l10n` after editing ARB files to regenerate
  `lib/src/l10n/generated/app_localizations.dart`.
- Add the new `Locale` to `preferred-supported-locales` in `l10n.yaml` and
  `supportedLocales` in the generated delegate is updated automatically.

## Database workflow

`lib/src/core/database/app_database.dart` defines the Drift schema. Use
`AppDatabase.inMemory()` for tests and override the provider as done in the
counter tests. After changing tables or DAOs, execute `dart run build_runner
build --delete-conflicting-outputs` to refresh generated code.

## Tooling scripts

| Command | Purpose |
| --- | --- |
| `dart format --set-exit-if-changed lib test` | Enforce formatting |
| `flutter analyze` | Static analysis with strict analyzer settings |
| `flutter test` | Execute unit and widget tests |
| `flutter gen-l10n` | Regenerate localization delegates |
| `dart run build_runner build --delete-conflicting-outputs` | Update Drift code |

The included GitHub Actions workflow runs the formatting check, analyzer, and
test suite on every push and pull request.

## Next steps

- Add additional feature modules under `lib/src/features/`.
- Expand localization by adding more ARB files.
- Configure platform-specific settings under the generated `android`, `ios`, and
  desktop folders as required.
