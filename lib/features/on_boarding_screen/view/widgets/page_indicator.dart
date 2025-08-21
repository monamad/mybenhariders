import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybenhariders/core/themes/colors.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: currentPage == index ? 12.w : 8.w,
          height: currentPage == index ? 12.h : 8.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index
                ? ColorManager.mainOrage
                : Colors.grey[300],
          ),
        ),
      ),
    );
  }
}
