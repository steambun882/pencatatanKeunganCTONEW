import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

Future<void> bootstrap({List<Override> overrides = const []}) async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      overrides: overrides,
      observers: _createObservers(enableLogging: kDebugMode),
      child: const App(),
    ),
  );
}

class AppProviderObserver extends ProviderObserver {
  const AppProviderObserver();

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint(
      'provider: ${provider.name ?? provider.runtimeType}, '
      'previous: $previousValue, '
      'next: $newValue',
    );
  }
}

ProviderContainer createAppContainer({
  List<Override> overrides = const [],
  bool enableLogging = kDebugMode,
}) {
  return ProviderContainer(
    overrides: overrides,
    observers: _createObservers(enableLogging: enableLogging),
  );
}

List<ProviderObserver> _createObservers({required bool enableLogging}) {
  return <ProviderObserver>[
    if (enableLogging) const AppProviderObserver(),
  ];
}
