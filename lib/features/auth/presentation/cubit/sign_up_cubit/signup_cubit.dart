import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/firbase_networking/api_result.dart';
import '../../../domain/use_case/sign_up_use_case.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignupCubit({required SignUpUseCase signUpUseCase})
    : _signUpUseCase = signUpUseCase,
      super(SignUpState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void emitSignUpState() async {
    emit(const SignUpState.signupLoading());

    final response = await _signUpUseCase(
      email: emailController.text.trim() ,
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
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
