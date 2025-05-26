import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/features/power_score_stats/data/model/power_stat_model.dart';

class PowerScoreRemoteSource {
  const PowerScoreRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, PowerStatModel>> getPowerScore({
    required String? fromDate,
    required String? toDate,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get(
        AppEndpoints.getPowerScoreStats,
        queryParameters: {
          'from_date': fromDate,
          'to_date': toDate,
        },
        cancelToken: cancelToken,
      );

      return right(PowerStatModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
