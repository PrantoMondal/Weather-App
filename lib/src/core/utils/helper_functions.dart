import 'package:intl/intl.dart';
import 'package:weather_app/src/core/constants/app_strings.dart';

abstract class HelperFunctions {
  static String formatDateTime(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);
    final formatter = DateFormat('dd MMM, yyyy hh:mm a');
    return formatter.format(date.toLocal());
  }

  static String formatTime(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);
    final formatter = DateFormat('hh:mm a');
    return formatter.format(date.toLocal());
  }

  static String kelvinToCelsiusString(double kelvin) {
    return "${(kelvin - 273.15).toStringAsFixed(1)} \u00B0 C";
  }

  static String kelvinToFahrenheitString(double kelvin) {
    return "${((kelvin - 273.15) * 9 / 5 + 32).toStringAsFixed(1)} \u00B0 F";
  }

  static String formatTemperature(double kelvin, String unit) {
    if (unit == AppStrings.tempUnitCelsius) {
      return kelvinToCelsiusString(kelvin);
    } else {
      return kelvinToFahrenheitString(kelvin);
    }
  }
}
