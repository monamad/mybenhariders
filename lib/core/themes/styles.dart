import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybenhariders/core/themes/colors.dart';

class TextStyles {
  static TextStyle font28BlackBold = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle font24BlackNormal = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static const TextStyle font19blackNormal = TextStyle(
    fontSize: 19,
    color: Colors.black,
  );

  static const TextStyle font18WhiteRegular = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle font16BlackRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black.withValues(alpha: 0.8),
  );
  static TextStyle font24mainOrageBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ColorManager.mainOrage,
  );
  static TextStyle font16mainOrageRegular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: ColorManager.mainOrage,
  );
}
