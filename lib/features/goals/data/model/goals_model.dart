import 'package:freezed_annotation/freezed_annotation.dart';

part 'goals_model.freezed.dart';
part 'goals_model.g.dart';

@freezed
class GoalsModel with _$GoalsModel {
  const factory GoalsModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _GoalsModel;

  factory GoalsModel.fromJson(Map<String, dynamic> json) =>
      _$GoalsModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'goals') List<Goal>? goals,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Goal with _$Goal {
  const factory Goal({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'details') List<Detail>? details,
  }) = _Goal;

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);
}

@freezed
class Detail with _$Detail {
  const factory Detail({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'goal_id') int? goalId,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'time_period') String? timePeriod,
    @JsonKey(name: 'is_completed') bool? isCompleted,
    @JsonKey(name: 'user_goals') List<UserGoal>? userGoals,
  }) = _Detail;

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}

@freezed
class UserGoal with _$UserGoal {
  const factory UserGoal({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'goal_id') int? goalId,
    @JsonKey(name: 'goal_detail_id') int? goalDetailId,
    @JsonKey(name: 'progress') String? progress,
    @JsonKey(name: 'is_ontrack') dynamic isOntrack,
    @JsonKey(name: 'is_complete') dynamic isComplete,
    @JsonKey(name: 'show_won_question') bool? showWonQuestion,
    @JsonKey(name: 'show_track_question') bool? showTrackQuestion,
    @JsonKey(name: 'goal_answers') List<GoalAnswer>? goalAnswers,
  }) = _UserGoal;

  factory UserGoal.fromJson(Map<String, dynamic> json) =>
      _$UserGoalFromJson(json);
}

@freezed
class GoalAnswer with _$GoalAnswer {
  const factory GoalAnswer({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'question_id') int? questionId,
    @JsonKey(name: 'user_goal_id') int? userGoalId,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'achieved') bool? achieved,
  }) = _GoalAnswer;

  factory GoalAnswer.fromJson(Map<String, dynamic> json) =>
      _$GoalAnswerFromJson(json);
}
