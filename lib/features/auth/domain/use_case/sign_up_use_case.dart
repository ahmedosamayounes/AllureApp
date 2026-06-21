import '../../../../core/firbase_networking/api_result.dart';
import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _repository;
  SignUpUseCase(AuthRepository repository) : _repository = repository;
  Future<ApiResult<UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return await _repository.signUp(email: email, password: password);
  }
}
