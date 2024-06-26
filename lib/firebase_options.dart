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
    apiKey: 'AIzaSyBGYUNn6WPD02jxxCCGtJwfc5Tgdo3h8_g',
    appId: '1:519287766416:web:41f8c29e3c4ee9a4cb8715',
    messagingSenderId: '519287766416',
    projectId: 'receipe-app-e75a6',
    authDomain: 'receipe-app-e75a6.firebaseapp.com',
    storageBucket: 'receipe-app-e75a6.appspot.com',
    measurementId: 'G-18GD8JK28W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAk1vZ4CBRl2a-YtYe-h3FeidjUUlY5MTk',
    appId: '1:519287766416:android:52643962e3bdc7f5cb8715',
    messagingSenderId: '519287766416',
    projectId: 'receipe-app-e75a6',
    storageBucket: 'receipe-app-e75a6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1MA7EpRogv2ZYl1qHVQy-Zw7FlxlNPvo',
    appId: '1:519287766416:ios:33ab163aa493fb4fcb8715',
    messagingSenderId: '519287766416',
    projectId: 'receipe-app-e75a6',
    storageBucket: 'receipe-app-e75a6.appspot.com',
    iosBundleId: 'com.example.receipeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1MA7EpRogv2ZYl1qHVQy-Zw7FlxlNPvo',
    appId: '1:519287766416:ios:39589ffd0b1b0a73cb8715',
    messagingSenderId: '519287766416',
    projectId: 'receipe-app-e75a6',
    storageBucket: 'receipe-app-e75a6.appspot.com',
    iosBundleId: 'com.example.receipeApp.RunnerTests',
  );
}
