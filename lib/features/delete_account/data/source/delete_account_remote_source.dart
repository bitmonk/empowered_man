import 'package:dartz/dartz.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';

class DeleteAccountRemoteSource {
  const DeleteAccountRemoteSource(this._client);
  // final DioApiClient _client;
  final DioApiClient _client;

  // Future<Either<AppError, ApiResponse<dynamic>>> fetchData({
  //   required int pageKey,
  //   String? searchQuery,
  // }) async {
  //   try {
  //     // final param = <String, dynamic>{'page': pageKey};
  //     // final url = searchQuery == null
  //     //     ? AppEndpoints.countries
  //     //     : AppEndpoints.countries + searchQuery;

  //     // final response =
  //     //     await _client.httpGet<dynamic>(url, queryParameters: param);
  //     // return right(
  //     //   ApiResponse(
  //     //     data: null
  //     //   ,)
  //     // );
  //     throw UnimplementedError();
  //   } catch (e) {
  //     if (e is ApiErrorResponse) {
  //       return left(e);
  //     } else {
  //       return left(InternalAppError(message: e.toString()));
  //     }
  //   }
  // }
  Future<Either<AppError, String>> deleteAccount({
    required String password,
    required String reasonForDeletion,
    CancelToken? cancelToken,
  }) async {
    try {
      resetUnauthorizedFlag();

      final response = await _client.delete(
        AppEndpoints.deleteAccount,
        body: {
          'password': password,
          'reason_for_deletion': reasonForDeletion,
        },
        cancelToken: cancelToken,
      );
      return Right(response['message']);
    } catch (e) {
      if (e is ApiErrorResponse) {
        return Left(e);
      } else {
        return Left(InternalAppError(message: e.toString()));
      }
    }
  }
}
