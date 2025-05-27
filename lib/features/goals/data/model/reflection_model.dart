import 'package:freezed_annotation/freezed_annotation.dart';

part 'reflection_model.freezed.dart';
part 'reflection_model.g.dart';


@freezed
class ReflectionModel with _$ReflectionModel {
  const factory ReflectionModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _ReflectionModel;

  factory ReflectionModel.fromJson(Map<String, dynamic> json) =>
      _$ReflectionModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'Reflection') Reflection? reflection,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Reflection with _$Reflection {
  const factory Reflection({
    @JsonKey(name: 'questions') List<Question>? questions,
  }) = _Reflection;

  factory Reflection.fromJson(Map<String, dynamic> json) =>
      _$ReflectionFromJson(json);
}

@freezed
class Question with _$Question {
  const factory Question({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'goal_detail_id') int? goalDetailId,
    @JsonKey(name: 'question_text') String? questionText,
    @JsonKey(name: 'answered') bool? answered,
    @JsonKey(name: 'answer') List<Answer>? answer,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

@freezed
class Answer with _$Answer {
  const factory Answer({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'question_id') int? questionId,
    @JsonKey(name: 'user_goal_id') int? userGoalId,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'achieved') bool? achieved,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
