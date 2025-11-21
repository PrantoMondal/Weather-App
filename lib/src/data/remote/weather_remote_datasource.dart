import 'package:weather_app/src/data/models/current_weather_response.dart';

abstract class WeatherRemoteDataSource {
  Future<CurrentWeatherResponse> getWeather({
    required double latitude,
    required double longitude,
  });
}
