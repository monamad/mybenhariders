import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybenhariders/core/themes/colors.dart';

class LogoWidget extends StatelessWidget {
  final double? size;
  final bool showBackground;

  const LogoWidget({
    super.key,
    this.size,
    this.showBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    final logoSize = size ?? 120.w;

    return Container(
      width: logoSize,
      height: logoSize,
      decoration: showBackground
          ? BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[100],
            )
          : null,
      child: ClipOval(
        child: Image.asset(
          'assets/images/logo.png',
          width: logoSize,
          height: logoSize,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Icon(
            Icons.person,
            size: (logoSize * 0.5),
            color: ColorManager.mainOrage,
          ),
        ),
      ),
    );
  }
}
