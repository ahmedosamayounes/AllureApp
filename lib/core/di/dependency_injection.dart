import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/cubit/sign_up_cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../features/auth/data/remote_data/auth_remote_data_source.dart';

import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';

import '../../features/auth/domain/use_case/google_sign_in_use_case.dart';
import '../../features/auth/domain/use_case/login_use_case.dart';
import '../../features/auth/domain/use_case/sign_up_use_case.dart';

import '../../features/auth/presentation/cubit/google_sign_in_cubit/google_sign_in_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // =========================================================================
  // 1. External Packages
  // =========================================================================
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());

  // =========================================================================
  // 2. Data Sources
  // =========================================================================
  // Take FirebaseAuth ,  GoogleSignIn
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () =>
        AuthRemoteDataSourceImpl(getIt<FirebaseAuth>(), getIt<GoogleSignIn>()),
  );

  // =========================================================================
  // 3. Repositories
  // =========================================================================

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );

  // =========================================================================
  // 4. Use Cases
  // =========================================================================
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<GoogleSignInUseCase>(
    () => GoogleSignInUseCase(getIt<AuthRepository>()),
  );

  // =========================================================================
  //5. Cubit
  // =========================================================================

  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(loginUseCase: getIt<LoginUseCase>()),
  );

  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(signUpUseCase: getIt<SignUpUseCase>()),
  );

  getIt.registerFactory<GoogleSignInCubit>(
    () => GoogleSignInCubit(googleSignInUseCase: getIt<GoogleSignInUseCase>()),
  );
}
