import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/features/goals/data/model/goals_answer_response_model.dart';
import 'package:empowered/features/goals/data/model/goals_chat_model.dart';
import 'package:empowered/features/goals/data/model/goals_updated_answer_model.dart';


class GoalsChatRemoteSource {
  const GoalsChatRemoteSource(this._client);

  final DioApiClient _client;
  Future<Either<AppError, GoalsChatModel>> getGoalsChat({
    String? goalId,
    String? goalDetailId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.post(
        AppEndpoints.getGoalsChat,
        queryParameters: {
          'goal_id': goalId,
          'goal_detail_id': goalDetailId,
        },
        cancelToken: cancelToken,
      );

      return right(GoalsChatModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, GoalsAnswerResponseModel>> sendGoalsMessage(
    String userGoalId,
    CancelToken? cancelToken,
    String? questionId,
    String? text,
  ) async {
    try {
      final formDataMap = FormData.fromMap({
        'user_goal_id': userGoalId,
        'question_id': questionId,
        'text': text ?? '',
      });

      final response = await _client.post(
        AppEndpoints.postGoalsAnswer,
        body: formDataMap,
        cancelToken: cancelToken,
      );
      return right(GoalsAnswerResponseModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, GoalsUpdatedAnswerModel>> updateGoalsAnswer(
    CancelToken? cancelToken,
    String goalAnswerId,
    String text,
  ) async {
    try {
      final formDataMap = FormData.fromMap({
        'text': text,
        //'answer_id': answerId,
      });

      final response = await _client.post(
        '${AppEndpoints.postGoalsAnswer}/$goalAnswerId',
        body: formDataMap,
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
}
