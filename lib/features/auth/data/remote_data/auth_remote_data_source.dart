import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/entity/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> login({required String email, required String password});
  Future<UserEntity> signup({required String email, required String password});
  Future<UserEntity> signInWithGoogle();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRemoteDataSourceImpl(this._auth, this._googleSignIn);

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    final UserCredential userCredential = await _auth
        .signInWithEmailAndPassword(email: email, password: password);
    final UserEntity userEntity = UserEntity(
      email: userCredential.user?.email ?? '',
      uId: userCredential.user?.uid ?? '',
    );
    return userEntity;
  }

  @override
  Future<UserEntity> signup({
    required String email,
    required String password,
  }) async {
    final UserCredential userCredential = await _auth
        .createUserWithEmailAndPassword(email: email, password: password);
    final UserEntity userEntity = UserEntity(
      email: userCredential.user?.email ?? '',
      uId: userCredential.user?.uid ?? '',
    );
    return userEntity;
  }

  @override
  Future<UserEntity> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in cancelled',
      );
    }
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    final userCredential = await _auth.signInWithCredential(credential);
    return UserEntity(
      email: userCredential.user?.email ?? '',
      uId: userCredential.user?.uid ?? '',
    );
  }
}
