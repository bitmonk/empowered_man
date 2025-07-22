import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/profile/data/model/user_profile_model.dart';
import 'package:empowered/features/profile/data/source/logout_remote_source.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';

class LogoutController extends GetxController {
  LogoutController({required this.remoteSource});
  final LogoutRemoteSource remoteSource;
  Rx<TheStates> logoutState = TheStates.initial.obs;
  CancelToken? _cancelToken;

  Future<bool> logout(String deviceId) async {
    logoutState.value = TheStates.loading;
    _cancelToken = CancelToken();

    try {
      // Log out from Agora Chat SDK
      // await ChatClient.getInstance.logout(); // true to clear local data
      // print('Agora Chat SDK logged out successfully');

      // Reset ProfileController's userProfile
      final profileController = Get.find<ProfileController>();
      profileController.userProfile.value = const UserProfileModel();
      profileController.userProfileState.value = TheStates.initial;

      // Perform API logout
      final result = await remoteSource.logout(
        cancelToken: _cancelToken,
        deviceId: deviceId,
      );

      return result.fold(
        (l) {
          AppUtils.showErrorSnackbar(message: l.message);
          logoutState.value = TheStates.error;
          return false;
        },
        (r) {
          logoutState.value = TheStates.success;
          AppUtils.showErrorSnackbar(message: r);
          // Navigate to login screen
          Get.offAllNamed('/login');
          return true;
        },
      );
    } catch (e) {
      print('Logout error: $e');
      AppUtils.showErrorSnackbar(message: 'Failed to log out: $e');
      logoutState.value = TheStates.error;
      return false;
    }
  }

  @override
  void onClose() {
    _cancelToken?.cancel();
    super.onClose();
  }
}
