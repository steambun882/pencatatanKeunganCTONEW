# Pencatatan Keuangan

Pencatatan Keuangan is a personal finance app designed to help users record daily transactions, visualise spending trends, and generate actionable insights. The project is built with Flutter and follows a layered architecture so that features remain modular and testable as the codebase grows.

## Requirements

- [Flutter](https://docs.flutter.dev/get-started/install) 3.22.0 or newer
- Android Studio and/or Xcode toolchains if you plan to build native binaries
- Dart SDK (bundled with Flutter)

## Getting Started

```bash
# Install dependencies
flutter pub get

# Run code generators (when using freezed/drift/riverpod annotations)
dart run build_runner build --delete-conflicting-outputs
```

### Running the application

```bash
# Launch on the default connected device or emulator
flutter run

# Build debug binaries
flutter build apk --debug
flutter build ios --simulator
```

### Quality checks

```bash
flutter analyze
flutter test
```

## Firebase security rules & emulators

Security rules restrict Firestore documents and Storage objects to the authenticated user (`request.auth.uid`). Firebase emulators are configured for Auth, Firestore, and Storage so the rules can be exercised locally.

### Prerequisites

```bash
npm install
```

### Run the emulator suite & rule tests

```bash
# Run automated Firestore & Storage rule tests
npm run test:rules

# Start the emulators for manual testing (runs until stopped)
npm run emulators:start
```

### Deploying rules

```bash
# Authenticate once per machine
npx firebase login

# Select the production project (replace with your project id)
npx firebase use <project-id>

# Deploy Firestore & Storage security rules
npm run deploy:rules
```

## Project Structure

```
lib/
├── app/                    # App entry widgets, router, localization, etc.
├── core/                   # Cross-cutting concerns (theme, configuration)
├── data/                   # Data sources, repositories, DTOs
├── domain/                 # Entities, use cases, and business rules
├── presentation/           # Feature UI & riverpod providers
└── shared/                 # Shared utilities, widgets, and extensions
```

Generated files such as `*.g.dart`, `*.freezed.dart`, and `*.drift.dart` are excluded from version control but can be recreated via `build_runner`.

## Tooling & Automation

- **Static analysis** is configured through `analysis_options.yaml`, extending `flutter_lints` with stricter language settings.
- **Git hooks** live under `tool/git_hooks`. Configure Git to use them by running:
  ```bash
  git config core.hooksPath tool/git_hooks
  ```
  The pre-commit hook formats staged Dart files and runs `flutter analyze` to keep the main branch clean.
- **CI** is handled by a GitHub Actions workflow that runs `flutter analyze` and `flutter test` on every push and pull request.

## Contributing

1. Create a new branch for your feature or fix.
2. Keep changes scoped and ensure tests pass.
3. Run `dart run build_runner build --delete-conflicting-outputs` when working with generated files.
4. Submit a pull request with a clear summary of your changes.

Happy coding!
