import 'package:json_annotation/json_annotation.dart';
part 'Onboarded_login_response.g.dart';

@JsonSerializable()
class OnboardedLoginResponse {
  final String accessToken;
  final String refreshToken;
  final String expiresAt;
  OnboardedLoginResponse(this.accessToken, this.refreshToken, this.expiresAt);
  factory OnboardedLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$OnboardedLoginResponseFromJson(json);
}
