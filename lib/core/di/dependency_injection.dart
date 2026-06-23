import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application/features/home/data/local_data/home_local_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../features/auth/data/remote_data/auth_remote_data_source.dart';
import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/domain/use_case/google_sign_in_use_case.dart';
import '../../features/auth/domain/use_case/login_use_case.dart';
import '../../features/auth/domain/use_case/sign_up_use_case.dart';
import '../../features/auth/presentation/cubit/google_sign_in_cubit/google_sign_in_cubit.dart';
import '../../features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/cubit/sign_up_cubit/signup_cubit.dart';
import '../../features/checkout/data/data_source/checkout_remote_data_source.dart';
import '../../features/checkout/data/repo/checkout_repository_impl.dart';
import '../../features/checkout/domain/repository/checkout_repository.dart';
import '../../features/checkout/domain/use_case/place_order_use_case.dart';
import '../../features/checkout/presentation/cubit/checkout_cubit.dart';
import '../../features/home/data/remote_data/home_remote_data_source.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/domain/repository/home_repository.dart';
import '../../features/home/domain/use_case/get_products_use_case.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // =========================================================================
  // 1. External Packages
  // =========================================================================
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance); 
  // =========================================================================
  // 2. Data Sources
  // =========================================================================
  // Auth
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt<FirebaseAuth>(), getIt<GoogleSignIn>()),
  );
  // Home (remote) 
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(getIt<FirebaseFirestore>(), getIt<FirebaseStorage>()),
  );
   // home (local)
  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );
  // Checkout
  getIt.registerLazySingleton<CheckoutRemoteDataSource>(
  () => CheckoutRemoteDataSourceImpl(getIt<FirebaseFirestore>()),
);

  // =========================================================================
  // 3. Repositories
  // =========================================================================

  // Auth
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );
  // Home 
getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt<HomeRemoteDataSource>(), getIt<HomeLocalDataSource>()),
  );
  // Checkout
  getIt.registerLazySingleton<CheckoutRepository>(
  () => CheckoutRepositoryImpl(getIt<CheckoutRemoteDataSource>()),
);

  // =========================================================================
  // 4. Use Cases
  // =========================================================================
  // Auth
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<GoogleSignInUseCase>(
    () => GoogleSignInUseCase(getIt<AuthRepository>()),
  );
  // Home

  getIt.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(getIt<HomeRepository>()),
  );
  // Checkout
  getIt.registerLazySingleton<PlaceOrderUseCase>(
  () => PlaceOrderUseCase(getIt<CheckoutRepository>()),
);

  // =========================================================================
  // 5. Cubit
  // =========================================================================
  // Auth
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(loginUseCase: getIt<LoginUseCase>()),
  );
  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(signUpUseCase: getIt<SignUpUseCase>()),
  );
  getIt.registerFactory<GoogleSignInCubit>(
    () => GoogleSignInCubit(googleSignInUseCase: getIt<GoogleSignInUseCase>()),
  );
  // Home
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(getIt<GetProductsUseCase>()),
  );
  // Checkout
  getIt.registerFactory<CheckoutCubit>(
  () => CheckoutCubit(getIt<PlaceOrderUseCase>()),
);
}