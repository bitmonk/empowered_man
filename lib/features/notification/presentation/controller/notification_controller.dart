import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/notification/data/model/notification_model.dart';
import 'package:empowered/features/notification/data/source/notification_remote_source.dart';

class NotificationController extends GetxController {
  NotificationController({required this.remoteSource});
  final NotificationRemoteSource remoteSource;
  RxBool allNotification = true.obs;
  RxBool checkInReminderNotification = true.obs;
  RxBool newMessageAddedNotification = true.obs;
  RxBool newVideoAddedNotification = true.obs;
  RxBool newReplyToMessage = true.obs;

  Rx<TheStates> getNotificationState = TheStates.initial.obs;
  Rx<TheStates> updateNotificationState = TheStates.initial.obs;
  CancelToken? _cancelToken;

  Rx<NotificationModel> notificationList = const NotificationModel().obs;

  Future<void> getNotification() async {
    getNotificationState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.getNotification(
      cancelToken: _cancelToken,
    );

    result.fold(
      (l) {
        getNotificationState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) {
        notificationList.value = r;
        getNotificationState.value = TheStates.success;
      },
    );
  }

  Future<void> updateNotification() async {
    updateNotificationState.value = TheStates.loading;
    var body = <String, String>{};
    notificationList.value.data?.entries.forEach((e) =>
        body[e.value.entries.first.key] =
            e.value.entries.first.value ? '1' : '0',);
    _cancelToken = CancelToken();
    final result = await remoteSource.updateNotification(
      body: body,
      cancelToken: _cancelToken,
    );

    result.fold(
      (l) {
        updateNotificationState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) {
        getNotification();
        // AppUtils.showSnackbar(message: r);
        updateNotificationState.value = TheStates.success;
      },
    );
  }
}
