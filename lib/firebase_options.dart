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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAU3OsqC3GOElVcTmY58MLt5cNVX68q22o',
    appId: '1:1048653145005:web:3cba3472984aea4cbbf724',
    messagingSenderId: '1048653145005',
    projectId: 'notes-6a2b0',
    authDomain: 'notes-6a2b0.firebaseapp.com',
    storageBucket: 'notes-6a2b0.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCakyyW6E2Zr4sN2Pv1zvAaoH-MwgBXIJ4',
    appId: '1:1048653145005:android:9c009bbae9fdc484bbf724',
    messagingSenderId: '1048653145005',
    projectId: 'notes-6a2b0',
    storageBucket: 'notes-6a2b0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD7rvx05rTmwdu8NzlQodzdEtBDmLh64tQ',
    appId: '1:1048653145005:ios:14700e728dd749b1bbf724',
    messagingSenderId: '1048653145005',
    projectId: 'notes-6a2b0',
    storageBucket: 'notes-6a2b0.firebasestorage.app',
    iosBundleId: 'com.example.notes',
  );
}
