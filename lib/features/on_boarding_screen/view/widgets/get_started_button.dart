import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybenhariders/core/routes/routes.dart';
import 'package:mybenhariders/core/themes/colors.dart';
import 'package:mybenhariders/core/themes/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      },
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        ),
        backgroundColor: WidgetStateProperty.all(ColorManager.mainOrage),
        elevation: WidgetStateProperty.all(8.0),
        shadowColor: WidgetStateProperty.all(
          Colors.black.withValues(alpha: 0.5),
        ),
      ),
      child: const Text('أبدا', style: TextStyles.font19blackNormal),
    );
  }
}
