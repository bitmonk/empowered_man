import 'package:empowered/features/tribe/data/source/tribe_group_remote_source.dart';
import 'package:empowered/features/tribe/presentation/controller/tribe_group_controller.dart';
import 'package:get/get.dart';

class TribeGroupBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => TribeGroupRemoteSource(Get.find()))
      ..put(
        TribeGroupController(
          remoteSource: Get.find<TribeGroupRemoteSource>(),
        ),
      );
  }
}

class TribeGroupInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => TribeGroupRemoteSource(Get.find()))
      ..put(
        TribeGroupController(
          remoteSource: Get.find<TribeGroupRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<TribeGroupRemoteSource>()
      ..delete<TribeGroupController>();
  }
}
