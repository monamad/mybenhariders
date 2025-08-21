import 'package:flutter/material.dart';
import 'package:mybenhariders/core/routes/routes.dart';

/// Core navigation service for main app-level navigation
/// Handles: Login → Main Layout → Settings, etc.
class AppNavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // Get current context
  static BuildContext? get currentContext => navigatorKey.currentContext;

  // App-level navigation methods
  static Future<void> navigateToLogin() async {
    await navigatorKey.currentState?.pushNamedAndRemoveUntil(
      Routes.loginRoute,
      (route) => false,
    );
  }

  static Future<void> navigateToOnboarding() async {
    await navigatorKey.currentState?.pushNamedAndRemoveUntil(
      Routes.onboardingRoute,
      (route) => false,
    );
  }

  static Future<void> navigateToMainLayout() async {
    await navigatorKey.currentState?.pushNamedAndRemoveUntil(
      Routes.mainlayout,
      (route) => false,
    );
  }

  // Generic navigation
  static Future<void> navigateTo(String route, {Object? arguments}) async {
    await navigatorKey.currentState?.pushNamed(route, arguments: arguments);
  }

  static Future<void> navigateAndReplace(
    String route, {
    Object? arguments,
  }) async {
    await navigatorKey.currentState?.pushReplacementNamed(
      route,
      arguments: arguments,
    );
  }

  static void goBack() {
    navigatorKey.currentState?.pop();
  }
}
