import 'package:empowered/features/main/data/source/main_remote_source.dart';
import 'package:empowered/features/main/presentation/controllers/main_controller.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => MainRemoteSource(Get.find()))
      ..put(
        MainController(
          remoteSource: Get.find<MainRemoteSource>(),
        ),
      );
  }
}

class MainInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => MainRemoteSource(Get.find()))
      ..put(
        MainController(
          remoteSource: Get.find<MainRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<MainRemoteSource>()
      ..delete<MainController>();
  }
}
