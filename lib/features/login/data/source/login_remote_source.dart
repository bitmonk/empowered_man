import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/preferences/shared_pref.dart';
import 'package:empowered/core/push_notification/firebase_notification_service.dart';
import 'package:empowered/features/profile/data/model/user_profile_model.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:get/get.dart';

class LoginRemoteSource {
  const LoginRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, String>> login({
    required String email,
    required String password,
    CancelToken? cancelToken,
  }) async {
    try {
      var deviceToken =
          await Get.find<FirebaseNotificationService>().getToken();
      resetUnauthorizedFlag();
      final response = await _client.post(
        AppEndpoints.login,
        body: {
          'email': email,
          'password': password,
          'device_token': deviceToken ?? 'null',
        },
        cancelToken: cancelToken,
      );
      final token = response['data']['token'] as String;
      await Get.find<AppSharedPref>().saveAccessToken(token);
      await Get.find<AppSharedPref>()
          .saveRefreshToken(response['data']['refresh_token']);
      var profile = UserProfileModel.fromJson(response['data']['user']);

      await Get.find<AppSharedPref>().saveUserModel(profile);
      Get.find<ProfileController>().userProfile.value = profile;
      return right(response['message']);
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
