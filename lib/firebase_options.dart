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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDQIF6IhtDRidfIxyv_gx6daX-adXpANgQ',
    appId: '1:536717338425:web:340b8dc852aa64ef8f2ae8',
    messagingSenderId: '536717338425',
    projectId: 'romb-form',
    authDomain: 'romb-form.firebaseapp.com',
    storageBucket: 'romb-form.appspot.com',
    measurementId: 'G-4BQ2F795YH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6oFbMsPY3h5vspYeQIczwEuenoT3Hymc',
    appId: '1:536717338425:android:f3caeb95db0a3fad8f2ae8',
    messagingSenderId: '536717338425',
    projectId: 'romb-form',
    storageBucket: 'romb-form.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSip8XMLxT3A02QvqZGRNBEgBZ4dd9rd8',
    appId: '1:536717338425:ios:1d7b57c158d0f8968f2ae8',
    messagingSenderId: '536717338425',
    projectId: 'romb-form',
    storageBucket: 'romb-form.appspot.com',
    iosClientId: '536717338425-pkug7gmlblv65gfcmcl5afli7apo6tdg.apps.googleusercontent.com',
    iosBundleId: 'hr.romb-ms.rombmarketingstrategy',
  );
}