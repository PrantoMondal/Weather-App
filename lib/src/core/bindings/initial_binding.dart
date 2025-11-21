import 'package:get/get.dart';
import 'package:weather_app/src/core/service/permission_service.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.putAsync<PermissionService>(() async {
      final s = PermissionService();
      await s.init(); // init returns Future<void>
      return s;
    });
  }
}
