import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // WEB
  static const FirebaseOptions web = FirebaseOptions(
  apiKey: "AIzaSyDAayTBl0N8JWKciAR8UR-zNa9pZDqf4o8",
  authDomain: "aventura360.firebaseapp.com",
  projectId: "aventura360",
  storageBucket: "aventura360.appspot.com", // ✔ CORREGIDO
  messagingSenderId: "950677884388",
  appId: "1:950677884388:web:5f1d3f3b1801e27df64bf1",
  measurementId: "G-2KR11L13C2",
);

  // ANDROID
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "YOUR_ANDROID_API_KEY",
    appId: "YOUR_ANDROID_APP_ID",
    messagingSenderId: "950677884388",
    projectId: "aventura360",
    storageBucket: "aventura360.firebasestorage.app",
  );

  // IOS
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "YOUR_IOS_API_KEY",
    appId: "YOUR_IOS_APP_ID",
    messagingSenderId: "950677884388",
    projectId: "aventura360",
    storageBucket: "aventura360.firebasestorage.app",
    iosBundleId: "com.example.paginasconrutas",
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: "YOUR_MACOS_API_KEY",
    appId: "YOUR_MACOS_APP_ID",
    messagingSenderId: "950677884388",
    projectId: "aventura360",
    storageBucket: "aventura360.firebasestorage.app",
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: "YOUR_WINDOWS_API_KEY",
    appId: "YOUR_WINDOWS_APP_ID",
    messagingSenderId: "950677884388",
    projectId: "aventura360",
    storageBucket: "aventura360.firebasestorage.app",
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: "YOUR_LINUX_API_KEY",
    appId: "YOUR_LINUX_APP_ID",
    messagingSenderId: "950677884388",
    projectId: "aventura360",
    storageBucket: "aventura360.firebasestorage.app",
  );
}
