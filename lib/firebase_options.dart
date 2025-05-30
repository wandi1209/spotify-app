// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD2eToDLRhuEs5tyBGcIIoFiVcd_u8ccIs',
    appId: '1:938148481624:web:8be4b3f0f08f449473182d',
    messagingSenderId: '938148481624',
    projectId: 'spotify-wandi',
    authDomain: 'spotify-wandi.firebaseapp.com',
    storageBucket: 'spotify-wandi.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbsxrfx5gkDAwXADZbo8x0FOakb3SEC1M',
    appId: '1:938148481624:android:e4de305c9b7f12bb73182d',
    messagingSenderId: '938148481624',
    projectId: 'spotify-wandi',
    storageBucket: 'spotify-wandi.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCLWeKYZPyDEYqsIz-e8lmUtVD3cdq5fsw',
    appId: '1:938148481624:ios:78505815deff94d573182d',
    messagingSenderId: '938148481624',
    projectId: 'spotify-wandi',
    storageBucket: 'spotify-wandi.firebasestorage.app',
    iosBundleId: 'wandidev.com.spotify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCLWeKYZPyDEYqsIz-e8lmUtVD3cdq5fsw',
    appId: '1:938148481624:ios:78505815deff94d573182d',
    messagingSenderId: '938148481624',
    projectId: 'spotify-wandi',
    storageBucket: 'spotify-wandi.firebasestorage.app',
    iosBundleId: 'wandidev.com.spotify',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD2eToDLRhuEs5tyBGcIIoFiVcd_u8ccIs',
    appId: '1:938148481624:web:e598e095be01ef5573182d',
    messagingSenderId: '938148481624',
    projectId: 'spotify-wandi',
    authDomain: 'spotify-wandi.firebaseapp.com',
    storageBucket: 'spotify-wandi.firebasestorage.app',
  );
}
