import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Supported application flavors.
enum AppFlavor {
  dev,
  prod,
}

/// Provides metadata about the current execution environment and exposes
/// convenience helpers to tailor runtime behaviour.
class AppEnvironment {
  const AppEnvironment._(this.flavor);

  final AppFlavor flavor;

  static const AppEnvironment dev = AppEnvironment._(AppFlavor.dev);
  static const AppEnvironment prod = AppEnvironment._(AppFlavor.prod);

  static const AppFlavor defaultFlavor = AppFlavor.dev;

  /// Creates an [AppEnvironment] from a string value (case-insensitive).
  static AppEnvironment fromName(String value) {
    final normalized = value.trim().toLowerCase();
    switch (normalized) {
      case 'prod':
      case 'production':
        return prod;
      case 'dev':
      case 'development':
        return dev;
      default:
        debugPrint(
          'Unknown APP_FLAVOR "$value" received. Falling back to dev.',
        );
        return dev;
    }
  }

  bool get isDev => flavor == AppFlavor.dev;

  bool get isProd => flavor == AppFlavor.prod;

  String get name => flavor.name;

  String get analyticsCollectionId => isProd ? 'prod' : 'dev';
}

/// Riverpod provider that exposes the active [AppEnvironment].
final appEnvironmentProvider = Provider<AppEnvironment>((ref) {
  throw UnimplementedError(
    'appEnvironmentProvider must be overridden at bootstrap time.',
  );
});
