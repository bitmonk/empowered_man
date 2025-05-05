import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/features/assesments/data/model/assessment_history_model.dart';

class AssessmentHistoryRemoteSource {
  const AssessmentHistoryRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, AssessmentHistoryModel>> getAssessmentHistory({
    required int? page,
    required String? query,
    // required String? emotionName,
    // required String? mainQuestion,
    // required String? sortBy,
    // required String? sortOrder,
    required int? perPage, CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get(
        AppEndpoints.assessmentHistoryUrl,
        queryParameters: {         
          if (query != null) 'search': query,
        },cancelToken: cancelToken,
      );

      return right(AssessmentHistoryModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

   Future<Either<AppError, String>> deleteAssessments({
    required List<String>? assessmentId,
  }) async {
    try {
      final response = await _client.delete(
        '${AppEndpoints.deleteAssessmentUrl}',
        body: {
          'ids': assessmentId,
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
