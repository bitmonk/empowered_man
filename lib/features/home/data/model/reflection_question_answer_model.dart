import 'package:freezed_annotation/freezed_annotation.dart';

part 'reflection_question_answer_model.freezed.dart';
part 'reflection_question_answer_model.g.dart';

@freezed
class ReflectionQuestionAnswerModel with _$ReflectionQuestionAnswerModel {
  const factory ReflectionQuestionAnswerModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _ReflectionQuestionAnswerModel;

  factory ReflectionQuestionAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$ReflectionQuestionAnswerModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'reflection') Reflection? reflection,
    @JsonKey(name: 'is_completed') bool? isCompleted,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Reflection with _$Reflection {
  const factory Reflection({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'emotion_name') String? emotionName,
    @JsonKey(name: 'reflection_type') String? reflectionType,
    @JsonKey(name: 'main_questions') List<MainQuestion>? mainQuestions,
  }) = _Reflection;

  factory Reflection.fromJson(Map<String, dynamic> json) =>
      _$ReflectionFromJson(json);
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
class Answer with _$Answer {
  const factory Answer({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'media') dynamic media,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'main_question_id') int? mainQuestionId,
    @JsonKey(name: 'follow_up_question_id') dynamic followUpQuestionId,
    @JsonKey(name: 'user_journal_id') dynamic userJournalId,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}

@freezed
class FollowUpQuestion with _$FollowUpQuestion {
  const factory FollowUpQuestion({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'question') String? question,
    @JsonKey(name: 'keywords') String? keywords,
    @JsonKey(name: 'question_type') String? questionType,
    @JsonKey(name: 'options') String? options,
    @JsonKey(name: 'answered') bool? answered,
    @JsonKey(name: 'answer') Answer? answer,
  }) = _FollowUpQuestion;

  factory FollowUpQuestion.fromJson(Map<String, dynamic> json) =>
      _$FollowUpQuestionFromJson(json);
}
