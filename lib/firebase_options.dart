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
    apiKey: 'AIzaSyDUwaNVfi4Nfim5FilXZfj0-vnOgBog-OE',
    appId: '1:1090259177495:web:5432317c9d94af4cf24c52',
    messagingSenderId: '1090259177495',
    projectId: 'handy-dois',
    authDomain: 'handy-dois.firebaseapp.com',
    databaseURL: 'https://handy-dois-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'handy-dois.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmALBg9Dhla6piIk0E16joLacERIuJcXU',
    appId: '1:1090259177495:android:25a93adc743a6e17f24c52',
    messagingSenderId: '1090259177495',
    projectId: 'handy-dois',
    databaseURL: 'https://handy-dois-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'handy-dois.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDSMGcOcUwm7ArV2H-usZrEJ8slnyJ25PM',
    appId: '1:1090259177495:ios:97394c35240b7557f24c52',
    messagingSenderId: '1090259177495',
    projectId: 'handy-dois',
    databaseURL: 'https://handy-dois-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'handy-dois.appspot.com',
    androidClientId: '1090259177495-pc5j6ld7a8o7n98v5frgm4gqgah251em.apps.googleusercontent.com',
    iosClientId: '1090259177495-2r9r8gmmmn5ln0649lbpgrta1qj04u55.apps.googleusercontent.com',
    iosBundleId: 'com.example.handy',
  );
}