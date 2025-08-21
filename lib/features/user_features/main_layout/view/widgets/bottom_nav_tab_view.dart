import 'package:flutter/material.dart';
import 'package:mybenhariders/features/user_features/main_layout/logic/main_layout_controller.dart';

/// A widget that manages the navigation stack for an individual bottom navigation tab.
/// Uses Offstage to show/hide the tab content based on the selected tab index.
class BottomNavTabView extends StatefulWidget {
  final MainLayoutController controller;
  final int tabIndex;

  const BottomNavTabView({
    super.key,
    required this.controller,
    required this.tabIndex,
  });

  @override
  State<BottomNavTabView> createState() => _BottomNavTabViewState();
}

class _BottomNavTabViewState extends State<BottomNavTabView> {
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
    print('test');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: widget.controller.selectedIndex != widget.tabIndex,
      child: Navigator(
        key: widget.controller.navigatorKeys[widget.tabIndex],
        initialRoute: widget.controller.getInitialRoute(widget.tabIndex),
        onGenerateRoute: (routeSettings) =>
            widget.controller.generateRoute(routeSettings, widget.tabIndex),
      ),
    );
  }
}
