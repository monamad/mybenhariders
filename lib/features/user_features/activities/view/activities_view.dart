import 'package:flutter/material.dart';
import 'package:mybenhariders/features/user_features/main_layout/view/navigation/bottom_nav_navigation_service.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Navigation examples with clear, descriptive methods
          ElevatedButton(
            onPressed: () {

              // ✅ Clear: Switch to Home tab
              BottomNavNavigationService.goToHomeTab();
            },
            child: Text("Go to Home Tab"),
          ),

          SizedBox(height: 16),

          ElevatedButton(
            onPressed: () {
              // ✅ Clear: Go to Home Details page (switches tab + navigates)
              BottomNavNavigationService.goToHomeDetailsFromAnywhere();
            },
            child: Text("Go to Home Details"),
          ),

          SizedBox(height: 16),

          ElevatedButton(
            onPressed: () {
              // ✅ Clear: Navigate within Activities tab
              BottomNavNavigationService.goToActivityDetails(
                arguments: {'activityId': '123'},
              );
            },
            child: Text("Go to Activity Details"),
          ),

          SizedBox(height: 16),

          ElevatedButton(
            onPressed: () {
              // ✅ Clear: Switch to Profile tab and open settings
              BottomNavNavigationService.goToProfileTab();
              Future.delayed(Duration(milliseconds: 100), () {
                BottomNavNavigationService.goToProfileSettings();
              });
            },
            child: Text("Go to Profile Settings"),
          ),
        ],
      ),
    );
  }
}
