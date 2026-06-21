import '../../../../core/firbase_networking/api_result.dart';
import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;
  LoginUseCase(AuthRepository repository) : _repository = repository;
  Future<ApiResult<UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return await _repository.login(email: email, password: password);
  }
}
