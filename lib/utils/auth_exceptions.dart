import 'package:firebase_auth/firebase_auth.dart';

class AuthExceptionHandler {
  static String handleException(Object e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'user-not-found':
          return 'No user found with this email.';
        case 'wrong-password':
          return 'Incorrect password. Please try again.';
        case 'email-already-in-use':
          return 'This email address is already in use.';
        case 'invalid-email':
          return 'The email address is invalid.';
        case 'weak-password':
          return 'The password is too weak.';
        case 'network-request-failed':
          return 'Please check your internet connection.';
        default:
          return 'Authentication failed: ${e.message}';
      }
    }
    return 'An unexpected error occurred. Please try again.';
  }
}
