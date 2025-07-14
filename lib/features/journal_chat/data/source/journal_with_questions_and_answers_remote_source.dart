// import 'package:dartz/dartz.dart';
// import 'package:empowered/core/dio_provider/api_response.dart';
// import 'package:empowered/core/dio_provider/dio_api_client.dart';
// import 'package:empowered/core/extension/extensions.dart';
// import 'package:empowered/features/journal_chat/data/model/chat_conversation_model.dart';

// class JournalWithQuestionsAndAnswersRemoteSource {
//   const JournalWithQuestionsAndAnswersRemoteSource(this._client);
//   final DioApiClient _client;
//   Future<Either<AppError, ChatConversationModel>>
//       getJournalWithQuestionsAndAnswers(String id) async {
//     try {
//       final response = await _client.get(
//         '${AppEndpoints.getJournalWithQuestionsAndAnswers}$id',
//         // cancelToken: cancelToken,
//       );
//       return right(ChatConversationModel.fromJson(response));
//     } catch (e) {
//       if (e is ApiErrorResponse) {
//         return left(e);
//       } else {
//         return left(InternalAppError(message: e.toString()));
//       }
//     }
//   }
// }
