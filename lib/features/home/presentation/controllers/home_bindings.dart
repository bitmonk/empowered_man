import 'package:empowered/features/home/data/source/home_remote_source.dart';
import 'package:empowered/features/home/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => HomeRemoteSource(Get.find()))
      ..put(
        HomeController(
          remoteSource: Get.find<HomeRemoteSource>(),
        ),
      );
  }
}

class HomeInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => HomeRemoteSource(Get.find()))
      ..put(
        HomeController(
          remoteSource: Get.find<HomeRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<HomeRemoteSource>()
      ..delete<HomeController>();
  }
}
