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

Flavors are available for development (`dev`) and production (`prod`). Each
flavor wires up its own Firebase project and runtime environment.

```bash
# Development flavor
flutter run --flavor dev -t lib/main_dev.dart

# Production flavor
flutter run --flavor prod -t lib/main_prod.dart
```

If you are working on iOS before creating platform-specific schemes, you can
omit `--flavor` and rely on the entrypoints with dart-defines:

```bash
flutter run -t lib/main_dev.dart --dart-define=APP_FLAVOR=dev
flutter run -t lib/main_prod.dart --dart-define=APP_FLAVOR=prod
```

## Firebase & environment setup

The application uses Firebase Authentication, Cloud Firestore, and Cloud Storage.
Placeholder configuration lives in `lib/firebase/firebase_options.dart` and
sample project files live in `firebase/dev` and `firebase/prod`.

1. Install the FlutterFire CLI:
   ```bash
   dart pub global activate flutterfire_cli
   ```
2. Configure the **development** project and copy the generated options:
   ```bash
   flutterfire configure \
     --project <firebase-dev-project-id> \
     --platforms=android,ios \
     --out=build/firebase_dev_options.dart \
     --ios-bundle-id com.example.pencatatankeuangan.dev \
     --android-package-name com.example.pencatatan_keuangan.dev
   ```
   - Use the resulting `FirebaseOptions` values to replace `_devAndroid` and
     `_devIos` in `lib/firebase/firebase_options.dart`.
   - Move the generated `google-services.json` into `android/app/src/dev/`.
   - Move `GoogleService-Info.plist` into `ios/Runner/Firebase/dev/`.
3. Repeat the command for the **production** project, adjusting bundle IDs
   (`com.example.pencatatankeuangan`) and output path
   (`build/firebase_prod_options.dart`). Copy the values into `_prodAndroid` and
   `_prodIos`, then place the platform files in `android/app/src/prod/` and
   `ios/Runner/Firebase/prod/`.

### Managing secrets

- Real Firebase configuration files (`google-services.json`,
  `GoogleService-Info.plist`) are ignored via `.gitignore`.
- Keep the example templates updated for onboarding, but store production
  secrets in a secure manager (e.g. 1Password, Google Secret Manager, or your
  preferred vault).
- When running `flutterfire configure`, point `--out` to a temporary location so
  you never risk committing generated secrets. Copy only the values you need
  into the checked-in options file.

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

### Quality checks

```bash
flutter analyze
flutter test
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
