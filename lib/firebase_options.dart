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
    apiKey: 'AIzaSyDuE3x7LYhHmNRdn6bzRGD2VuMvyItQuGQ',
    appId: '1:145045699351:web:0a58fa001e40fd36ae1552',
    messagingSenderId: '145045699351',
    projectId: 'chat-messenger-8f066',
    authDomain: 'chat-messenger-8f066.firebaseapp.com',
    storageBucket: 'chat-messenger-8f066.appspot.com',
    measurementId: 'G-8R956BYHHE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8LTYyas4X-Zok-JpfYO7_02PHXsi6nMw',
    appId: '1:145045699351:android:9c94174296b98c2eae1552',
    messagingSenderId: '145045699351',
    projectId: 'chat-messenger-8f066',
    storageBucket: 'chat-messenger-8f066.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtxz-v1DSB3rxinKvyA_mTv3RjzA1OjHU',
    appId: '1:145045699351:ios:c08df27e294ea480ae1552',
    messagingSenderId: '145045699351',
    projectId: 'chat-messenger-8f066',
    storageBucket: 'chat-messenger-8f066.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtxz-v1DSB3rxinKvyA_mTv3RjzA1OjHU',
    appId: '1:145045699351:ios:7fbddc331e3e401bae1552',
    messagingSenderId: '145045699351',
    projectId: 'chat-messenger-8f066',
    storageBucket: 'chat-messenger-8f066.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}