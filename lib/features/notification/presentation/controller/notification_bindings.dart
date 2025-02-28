import 'package:empowered/features/notification/data/source/notification_remote_source.dart';
import 'package:empowered/features/notification/presentation/controller/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => NotificationRemoteSource(Get.find()))
      ..put(
        NotificationController(
          remoteSource: Get.find<NotificationRemoteSource>(),
        ),
      );
  }
}

class NotificationInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => NotificationRemoteSource(Get.find()))
      ..put(
        NotificationController(
          remoteSource: Get.find<NotificationRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<NotificationRemoteSource>()
      ..delete<NotificationController>();
  }
}
