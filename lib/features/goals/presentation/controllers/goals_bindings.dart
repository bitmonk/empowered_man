import 'package:empowered/features/goals/data/source/goals_remote_source.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_controller.dart';
import 'package:get/get.dart';

class GoalsBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => GoalsRemoteSource(Get.find()))
      ..put(
        GoalsController(
          remoteSource: Get.find<GoalsRemoteSource>(),
        ),
      );
  }
}

class GoalsInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => GoalsRemoteSource(Get.find()))
      ..put(
        GoalsController(
          remoteSource: Get.find<GoalsRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<GoalsRemoteSource>()
      ..delete<GoalsController>();
  }
}
