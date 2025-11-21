import 'package:get/get.dart';
import 'package:weather_app/src/core/base/base_remote_datasource.dart';
import 'package:weather_app/src/data/models/current_weather_response.dart';
import 'package:weather_app/src/data/remote/weather_remote_datasource.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
          "$baseUrl/weather?lat=$latitude&lon=$longitude&appid=${dotenv.env['API_KEY']}";
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
}
