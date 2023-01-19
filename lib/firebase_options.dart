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
    apiKey: 'AIzaSyCgNQtxiQsHfNx38v_1tLEuwBpJaZ31V-c',
    appId: '1:201378912298:web:a0c190308af2b3c5720b53',
    messagingSenderId: '201378912298',
    projectId: 'bootcamppgt',
    authDomain: 'bootcamppgt.firebaseapp.com',
    storageBucket: 'bootcamppgt.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5C5Z7WwpbGTrZMxe8nnZ0GGwvN1kbTzQ',
    appId: '1:201378912298:android:44e0a6a8f2d6475f720b53',
    messagingSenderId: '201378912298',
    projectId: 'bootcamppgt',
    storageBucket: 'bootcamppgt.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjdlil7pw5T7nSO_o5GjPTfWCkZBeRq3Y',
    appId: '1:201378912298:ios:d7734f29410573c7720b53',
    messagingSenderId: '201378912298',
    projectId: 'bootcamppgt',
    storageBucket: 'bootcamppgt.appspot.com',
    iosClientId: '201378912298-i7re690fo9ad6j3854i36ohcbrqg216f.apps.googleusercontent.com',
    iosBundleId: 'com.example.httpFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAjdlil7pw5T7nSO_o5GjPTfWCkZBeRq3Y',
    appId: '1:201378912298:ios:d7734f29410573c7720b53',
    messagingSenderId: '201378912298',
    projectId: 'bootcamppgt',
    storageBucket: 'bootcamppgt.appspot.com',
    iosClientId: '201378912298-i7re690fo9ad6j3854i36ohcbrqg216f.apps.googleusercontent.com',
    iosBundleId: 'com.example.httpFlutter',
  );
}
