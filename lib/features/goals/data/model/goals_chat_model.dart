import 'package:freezed_annotation/freezed_annotation.dart';

part 'goals_chat_model.freezed.dart';
part 'goals_chat_model.g.dart';

@freezed
class GoalsChatModel with _$GoalsChatModel {
  const factory GoalsChatModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _GoalsChatModel;

  factory GoalsChatModel.fromJson(Map<String, dynamic> json) =>
      _$GoalsChatModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'user_goal') UserGoal? userGoal,
    @JsonKey(name: 'questions') List<Question>? questions,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
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

@freezed
class UserGoal with _$UserGoal {
  const factory UserGoal({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'goal_id') int? goalId,
    @JsonKey(name: 'goal_detail_id') int? goalDetailId,
    @JsonKey(name: 'progress') dynamic progress,
    @JsonKey(name: 'is_ontrack') dynamic isOntrack,
    @JsonKey(name: 'is_complete') dynamic isComplete,
    @JsonKey(name: 'show_won_question') dynamic showWonQuestion,
    @JsonKey(name: 'show_track_question') dynamic showTrackQuestion,
    @JsonKey(name: 'goal') Goal? goal,
    @JsonKey(name: 'goal_detail') GoalDetail? goalDetail,
    @JsonKey(name: 'goal_answers') List<dynamic>? goalAnswers,
  }) = _UserGoal;

  factory UserGoal.fromJson(Map<String, dynamic> json) =>
      _$UserGoalFromJson(json);
}

@freezed
class Goal with _$Goal {
  const factory Goal({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
  }) = _Goal;

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);
}

@freezed
class GoalDetail with _$GoalDetail {
  const factory GoalDetail({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'goal_id') int? goalId,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'time_period') String? timePeriod,
    @JsonKey(name: 'is_completed') dynamic isCompleted,
  }) = _GoalDetail;

  factory GoalDetail.fromJson(Map<String, dynamic> json) =>
      _$GoalDetailFromJson(json);
}
