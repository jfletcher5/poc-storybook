import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC2nL16zJhSjuVsMRUk0zjG6R6mUf493_o",
            authDomain: "poc-storybook-s3b929.firebaseapp.com",
            projectId: "poc-storybook-s3b929",
            storageBucket: "poc-storybook-s3b929.appspot.com",
            messagingSenderId: "222835500576",
            appId: "1:222835500576:web:ebee8c9732556a99177e45"));
  } else {
    await Firebase.initializeApp();
  }
}
