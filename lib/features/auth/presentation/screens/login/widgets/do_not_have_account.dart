import 'package:flutter/material.dart';
import '../../../../../../core/helpers/extensions.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account ?',
          style: TextStyle(color: Colors.black, fontSize: 14.sp),
        ),
        TextButton(
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colorss.primreColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            context.pushReplacementNamed(Routes.signUpScreen);
          },
        ),
      ],
    );
  }
}
