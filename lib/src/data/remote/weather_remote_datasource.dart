import 'package:weather_app/src/data/models/city_response.dart';
import 'package:weather_app/src/data/models/current_weather_response.dart';
import 'package:weather_app/src/data/models/forecast_weather_response.dart';
import 'package:weather_app/src/data/models/forecast_weather_response.dart';

abstract class WeatherRemoteDataSource {
  Future<CurrentWeatherResponse> getWeather({
    required double latitude,
    required double longitude,
  });

  Future<CurrentWeatherResponse> getWeatherByCityName({required String cityName});

  Future<ForecastWeatherResponse> getForecastWeather({
    required double latitude,
    required double longitude,
  });

  Future<ForecastWeatherResponse> getForecastWeatherByCityName({
    required String cityName,
  });

  Future<List<CityResponse>> getCities({required String query});
}
