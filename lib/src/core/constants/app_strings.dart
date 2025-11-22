import 'package:weather_app/src/core/config/build_config.dart';

abstract class AppStrings {
  static final _config = BuildConfig.instance.envConfig;

  // Preference keys
  static final spLatitude = "${_config.packageName}.latitude";
  static final spLongitude = "${_config.packageName}.longitude";

  static final spTempUnit = "${_config.packageName}.temp_unit";

  static final tempUnitCelsius = "C";
  static final tempUnitFahrenheit = "F";
  static final iconPrefix = 'https://openweathermap.org/img/wn/';
  static final iconSuffix = '@2x.png';
}
