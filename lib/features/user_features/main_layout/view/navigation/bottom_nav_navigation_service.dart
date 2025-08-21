import 'package:flutter/material.dart';

class BottomNavNavigationService {
  static final GlobalKey<NavigatorState> homeTabKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> helpTabKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> activitiesTabKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> profileTabKey =
      GlobalKey<NavigatorState>();

  // Callback to switch tabs (set by MainLayoutController)
  static Function(int)? _switchTabCallback;

  /// Initialize the service with tab switching callback
  static void initialize(Function(int) switchTabCallback) {
    _switchTabCallback = switchTabCallback;
  }

  // ============= TAB SWITCHING =============

  /// Switch to Home tab
  static void goToHomeTab() {
    _switchTabCallback?.call(0);
  }

  /// Switch to Help tab
  static void goToHelpTab() {
    _switchTabCallback?.call(1);
  }

  /// Switch to Activities tab
  static void goToActivitiesTab() {
    _switchTabCallback?.call(2);
  }

  /// Switch to Profile tab
  static void goToProfileTab() {
    _switchTabCallback?.call(3);
  }

  // ============= WITHIN TAB NAVIGATION =============

  // Home tab navigation
  static void goToHomeDetails({Object? arguments}) {
    homeTabKey.currentState?.pushNamed('/home/details', arguments: arguments);
  }

  static void goToHomeSearch({Object? arguments}) {
    homeTabKey.currentState?.pushNamed('/home/search', arguments: arguments);
  }

  // Activities tab navigation
  static void goToActivityDetails({Object? arguments}) {
    activitiesTabKey.currentState?.pushNamed(
      '/activities/details',
      arguments: arguments,
    );
  }

  static void goToActivityHistory({Object? arguments}) {
    activitiesTabKey.currentState?.pushNamed(
      '/activities/history',
      arguments: arguments,
    );
  }

  // Profile tab navigation
  static void goToProfileEdit({Object? arguments}) {
    profileTabKey.currentState?.pushNamed(
      '/profile/edit',
      arguments: arguments,
    );
  }

  static void goToProfileSettings({Object? arguments}) {
    profileTabKey.currentState?.pushNamed(
      '/profile/settings',
      arguments: arguments,
    );
  }

  // Help tab navigation
  static void goToHelpDetails({Object? arguments}) {
    helpTabKey.currentState?.pushNamed('/help/details', arguments: arguments);
  }

  // ============= SMART NAVIGATION =============

  /// Navigate to a specific page and switch to its tab automatically
  static void goToProfileEditFromAnywhere({Object? arguments}) {
    goToProfileTab(); // Switch to profile tab first
    Future.delayed(Duration(milliseconds: 100), () {
      goToProfileEdit(arguments: arguments); // Then navigate within tab
    });
  }

  static void goToHomeDetailsFromAnywhere({Object? arguments}) {
    goToHomeTab();
    Future.delayed(Duration(milliseconds: 100), () {
      goToHomeDetails(arguments: arguments);
    });
  }

  // ============= UTILITY METHODS =============

  /// Get the navigator key for a specific tab
  static GlobalKey<NavigatorState> getTabNavigatorKey(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return homeTabKey;
      case 1:
        return helpTabKey;
      case 2:
        return activitiesTabKey;
      case 3:
        return profileTabKey;
      default:
        return homeTabKey;
    }
  }

  /// Go back within current tab
  static void goBackInCurrentTab(int currentTabIndex) {
    getTabNavigatorKey(currentTabIndex).currentState?.pop();
  }
}
