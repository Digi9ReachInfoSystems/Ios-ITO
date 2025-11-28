import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCrxy5nTs_OKyZY3QSYpn3z07_bPYDnURs",
            authDomain: "indian-talent-olympaid.firebaseapp.com",
            projectId: "indian-talent-olympaid",
            storageBucket: "indian-talent-olympaid.appspot.com",
            messagingSenderId: "453770555722",
            appId: "1:453770555722:web:cead4c459dbff37a5ed1b3",
            measurementId: "G-PQMZPCE5ET"));
  } else {
    await Firebase.initializeApp();
  }
}
