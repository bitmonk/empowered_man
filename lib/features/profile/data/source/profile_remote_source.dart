import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/features/profile/data/model/user_profile_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

class ProfileRemoteSource {
  const ProfileRemoteSource(this._client);
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

  Future<Either<AppError, String>> updateProfileImage({
    required String? profilePhotoPath,
    CancelToken? cancelToken,
  }) async {
    try {
      resetUnauthorizedFlag();
      final formDataMap = FormData.fromMap({});

      if (profilePhotoPath != null) {
        var fileName = profilePhotoPath.split('/').last;
        var mimeType = mime(fileName) ?? '';
        var mimee = mimeType.split('/')[0];
        var type = mimeType.split('/')[1];

        formDataMap.files.add(
          MapEntry(
            'image',
            await MultipartFile.fromFile(
              profilePhotoPath,
              filename: fileName,
              contentType: MediaType(mimee, type),
            ),
          ),
        );
      }

      final response = await _client.post(
        AppEndpoints.updateProfileImage,
        body: formDataMap,
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

  Future<Either<AppError, String>> deleteProfileImage({
    CancelToken? cancelToken,
  }) async {
    try {
      resetUnauthorizedFlag();

      final response = await _client.delete(
        AppEndpoints.deleteProfileImage,
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

  Future<Either<AppError, UserProfileModel>> getProfile() async {
    try {
      final response = await _client.get(
        AppEndpoints.getUserProfile,
        // cancelToken: cancelToken,
      );
      final data = response['data']['user'];
      return right(UserProfileModel.fromJson(data));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
