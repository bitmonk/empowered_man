import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/preferences/preferences.dart';
import 'package:get/get.dart';

class LoginRemoteSource {
  const LoginRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, ApiResponse<String>>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.post(
        AppEndpoints.login,
        body: {
          'email': email,
          'password': password,
        },
      );
      final token = response['token'] as String;
      await Get.find<Preferences>()
          .saveString(PreferenceKeys.accessToken, token);
      return right(
        ApiResponse(
          data: token,
        ),
      );
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
