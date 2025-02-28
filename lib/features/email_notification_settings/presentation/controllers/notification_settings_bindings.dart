import 'package:empowered/features/email_notification_settings/data/source/notification_settings_remote_source.dart';
import 'package:empowered/features/email_notification_settings/presentation/controllers/notification_settings_controller.dart';
import 'package:get/get.dart';

class NotificationSettingsBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => NotificationSettingsRemoteSource(Get.find()))
      ..put(
        NotificationSettingsController(
          remoteSource: Get.find<NotificationSettingsRemoteSource>(),
        ),
      );
  }
}

class NotificationSettingsInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => NotificationSettingsRemoteSource(Get.find()))
      ..put(
        NotificationSettingsController(
          remoteSource: Get.find<NotificationSettingsRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<NotificationSettingsRemoteSource>()
      ..delete<NotificationSettingsController>();
  }
}
