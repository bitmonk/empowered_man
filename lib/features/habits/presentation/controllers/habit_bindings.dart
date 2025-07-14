import 'package:empowered/features/habits/data/source/habit_remote_source.dart';
import 'package:empowered/features/habits/presentation/controllers/habit_controller.dart';
import 'package:get/get.dart';

class HabitBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => HabitRemoteSource(Get.find()))
      ..put(
        HabitController(
          remoteSource: Get.find<HabitRemoteSource>(),
        ),
      );
  }
}

class HabitInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => HabitRemoteSource(Get.find()))
      ..put(
        HabitController(
          remoteSource: Get.find<HabitRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<HabitRemoteSource>()
      ..delete<HabitController>();
  }
}
