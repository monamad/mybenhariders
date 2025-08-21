import 'package:flutter/material.dart';
import 'package:mybenhariders/core/routes/bottom_nav_router.dart';
import 'package:mybenhariders/core/routes/routes.dart';
import 'package:mybenhariders/features/user_features/main_layout/view/navigation/bottom_nav_navigation_service.dart';

class MainLayoutController extends ChangeNotifier {
  int _selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    BottomNavNavigationService.homeTabKey,
    BottomNavNavigationService.helpTabKey,
    BottomNavNavigationService.activitiesTabKey,
    BottomNavNavigationService.profileTabKey,
  ];

  // Getters
  int get selectedIndex => _selectedIndex;
  List<GlobalKey<NavigatorState>> get navigatorKeys => _navigatorKeys;

  // Initialize the controller
  void initialize() {
    BottomNavNavigationService.initialize(_switchToTab);
  }

  // Handle tab selection
  void onItemTapped(int index) {
    print('Switching to tab: $index');
    _switchToTab(index);
  }

  // Internal method to switch tabs
  void _switchToTab(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  // Handle back button press
  Future<bool> handleWillPop() async {
    final isFirstRouteInCurrentTab = !await _navigatorKeys[_selectedIndex]
        .currentState!
        .maybePop();

    if (isFirstRouteInCurrentTab) {
      if (_selectedIndex != 0) {
        onItemTapped(0);
        return false;
      }
    }
    return isFirstRouteInCurrentTab;
  }

  // Generate route for each tab
  Route<dynamic>? generateRoute(RouteSettings routeSettings, int tabIndex) {
    switch (tabIndex) {
      case 0:
        return BottomNavRouter.generateHomeRoute(routeSettings);
      case 1:
        return BottomNavRouter.generateHelpRoute(routeSettings);
      case 2:
        return BottomNavRouter.generateActivitiesRoute(routeSettings);
      case 3:
        return BottomNavRouter.generateProfileRoute(routeSettings);
      default:
        return BottomNavRouter.generateHomeRoute(routeSettings);
    }
  }

  // Get initial route for each tab
  String getInitialRoute(int index) {
    switch (index) {
      case 0:
        return Routes.homeTab;
      case 1:
        return Routes.helpTab;
      case 2:
        return Routes.activitiesTab;
      case 3:
        return Routes.profileTab;
      default:
        return Routes.homeTab;
    }
  }

}
