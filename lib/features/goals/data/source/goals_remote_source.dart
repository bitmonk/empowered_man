import 'package:dartz/dartz.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/data/model/goals_model.dart';
import 'package:empowered/features/goals/data/model/goals_updated_answer_model.dart';

class GoalsRemoteSource {
  const GoalsRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, GoalsModel>> getGoals({
    String? fromDate,
    String? toDate,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get(
        AppEndpoints.getGoalsUrl,
        queryParameters: {'from_date': fromDate, 'to_date': toDate},
        cancelToken: cancelToken,
      );

      return right(GoalsModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, GoalsUpdatedAnswerModel>> achieveTarget({
    String? id,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.patch(
        '${AppEndpoints.postAchieveTarget}/$id/achieve',
        cancelToken: cancelToken,
      );

      return right(GoalsUpdatedAnswerModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, GoalsUpdatedAnswerModel>> markOnTrack({
    String? id,
    bool? onTrack,
    CancelToken? cancelToken,
  }) async {
    try {
      var onTrackId = onTrack == true ? 1 : 0;
      final response = await _client.patch(
        '${AppEndpoints.postMarkOnTrackUrl}/$id/ontrack',
        queryParameters: {'is_ontrack': onTrackId},
        cancelToken: cancelToken,
      );

      return right(GoalsUpdatedAnswerModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, GoalsUpdatedAnswerModel>> completeGoal({
    String? id,
    bool? complateGoal,
    CancelToken? cancelToken,
  }) async {
    try {
      var complateGoalId = complateGoal == false ? 1 : 0;
      final response = await _client.patch(
        '${AppEndpoints.postMarkOnTrackUrl}/$id/complete',
        queryParameters: {'is_complete': complateGoalId},
        cancelToken: cancelToken,
      );
      if (response['data'] is List) {
        return right(GoalsUpdatedAnswerModel.empty());
      } else {
        return right(GoalsUpdatedAnswerModel.fromJson(response));
      }
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
