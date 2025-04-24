import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_journals_model.freezed.dart';
part 'user_journals_model.g.dart';

@freezed
class SeeUserJournalResponseModel with _$SeeUserJournalResponseModel {
  const factory SeeUserJournalResponseModel({
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') SeeUserJournalsData? data,
  }) = _SeeUserJournalResponseModel;

  factory SeeUserJournalResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SeeUserJournalResponseModelFromJson(json);
}

@freezed
class SeeUserJournalsData with _$SeeUserJournalsData {
  const factory SeeUserJournalsData({
    @JsonKey(name: 'user_journals') List<SeeUserJournal>? userJournals,
  }) = _SeeUserJournalsData;

  factory SeeUserJournalsData.fromJson(Map<String, dynamic> json) =>
      _$SeeUserJournalsDataFromJson(json);
}

@freezed
class SeeUserJournal with _$SeeUserJournal {
  const factory SeeUserJournal({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'completed_at') String? completedAt,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'journal_id') int? journalId,
    @JsonKey(name: 'is_complete') bool? isComplete,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'journal') Journal? journal,
    @JsonKey(name: 'journal_answers') List<JournalAnswer>? journalAnswers,
  }) = _SeeUserJournal;

  factory SeeUserJournal.fromJson(Map<String, dynamic> json) =>
      _$SeeUserJournalFromJson(json);
}

@freezed
class Journal with _$Journal {
  const factory Journal({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'emotion_name') String? emotionName,
  }) = _Journal;

  factory Journal.fromJson(Map<String, dynamic> json) =>
      _$JournalFromJson(json);
}

@freezed
class JournalAnswer with _$JournalAnswer {
  const factory JournalAnswer({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'media') String? media,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'main_question_id') int? mainQuestionId,
    @JsonKey(name: 'follow_up_question_id') int? followUpQuestionId,
    @JsonKey(name: 'user_journal_id') int? userJournalId,
    @JsonKey(name: 'main_question') Question? mainQuestion,
    @JsonKey(name: 'follow_up_question') Question? followUpQuestion,
  }) = _JournalAnswer;

  factory JournalAnswer.fromJson(Map<String, dynamic> json) =>
      _$JournalAnswerFromJson(json);
}

@freezed
class Question with _$Question {
  const factory Question({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'question') String? question,
    @JsonKey(name: 'keywords') String? keywords,
    @JsonKey(name: 'question_type') String? questionType,
    @JsonKey(name: 'options') String? options,
    @JsonKey(name: 'answered') bool? answered,
    @JsonKey(name: 'answer') Answer? answer,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

@freezed
class Answer with _$Answer {
  const factory Answer({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'media') String? media,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'main_question_id') int? mainQuestionId,
    @JsonKey(name: 'follow_up_question_id') int? followUpQuestionId,
    @JsonKey(name: 'user_journal_id') int? userJournalId,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
