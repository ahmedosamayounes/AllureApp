import '../../../../core/firbase_networking/api_result.dart';
import '../entity/user_entity.dart';

abstract class AuthRepository {
  Future<ApiResult<UserEntity>> login({
    required String email,
    required String password,
  });
  Future<ApiResult<UserEntity>> signUp({
    required String email,
    required String password,
  });
  Future<ApiResult<UserEntity>> signInWithGoogle();
}
