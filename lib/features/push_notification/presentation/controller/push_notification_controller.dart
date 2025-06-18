import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/push_notification/data/model/push_notification_model.dart';
import 'package:empowered/features/push_notification/data/source/notification_remote_source.dart';

class PushNotificationController extends GetxController {
  PushNotificationController({required this.remoteSource});
  final PushNotificationRemoteSource remoteSource;

  Rx<TheStates> getPushNotificationState = TheStates.initial.obs;
  Rx<PushNotificationModel> pushNotificationModel = const PushNotificationModel().obs;

  CancelToken? _cancelToken;

  @override
  void onInit() {
    super.onInit();
    getNotification();
  }

  Future<void> getNotification() async {
    getPushNotificationState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.getNotification(
      cancelToken: _cancelToken,
    );

    result.fold(
      (l) {
        getPushNotificationState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        pushNotificationModel.value = r;
        getPushNotificationState.value = TheStates.success;
        return true;
      },
    );
  }
}
