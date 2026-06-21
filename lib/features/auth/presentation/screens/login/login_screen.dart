// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'package:flutter/material.dart';
import 'package:flutter_application/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:flutter_application/features/auth/presentation/screens/google_sign_in/google_sign_in.dart';
import 'package:flutter_application/features/auth/presentation/screens/login/widgets/do_not_have_account.dart';
import 'package:flutter_application/features/auth/presentation/screens/login/widgets/email_and_password_login.dart';
import 'package:flutter_application/features/auth/presentation/screens/login/widgets/login_bloc_listener.dart';
import 'package:flutter_application/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter_application/features/auth/presentation/widgets/auth_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.all(12.r),
            child: Form(
              key: context.read<LoginCubit>().formKey,

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AuthHeader(
                      name: 'Welcome Back',
                      description:
                          'Great to see you again — let’s get you signed in',
                    ),
                    Gap(50.h),

                    // Forms
                    const EmailAndPasswordLogin(),
                    Gap(30.h),

                    //Login Button
                    AuthButton(
                      isLoading: isLoading,
                      name: 'Login',

                      onTap: () {
                        validateThenDoLogin(context);
                      },
                    ),

                    Gap(20.h),
                    Center(
                      child: Text('OR ', style: TextStyle(fontSize: 16.sp)),
                    ),
                    Gap(15.h),
                    const LoginWithGoogle(),
                    Gap(10.h),
                    const DoNotHaveAccount(),
                    const LoginBlocListener(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
