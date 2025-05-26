import 'package:dartz/dartz.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';

class ChatRemoteSource {
  ChatRemoteSource(this._client);
  final DioApiClient _client;
  final Dio _dio = Dio();
  Future<Either<AppError, bool>> downloadVideo(
      {required String url,
      required String path,
      Function(int, int)? onReceiveProgress,}) async {
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
}
