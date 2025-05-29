// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoalsChatModelImpl _$$GoalsChatModelImplFromJson(Map<String, dynamic> json) =>
    _$GoalsChatModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GoalsChatModelImplToJson(
        _$GoalsChatModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      userGoal: json['user_goal'] == null
          ? null
          : UserGoal.fromJson(json['user_goal'] as Map<String, dynamic>),
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'user_goal': instance.userGoal,
      'questions': instance.questions,
    };

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: (json['id'] as num?)?.toInt(),
      goalDetailId: json['goal_detail_id'],
      questionText: json['question_text'] as String?,
      answered: json['answered'] as bool?,
      answer: (json['answer'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'goal_detail_id': instance.goalDetailId,
      'question_text': instance.questionText,
      'answered': instance.answered,
      'answer': instance.answer,
    };

_$AnswerImpl _$$AnswerImplFromJson(Map<String, dynamic> json) => _$AnswerImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      questionId: json['question_id'],
      userGoalId: json['user_goal_id'],
      text: json['text'] as String?,
      achieved: json['achieved'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'question_id': instance.questionId,
      'user_goal_id': instance.userGoalId,
      'text': instance.text,
      'achieved': instance.achieved,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$UserGoalImpl _$$UserGoalImplFromJson(Map<String, dynamic> json) =>
    _$UserGoalImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      goalId: json['goal_id'],
      goalDetailId: json['goal_detail_id'],
      progress: json['progress'],
      isOntrack: json['is_ontrack'] as bool?,
      isComplete: json['is_complete'] as bool?,
      showWonQuestion: json['show_won_question'] as bool?,
      showTrackQuestion: json['show_track_question'] as bool?,
      goal: json['goal'] == null
          ? null
          : Goal.fromJson(json['goal'] as Map<String, dynamic>),
      goalDetail: json['goal_detail'] == null
          ? null
          : GoalDetail.fromJson(json['goal_detail'] as Map<String, dynamic>),
      goalAnswers: (json['goal_answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
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
      'goal': instance.goal,
      'goal_detail': instance.goalDetail,
      'goal_answers': instance.goalAnswers,
    };

_$GoalImpl _$$GoalImplFromJson(Map<String, dynamic> json) => _$GoalImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$GoalImplToJson(_$GoalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

_$GoalDetailImpl _$$GoalDetailImplFromJson(Map<String, dynamic> json) =>
    _$GoalDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      goalId: (json['goal_id'] as num?)?.toInt(),
      type: json['type'] as String?,
      timePeriod: json['time_period'] as String?,
      isCompleted: json['is_completed'] as bool?,
    );

Map<String, dynamic> _$$GoalDetailImplToJson(_$GoalDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'goal_id': instance.goalId,
      'type': instance.type,
      'time_period': instance.timePeriod,
      'is_completed': instance.isCompleted,
    };
