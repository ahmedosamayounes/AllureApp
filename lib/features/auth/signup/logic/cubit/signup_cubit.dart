import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/firbase_networking/api_result.dart';
import '../../../auth_serivce/auth_service.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignUpState> {
  final AuthService _authService = AuthService();

  SignupCubit() : super(SignUpState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void emitSignUpState() async {
    emit(const SignUpState.signupLoading());

    final response = await _authService.signup(
      email: emailController.text,
      password: passwordController.text,
    );

    response.when(
      success: (loginResponse) async {
        emit(SignUpState.signupSuccess(loginResponse));
      },
      failure: (error) {
        emit(SignUpState.error(message: error.toString()));
      },
    );
  }
}
