import 'package:empowered/features/login/data/source/login_remote_source.dart';
import 'package:empowered/features/login/presentation/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => LoginRemoteSource(Get.find()))
      ..put(
        LoginController(
          remoteSource: Get.find<LoginRemoteSource>(),
        ),
      );
  }
}

class LoginInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => LoginRemoteSource(Get.find()))
      ..put(
        LoginController(
          remoteSource: Get.find<LoginRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<LoginRemoteSource>()
      ..delete<LoginController>();
  }
}
