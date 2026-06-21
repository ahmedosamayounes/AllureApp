// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application/features/auth/presentation/cubit/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:flutter_application/features/auth/presentation/cubit/google_sign_in_cubit/google_sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../login/widgets/login_wih.dart'; 

class LoginWithGoogle extends StatelessWidget {
  const LoginWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleSignInCubit, GoogleSignInState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (userEntity) {
            
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login Successful!')),
            );
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colorss.primreColor,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                content: Text(
                  message,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ),
            );
          },
        );
      },
      builder: (context, state) {

        final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);
        
        return LoginWith(
          name: 'Google ',
          onPressed: state.maybeWhen(
            loading: () => null,
            orElse: () => () {
              context.read<GoogleSignInCubit>().emitGoogleSignInStates();
            },
          ),
        );
      },
    );
  }
}