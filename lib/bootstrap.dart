import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);

    final stack = details.stack ?? StackTrace.current;
    Zone.current.handleUncaughtError(details.exception, stack);
  };

  await runZonedGuarded(
    () async => runApp(await builder()),
    (error, stackTrace) => log(
      error.toString(),
      stackTrace: stackTrace,
    ),
  );
}
