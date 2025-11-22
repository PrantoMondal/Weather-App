import 'package:flutter/material.dart';
import 'package:weather_app/src/core/base/base_view.dart';
import 'package:weather_app/src/core/constants/app_colors.dart';
import 'package:weather_app/src/core/constants/app_textstyles.dart';
import '../controllers/splash_controller.dart';

class SplashView extends BaseView<SplashController> {
  SplashView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.lightBlue, AppColors.white],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(100),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.sunny_snowing, color: Colors.white, size: 60),
            ),

            const SizedBox(height: 20),

            const Text("Weather App", style: kInter700W16S),

            const SizedBox(height: 20),

            const CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
          ],
        ),
      ),
    );
  }
}
