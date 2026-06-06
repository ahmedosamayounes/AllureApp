import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../auth_shared_widgets/auth_button.dart';
import '../auth_shared_widgets/auth_header.dart';
import 'logic/cubit/signup_cubit.dart';
import 'widgets/already_have_account.dart';
import 'widgets/email_and_password_signup.dart';
import 'widgets/sign_up_bloc_listener.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,

        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(12.0.r),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthHeader(
                    name: 'Create an account',
                    description:
                        'Create your account and start your journey with us',
                  ),

                  Gap(50.h),

                  const EmailAndPasswordSignup(),
                  Gap(30.h),

                  //Signup Button
                  AuthButton(
                    isLoading: isLoading,
                    name: 'Sign Up',
                    onTap: () {
                      validateThenDoSignUP(context);
                    },
                  ),

                  Gap(10.h),

                  const AlreadyHaveAccount(),
                  const SignupBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignUP(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignUpState();
    }
  }
}
