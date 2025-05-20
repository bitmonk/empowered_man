import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
// import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/data/model/reflection_answer_response_model.dart';
import 'package:empowered/features/home/data/model/reflection_question_answer_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

class ReflectionJournalChatRemoteSource {
  const ReflectionJournalChatRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, ReflectionQuestionAnswerModel>>
      getReflectionWithQuestionAnswers({
    required String reflectionType,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get(
        '${AppEndpoints.getReflectionByType}',
        queryParameters: {
          'reflection_type': reflectionType,
        },
        cancelToken: cancelToken,
      );
      return right(ReflectionQuestionAnswerModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, ReflectionAnswerResponseModel>> sendMessage(
    String reflectionId,
    String? mediaPath,
    CancelToken? cancelToken,
    String? mainQuestionId,
    String? text,
    String? followupQuestionId,
  ) async {
    try {
      final formDataMap = FormData.fromMap({
        'reflection_id': reflectionId,
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
        AppEndpoints.postReflectionAnswer,
        body: formDataMap,
        cancelToken: cancelToken,
      );
      return right(ReflectionAnswerResponseModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, ReflectionAnswerResponseModel>> updateMessage(
    CancelToken? cancelToken,
    String answerId,
    String? text,
  ) async {
    try {
      final formDataMap = FormData.fromMap({
        'text': text ?? '',
        //'answer_id': answerId,
      });

      // if (mediaPath != null) {
      //   var fileName = mediaPath.split('/').last;
      //   var mimeType = mime(fileName) ?? 'application/octet-stream';
      //   var typeParts = mimeType.split('/');

      //   formDataMap.files.add(
      //     MapEntry(
      //       'media[]',
      //       await MultipartFile.fromFile(
      //         mediaPath,
      //         filename: fileName,
      //         contentType: MediaType(typeParts[0], typeParts[1]),
      //       ),
      //     ),
      //   );
      // }
      final response = await _client.post(
        '${AppEndpoints.postReflectionAnswer}/$answerId',
        body: formDataMap,
        cancelToken: cancelToken,
      );
      return right(ReflectionAnswerResponseModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
