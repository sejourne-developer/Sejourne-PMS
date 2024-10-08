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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACUBVC2wjGtGsa7g-Y9IVEWBv18GkFJKQ',
    appId: '1:1019295180323:android:f27e8e65124e1b793a3396',
    messagingSenderId: '1019295180323',
    projectId: 'sejourne-c8bfd',
    storageBucket: 'sejourne-c8bfd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCuF4MXk9KbczM_-q9LgsY7eg1bzVKIBaE',
    appId: '1:1019295180323:ios:ca847748bd82e9293a3396',
    messagingSenderId: '1019295180323',
    projectId: 'sejourne-c8bfd',
    storageBucket: 'sejourne-c8bfd.appspot.com',
    androidClientId: '1019295180323-4epe4ncrbckmisq2i7ctpgom9canrtdi.apps.googleusercontent.com',
    iosClientId: '1019295180323-milor6r440lj2d7u25sl485toh1a5r4i.apps.googleusercontent.com',
    iosBundleId: 'com.sejourne.pms',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAzA0pRC4fNATNVf7shZNY2mEW91c9N4mw',
    appId: '1:1019295180323:web:5f080e34b35482513a3396',
    messagingSenderId: '1019295180323',
    projectId: 'sejourne-c8bfd',
    authDomain: 'sejourne-c8bfd.firebaseapp.com',
    storageBucket: 'sejourne-c8bfd.appspot.com',
    measurementId: 'G-6BH3YJVPG1',
  );

}