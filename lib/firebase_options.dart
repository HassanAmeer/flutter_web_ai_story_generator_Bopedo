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
    apiKey: 'AIzaSyAx-awitmONyXEQgTZUgcR_u70ddOEcedo',
    appId: '1:349436306147:web:83ecca3c0222e68bf35bd6',
    messagingSenderId: '349436306147',
    projectId: 'deborduurshop-a41a3',
    authDomain: 'deborduurshop-a41a3.firebaseapp.com',
    storageBucket: 'deborduurshop-a41a3.appspot.com',
    measurementId: 'G-N2GDG02LLH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWskxnbZPEeNINebpZenhDiZ2PfCmlPP8',
    appId: '1:349436306147:android:7951f62219d54188f35bd6',
    messagingSenderId: '349436306147',
    projectId: 'deborduurshop-a41a3',
    storageBucket: 'deborduurshop-a41a3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsYWYDbCHxuENupi3EDGCAJAaA93NBduo',
    appId: '1:349436306147:ios:f177cd7119d5bb55f35bd6',
    messagingSenderId: '349436306147',
    projectId: 'deborduurshop-a41a3',
    storageBucket: 'deborduurshop-a41a3.appspot.com',
    iosBundleId: 'com.scorpionsol.deborduurshop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDsYWYDbCHxuENupi3EDGCAJAaA93NBduo',
    appId: '1:349436306147:ios:f177cd7119d5bb55f35bd6',
    messagingSenderId: '349436306147',
    projectId: 'deborduurshop-a41a3',
    storageBucket: 'deborduurshop-a41a3.appspot.com',
    iosBundleId: 'com.scorpionsol.deborduurshop',
  );
}
