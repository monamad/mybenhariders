import 'package:json_annotation/json_annotation.dart';

part 'onboarding_login_response.g.dart';

@JsonSerializable()
class OnboardingLoginResponse {
  final String onboardingToken;

  final String nextStep;
  OnboardingLoginResponse(this.onboardingToken, this.nextStep);

  factory OnboardingLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$OnboardingLoginResponseFromJson(json);
}

