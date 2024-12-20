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
    apiKey: 'AIzaSyAiJritvudDniSekHZnom8eKHl244_toCk',
    appId: '1:8792745098:web:3f66024a8faa198ff4b973',
    messagingSenderId: '8792745098',
    projectId: 'authentication-a6cf3',
    authDomain: 'authentication-a6cf3.firebaseapp.com',
    storageBucket: 'authentication-a6cf3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFh8AFMzhLLZUTYDNC_moALsolK2KlVXI',
    appId: '1:8792745098:android:bfe978c6110bc1fef4b973',
    messagingSenderId: '8792745098',
    projectId: 'authentication-a6cf3',
    storageBucket: 'authentication-a6cf3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8A5eKS-m242W2nyjK7pNiWjI1NOcuHOQ',
    appId: '1:8792745098:ios:a9119ac853293395f4b973',
    messagingSenderId: '8792745098',
    projectId: 'authentication-a6cf3',
    storageBucket: 'authentication-a6cf3.appspot.com',
    iosBundleId: 'com.example.authentication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD8A5eKS-m242W2nyjK7pNiWjI1NOcuHOQ',
    appId: '1:8792745098:ios:a9119ac853293395f4b973',
    messagingSenderId: '8792745098',
    projectId: 'authentication-a6cf3',
    storageBucket: 'authentication-a6cf3.appspot.com',
    iosBundleId: 'com.example.authentication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAiJritvudDniSekHZnom8eKHl244_toCk',
    appId: '1:8792745098:web:8f1a79ed1e435ae8f4b973',
    messagingSenderId: '8792745098',
    projectId: 'authentication-a6cf3',
    authDomain: 'authentication-a6cf3.firebaseapp.com',
    storageBucket: 'authentication-a6cf3.appspot.com',
  );
}
