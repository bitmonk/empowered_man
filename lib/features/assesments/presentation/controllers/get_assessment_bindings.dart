import 'package:empowered/features/assesments/data/source/get_assessment_remote_source.dart';
import 'package:empowered/features/assesments/presentation/controllers/get_assessment_controller.dart';
import 'package:get/get.dart';

class GetAssessmentBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => GetAssessmentRemoteSource(Get.find()))
      ..put(
        GetAssessmentController(
          remoteSource: Get.find<GetAssessmentRemoteSource>(),
        ),
      );
  }
}

class GetAssessmentInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => GetAssessmentRemoteSource(Get.find()))
      ..put(
        GetAssessmentController(
          remoteSource: Get.find<GetAssessmentRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<GetAssessmentRemoteSource>()
      ..delete<GetAssessmentController>();
  }
}
