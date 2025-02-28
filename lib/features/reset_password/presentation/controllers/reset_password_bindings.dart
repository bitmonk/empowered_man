import 'package:empowered/features/reset_password/data/source/reset_password_remote_source.dart';
import 'package:empowered/features/reset_password/presentation/controllers/reset_password_controller.dart';
import 'package:get/get.dart';

class ResetPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => ResetPasswordRemoteSource(Get.find()))
      ..put(
        ResetPasswordController(
          remoteSource: Get.find<ResetPasswordRemoteSource>(),
        ),
      );
  }
}

class ResetPasswordInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => ResetPasswordRemoteSource(Get.find()))
      ..put(
        ResetPasswordController(
          remoteSource: Get.find<ResetPasswordRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<ResetPasswordRemoteSource>()
      ..delete<ResetPasswordController>();
  }
}
