import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/features/journal_chat/data/model/journal_emotion_names_model.dart';

class JournalEmotionNamesRemoteSource {
  const JournalEmotionNamesRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, JournalEmotionNamesModel>> getEmotionName() async {
    try {
      final response = await _client.get(
        AppEndpoints.getJournalEmotionName,
        // cancelToken: cancelToken,
      );
      return right(JournalEmotionNamesModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
