import 'package:get/get.dart';
import 'package:weather_app/src/core/service/permission_service.dart';
import 'package:weather_app/src/module/splash/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PermissionService());
    Get.lazyPut<SplashController>(
      () => SplashController(permissionService: PermissionService.to),
      fenix: true,
    );
  }
}
