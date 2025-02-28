import 'package:empowered/features/app_directory/data/source/app_directory_remote_source.dart';
import 'package:empowered/features/app_directory/presentation/controllers/app_directory_controller.dart';
import 'package:get/get.dart';

class AppDirectoryBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => AppDirectoryRemoteSource(Get.find()))
      ..put(
        AppDirectoryController(
          remoteSource: Get.find<AppDirectoryRemoteSource>(),
        ),
      );
  }
}

class AppDirectoryInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => AppDirectoryRemoteSource(Get.find()))
      ..put(
        AppDirectoryController(
          remoteSource: Get.find<AppDirectoryRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<AppDirectoryRemoteSource>()
      ..delete<AppDirectoryController>();
  }
}
