import 'package:freezed_annotation/freezed_annotation.dart';

part 'see_journal_model_response.freezed.dart';
part 'see_journal_model_response.g.dart';

@freezed
class SeeJournalModelResponse with _$SeeJournalModelResponse {
  const factory SeeJournalModelResponse({
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') SeeJournalModelData? data,
  }) = _SeeJournalModelResponse;

  factory SeeJournalModelResponse.fromJson(Map<String, dynamic> json) =>
      _$SeeJournalModelResponseFromJson(json);
}

@freezed
class SeeJournalModelData with _$SeeJournalModelData {
  const factory SeeJournalModelData({
    @JsonKey(name: 'user_journal') SeeJournalModelUserJournal? userJournal,
  }) = _SeeJournalModelData;

  factory SeeJournalModelData.fromJson(Map<String, dynamic> json) =>
      _$SeeJournalModelDataFromJson(json);
}

@freezed
class SeeJournalModelUserJournal with _$SeeJournalModelUserJournal {
  const factory SeeJournalModelUserJournal({
    int? id,
    @JsonKey(name: 'completed_at') String? completedAt,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'journal_id') int? journalId,
    @JsonKey(name: 'is_complete') bool? isComplete,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    SeeJournalModelJournal? journal,
    List<SeeJournalModelAnswer>? journalAnswers,
  }) = _SeeJournalModelUserJournal;

  factory SeeJournalModelUserJournal.fromJson( Map<String, dynamic> json) =>
      _$SeeJournalModelUserJournalFromJson(json);
}

@freezed
class SeeJournalModelJournal with _$SeeJournalModelJournal {
  const factory SeeJournalModelJournal({
    int? id,
    @JsonKey(name: 'emotion_name') String? emotionName,
  }) = _SeeJournalModelJournal;

  factory SeeJournalModelJournal.fromJson(Map<String, dynamic> json) =>
      _$SeeJournalModelJournalFromJson(json);
}

@freezed
class SeeJournalModelAnswer with _$SeeJournalModelAnswer {
  const factory SeeJournalModelAnswer({
    int? id,
    String? text,
    String? media,
    @JsonKey(name:'created_at') String? createdAt,
    @JsonKey(name:'updated_at') String? updatedAt,
    @JsonKey(name:'main_question_id') int? mainQuestionId,
    @JsonKey(name:'follow_up_question_id') int? followUpQuestionId,
    @JsonKey(name:'user_journal_id') int? userJournalId,
    SeeJournalModelMainQuestion? mainQuestion,
    SeeJournalModelFollowUpQuestion? followUpQuestion,
  }) = _SeeJournalModelAnswer;

  factory SeeJournalModelAnswer.fromJson(Map<String, dynamic> json) =>
      _$SeeJournalModelAnswerFromJson(json);
}

@freezed
class SeeJournalModelMainQuestion with _$SeeJournalModelMainQuestion {
  const factory SeeJournalModelMainQuestion({
    int? id,
    String? question,
    String? keywords,
    @JsonKey(name:'answered') bool? answered,
    SeeJournalModelAnswer? answer,
  }) = _SeeJournalModelMainQuestion;

  factory SeeJournalModelMainQuestion.fromJson(Map<String, dynamic> json) =>
      _$SeeJournalModelMainQuestionFromJson(json);
}

@freezed
class SeeJournalModelFollowUpQuestion with _$SeeJournalModelFollowUpQuestion {
  const factory SeeJournalModelFollowUpQuestion({
    int? id,
    String? question,
    String? keywords,
    @JsonKey(name:'question_type') String? questionType,
    List<String>? options,
    @JsonKey(name:'answered') bool? answered,
    SeeJournalModelAnswer? answer,
  }) = _SeeJournalModelFollowUpQuestion;

  factory SeeJournalModelFollowUpQuestion.fromJson(Map<String, dynamic> json) =>
      _$SeeJournalModelFollowUpQuestionFromJson(json);
}