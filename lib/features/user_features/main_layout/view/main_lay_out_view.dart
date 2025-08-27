import 'package:flutter/material.dart';
import 'package:mybenhariders/features/user_features/main_layout/logic/main_layout_controller.dart';
import 'package:mybenhariders/features/user_features/main_layout/view/widgets/main_layout_bottom_nav_bar.dart';
import 'package:mybenhariders/features/user_features/main_layout/view/widgets/bottom_nav_tab_view.dart';
import 'package:mybenhariders/features/check_location_perrmissions/view/global_location_overlay.dart';

class MainLayOutView extends StatelessWidget {
  final MainLayoutController controller;

  const MainLayOutView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GlobalLocationOverlay(
      child: WillPopScope(
        onWillPop: controller.handleWillPop,
        child: Scaffold(
          body: Stack(
            children: [
              // Each tab has its own navigation stack
              BottomNavTabView(controller: controller, tabIndex: 0), // Home
              BottomNavTabView(controller: controller, tabIndex: 1), // Help
              BottomNavTabView(
                controller: controller,
                tabIndex: 2,
              ), // Activities
              BottomNavTabView(controller: controller, tabIndex: 3), // Profile
            ],
          ),
          bottomNavigationBar: MainLayoutBottomNavBar(controller: controller),
        ),
      ),
    );
  }
}
