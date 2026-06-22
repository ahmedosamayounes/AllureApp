import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/firbase_networking/api_result.dart';
import '../../../../core/firbase_networking/firebase_error_handler.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../remote_data/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  AuthRepositoryImpl(this._remoteDataSource);
  @override
  Future<ApiResult<UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final userEntity = await _remoteDataSource.login(
        email: email,
        password: password,
      );
      return ApiResult.success(userEntity);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(FirebaseErrorHandler.handle(e));
    } catch (e) {
      return ApiResult.failure("Unexpected error occurred");
    }
  }

  @override
  Future<ApiResult<UserEntity>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final userEntity = await _remoteDataSource.signup(
        email: email,
        password: password,
      );
      return ApiResult.success(userEntity);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(FirebaseErrorHandler.handle(e));
    } catch (e) {
      return ApiResult.failure("Unexpected error occurred");
    }
  }
  
  @override
  Future<ApiResult<UserEntity>> signInWithGoogle()  async{
  try {
      final userEntity = await _remoteDataSource.signInWithGoogle();
      
      return ApiResult.success(userEntity);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(FirebaseErrorHandler.handle(e));
    } catch (e) {
      return ApiResult.failure("Unexpected error occurred during Google Sign-In");
    }
  }
}
