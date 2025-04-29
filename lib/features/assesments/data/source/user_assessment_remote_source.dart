import 'package:dartz/dartz.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/data/model/score_question_model.dart';
import 'package:empowered/features/assesments/data/model/user_assessment_model.dart';

class UserAssessmentRemoteSource {
  const UserAssessmentRemoteSource(this._client);

  final DioApiClient _client;

  Future<Either<AppError, UserAssessmentModel>> userAssessment({
    String? id,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.post(
        '${AppEndpoints.createUserAssessement}$id/start',
        cancelToken: cancelToken,
        body: {
          'assessment_id': id,
        },
      );

      return right(UserAssessmentModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, ScoreQuestionModel>> scoreQuestion({
    String? userAssessmentScoreId,
    String? assessmentQuestionId,
    String? score,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.post(
        AppEndpoints.scoreQuestionUrl,
        cancelToken: cancelToken,
        body: {
          'user_assessment_score_id': userAssessmentScoreId,
          'assessment_question_id': assessmentQuestionId,
          'score': score,
        },
      );

      return right(ScoreQuestionModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
