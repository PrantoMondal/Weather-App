import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:weather_app/src/core/config/build_config.dart';
import 'src/application.dart';
import 'src/core/config/env_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final envConfig = EnvConfig(
    appName: packageInfo.appName,
    appVersion: packageInfo.version,
    packageName: packageInfo.packageName,
    baseUrl: "https://api.openweathermap.org/data/2.5",
  );

  BuildConfig.instantiate(config: envConfig);
  await dotenv.load(fileName: ".env");

  runApp(const Application());
}
