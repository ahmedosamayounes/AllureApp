import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/user_entity.dart';

part 'google_sign_in_state.freezed.dart';
@freezed
class GoogleSignInState with _$GoogleSignInState {
  const factory GoogleSignInState.initial() = _Initial;
  const factory GoogleSignInState.loading() = _Loading;
  const factory GoogleSignInState.success(UserEntity userEntity) = _Success;
  const factory GoogleSignInState.error({required String message}) = _Error;
}