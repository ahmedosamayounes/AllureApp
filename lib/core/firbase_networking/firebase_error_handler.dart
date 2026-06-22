import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorHandler {
  static String handle(dynamic e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'invalid-email':
          return 'Invalid email address';
        case 'user-disabled':
          return 'This account has been disabled';
        case 'user-not-found':
          return 'No user found with this email';
        case 'wrong-password':
          return 'Incorrect password';
        case 'email-already-in-use':
          return 'This email is already in use';
        case 'operation-not-allowed':
          return 'This sign-in method is not enabled';
        case 'weak-password':
          return 'Password is too weak';
        case 'too-many-requests':
          return 'Too many attempts. Try again later';
        case 'network-request-failed':
          return 'Please check your internet connection';
        case 'invalid-credential':
          return 'Email or password is incorrect';
        case 'account-exists-with-different-credential':
          return 'Account exists with a different sign-in method';
        case 'invalid-verification-code':
          return 'Invalid verification code';
        case 'invalid-verification-id':
          return 'Invalid verification ID';
        case 'session-expired':
          return 'Session expired. Please try again';
        default:
          return e.message ?? 'Something went wrong. Please try again';
      }
    } else if (e is FirebaseException) {
      switch (e.code) {
        case 'permission-denied':
          return 'You do not have permission to perform this action';
        case 'unavailable':
          return 'Firebase services are currently unavailable. Try again later';
        default:
          return e.message ?? 'Firebase error occurred';
      }
    } else {
      return e.toString();
    }
  }
}