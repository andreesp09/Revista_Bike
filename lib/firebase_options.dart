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
    apiKey: 'AIzaSyAS-qg-pmcIdarRSo89DYPEQIuQifH6UhE',
    appId: '1:66867026845:web:cd76dfa95cdc0cbea0ed74',
    messagingSenderId: '66867026845',
    projectId: 'revistabike-69c6d',
    authDomain: 'revistabike-69c6d.firebaseapp.com',
    databaseURL: 'https://revistabike-69c6d-default-rtdb.firebaseio.com',
    storageBucket: 'revistabike-69c6d.appspot.com',
    measurementId: 'G-H46S6SNP3W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKbulsX7CPD9uZPqX7HzhsemmMq8XbxqM',
    appId: '1:66867026845:android:db51fd85f7a10bf8a0ed74',
    messagingSenderId: '66867026845',
    projectId: 'revistabike-69c6d',
    databaseURL: 'https://revistabike-69c6d-default-rtdb.firebaseio.com',
    storageBucket: 'revistabike-69c6d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACBgblBSNu7vnFsIcQNBpN2_f5WbCj-Ao',
    appId: '1:66867026845:ios:eed52681d1ab0f34a0ed74',
    messagingSenderId: '66867026845',
    projectId: 'revistabike-69c6d',
    databaseURL: 'https://revistabike-69c6d-default-rtdb.firebaseio.com',
    storageBucket: 'revistabike-69c6d.appspot.com',
    iosClientId: '66867026845-l7frgucms0ih42u6d59elfphu8h1ljbk.apps.googleusercontent.com',
    iosBundleId: 'com.example.revistabikeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyACBgblBSNu7vnFsIcQNBpN2_f5WbCj-Ao',
    appId: '1:66867026845:ios:eba02453e075a961a0ed74',
    messagingSenderId: '66867026845',
    projectId: 'revistabike-69c6d',
    databaseURL: 'https://revistabike-69c6d-default-rtdb.firebaseio.com',
    storageBucket: 'revistabike-69c6d.appspot.com',
    iosClientId: '66867026845-54s3t9bi34rm8s26qjsv4qs7n835a8lf.apps.googleusercontent.com',
    iosBundleId: 'com.example.revistabikeApp.RunnerTests',
  );
}
