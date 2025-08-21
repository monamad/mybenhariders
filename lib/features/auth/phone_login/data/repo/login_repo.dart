

import 'package:mybenhariders/core/networking/api_result.dart';
import 'package:mybenhariders/core/networking/api_service.dart';
import 'package:mybenhariders/features/auth/phone_login/data/models/Onboarded_login_response.dart';
import 'package:mybenhariders/features/auth/phone_login/data/models/login_request_body.dart';
import 'package:mybenhariders/features/auth/phone_login/data/models/login_response.dart';
import 'package:mybenhariders/features/auth/phone_login/data/models/onboarding_login_response.dart';
import 'package:mybenhariders/features/auth/phone_login/data/repo/success_login_result.dart';

class LoginRepo {
  final ApiService apiService;
  LoginRepo(this.apiService);

  Future<ApiResult<SuccessLoginResult>> loginWithPhone(
    LoginRequestBody body,
  ) async {
    try {
      final response = await apiService.login(body);
      if (response.type == 'onboarding_required') {
        final OnboardingLoginResponse onboardingData =
            OnboardingLoginResponse.fromJson(response.result);
        return ApiResult.success(SuccessLoginResult.onboarding(onboardingData));
      } else {
        final OnboardedLoginResponse onboardedData =
            OnboardedLoginResponse.fromJson(response.result);
        return ApiResult.success(SuccessLoginResult.onboarded(onboardedData));
      }
    } catch (e) {
      return ApiResult.error('Login failed: ${e.toString()}');
    }
  }

  Future<ApiResult<SuccessLoginResult>> loginWithGoogle(
    Map<String, dynamic> body,
  ) async {
    try {
      final LoginResponse response = await apiService.googleSignIn(body);
      if (response.type == 'onboarding_required') {
        final OnboardingLoginResponse onboardingData =
            OnboardingLoginResponse.fromJson(response.result);
        return ApiResult.success(SuccessLoginResult.onboarding(onboardingData));
      } else {
        final OnboardedLoginResponse onboardedData =
            OnboardedLoginResponse.fromJson(response.result);
        return ApiResult.success(SuccessLoginResult.onboarded(onboardedData));
      }
    } catch (e) {
      return ApiResult.error('Google Sign-In failed: ${e.toString()}');
    }
  }
}
