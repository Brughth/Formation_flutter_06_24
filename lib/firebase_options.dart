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
    apiKey: 'AIzaSyBrJluOdl0VvlqlTCisFUVBXY8cfZoGDGs',
    appId: '1:656919954465:web:f23e63c0cca97a6b2a4f60',
    messagingSenderId: '656919954465',
    projectId: 'formationflutter-fe775',
    authDomain: 'formationflutter-fe775.firebaseapp.com',
    storageBucket: 'formationflutter-fe775.appspot.com',
    measurementId: 'G-TQBV65NQDR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGA3MWSaLoRWadUExh2g3CaFOJakiduHY',
    appId: '1:656919954465:android:8d5d5728b43fa3ed2a4f60',
    messagingSenderId: '656919954465',
    projectId: 'formationflutter-fe775',
    storageBucket: 'formationflutter-fe775.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBU8vvgcvEbS57pNjp09_trgYyxmZnejG8',
    appId: '1:656919954465:ios:ad5b4b977727c22f2a4f60',
    messagingSenderId: '656919954465',
    projectId: 'formationflutter-fe775',
    storageBucket: 'formationflutter-fe775.appspot.com',
    iosBundleId: 'com.example.formationFlutterJoin24',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBU8vvgcvEbS57pNjp09_trgYyxmZnejG8',
    appId: '1:656919954465:ios:ad5b4b977727c22f2a4f60',
    messagingSenderId: '656919954465',
    projectId: 'formationflutter-fe775',
    storageBucket: 'formationflutter-fe775.appspot.com',
    iosBundleId: 'com.example.formationFlutterJoin24',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBrJluOdl0VvlqlTCisFUVBXY8cfZoGDGs',
    appId: '1:656919954465:web:b1b6e70cddda6d1b2a4f60',
    messagingSenderId: '656919954465',
    projectId: 'formationflutter-fe775',
    authDomain: 'formationflutter-fe775.firebaseapp.com',
    storageBucket: 'formationflutter-fe775.appspot.com',
    measurementId: 'G-EVKPKWEPKW',
  );
}
