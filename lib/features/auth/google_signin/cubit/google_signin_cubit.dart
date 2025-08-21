import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mybenhariders/core/networking/api_result.dart';

import 'package:mybenhariders/features/auth/google_signin/data/google_signin_repo.dart';

part 'google_signin_state.dart';
part 'google_signin_cubit.freezed.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  final GoogleSignInRepo googleSignInRepo;
  GoogleSignInCubit(this.googleSignInRepo) : super(GoogleSignInState.initial());

  Future<void> signInWithGoogle() async {
    emit(GoogleSignInState.loading());

    final ApiResult<String?> result = await googleSignInRepo.signInWithGoogle();

    result.when(
      success: (idToken) {
        emit(GoogleSignInState.success(idToken!));
      },
      error: (message) {
        emit(GoogleSignInState.error(message));
      },
    );
  }

  Future<void> signOut() async {
    emit(GoogleSignInState.loading());
    await googleSignInRepo.signOut();
    emit(GoogleSignInState.initial());
  }
}
