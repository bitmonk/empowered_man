import 'package:dartz/dartz.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/data/model/agora_user_model.dart';

class ChatRemoteSource {
  ChatRemoteSource(this._client);
  final DioApiClient _client;
  final Dio _dio = Dio();
  Future<Either<AppError, bool>> downloadVideo({
    required String url,
    required String path,
    Function(int, int)? onReceiveProgress,
  }) async {
    try {
      await _dio.download(url, path, onReceiveProgress: onReceiveProgress);
      return right(true);
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, AgoraUserModel>> searchUser({
    required String? query,
    String limit = '100',
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.post(
        AppEndpoints.searchUser,
        body: {
          'query': query,
          'limit': limit,
        },
        cancelToken: cancelToken,
      );

      return right(AgoraUserModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
