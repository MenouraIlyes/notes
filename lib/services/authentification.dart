import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  // Google sing in
  Future<User?> signInWithGoogle() async {
    try {
      // Begin interactive sign in process
      final GoogleSignInAccount? gUser = await GoogleSignIn(
        scopes: ["profile", "email"],
      ).signIn();

      if (gUser == null) {
        // The user canceled the sign-in
        return null;
      }

      // Obtain auth details from request
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      // Create a new credential for user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Finally, sign in
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      print('Error during the google sign in :${e.toString()}');
      return null;
    }
  }

  // check if the user exists
  Future<bool> isNewUser(User user) async {
    // Check if user is newly created based on creation time
    DateTime? creationTime = user.metadata.creationTime;
    final now = DateTime.now();
    final differenceInMinutes = now.difference(creationTime!).inMinutes;
    return differenceInMinutes < 0.1; // Adjust threshold as needed
  }
}
