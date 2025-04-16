import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';

class HabitRemoteSource {
  const HabitRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, String>> getHabit({
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get(
        AppEndpoints.habits,
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

  Future<Either<AppError, String>> updateHabit({
    required String habitId,
    required String status,
    required String habitDate,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.post(
        AppEndpoints.habits,
        queryParameters: {
          'habits_id': habitId,
          'habit_date': habitDate,
          'status': status,
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
