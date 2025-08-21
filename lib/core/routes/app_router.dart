import 'package:flutter/material.dart';
import 'package:mybenhariders/core/routes/routes.dart';
import 'package:mybenhariders/core/di/dependancy_injection.dart';
import 'package:mybenhariders/features/auth/login_view.dart';
import 'package:mybenhariders/features/on_boarding_screen/view/on_boarding_view.dart';
import 'package:mybenhariders/features/user_features/main_layout/view/main_lay_out_view.dart';
import 'package:mybenhariders/features/user_features/main_layout/logic/main_layout_controller.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.userMainLayout:
        return MaterialPageRoute(
          builder: (_) =>
              MainLayOutView(controller: getIt<MainLayoutController>()),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
