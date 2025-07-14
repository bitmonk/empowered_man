import 'package:empowered/features/assesments/data/source/user_assessment_remote_source.dart';
import 'package:empowered/features/assesments/presentation/controllers/user_assessment_controller.dart';
import 'package:get/get.dart';

class UserAssessmentBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => UserAssessmentRemoteSource(Get.find()))
      ..put(
        UserAssessmentController(
          remoteSource: Get.find<UserAssessmentRemoteSource>(),
        ),
      );
  }
}

class UserAssessmentInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => UserAssessmentRemoteSource(Get.find()))
      ..put(
        UserAssessmentController(
          remoteSource: Get.find<UserAssessmentRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<UserAssessmentRemoteSource>()
      ..delete<UserAssessmentController>();
  }
}
