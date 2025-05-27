import 'package:dartz/dartz.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/data/model/reflection_model.dart';

class ReflectionRemoteSource {
  const ReflectionRemoteSource(this._client);
  final DioApiClient _client;
  Future<Either<AppError, ReflectionModel>> getReflection({
    String? reflectionId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get(
        '${AppEndpoints.getReflection}$reflectionId',
        cancelToken: cancelToken,
      );

      return right(ReflectionModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
