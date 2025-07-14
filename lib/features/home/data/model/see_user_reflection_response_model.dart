import 'package:freezed_annotation/freezed_annotation.dart';

part 'see_user_reflection_response_model.freezed.dart';
part 'see_user_reflection_response_model.g.dart';

@freezed
class SeeUserReflectionResponseModel with _$SeeUserReflectionResponseModel {
  const factory SeeUserReflectionResponseModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _SeeUserReflectionResponseModel;

  factory SeeUserReflectionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SeeUserReflectionResponseModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'user_reflections') List<SeeUserReflection>? userReflections,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class SeeUserReflection with _$SeeUserReflection {
  const factory SeeUserReflection({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'completed_at') dynamic completedAt,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'reflection_id') int? reflectionId,
    @JsonKey(name: 'is_complete') bool? isComplete,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'reflection') Reflection? reflection,
    @JsonKey(name: 'reflection_answers') List<Answer>? reflectionAnswers,
  }) = _SeeUserReflection;

  factory SeeUserReflection.fromJson(Map<String, dynamic> json) =>
      _$SeeUserReflectionFromJson(json);
}

@freezed
class Reflection with _$Reflection {
  const factory Reflection({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'emotion_name') String? emotionName,
    @JsonKey(name: 'reflection_type') String? reflectionType,
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
    @JsonKey(name: 'main_question') MainQuestion? mainQuestion,
    @JsonKey(name: 'follow_up_question') FollowUpQuestion? followUpQuestion,
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
    @JsonKey(name: 'options') dynamic options,
    @JsonKey(name: 'answered') bool? answered,
    @JsonKey(name: 'answer') Answer? answer,
  }) = _FollowUpQuestion;

  factory FollowUpQuestion.fromJson(Map<String, dynamic> json) =>
      _$FollowUpQuestionFromJson(json);
}
