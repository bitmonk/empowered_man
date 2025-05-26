import 'package:empowered/features/power_score_stats/data/source/power_score_remote_source.dart';
import 'package:empowered/features/power_score_stats/presentation/controllers/power_score_controller.dart';
import 'package:get/get.dart';

class PowerScoreBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => PowerScoreRemoteSource(Get.find()))
      ..put(
        PowerScoreController(
          remoteSource: Get.find<PowerScoreRemoteSource>(),
        ),
      );
  }
}

class PowerScoreInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => PowerScoreRemoteSource(Get.find()))
      ..put(
        PowerScoreController(
          remoteSource: Get.find<PowerScoreRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<PowerScoreRemoteSource>()
      ..delete<PowerScoreController>();
  }
}
