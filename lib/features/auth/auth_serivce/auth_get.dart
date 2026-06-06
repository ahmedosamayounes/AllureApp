import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/colors.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData && snapshot.data != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, Routes.homeScreen);
          });
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Colorss.primreColor),
            ),
          );
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, Routes.loginScreen);
        });
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(color: Colorss.primreColor),
          ),
        );
      },
    );
  }
}
