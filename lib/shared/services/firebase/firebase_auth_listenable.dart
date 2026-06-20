import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// TODO (docs)
class FirebaseAuthStateListenable extends ChangeNotifier {
  FirebaseAuthStateListenable() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      notifyListeners();
    });
  }
}
