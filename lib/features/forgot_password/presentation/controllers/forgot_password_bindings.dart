import 'package:empowered/features/forgot_password/data/source/forgot_password_remote_source.dart';
import 'package:empowered/features/forgot_password/presentation/controllers/forgot_password_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => ForgotPasswordRemoteSource(Get.find()))
      ..put(
        ForgotPasswordController(
          remoteSource: Get.find<ForgotPasswordRemoteSource>(),
        ),
      );
  }
}

class ForgotPasswordInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => ForgotPasswordRemoteSource(Get.find()))
      ..put(
        ForgotPasswordController(
          remoteSource: Get.find<ForgotPasswordRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<ForgotPasswordRemoteSource>()
      ..delete<ForgotPasswordController>();
  }
}
