import 'package:dartz/dartz.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/notification/data/model/notification_model.dart';

class NotificationRemoteSource {
  const NotificationRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, NotificationModel>> getNotification(
      {CancelToken? cancelToken,}) async {
    try {
      final response = await _client.get(AppEndpoints.getNotification,
          cancelToken: cancelToken,);
      var res = NotificationModel.fromJson(response);
      return right(res);
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, String>> updateNotification(
      {required Map<String, String> body, CancelToken? cancelToken,}) async {
    try {
      final response = await _client.post(AppEndpoints.getNotification,
          body: body, cancelToken: cancelToken,);
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
