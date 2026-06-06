import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/firbase_networking/api_result.dart';
import '../../../auth_serivce/auth_service.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService _authService = AuthService();
  LoginCubit() : super(LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _authService.login(
      email: emailController.text,
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
}
