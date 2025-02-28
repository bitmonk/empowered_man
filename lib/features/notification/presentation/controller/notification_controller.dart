import 'package:empowered/features/notification/data/source/notification_remote_source.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationController({required this.remoteSource});
  final NotificationRemoteSource remoteSource;
  RxBool allNotification = true.obs;
  RxBool checkInReminderNotification = true.obs;
  RxBool newMessageAddedNotification = true.obs;
  RxBool newVideoAddedNotification = true.obs;
  RxBool newReplyToMessage = true.obs;
}
