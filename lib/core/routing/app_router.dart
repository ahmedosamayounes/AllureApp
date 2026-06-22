import 'package:flutter/material.dart';
import '../../features/checkout/presentation/screens/place_order_screen.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';
import '../../features/auth/presentation/screens/auth_get.dart';
import '../../features/auth/presentation/cubit/google_sign_in_cubit/google_sign_in_cubit.dart';
import '../../features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/cubit/sign_up_cubit/signup_cubit.dart';

import '../../features/auth/presentation/screens/login/login_screen.dart';
import '../../features/auth/presentation/screens/signup/signup_screen.dart';
import '../../features/checkout/presentation/cubit/checkout_cubit.dart';
import '../../features/checkout/presentation/screens/checkout_screen.dart';
import '../../features/home/data/models/product_model.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/home/presentation/screens/home_screen.dart';
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
            create: (_) => getIt<HomeCubit>()..getProducts(),
            child: const HomeScreen(),
          ),
        );

      case Routes.checkoutScreen:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CheckoutCubit>(),
            child: CheckoutScreen(product: product),
          ),
        );

      case Routes.placeOrderScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final product = args['product'] as ProductModel;
        final checkoutCubit = args['checkoutCubit'] as CheckoutCubit;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: checkoutCubit,
            child: PlaceOrderScreen(product: product),
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
