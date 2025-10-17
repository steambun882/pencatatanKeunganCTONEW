import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'package:pencatatan_keuangan/core/core.dart';

/// Firebase configuration generated via the FlutterFire CLI.
///
/// Replace the placeholder values with the output from
/// `flutterfire configure` for each flavor (dev/prod).
class DefaultFirebaseOptions {
  const DefaultFirebaseOptions._();

  static FirebaseOptions currentPlatform(AppFlavor flavor) {
    switch (flavor) {
      case AppFlavor.dev:
        return _dev();
      case AppFlavor.prod:
        return _prod();
    }
  }

  static FirebaseOptions _dev() {
    if (kIsWeb) {
      throw UnsupportedError(
        'Firebase options have not been configured for web. Run flutterfire configure.',
      );
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return _devAndroid;
      case TargetPlatform.iOS:
        return _devIos;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static FirebaseOptions _prod() {
    if (kIsWeb) {
      throw UnsupportedError(
        'Firebase options have not been configured for web. Run flutterfire configure.',
      );
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return _prodAndroid;
      case TargetPlatform.iOS:
        return _prodIos;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // Development
  static const FirebaseOptions _devAndroid = FirebaseOptions(
    apiKey: 'DEV_ANDROID_API_KEY',
    appId: '1:1234567890:android:devfirebaseapp',
    messagingSenderId: '1234567890',
    projectId: 'pencatatan-keuangan-dev',
    storageBucket: 'pencatatan-keuangan-dev.appspot.com',
  );

  static const FirebaseOptions _devIos = FirebaseOptions(
    apiKey: 'DEV_IOS_API_KEY',
    appId: '1:1234567890:ios:devfirebaseapp',
    messagingSenderId: '1234567890',
    projectId: 'pencatatan-keuangan-dev',
    storageBucket: 'pencatatan-keuangan-dev.appspot.com',
    iosBundleId: 'com.example.pencatatankeuangan.dev',
    iosClientId: 'dev-ios-client-id.apps.googleusercontent.com',
    androidClientId: 'dev-android-client-id.apps.googleusercontent.com',
  );

  // Production
  static const FirebaseOptions _prodAndroid = FirebaseOptions(
    apiKey: 'PROD_ANDROID_API_KEY',
    appId: '1:0987654321:android:prodfirebaseapp',
    messagingSenderId: '0987654321',
    projectId: 'pencatatan-keuangan-prod',
    storageBucket: 'pencatatan-keuangan-prod.appspot.com',
  );

  static const FirebaseOptions _prodIos = FirebaseOptions(
    apiKey: 'PROD_IOS_API_KEY',
    appId: '1:0987654321:ios:prodfirebaseapp',
    messagingSenderId: '0987654321',
    projectId: 'pencatatan-keuangan-prod',
    storageBucket: 'pencatatan-keuangan-prod.appspot.com',
    iosBundleId: 'com.example.pencatatankeuangan',
    iosClientId: 'prod-ios-client-id.apps.googleusercontent.com',
    androidClientId: 'prod-android-client-id.apps.googleusercontent.com',
  );
}
