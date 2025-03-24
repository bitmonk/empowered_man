import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';

class MainRemoteSource {
  const MainRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, ApiResponse<dynamic>>> getUser() async {
    try {
      await _client.get(
        AppEndpoints.login,
      );

      return right(
        const ApiResponse(),
      );
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, bool>> deleteUser() async {
    try {
      await _client.post(
        AppEndpoints.login,
      );

      return right(
        true,
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
