import 'package:mybenhariders/core/themes/colors.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mybenhariders/core/themes/styles.dart';

class PolicyText extends StatelessWidget {
  const PolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'By joining our app, you agree to our ',
        style: TextStyles.font16BlackRegular,
        children: [
          TextSpan(
            text: 'Terms of Service',
            style: const TextStyle(
              color: ColorManager.mainOrage,
              decoration: TextDecoration.underline,
              decorationColor: ColorManager.mainOrage,
              decorationThickness: 1.5,
              height: 1.5,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('Terms of Service clicked');
              },
          ),
          const TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: const TextStyle(
              color: ColorManager.mainOrage,
              decoration: TextDecoration.underline,
              decorationColor: ColorManager.mainOrage,
              decorationThickness: 1.5,
              height: 1.5,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('Privacy Policy clicked');
              },
          ),
          const TextSpan(text: '.'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
