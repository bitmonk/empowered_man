import 'package:empowered/features/push_notification/data/source/notification_remote_source.dart';
import 'package:empowered/features/push_notification/presentation/controller/push_notification_controller.dart';
import 'package:get/get.dart';

class PushNotificationBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => PushNotificationRemoteSource(Get.find()))
      ..put(
        PushNotificationController(
          remoteSource: Get.find<PushNotificationRemoteSource>(),
        ),
      );
  }
}

class PushNotificationInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => PushNotificationRemoteSource(Get.find()))
      ..put(
        PushNotificationController(
          remoteSource: Get.find<PushNotificationRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<PushNotificationRemoteSource>()
      ..delete<PushNotificationController>();
  }
}
