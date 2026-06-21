import 'package:flutter/material.dart';
import 'package:flutter_application/core/di/dependency_injection.dart';
import 'package:flutter_application/core/routing/routes.dart';
import 'package:flutter_application/features/auth/data/auth_get.dart';
import 'package:flutter_application/features/auth/presentation/cubit/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:flutter_application/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:flutter_application/features/auth/presentation/cubit/sign_up_cubit/signup_cubit.dart';

import 'package:flutter_application/features/auth/presentation/screens/login/login_screen.dart';
import 'package:flutter_application/features/auth/presentation/screens/signup/signup_screen.dart';
import 'package:flutter_application/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:flutter_application/features/checkout/ui/checkout.dart';
import 'package:flutter_application/features/home/data/models/product_model.dart';
import 'package:flutter_application/features/home/data/networking/home_service.dart';
import 'package:flutter_application/features/home/data/repo/home_repo.dart';
import 'package:flutter_application/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_application/features/home/ui/home.dart';
import 'package:flutter_application/features/place_order/ui/placeorder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<LoginCubit>()),
              BlocProvider(create: (context) => getIt<GoogleSignInCubit>()),
            ],
            child: const LoginScreen(),
          ),
        );

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => HomeCubit(HomeRepo(HomeService()))..getProducts(),
            child: const Home(),
          ),
        );

      case Routes.checkoutScreen:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CheckoutCubit(),
            child: Checkout(product: product),
          ),
        );

      case Routes.placeOrderScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final product = args['product'] as ProductModel;
        final checkoutCubit = args['checkoutCubit'] as CheckoutCubit;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: checkoutCubit,
            child: PlaceOrder(product: product),
          ),
        );

      case Routes.authGate:
        return MaterialPageRoute(builder: (_) => const AuthGate());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
