
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mybenhariders/features/auth/phone_login/data/models/Onboarded_login_response.dart';
import 'package:mybenhariders/features/auth/phone_login/data/models/onboarding_login_response.dart';

part 'success_login_result.freezed.dart';

@freezed
abstract class SuccessLoginResult with _$SuccessLoginResult {
  factory SuccessLoginResult.onboarded(
    OnboardedLoginResponse onboardedLoginReponse,
  ) = OnboardedLoginReponse;
  factory SuccessLoginResult.onboarding(
    OnboardingLoginResponse onboardingLoginReponse,
  ) = OnboardingLoginReponse;
}
