// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDc4S_JwwgtpQrdvfWDzLnXa1wf_-nOBNg',
    appId: '1:867562556030:web:e9193ba5c19d673abaa62f',
    messagingSenderId: '867562556030',
    projectId: 'duongst-9e232',
    authDomain: 'duongst-9e232.firebaseapp.com',
    storageBucket: 'duongst-9e232.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4XMVQ8UlR2s7qkKszRxgZI4RL1M7CLAA',
    appId: '1:867562556030:android:20c3462f22d3c74bbaa62f',
    messagingSenderId: '867562556030',
    projectId: 'duongst-9e232',
    storageBucket: 'duongst-9e232.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzGqFEm4oVWPvYUd5wh6ud8bB_eW_Ji1s',
    appId: '1:867562556030:ios:5d2fecd906a0db49baa62f',
    messagingSenderId: '867562556030',
    projectId: 'duongst-9e232',
    storageBucket: 'duongst-9e232.appspot.com',
    iosBundleId: 'com.example.dooDuong',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDzGqFEm4oVWPvYUd5wh6ud8bB_eW_Ji1s',
    appId: '1:867562556030:ios:bbc11b5956c846a9baa62f',
    messagingSenderId: '867562556030',
    projectId: 'duongst-9e232',
    storageBucket: 'duongst-9e232.appspot.com',
    iosBundleId: 'com.example.dooDuong.RunnerTests',
  );
}
