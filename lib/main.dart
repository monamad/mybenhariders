import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybenhariders/core/di/dependancy_injection.dart';
import 'package:mybenhariders/core/networking/api_result.dart';
import 'package:mybenhariders/core/routes/app_router.dart';
import 'package:mybenhariders/core/routes/routes.dart';
import 'package:mybenhariders/core/navigation/app_navigation_service.dart';
import 'package:mybenhariders/core/themes/colors.dart';
import 'package:mybenhariders/features/auth/phone_login/data/models/login_request_body.dart';
import 'package:mybenhariders/features/auth/phone_login/data/repo/login_repo.dart';
import 'package:mybenhariders/features/auth/phone_login/data/repo/success_login_result.dart';

void main() async {
  await setupGetIt();
  if (kDebugMode) {
    print('sex');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 1000),
      child: MaterialApp(
        navigatorKey: AppNavigationService.navigatorKey,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: Routes.onboardingRoute,
        title: 'My Benha Riders',
        theme: ThemeData(
          primaryColor: ColorManager.mainOrage,
          scaffoldBackgroundColor: Colors.white,
        ),
        // Remove home property to use routing system
      ),
    );
  }
}

void logintest() async {
  LoginRepo loginRepo = LoginRepo(getIt());

  ApiResult<SuccessLoginResult> response = await loginRepo.loginWithPhone(
    LoginRequestBody(phoneNumber: '01200000000', password: '01200000000'),
  );
  response.when(
    success: (data) {
      data.when(
        onboarded: (onboarded) {
          print('Onboarded login successful');
          print('Onboarded token: ${onboarded.accessToken}');
        },
        onboarding: (result) {
          print('Onboarding required: ${result.nextStep}');
        },
      );
    },
    error: (message) {
      print('Login failed: $message');
    },
  );
}
