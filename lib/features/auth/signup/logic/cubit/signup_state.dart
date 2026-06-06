
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignUpState<T> with _$SignUpState<T> {
  const factory SignUpState.initial() = _Initial;

  const factory SignUpState.signupLoading() = SignUpLoading;
  const factory SignUpState.signupSuccess(T data) = SignUpSuccess<T>;
  const factory SignUpState.error({required String message}) = Error;
}
