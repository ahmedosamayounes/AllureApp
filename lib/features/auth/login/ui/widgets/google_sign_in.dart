// ignore_for_file: control_flow_in_finally, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../auth_serivce/auth_service.dart';
import 'login_wih.dart';

class LoginWithGoogle extends StatefulWidget {
  const LoginWithGoogle({super.key});

  @override
  State<LoginWithGoogle> createState() => _LoginWithGoogleState();
}

class _LoginWithGoogleState extends State<LoginWithGoogle> {
  bool isLoading = false;
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return LoginWith(
      name: 'Google ',
      onPressed: isLoading
          ? null
          : () async {
              if (!mounted) return;
              setState(() {
                isLoading = true;
              });
              try {
                await _authService.signInWithGoogle();
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colorss.primreColor,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(20),
                    ),
                    content: Text(
                      'Google sign-in failed',
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                );
              } finally {
                if (!mounted) return;
                setState(() {
                  isLoading = false;
                });
              }
            },
    );
  }
}
