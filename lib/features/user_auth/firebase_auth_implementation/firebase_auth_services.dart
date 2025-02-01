//
//
//
//
// import 'package:firebase_auth/firebase_auth.dart';
//
// import '../../../global/common/toast.dart';
//
//
// class FirebaseAuthService {
//
//   FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<User?> signUpWithEmailAndPassword(String email, String password) async {
//
//     try {
//       UserCredential credential =await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       return credential.user;
//     } on FirebaseAuthException catch (e) {
//
//       if (e.code == 'email-already-in-use') {
//         showToast(message: 'The email address is already in use.');
//       } else {
//         showToast(message: 'An error occurred: ${e.code}');
//       }
//     }
//     return null;
//
//   }
//
//   Future<User?> signInWithEmailAndPassword(String email, String password) async {
//
//     try {
//       UserCredential credential =await _auth.signInWithEmailAndPassword(email: email, password: password);
//       return credential.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found' || e.code == 'wrong-password') {
//         showToast(message: 'Invalid email or password.');
//       } else {
//         showToast(message: 'An error occurred: ${e.code}');
//       }
//
//     }
//     return null;
//
//   }
//
//
//
//
// }
//
//


import 'package:firebase_auth/firebase_auth.dart';
import '../../../global/common/toast.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuthException errors
      if (e.code == 'email-already-in-use') {
        showToast(message: 'The email address is already in use.');
      } else if (e.code == 'weak-password') {
        showToast(message: 'The password is too weak.');
      } else if (e.code == 'invalid-email') {
        showToast(message: 'The email address is invalid.');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }
    } catch (e) {
      // Handle general exceptions (e.g., network issues)
      showToast(message: 'An unexpected error occurred: $e');
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuthException errors
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(message: 'Invalid email or password.');
      } else if (e.code == 'invalid-email') {
        showToast(message: 'The email address is invalid.');
      } else if (e.code == 'user-disabled') {
        showToast(message: 'This account has been disabled.');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }
    } catch (e) {
      // Handle general exceptions (e.g., network issues)
      showToast(message: 'An unexpected error occurred: $e');
    }
    return null;
  }
}