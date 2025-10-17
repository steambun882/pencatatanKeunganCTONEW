import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pencatatan_keuangan/app/app.dart';
import 'package:pencatatan_keuangan/core/core.dart';
import 'package:pencatatan_keuangan/firebase/firebase_options.dart';

Future<void> bootstrap({required AppEnvironment environment}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(environment.flavor),
  );

  runZonedGuarded(
    () {
      runApp(
        ProviderScope(
          overrides: [
            appEnvironmentProvider.overrideWithValue(environment),
          ],
          child: const PencatatanKeuanganApp(),
        ),
      );
    },
    (error, stackTrace) {
      FlutterError.reportError(FlutterErrorDetails(exception: error, stack: stackTrace));
    },
  );
}
