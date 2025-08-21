import 'package:flutter/material.dart';
import 'package:mybenhariders/core/routes/routes.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeTabKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> helpTabKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> activitiesTabKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> profileTabKey =
      GlobalKey<NavigatorState>();

  // Callback to navigate to tabs
  static Function(int, {String? route})? _navigateToTabCallback;

  // Function to get the current context
  static BuildContext? get currentContext => navigatorKey.currentContext;

  // Set the callback function
  static void setNavigateToTabCallback(
    Function(int, {String? route}) callback,
  ) {
    _navigateToTabCallback = callback;
  }

  // Function to navigate to a specific tab from anywhere (useful for notifications)
  static void navigateToTab(int tabIndex, {String? route}) {
    _navigateToTabCallback?.call(tabIndex, route: route);
  }

  // Navigate to specific pages within tabs
  static void navigateToHomeDetails() {
    homeTabKey.currentState?.pushNamed(Routes.homeTab);
  }

  static void navigateToActivityDetails() {
    activitiesTabKey.currentState?.pushNamed('/activities/details');
  }

  static void navigateToProfileEdit() {
    profileTabKey.currentState?.pushNamed('/profile/edit');
  }

  static void navigateToProfileSettings() {
    profileTabKey.currentState?.pushNamed('/profile/settings');
  }

  // Handle notification navigation
  static void handleNotificationNavigation(Map<String, dynamic> data) {
    final String? type = data['type'];
    final String? page = data['page'];

    switch (type) {
      case 'home':
        navigateToTab(0, route: page);
        break;
      case 'help':
        navigateToTab(1, route: page);
        break;
      case 'activity':
        navigateToTab(2, route: page);
        break;
      case 'profile':
        navigateToTab(3, route: page);
        break;
      default:
        navigateToTab(0); // Default to home
    }
  }
}
