import 'package:flutter/material.dart';
import 'package:flutter_application/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import '../../../../../../core/helpers/app_regex.dart';
import '../../../widgets/auth_text_form_filed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';


class EmailAndPasswordLogin extends StatefulWidget {
  const EmailAndPasswordLogin({super.key});

  @override
  State<EmailAndPasswordLogin> createState() => _EmailAndPasswordLoginState();
}

class _EmailAndPasswordLoginState extends State<EmailAndPasswordLogin> {
  bool isObscureText = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Email Adreess
        AuthTextFormFiled(
          controller: context.read<LoginCubit>().emailController,
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
          controller: context.read<LoginCubit>().passwordController,
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
      ],
    );
  }
}
