import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';

class ForgotPasswordRemoteSource {
  const ForgotPasswordRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, String>> forgotPassword({
    required String email,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.post(AppEndpoints.forgotPassword,
          cancelToken: cancelToken, body: {'email': email},);
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
