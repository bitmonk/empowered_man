import 'package:empowered/features/profile/data/source/logout_remote_source.dart';
import 'package:empowered/features/profile/presentation/controllers/logout_controller.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => LogoutRemoteSource(Get.find()))
      ..put(
        LogoutController(
          remoteSource: Get.find<LogoutRemoteSource>(),
        ),
      );
  }
}

class LogoutInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => LogoutRemoteSource(Get.find()))
      ..put(
        LogoutController(
          remoteSource: Get.find<LogoutRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<LogoutRemoteSource>()
      ..delete<LogoutController>();
  }
}
