import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/firbase_networking/api_result.dart';
import '../../../domain/use_case/google_sign_in_use_case.dart';
import 'google_sign_in_state.dart';


class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  final GoogleSignInUseCase _googleSignInUseCase;

  GoogleSignInCubit({required GoogleSignInUseCase googleSignInUseCase})
      : _googleSignInUseCase = googleSignInUseCase,
        super(const GoogleSignInState.initial());

  void emitGoogleSignInStates() async {
    emit(const GoogleSignInState.loading());

    final response = await _googleSignInUseCase();

    response.when(
      success: (userEntity) {
        emit(GoogleSignInState.success(userEntity));
      },
      failure: (error) {
        emit(GoogleSignInState.error(message: error.toString()));
      }, 
    );
  }
}