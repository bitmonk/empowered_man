import 'package:empowered/features/goals/data/source/goals_overview_source.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_overview_controller.dart';
import 'package:get/get.dart';

class GoalsOverviewBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => GoalsOverviewRemoteSource(Get.find()))
      ..put(
        GoalsOverviewController(
          remoteSource: Get.find<GoalsOverviewRemoteSource>(),
        ),
      );
  }
}

class GoalsOverviewInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => GoalsOverviewRemoteSource(Get.find()))
      ..put(
        GoalsOverviewController(
          remoteSource: Get.find<GoalsOverviewRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<GoalsOverviewRemoteSource>()
      ..delete<GoalsOverviewController>();
  }
}
