import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/firbase_networking/api_result.dart';
import '../../../domain/use_case/login_use_case.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  LoginCubit({required LoginUseCase loginUseCase}): _loginUseCase = loginUseCase, super( const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginUseCase(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    response.when(
      success: (loginResponse) async {
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(message: error.toString()));
      },
    );
  }
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
