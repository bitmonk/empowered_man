import 'package:empowered/features/assesments/data/source/assessment_history_remote_source.dart';
import 'package:empowered/features/assesments/presentation/controllers/assessment_history_controller.dart';
import 'package:get/get.dart';

class AssessmentHistoryBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => AssessmentHistoryRemoteSource(Get.find()))
      ..put(
        AssessmentHistoryController(
          remoteSource: Get.find<AssessmentHistoryRemoteSource>(),
        ),
      );
  }
}

class AssessmentHistoryInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => AssessmentHistoryRemoteSource(Get.find()))
      ..put(
        AssessmentHistoryController(
          remoteSource: Get.find<AssessmentHistoryRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<AssessmentHistoryRemoteSource>()
      ..delete<AssessmentHistoryController>();
  }
}
