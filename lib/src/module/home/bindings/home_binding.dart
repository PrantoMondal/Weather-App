import 'package:get/get.dart';
import 'package:weather_app/src/data/local/preference_manager.dart';
import 'package:weather_app/src/data/remote/weather_remote_datasource_impl.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherRemoteDataSourceImpl(), fenix: true);
    Get.lazyPut<HomeController>(
      () => HomeController(
        remoteDataSource: WeatherRemoteDataSourceImpl.to,
        preferenceManager: PreferenceManager.to,
      ),
      fenix: true,
    );
  }
}
