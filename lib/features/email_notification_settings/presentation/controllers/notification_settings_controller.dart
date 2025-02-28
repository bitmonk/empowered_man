import 'package:empowered/features/email_notification_settings/data/source/notification_settings_remote_source.dart';
import 'package:get/get.dart';

class NotificationSettingsController extends GetxController {
  NotificationSettingsController({required this.remoteSource});
  final NotificationSettingsRemoteSource remoteSource;
  RxBool emailNotificatios = true.obs;
  RxBool contactusResponxe = true.obs;
  RxBool forGetPassword = false.obs;
  RxBool accountTemporarilySuspended = true.obs;
  RxBool accounDeleted = false.obs;
}
