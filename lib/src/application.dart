import 'package:flutter/material.dart';
import 'package:weather_app/src/core/bindings/initial_binding.dart';
import 'core/config/build_config.dart';
import 'package:get/get.dart';
import 'core/routes/app_pages.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final config = BuildConfig.instance.envConfig;

    return GetMaterialApp(
      title: config.appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: InitialBindings(),
      locale: Get.locale,
      debugShowCheckedModeBanner: false,
    );
  }
}
