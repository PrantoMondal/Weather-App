import 'package:get/get.dart';
import 'package:weather_app/src/core/service/permission_service.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(() => PermissionService().init());
    // Get.lazyPut(() => AuthRemoteDatasource(), fenix: true);
    // Get.lazyPut(() => SocketService(), fenix: true);
  }
}
