import 'package:empowered/features/goals/data/source/goals_chat_remote_source.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_chat_controller.dart';
import 'package:get/get.dart';

class GoalsChatBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => GoalsChatRemoteSource(Get.find()))
      ..put(
        GoalsChatController(
          remoteSource: Get.find<GoalsChatRemoteSource>(),
        ),
      );
  }
}

class GoalsChatInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => GoalsChatRemoteSource(Get.find()))
      ..put(
        GoalsChatController(
          remoteSource: Get.find<GoalsChatRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<GoalsChatRemoteSource>()
      ..delete<GoalsChatController>();
  }
}
