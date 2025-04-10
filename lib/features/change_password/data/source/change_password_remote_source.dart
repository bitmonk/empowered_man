import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';

class ChangePasswordRemoteSource {
  const ChangePasswordRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, ApiResponse<dynamic>>> fetchData({
    required int pageKey,
    String? searchQuery,
  }) async {
    try {
      // final param = <String, dynamic>{'page': pageKey};
      // final url = searchQuery == null
      //     ? AppEndpoints.countries
      //     : AppEndpoints.countries + searchQuery;

      // final response =
      //     await _client.httpGet<dynamic>(url, queryParameters: param);
      // return right(
      //   ApiResponse(
      //     data: null
      //   ,)
      // );
      throw UnimplementedError();
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, String>> changePassword({
    required String newPasswordConfirmation,
    required String newPassword,
    CancelToken? cancelToken,
  }) async {
    try {
      print(
        'Sending PUT request to ${AppEndpoints.changePassword} with body: {new_password: $newPassword, new_password_confirmation: $newPasswordConfirmation}',
      );
      final response = await _client.put(
        AppEndpoints.changePassword,
        body: {
          'new_password': newPassword,
          'new_password_confirmation': newPasswordConfirmation,
        },
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
