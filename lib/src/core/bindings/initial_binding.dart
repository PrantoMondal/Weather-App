import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => PreferenceManagerImpl(), fenix: true);
    // Get.lazyPut(() => AuthRemoteDatasource(), fenix: true);
    // Get.lazyPut(() => SocketService(), fenix: true);
  }
}
