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
    apiKey: 'AIzaSyBCKz8pMQ4TMIvtLHxH5NN6wjdLd9gVyJk',
    appId: '1:811233566217:web:cf981fa3b35600b481a2d8',
    messagingSenderId: '811233566217',
    projectId: 'appchat-34837',
    authDomain: 'appchat-34837.firebaseapp.com',
    databaseURL: 'https://appchat-34837-default-rtdb.firebaseio.com',
    storageBucket: 'appchat-34837.appspot.com',
    measurementId: 'G-SQ2950SPTK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEHzPf5g5i0ujdNJrHHx3Vc3h1rmi25eU',
    appId: '1:811233566217:android:a438bdc55d712abd81a2d8',
    messagingSenderId: '811233566217',
    projectId: 'appchat-34837',
    databaseURL: 'https://appchat-34837-default-rtdb.firebaseio.com',
    storageBucket: 'appchat-34837.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVKfCeBOtpVxbl_fjBEbwrOFpdttf-3UM',
    appId: '1:811233566217:ios:7c17ce9b31c317e481a2d8',
    messagingSenderId: '811233566217',
    projectId: 'appchat-34837',
    databaseURL: 'https://appchat-34837-default-rtdb.firebaseio.com',
    storageBucket: 'appchat-34837.appspot.com',
    iosClientId: '811233566217-sfmoifak1ldv525kqi9faht7d08iql43.apps.googleusercontent.com',
    iosBundleId: 'y',
  );
}