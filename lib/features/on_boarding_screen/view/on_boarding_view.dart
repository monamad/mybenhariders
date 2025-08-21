
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybenhariders/core/themes/styles.dart';
import 'package:mybenhariders/core/utils/widgets/custom_app_bar.dart';
import 'package:mybenhariders/features/on_boarding_screen/view/widgets/get_started_button.dart';
import 'package:mybenhariders/features/on_boarding_screen/view/widgets/policy_text.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 25.h),
              Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.9,
                child: Image.asset(
                  'assets/images/home_image.png',
                  height: 400.h,
                ),
              ),
              Text(
                'بنها بين إيدك، تنقل بسهولة وسرعة',
                style: TextStyles.font28BlackBold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25.h),
              Text(
                'أسرع وأأمن وسيلة تنقلك في بنها',
                style: TextStyles.font24BlackNormal,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 130.h),
              const GetStartedButton(),
              SizedBox(height: 20.h),
              const PolicyText(),
            ],
          ),
        ),
      ),
    );
  }
}
