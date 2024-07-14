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
    apiKey: 'AIzaSyD2EEXfkAaa-hX1MCE_eRAArYWWEEdZRh8',
    appId: '1:235422711950:web:9951f439b76679174889df',
    messagingSenderId: '235422711950',
    projectId: 'rsa-app-6ff6c',
    authDomain: 'rsa-app-6ff6c.firebaseapp.com',
    storageBucket: 'rsa-app-6ff6c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWIgmJoueZQYSLuk3blEmirAqlt0qJmzk',
    appId: '1:235422711950:android:f8d69481079a49264889df',
    messagingSenderId: '235422711950',
    projectId: 'rsa-app-6ff6c',
    storageBucket: 'rsa-app-6ff6c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDxAiKj1r1W8uK0Jz_id8cSFIyrgPOKjqE',
    appId: '1:235422711950:ios:71b881ff199b98264889df',
    messagingSenderId: '235422711950',
    projectId: 'rsa-app-6ff6c',
    storageBucket: 'rsa-app-6ff6c.appspot.com',
    iosBundleId: 'com.example.eduAcademy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDxAiKj1r1W8uK0Jz_id8cSFIyrgPOKjqE',
    appId: '1:235422711950:ios:71b881ff199b98264889df',
    messagingSenderId: '235422711950',
    projectId: 'rsa-app-6ff6c',
    storageBucket: 'rsa-app-6ff6c.appspot.com',
    iosBundleId: 'com.example.eduAcademy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD2EEXfkAaa-hX1MCE_eRAArYWWEEdZRh8',
    appId: '1:235422711950:web:4e8923c40c5707f54889df',
    messagingSenderId: '235422711950',
    projectId: 'rsa-app-6ff6c',
    authDomain: 'rsa-app-6ff6c.firebaseapp.com',
    storageBucket: 'rsa-app-6ff6c.appspot.com',
  );
}
