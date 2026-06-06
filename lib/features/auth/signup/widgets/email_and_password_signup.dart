import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../auth_shared_widgets/auth_text_form_filed.dart';
import '../logic/cubit/signup_cubit.dart';
import 'paswword_validations.dart';

class EmailAndPasswordSignup extends StatefulWidget {
  const EmailAndPasswordSignup({super.key});

  @override
  State<EmailAndPasswordSignup> createState() => _EmailAndPasswordSignupState();
}

class _EmailAndPasswordSignupState extends State<EmailAndPasswordSignup> {
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  bool isObscureText = true;
  bool isLoading = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,

      child: Column(
        children: [
          //Email Adreess
          AuthTextFormFiled(
            controller: context.read<SignupCubit>().emailController,
            hinttext: 'Email Adreess',
            keyboardType: TextInputType.emailAddress,
            icon: Icon(Icons.email_outlined),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          Gap(20.h),

          //Password
          AuthTextFormFiled(
            keyboardType: TextInputType.visiblePassword,
            controller: context.read<SignupCubit>().passwordController,
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            hinttext: 'Password',
            icon: Icon(Icons.lock_outline),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }

              return null;
            },
          ),
          Gap(20.h),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
