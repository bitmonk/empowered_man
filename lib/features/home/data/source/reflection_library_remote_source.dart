import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/features/home/data/model/reflection_library_model.dart';
import 'package:empowered/features/home/data/model/see_user_reflection_response_model.dart';

class ReflectionLibraryRemoteSource {
  const ReflectionLibraryRemoteSource(this._client);
  final DioApiClient _client;
  Future<Either<AppError, ReflectionLibraryModel>> getReflectionLibrary({
    required int? page,
    required String? reflectionType,
    required String? mainQuestion,
    required String? sortBy,
    required String? sortOrder,
    required int? perPage,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};

      if (page != null) queryParameters['page'] = page;
      if (reflectionType != null)
        queryParameters['reflection_type'] = reflectionType;
      if (mainQuestion != null) queryParameters['main_question'] = mainQuestion;
      //   if (sortBy != null) queryParameters['sort_by'] = sortBy;
      //  if (sortOrder != null) queryParameters['sort_order'] = sortOrder;
      if (perPage != null) queryParameters['per_page'] = perPage;

      final response = await _client.get(
        AppEndpoints.reflectionLibrary,
        queryParameters: queryParameters,
      );

      return right(ReflectionLibraryModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, SeeUserReflectionResponseModel>> getBulkSeeReflection({
    required List<String>? reflectionId,
  }) async {
    try {
      final response = await _client.post(
        AppEndpoints.getUserReflectionBulkDetail,
        body: {
          'ids': reflectionId,
        },
      );

      return right(SeeUserReflectionResponseModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
  Future<Either<AppError, String>> deleteBulkReflection({
    required List<String>? reflectionId,
  }) async {
    try {
      final response = await _client.delete(
        AppEndpoints.deleteBulkReflection,
        body: {
          'ids': reflectionId,
        },
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
