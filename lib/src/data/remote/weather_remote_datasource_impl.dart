import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/core/base/base_remote_datasource.dart';
import 'package:weather_app/src/data/models/city_response.dart';
import 'package:weather_app/src/data/models/current_weather_response.dart';
import 'package:weather_app/src/data/models/forecast_weather_response.dart';
import 'package:weather_app/src/data/models/forecast_weather_response.dart';
import 'package:weather_app/src/data/models/forecast_weather_response.dart';
import 'package:weather_app/src/data/models/forecast_weather_response.dart';
import 'package:weather_app/src/data/remote/weather_remote_datasource.dart';

class WeatherRemoteDataSourceImpl extends BaseRemoteDatasource
    implements WeatherRemoteDataSource {
  static WeatherRemoteDataSourceImpl get to => Get.find<WeatherRemoteDataSourceImpl>();

  @override
  Future<CurrentWeatherResponse> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final endpoint =
          "${baseUrl}data/2.5/weather?lat=$latitude&lon=$longitude&appid=${dotenv.env['API_KEY']}";
      final api = dioClient.get(endpoint);
      final response = await callApi(api);
      final json = response.data;
      logger.d(json);
      return CurrentWeatherResponse.fromJson(json);
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  @override
  Future<CurrentWeatherResponse> getWeatherByCityName({required String cityName}) async {
    try {
      final endpoint =
          "${baseUrl}data/2.5/weather?q=$cityName&appid=${dotenv.env['API_KEY']}";
      final api = dioClient.get(endpoint);
      final response = await callApi(api);
      final json = response.data;
      logger.d(json);
      return CurrentWeatherResponse.fromJson(json);
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  @override
  Future<List<CityResponse>> getCities({required String query}) async {
    try {
      final endpoint = "${baseUrl}geo/1.0/direct";
      final api = dioClient.get(
        endpoint,
        queryParameters: {'q': query.trim(), 'limit': 5, 'appid': dotenv.env['API_KEY']},
      );
      final response = await callApi(api);

      final List<dynamic> jsonList = response.data;

      logger.d('Cities API Response: $jsonList');

      return jsonList
          .map((json) => CityResponse.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ForecastWeatherResponse> getForecastWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final endpoint =
          "${baseUrl}data/2.5/forecast?lat=$latitude&lon=$longitude&appid=${dotenv.env['API_KEY']}";
      final api = dioClient.get(endpoint);
      final response = await callApi(api);
      final json = response.data;
      logger.d(json);
      return ForecastWeatherResponse.fromJson(json);
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  @override
  Future<ForecastWeatherResponse> getForecastWeatherByCityName({
    required String cityName,
  }) async {
    try {
      final endpoint =
          "${baseUrl}data/2.5/forecast?q=$cityName&appid=${dotenv.env['API_KEY']}";
      final api = dioClient.get(endpoint);
      final response = await callApi(api);
      final json = response.data;
      logger.d(json);
      return ForecastWeatherResponse.fromJson(json);
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }
}
