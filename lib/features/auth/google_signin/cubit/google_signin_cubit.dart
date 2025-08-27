import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mybenhariders/core/networking/api_result.dart';
import 'package:mybenhariders/core/local_data_source/token_storage_service.dart';

import 'package:mybenhariders/features/auth/google_signin/data/repo/google_signin_repo.dart';
import 'package:mybenhariders/features/auth/google_signin/data/repo/login_with_google_repo.dart';
import 'package:mybenhariders/features/auth/phone_login/data/repo/success_login_result.dart';

part 'google_signin_state.dart';
part 'google_signin_cubit.freezed.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  final GoogleSignInRepo googleSignInRepo;
  final LoginWithGoogleRepo loginWithGoogleRepo;
  GoogleSignInCubit(this.googleSignInRepo, this.loginWithGoogleRepo)
    : super(GoogleSignInState._initial());

  Future<void> signInWithGoogle() async {
    print('done22222');
    final ApiResult<String?> result = await googleSignInRepo.signInWithGoogle();
    result.when(
      success: (idToken) async {
        // Store the Google ID token
        await TokenStorageService.storeGoogleToken(idToken!);
        print('done1');
        final ApiResult<SuccessLoginResult> loginResult =
            await loginWithGoogleRepo.loginWithGoogle({'idToken': idToken});
        loginResult.when(
          success: (SuccessLoginResult data) {
            data.when(
              onboarded: (onboarded) {
                TokenStorageService.storeAccessToken(onboarded.accessToken);
              },
              onboarding: (result) {},
            );
          },
          error: (message) {
            emit(GoogleSignInState.error(message));
            return;
          },
        );
        emit(GoogleSignInState.success(idToken));
      },
      error: (message) {
        print('Google Sign-In Error: $message');
        emit(GoogleSignInState.error(message));
      },
    );
  }

  Future<void> signOut() async {
    await googleSignInRepo.signOut();
    await TokenStorageService.clearTokens();
    emit(GoogleSignInState._initial());
  }
}
