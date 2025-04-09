import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';

class EditProfileRemoteSource {
  const EditProfileRemoteSource(this._client);
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

  Future<Either<AppError, String>> updateProfile({
    required String? name,
    required String? email,
    required String? phone,
    required String? occupation,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.post(
        AppEndpoints.updateProfile,
        body: {
          'full_name': name,
          'email': email,
          'occupation': occupation,
          'phone_number': phone,
          'image': null,
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
