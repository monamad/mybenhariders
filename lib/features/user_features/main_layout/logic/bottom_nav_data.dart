import 'package:flutter/material.dart';

class BottomNavItem {
  final IconData icon;
  final String label;

  const BottomNavItem({required this.icon, required this.label});
}

class BottomNavData {
  static const List<BottomNavItem> items = [
    BottomNavItem(icon: Icons.home, label: "Home"),
    BottomNavItem(icon: Icons.help_outline, label: "Help"),
    BottomNavItem(icon: Icons.history, label: "Activities"),
    BottomNavItem(icon: Icons.person_outline, label: "Profile"),
  ];
}
