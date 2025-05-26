// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoalsModelImpl _$$GoalsModelImplFromJson(Map<String, dynamic> json) =>
    _$GoalsModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GoalsModelImplToJson(_$GoalsModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      goals: (json['goals'] as List<dynamic>?)
          ?.map((e) => Goal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'goals': instance.goals,
    };

_$GoalImpl _$$GoalImplFromJson(Map<String, dynamic> json) => _$GoalImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GoalImplToJson(_$GoalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'details': instance.details,
    };

_$DetailImpl _$$DetailImplFromJson(Map<String, dynamic> json) => _$DetailImpl(
      id: (json['id'] as num?)?.toInt(),
      goalId: (json['goal_id'] as num?)?.toInt(),
      type: json['type'] as String?,
      timePeriod: json['time_period'] as String?,
      isCompleted: json['is_completed'] as bool?,
      userGoals: (json['user_goals'] as List<dynamic>?)
          ?.map((e) => UserGoal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DetailImplToJson(_$DetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'goal_id': instance.goalId,
      'type': instance.type,
      'time_period': instance.timePeriod,
      'is_completed': instance.isCompleted,
      'user_goals': instance.userGoals,
    };

_$UserGoalImpl _$$UserGoalImplFromJson(Map<String, dynamic> json) =>
    _$UserGoalImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      goalId: (json['goal_id'] as num?)?.toInt(),
      goalDetailId: (json['goal_detail_id'] as num?)?.toInt(),
      progress: json['progress'] as String?,
      isOntrack: json['is_ontrack'],
      isComplete: json['is_complete'],
      showWonQuestion: json['show_won_question'] as bool?,
      showTrackQuestion: json['show_track_question'] as bool?,
      goalAnswers: (json['goal_answers'] as List<dynamic>?)
          ?.map((e) => GoalAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserGoalImplToJson(_$UserGoalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'goal_id': instance.goalId,
      'goal_detail_id': instance.goalDetailId,
      'progress': instance.progress,
      'is_ontrack': instance.isOntrack,
      'is_complete': instance.isComplete,
      'show_won_question': instance.showWonQuestion,
      'show_track_question': instance.showTrackQuestion,
      'goal_answers': instance.goalAnswers,
    };

_$GoalAnswerImpl _$$GoalAnswerImplFromJson(Map<String, dynamic> json) =>
    _$GoalAnswerImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      questionId: (json['question_id'] as num?)?.toInt(),
      userGoalId: (json['user_goal_id'] as num?)?.toInt(),
      text: json['text'] as String?,
      achieved: json['achieved'] as bool?,
    );

Map<String, dynamic> _$$GoalAnswerImplToJson(_$GoalAnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'question_id': instance.questionId,
      'user_goal_id': instance.userGoalId,
      'text': instance.text,
      'achieved': instance.achieved,
    };
