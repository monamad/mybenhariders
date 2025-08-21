import 'package:mybenhariders/core/navigation/app_navigation_service.dart';
import 'package:mybenhariders/features/user_features/main_layout/view/navigation/bottom_nav_navigation_service.dart';

/// Handles navigation from notifications, deep links, etc.
class NotificationNavigationService {
  /// Handle navigation from push notifications
  static void handleNotificationTap(Map<String, dynamic> notificationData) {
    final String? action = notificationData['action'];
    final String? screen = notificationData['screen'];
    final Object? arguments = notificationData['arguments'];

    switch (action) {
      case 'open_profile':
        _navigateToMainLayoutThen(() {
          BottomNavNavigationService.goToProfileEditFromAnywhere(
            arguments: arguments,
          );
        });
        break;

      case 'open_activity':
        _navigateToMainLayoutThen(() {
          BottomNavNavigationService.goToActivitiesTab();
          if (screen != null) {
            BottomNavNavigationService.goToActivityDetails(
              arguments: arguments,
            );
          }
        });
        break;

      case 'open_home':
        _navigateToMainLayoutThen(() {
          BottomNavNavigationService.goToHomeTab();
          if (screen == 'details') {
            BottomNavNavigationService.goToHomeDetails(arguments: arguments);
          }
        });
        break;

      case 'logout':
        AppNavigationService.navigateToLogin();
        break;

      default:
        // Default to main layout home
        _navigateToMainLayoutThen(() {
          BottomNavNavigationService.goToHomeTab();
        });
    }
  }

  /// Handle deep links from external sources
  static void handleDeepLink(String link, {Object? arguments}) {
    if (link.startsWith('/profile')) {
      _navigateToMainLayoutThen(() {
        BottomNavNavigationService.goToProfileTab();
        if (link.contains('/edit')) {
          BottomNavNavigationService.goToProfileEdit(arguments: arguments);
        }
      });
    } else if (link.startsWith('/activities')) {
      _navigateToMainLayoutThen(() {
        BottomNavNavigationService.goToActivitiesTab();
        if (link.contains('/details')) {
          BottomNavNavigationService.goToActivityDetails(arguments: arguments);
        }
      });
    } else if (link.startsWith('/home')) {
      _navigateToMainLayoutThen(() {
        BottomNavNavigationService.goToHomeTab();
        if (link.contains('/details')) {
          BottomNavNavigationService.goToHomeDetails(arguments: arguments);
        }
      });
    }
  }

  /// Helper to ensure we're on main layout before navigating to tabs
  static void _navigateToMainLayoutThen(VoidCallback callback) {
    AppNavigationService.navigateToMainLayout().then((_) {
      // Wait a frame for the navigation to complete
      Future.delayed(Duration(milliseconds: 150), callback);
    });
  }
}

typedef VoidCallback = void Function();
