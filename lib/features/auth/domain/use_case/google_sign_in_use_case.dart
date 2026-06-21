import '../../../../core/firbase_networking/api_result.dart';
import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class GoogleSignInUseCase {
  final AuthRepository _repository;

  GoogleSignInUseCase(this._repository);

  Future<ApiResult<UserEntity>> call() async {
    return await _repository.signInWithGoogle();
  }
}