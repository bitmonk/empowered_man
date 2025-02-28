import 'package:empowered/features/profile/data/source/profile_remote_source.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => ProfileRemoteSource(Get.find()))
      ..put(
        ProfileController(
          remoteSource: Get.find<ProfileRemoteSource>(),
        ),
      );
  }
}

class ProfileInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => ProfileRemoteSource(Get.find()))
      ..put(
        ProfileController(
          remoteSource: Get.find<ProfileRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<ProfileRemoteSource>()
      ..delete<ProfileController>();
  }
}
