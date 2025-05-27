import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/data/source/reflection_remote_source.dart';
import 'package:empowered/features/goals/presentation/controllers/reflection_controller.dart';

class ReflectionBindings extends Bindings{
  @override
  void dependencies() {
    Get
      ..lazyPut(() => ReflectionRemoteSource(Get.find()))
      ..put(
        ReflectionController(
          remoteSource: Get.find<ReflectionRemoteSource>(),
        ),
      );
  }
}

class ReflectionInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => ReflectionRemoteSource(Get.find()))
      ..put(
        ReflectionController(
          remoteSource: Get.find<ReflectionRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<ReflectionRemoteSource>()
      ..delete<ReflectionController>();
  }
}