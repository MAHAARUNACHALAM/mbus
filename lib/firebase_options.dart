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
    apiKey: 'AIzaSyBZvBvLaLwNTpuwjfydiJITWxY4l9pMCdQ',
    appId: '1:39285317316:web:424049424609e5e1413391',
    messagingSenderId: '39285317316',
    projectId: 'mbus-9c563',
    authDomain: 'mbus-9c563.firebaseapp.com',
    storageBucket: 'mbus-9c563.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOZeBEozpkLkH13UekFdozb2F7HyUkAyU',
    appId: '1:39285317316:android:21cc3e97200ba887413391',
    messagingSenderId: '39285317316',
    projectId: 'mbus-9c563',
    storageBucket: 'mbus-9c563.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_JHd3BmVQtXlPV2Hc52gw-i4WQMvSL-I',
    appId: '1:39285317316:ios:a38db72c8e32d1c8413391',
    messagingSenderId: '39285317316',
    projectId: 'mbus-9c563',
    storageBucket: 'mbus-9c563.appspot.com',
    iosClientId: '39285317316-d2jgf07p1s9aagcicja9a1pkk1g6pnvk.apps.googleusercontent.com',
    iosBundleId: 'com.example.mbus',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC_JHd3BmVQtXlPV2Hc52gw-i4WQMvSL-I',
    appId: '1:39285317316:ios:a38db72c8e32d1c8413391',
    messagingSenderId: '39285317316',
    projectId: 'mbus-9c563',
    storageBucket: 'mbus-9c563.appspot.com',
    iosClientId: '39285317316-d2jgf07p1s9aagcicja9a1pkk1g6pnvk.apps.googleusercontent.com',
    iosBundleId: 'com.example.mbus',
  );
}