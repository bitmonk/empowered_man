import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/profile/data/source/logout_remote_source.dart';

class LogoutController extends GetxController {
  LogoutController({required this.remoteSource});
  final LogoutRemoteSource remoteSource;
  Rx<TheStates> logoutState = TheStates.initial.obs;
  CancelToken? _cancelToken;

  Future<bool> logout(String deviceId) async {
    logoutState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.logout(
      cancelToken: _cancelToken,
      deviceId: deviceId,
    );
    var res = result.fold(
      (l) {
        AppUtils.showErrorSnackbar(message: l.message);
        logoutState.value = TheStates.error;
        return false;
      },
      (r) {
        logoutState.value = TheStates.success;
        AppUtils.showErrorSnackbar(message: r);
        return true;
      },
    );
    return res;
  }
}
