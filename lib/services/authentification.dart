import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  // Email sign in
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      // login the user
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User?> registerWithEmail(String email, String password) async {
    try {
      // register user
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // Handle email already in use error (display message, etc.)
        print('The email address is already in use by another account.');
        return null;
      } else {
        // Handle other FirebaseAuthException codes (optional)
        print('FirebaseAuthException: ${e.code}');
        return null;
      }
    } catch (e) {
      // Handle other exceptions that might occur
      print('An error occurred: ${e.toString()}');
      return null;
    }
  }

  // Sign out method
  Future<void> signOut(BuildContext context) async {
    try {
      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
