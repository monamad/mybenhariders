import 'package:flutter/material.dart';
import 'package:mybenhariders/core/routes/routes.dart';
import 'package:mybenhariders/core/themes/colors.dart';
import 'package:mybenhariders/core/themes/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.electric_scooter,
                size: 120,
                color: ColorManager.mainOrage,
              ),
              SizedBox(height: 20),
              Text("جاهز لرحلتك", style: TextStyles.font24mainOrageBold),
              SizedBox(height: 10),
              Text(
                "اضغط على الزر أدناه لبدء رحلتك",
                style: TextStyles.font16mainOrageRegular,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pushNamed(context, Routes.startTrip);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.mainOrage,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: Text("أبدا رحلة", style: TextStyles.font18WhiteRegular),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
