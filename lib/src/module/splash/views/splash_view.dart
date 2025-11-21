import 'package:flutter/material.dart';
import 'package:weather_app/src/core/base/base_view.dart';
import '../controllers/splash_controller.dart';

class SplashView extends BaseView<SplashController> {
  SplashView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // App Icon
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.cloud, color: Colors.white, size: 60),
          ),

          const SizedBox(height: 20),

          // App title
          const Text(
            "Weather App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 20),

          // Loading indicator
          const CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
        ],
      ),
    );
  }
}
