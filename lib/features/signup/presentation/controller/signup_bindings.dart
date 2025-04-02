import 'package:empowered/features/signup/data/source/signup_remote_source.dart';
import 'package:empowered/features/signup/presentation/controller/signup_controller.dart';
import 'package:get/get.dart';

class SignupBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => SignupRemoteSource(Get.find()))
      ..put(
        SignupController(
          remoteSource: Get.find<SignupRemoteSource>(),
        ),
      );
  }
}

class SignupInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => SignupRemoteSource(Get.find()))
      ..put(
        SignupController(
          remoteSource: Get.find<SignupRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<SignupRemoteSource>()
      ..delete<SignupController>();
  }
}
