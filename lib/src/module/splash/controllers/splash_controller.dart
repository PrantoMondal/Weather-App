import 'package:get/get.dart';
import 'package:weather_app/src/core/base/base_controller.dart';
import 'package:weather_app/src/core/routes/app_pages.dart';
import 'package:weather_app/src/core/service/permission_service.dart';

class SplashController extends BaseController {
  final PermissionService permissionService;
  SplashController({required this.permissionService});

  @override
  void onInit() {
    super.onInit();
    startApp();
  }

  Future<void> startApp() async {
    await Future.delayed(const Duration(seconds: 1));
    await permissionService.init();

    Get.offAllNamed(Routes.HOME);
  }
}
