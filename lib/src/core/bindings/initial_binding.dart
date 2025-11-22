import 'package:get/get.dart';
import 'package:weather_app/src/core/service/permission_service.dart';
import 'package:weather_app/src/data/local/preference_manager.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<PreferenceManager>(PreferenceManager(), permanent: true);
    Get.put<PermissionService>(
      PermissionService(preferenceManager: PreferenceManager.to),
      permanent: true,
    );
  }
}
