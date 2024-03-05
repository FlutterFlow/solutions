import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyADv4hZm-LK3x9RpHmc0wH3wkvIOEyvh9w",
            authDomain: "push-notification-test-1751d.firebaseapp.com",
            projectId: "push-notification-test-1751d",
            storageBucket: "push-notification-test-1751d.appspot.com",
            messagingSenderId: "132300664508",
            appId: "1:132300664508:web:0bdfb156f5087f78422ab9",
            measurementId: "G-S6R5KEGP4Q"));
  } else {
    await Firebase.initializeApp();
  }
}
