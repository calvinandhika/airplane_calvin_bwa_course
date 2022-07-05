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
    apiKey: 'AIzaSyASJ3aysZy5ngtyBn7gHgqm6oEf9melQY8',
    appId: '1:259497910756:web:b5735f801777239383e7f1',
    messagingSenderId: '259497910756',
    projectId: 'airplane-4c2d7',
    authDomain: 'airplane-4c2d7.firebaseapp.com',
    storageBucket: 'airplane-4c2d7.appspot.com',
    measurementId: 'G-L4K4YWNGHS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKhdYMyHks3E6c_FLO9TdqgkFi74U-zGQ',
    appId: '1:259497910756:android:99732e4e6f5c8cda83e7f1',
    messagingSenderId: '259497910756',
    projectId: 'airplane-4c2d7',
    storageBucket: 'airplane-4c2d7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDeffCxPCwN_4-7229b2if7yiNVO8smb0c',
    appId: '1:259497910756:ios:baffea5d246804e883e7f1',
    messagingSenderId: '259497910756',
    projectId: 'airplane-4c2d7',
    storageBucket: 'airplane-4c2d7.appspot.com',
    iosClientId: '259497910756-ifb67p7h0q1jcojgd88djijvvgngsp7d.apps.googleusercontent.com',
    iosBundleId: 'com.calvinandhika.travelApps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDeffCxPCwN_4-7229b2if7yiNVO8smb0c',
    appId: '1:259497910756:ios:baffea5d246804e883e7f1',
    messagingSenderId: '259497910756',
    projectId: 'airplane-4c2d7',
    storageBucket: 'airplane-4c2d7.appspot.com',
    iosClientId: '259497910756-ifb67p7h0q1jcojgd88djijvvgngsp7d.apps.googleusercontent.com',
    iosBundleId: 'com.calvinandhika.travelApps',
  );
}