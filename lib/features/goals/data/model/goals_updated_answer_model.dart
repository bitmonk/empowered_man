import 'package:freezed_annotation/freezed_annotation.dart';

part 'goals_updated_answer_model.freezed.dart';
part 'goals_updated_answer_model.g.dart';

@freezed
class GoalsUpdatedAnswerModel with _$GoalsUpdatedAnswerModel {
  const factory GoalsUpdatedAnswerModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _GoalsUpdatedAnswerModel;

  factory GoalsUpdatedAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$GoalsUpdatedAnswerModelFromJson(json);
  factory GoalsUpdatedAnswerModel.empty() {
    return const GoalsUpdatedAnswerModel();
  }
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'goal_answer') GoalAnswerModel? goalAnswer,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class GoalAnswerModel with _$GoalAnswerModel {
  const factory GoalAnswerModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'question_id') int? questionId,
    @JsonKey(name: 'user_goal_id') int? userGoalId,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'achieved') bool? achieved,
  }) = _GoalAnswerModel;

  factory GoalAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$GoalAnswerModelFromJson(json);
}
