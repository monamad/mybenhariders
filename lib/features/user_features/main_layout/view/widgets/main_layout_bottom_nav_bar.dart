import 'package:flutter/material.dart';
import 'package:mybenhariders/core/themes/colors.dart';
import 'package:mybenhariders/features/user_features/main_layout/logic/bottom_nav_data.dart';
import 'package:mybenhariders/features/user_features/main_layout/logic/main_layout_controller.dart';

class MainLayoutBottomNavBar extends StatefulWidget {
  final MainLayoutController controller;

  const MainLayoutBottomNavBar({super.key, required this.controller});

  @override
  State<MainLayoutBottomNavBar> createState() => _MainLayoutBottomNavBarState();
}

class _MainLayoutBottomNavBarState extends State<MainLayoutBottomNavBar> {

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onControllerChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    super.dispose();
  }

  void _onControllerChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.controller.selectedIndex,
      onTap: widget.controller.onItemTapped,
      selectedItemColor: ColorManager.mainOrage,
      unselectedItemColor: Colors.grey[500],
      items: BottomNavData.items
          .map(
            (item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
            ),
          )
          .toList(),
    );
  }
}
