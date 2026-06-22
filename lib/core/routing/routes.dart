import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class Routes {
  static const String authGate = '/authGate';
  static const String loginScreen = '/login_screen';
  static const String homeScreen = '/home_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String checkoutScreen = '/checkout_screen';
  static const String placeOrderScreen = '/place_order_screen';
}
