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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/splash_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
