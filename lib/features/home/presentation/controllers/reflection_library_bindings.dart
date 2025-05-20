import 'package:empowered/features/home/data/source/reflection_library_remote_source.dart';
import 'package:empowered/features/home/presentation/controllers/reflection_library_controller.dart';
import 'package:get/get.dart';

class ReflectionEmotionNameBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => ReflectionLibraryRemoteSource(Get.find()))
      ..put(
        ReflectionLibraryController(
          remoteSource: Get.find<ReflectionLibraryRemoteSource>(),
        ),
      );
  }
}

class ReflectionEmotionNameInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => ReflectionLibraryRemoteSource(Get.find()))
      ..put(
        ReflectionLibraryController(
          remoteSource: Get.find<ReflectionLibraryRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<ReflectionLibraryRemoteSource>()
      ..delete<ReflectionLibraryController>();
  }
}
