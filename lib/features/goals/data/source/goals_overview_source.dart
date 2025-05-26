import 'package:dartz/dartz.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/data/model/goals_overview_model.dart';

class GoalsOverviewRemoteSource {
  const GoalsOverviewRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, GoalsOverviewModel>> getGoalsOverview({
    String? year,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get(
        AppEndpoints.getGoalsOverviewUrl,
        queryParameters: {
          'year': year,
        },
        cancelToken: cancelToken,
      );

      return right(GoalsOverviewModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
