import 'package:empowered/features/courses/data/source/course_remote_source.dart';
import 'package:empowered/features/courses/presentation/controllers/course_controller.dart';
import 'package:get/get.dart';

class CourseBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => CourseRemoteSource(Get.find()))
      ..put(
        CourseController(
          remoteSource: Get.find<CourseRemoteSource>(),
        ),
      );
  }
}

class CourseInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => CourseRemoteSource(Get.find()))
      ..put(
        CourseController(
          remoteSource: Get.find<CourseRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<CourseRemoteSource>()
      ..delete<CourseController>();
  }
}
