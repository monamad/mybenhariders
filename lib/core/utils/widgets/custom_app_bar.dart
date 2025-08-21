import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0.0,
      toolbarHeight: 100.h,
      title: Padding(
        padding: EdgeInsets.only(top: 25.h, right: 21.w),
        child: Image.asset(
          'assets/images/logo.png',
          height: 200.h,
          fit: BoxFit.contain,
        ),
      ),
      centerTitle: true,
    );
  }
}
