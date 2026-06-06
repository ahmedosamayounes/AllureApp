import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/firbase_networking/api_error_handler.dart';
import '../../../core/firbase_networking/api_result.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // login
  Future<ApiResult<UserCredential>> login({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return ApiResult.success(userCredential);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(FirebaseErrorHandler.handle(e));
    } catch (e) {
      return ApiResult.failure("Unexpected error");
    }
  }

  // Sign Up

  Future<ApiResult<UserCredential>> signup({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return ApiResult.success(userCredential);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(FirebaseErrorHandler.handle(e));
    } catch (e) {
      return ApiResult.failure("Unexpected error");
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      throw FirebaseAuthException(code: 'cancelled');
    }

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    return await _auth.signInWithCredential(credential);
  }
}
