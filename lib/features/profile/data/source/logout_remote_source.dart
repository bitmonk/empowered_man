import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';

class LogoutRemoteSource {
  const LogoutRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, String>> logout({
    CancelToken? cancelToken,
  }) async {
    try {
      resetUnauthorizedFlag();
      final response = await _client.post(
        AppEndpoints.logout,
        // body: {},
        cancelToken: cancelToken,
      );
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
