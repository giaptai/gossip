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
    apiKey: 'AIzaSyDsT_rqVX2gLzTwnj3SeSDUwJyRoSmXhYs',
    appId: '1:302622152430:web:98e9371fd1431ff8a585ff',
    messagingSenderId: '302622152430',
    projectId: 'gossip-data-84d31',
    authDomain: 'gossip-data-84d31.firebaseapp.com',
    storageBucket: 'gossip-data-84d31.firebasestorage.app',
    measurementId: 'G-675K7GZ86Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUBzVg8YwibUZcJUSa7TgxoUMommYdjpo',
    appId: '1:302622152430:android:0af1b44aeb2b8e26a585ff',
    messagingSenderId: '302622152430',
    projectId: 'gossip-data-84d31',
    storageBucket: 'gossip-data-84d31.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBb0njxlVJOjXaeqvsbERCqHYh6SppKMx4',
    appId: '1:302622152430:ios:08e6a7e1a321868da585ff',
    messagingSenderId: '302622152430',
    projectId: 'gossip-data-84d31',
    storageBucket: 'gossip-data-84d31.firebasestorage.app',
    iosBundleId: 'com.example.gossipV01',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBb0njxlVJOjXaeqvsbERCqHYh6SppKMx4',
    appId: '1:302622152430:ios:08e6a7e1a321868da585ff',
    messagingSenderId: '302622152430',
    projectId: 'gossip-data-84d31',
    storageBucket: 'gossip-data-84d31.firebasestorage.app',
    iosBundleId: 'com.example.gossipV01',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDsT_rqVX2gLzTwnj3SeSDUwJyRoSmXhYs',
    appId: '1:302622152430:web:8a46af43c364e211a585ff',
    messagingSenderId: '302622152430',
    projectId: 'gossip-data-84d31',
    authDomain: 'gossip-data-84d31.firebaseapp.com',
    storageBucket: 'gossip-data-84d31.firebasestorage.app',
    measurementId: 'G-36MT9D1Y9T',
  );
}
