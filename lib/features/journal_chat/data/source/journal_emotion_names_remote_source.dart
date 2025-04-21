import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/features/journal_chat/data/model/journal_emotion_names_model.dart';
import 'package:empowered/features/journal_chat/data/model/journal_library_index_model.dart';
import 'package:empowered/features/journal_chat/data/model/user_journals_model.dart';

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

  Future<Either<AppError, JournalLibraryIndexModel>> getJournalLibrary({
    required int? page,
    required String? emotionName,
    required String? mainQuestion,
    required String? sortBy,
    required String? sortOrder,
    required int? perPage,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};

      if (page != null) queryParameters['page'] = page;
      if (emotionName != null) queryParameters['emotion_name'] = emotionName;
      // if (mainQuestion != null) queryParameters['main_question'] = mainQuestion;
      //   if (sortBy != null) queryParameters['sort_by'] = sortBy;
      //  if (sortOrder != null) queryParameters['sort_order'] = sortOrder;
      if (perPage != null) queryParameters['per_page'] = perPage;

      final response = await _client.get(
        AppEndpoints.getJournalLibrary,
        queryParameters: queryParameters,
      );

      return right(JournalLibraryIndexModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, UserJournalsResponse>> getSeeJournal({
    required String? journalId,
  }) async {
    try {
      final response = await _client.get(
        '${AppEndpoints.getSeeJournal}/$journalId/details',
      );

      return right(UserJournalsResponse.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, UserJournalsResponse>> getBulkSeeJournal({
    required List<String>? journalId,
  }) async {
    try {
      final response = await _client.post(
        '${AppEndpoints.getSeeJournal}/details',
        body: {
          'ids': journalId,
        },
      );

      return right(UserJournalsResponse.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, String>> deleteJournal({
    required String? journalId,
  }) async {
    try {
      final response = await _client.delete(
        '${AppEndpoints.getSeeJournal}/$journalId',
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

  Future<Either<AppError, String>> deleteBulkJournal({
    required List<String>? journalId,
  }) async {
    try {
      final response = await _client.delete(
        '${AppEndpoints.getSeeJournal}',
        body: {
          'ids': journalId,
        },
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
