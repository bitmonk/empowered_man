import 'package:empowered/features/tasks/data/source/tasks_remote_source.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_controller.dart';
import 'package:get/get.dart';

class TasksBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => TasksRemoteSource(Get.find()))
      ..put(
        TasksController(
          remoteSource: Get.find<TasksRemoteSource>(),
        ),
      );
  }
}

class TasksInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => TasksRemoteSource(Get.find()))
      ..put(
        TasksController(
          remoteSource: Get.find<TasksRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<TasksRemoteSource>()
      ..delete<TasksController>();
  }
}
