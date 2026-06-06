import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/auth_serivce/auth_get.dart';
import '../../features/auth/login/logic/cubit/login_cubit.dart';
import '../../features/auth/login/ui/login_screen.dart';
import '../../features/auth/signup/logic/cubit/signup_cubit.dart';
import '../../features/auth/signup/signup_screen.dart';
import '../../features/checkout/logic/cubit/checkout_cubit.dart';
import '../../features/checkout/ui/checkout.dart';
import '../../features/home/data/models/product_model.dart';
import '../../features/home/data/networking/home_service.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/logic/cubit/home_cubit.dart';
import '../../features/home/ui/home.dart';
import '../../features/place_order/ui/placeorder.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const Login(),
          ),
        );

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignupCubit(),
            child: SignupScreen(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => HomeCubit(HomeRepo(HomeService()))..getProducts(),
            child: Home(),
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
