import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/features/journal_chat/data/model/chat_conversation_model.dart';
import 'package:empowered/features/journal_chat/data/model/journal_answer_response_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

class JournalChatRemoteSource {
  const JournalChatRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, ChatConversationModel>>
      getJournalWithQuestionsAndAnswers(String id) async {
    try {
      final response = await _client.get(
        '${AppEndpoints.getJournalWithQuestionsAndAnswers}$id',
        // cancelToken: cancelToken,
      );
      return right(ChatConversationModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, JournalAnswerResponseModel>> sendMessage(
    String id,
    String? mediaPath,
    CancelToken? cancelToken,
    String? mainQuestionId,
    String? text,
    String? followupQuestionId,
  ) async {
    try {
      final formDataMap = FormData.fromMap({
        'journal_id': id,
        'main_question_id': mainQuestionId,
        'text': text ?? '',
        'follow_up_question_id': followupQuestionId,
      });

      if (mediaPath != null) {
        var fileName = mediaPath.split('/').last;
        var mimeType = mime(fileName) ?? 'application/octet-stream';
        var typeParts = mimeType.split('/');

        formDataMap.files.add(
          MapEntry(
            'media[]',
            await MultipartFile.fromFile(
              mediaPath,
              filename: fileName,
              contentType: MediaType(typeParts[0], typeParts[1]),
            ),
          ),
        );
      }
      final response = await _client.post(
        AppEndpoints.postJournalAnswer,
        body: formDataMap,
        cancelToken: cancelToken,
      );
      return right(JournalAnswerResponseModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
