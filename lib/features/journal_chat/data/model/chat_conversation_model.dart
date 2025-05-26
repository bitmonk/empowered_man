import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_conversation_model.freezed.dart';
part 'chat_conversation_model.g.dart';

@freezed
class ChatConversationModel with _$ChatConversationModel {
  const factory ChatConversationModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') JournalData? data,
  }) = _ChatConversationModel;

  factory ChatConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ChatConversationModelFromJson(json);
}

@freezed
class JournalData with _$JournalData {
  const factory JournalData({
    @JsonKey(name: 'journal') Journal? journal,
    @JsonKey(name: 'is_completed') bool? isCompleted,
  }) = _JournalData;

  factory JournalData.fromJson(Map<String, dynamic> json) =>
      _$JournalDataFromJson(json);
}

@freezed
class Journal with _$Journal {
  const factory Journal({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'emotion_name') String? emotionName,
    @JsonKey(name: 'main_questions') List<MainQuestion>? mainQuestions,
  }) = _Journal;

  factory Journal.fromJson(Map<String, dynamic> json) =>
      _$JournalFromJson(json);
}

@freezed
class MainQuestion with _$MainQuestion {
  const factory MainQuestion({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'question') String? question,
    @JsonKey(name: 'keywords') String? keywords,
    @JsonKey(name: 'answered') bool? answered,
    @JsonKey(name: 'answer') Answer? answer,
    @JsonKey(name: 'follow_up_questions')
    List<FollowUpQuestion>? followUpQuestions,
  }) = _MainQuestion;

  factory MainQuestion.fromJson(Map<String, dynamic> json) =>
      _$MainQuestionFromJson(json);
}

@freezed
class FollowUpQuestion with _$FollowUpQuestion {
  const factory FollowUpQuestion({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'question') String? question,
    @JsonKey(name: 'keywords') String? keywords,
    @JsonKey(name: 'question_type') String? questionType,
    @JsonKey(name: 'options') dynamic options,
    @JsonKey(name: 'answered') bool? answered,
    @JsonKey(name: 'answer') Answer? answer,
  }) = _FollowUpQuestion;

  factory FollowUpQuestion.fromJson(Map<String, dynamic> json) =>
      _$FollowUpQuestionFromJson(json);
}

@freezed
class Answer with _$Answer {
  const factory Answer({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'media') Media? media,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'main_question_id') int? mainQuestionId,
    @JsonKey(name: 'follow_up_question_id') int? followUpQuestionId,
    @JsonKey(name: 'user_journal_id') int? userJournalId,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}

@freezed
class Media with _$Media {
  const factory Media({
    @JsonKey(name: 'images') List<String>? images,
    List<String>? videos,
    List<String>? voices,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}
