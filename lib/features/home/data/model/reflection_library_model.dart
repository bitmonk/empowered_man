import 'package:freezed_annotation/freezed_annotation.dart';

part 'reflection_library_model.freezed.dart';
part 'reflection_library_model.g.dart';

@freezed
class ReflectionLibraryModel with _$ReflectionLibraryModel {
  const factory ReflectionLibraryModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _ReflectionLibraryModel;

  factory ReflectionLibraryModel.fromJson(Map<String, dynamic> json) =>
      _$ReflectionLibraryModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'user_reflections') List<UserReflection>? userReflections,
    @JsonKey(name: 'meta') Meta? meta,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'last_page') int? lastPage,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class UserReflection with _$UserReflection {
  const factory UserReflection({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'reflection_id') int? reflectionId,
    @JsonKey(name: 'is_complete') bool? isComplete,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'reflection') Reflection? reflection,
  }) = _UserReflection;

  factory UserReflection.fromJson(Map<String, dynamic> json) =>
      _$UserReflectionFromJson(json);
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
