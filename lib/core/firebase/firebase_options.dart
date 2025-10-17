import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not configured for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'demo-api-key-web',
    appId: '1:000000000000:web:demoappid',
    messagingSenderId: '000000000000',
    projectId: 'demo-project-id',
    authDomain: 'demo-project-id.firebaseapp.com',
    storageBucket: 'demo-project-id.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'demo-api-key-android',
    appId: '1:000000000000:android:demoappid',
    messagingSenderId: '000000000000',
    projectId: 'demo-project-id',
    storageBucket: 'demo-project-id.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'demo-api-key-ios',
    appId: '1:000000000000:ios:demoappid',
    messagingSenderId: '000000000000',
    projectId: 'demo-project-id',
    storageBucket: 'demo-project-id.appspot.com',
    iosBundleId: 'com.example.pencatatankeuangan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'demo-api-key-macos',
    appId: '1:000000000000:macos:demoappid',
    messagingSenderId: '000000000000',
    projectId: 'demo-project-id',
    storageBucket: 'demo-project-id.appspot.com',
    iosBundleId: 'com.example.pencatatankeuangan',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'demo-api-key-windows',
    appId: '1:000000000000:windows:demoappid',
    messagingSenderId: '000000000000',
    projectId: 'demo-project-id',
    storageBucket: 'demo-project-id.appspot.com',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'demo-api-key-linux',
    appId: '1:000000000000:linux:demoappid',
    messagingSenderId: '000000000000',
    projectId: 'demo-project-id',
    storageBucket: 'demo-project-id.appspot.com',
  );
}
