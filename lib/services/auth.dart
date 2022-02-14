import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
  Future<String> signIn({String phoneNumber, String password}) async {
    try {
      await _firebaseAuth.signInWithPhoneNumber(phoneNumber);
      return "Singed in";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Signed UP';
    } catch (e) {
      return e.message;
    }
  }
}
