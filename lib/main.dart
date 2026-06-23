import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/data/models/product_adapter.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/services/notification_service.dart';
import 'core/stripe_payment/stripe_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Firebase_Notifications 
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService().initNotifications();
  // Hive
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  //Dependency Injection
  setupGetIt();
  //Stripe
  Stripe.publishableKey = ApiKeys.publishableKey;
  await Stripe.instance.applySettings();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          initialRoute: Routes.authGate,
          onGenerateRoute: AppRouter().generateRoute,
        );
      },
    );
  }
}
