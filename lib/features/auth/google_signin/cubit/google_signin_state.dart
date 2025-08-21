part of 'google_signin_cubit.dart';

@freezed
class GoogleSignInState with _$GoogleSignInState {
  const factory GoogleSignInState.initial() = _Initial;
  const factory GoogleSignInState.loading() = Loading;
  const factory GoogleSignInState.success(String idToken) = Success;
  const factory GoogleSignInState.error(String message) = Error;
}
