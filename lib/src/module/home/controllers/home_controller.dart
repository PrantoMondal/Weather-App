import 'package:get/get.dart';
import 'package:weather_app/src/core/base/base_controller.dart';
import 'package:weather_app/src/data/models/current_weather_response.dart';
import 'package:weather_app/src/data/remote/weather_remote_datasource.dart';

class HomeController extends BaseController {
  final WeatherRemoteDataSource remoteDataSource;
  HomeController({required this.remoteDataSource});
  final RxString condition = 'sunny'.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentWeather();
  }

  Rx<CurrentWeatherResponse> weather = CurrentWeatherResponse().obs;
  RxBool isLoading = true.obs;
  void getCurrentWeather() async {
    callDataService(
      remoteDataSource.getWeather(latitude: 23.727133, longitude: 90.443467),
      onSuccess: (data) {
        weather.value = data;
        isLoading.value = false;
      },
      onError: (error) {
        isLoading.value = false;
      },
    );
  }
}
