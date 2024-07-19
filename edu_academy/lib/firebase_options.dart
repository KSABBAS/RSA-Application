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
    apiKey: 'AIzaSyCKVcdizgixVTCDebrzbWpWXQ7vUBk2SRo',
    appId: '1:683845387878:web:ea70e31090d15e64ba0fa7',
    messagingSenderId: '683845387878',
    projectId: 'rsa-app-3ec3f',
    authDomain: 'rsa-app-3ec3f.firebaseapp.com',
    storageBucket: 'rsa-app-3ec3f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACZEenMlS1ugJWpqeCTvix5cIhkGpq2Yo',
    appId: '1:683845387878:android:d8b83d6641ae0aafba0fa7',
    messagingSenderId: '683845387878',
    projectId: 'rsa-app-3ec3f',
    storageBucket: 'rsa-app-3ec3f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-dEsthNDE71O5klYi3pN4OdeQ8oW1eXw',
    appId: '1:683845387878:ios:078172c986bcee13ba0fa7',
    messagingSenderId: '683845387878',
    projectId: 'rsa-app-3ec3f',
    storageBucket: 'rsa-app-3ec3f.appspot.com',
    iosBundleId: 'com.example.eduAcademy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-dEsthNDE71O5klYi3pN4OdeQ8oW1eXw',
    appId: '1:683845387878:ios:078172c986bcee13ba0fa7',
    messagingSenderId: '683845387878',
    projectId: 'rsa-app-3ec3f',
    storageBucket: 'rsa-app-3ec3f.appspot.com',
    iosBundleId: 'com.example.eduAcademy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCKVcdizgixVTCDebrzbWpWXQ7vUBk2SRo',
    appId: '1:683845387878:web:7530086403d14b6bba0fa7',
    messagingSenderId: '683845387878',
    projectId: 'rsa-app-3ec3f',
    authDomain: 'rsa-app-3ec3f.firebaseapp.com',
    storageBucket: 'rsa-app-3ec3f.appspot.com',
  );
}
