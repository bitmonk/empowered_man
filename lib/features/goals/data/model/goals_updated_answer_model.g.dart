// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_updated_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoalsUpdatedAnswerModelImpl _$$GoalsUpdatedAnswerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GoalsUpdatedAnswerModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GoalsUpdatedAnswerModelImplToJson(
        _$GoalsUpdatedAnswerModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      goalAnswer: json['goal_answer'] == null
          ? null
          : GoalAnswerModel.fromJson(
              json['goal_answer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'goal_answer': instance.goalAnswer,
    };

_$GoalAnswerModelImpl _$$GoalAnswerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GoalAnswerModelImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      questionId: (json['question_id'] as num?)?.toInt(),
      userGoalId: (json['user_goal_id'] as num?)?.toInt(),
      text: json['text'] as String?,
      achieved: json['achieved'] as bool?,
    );

Map<String, dynamic> _$$GoalAnswerModelImplToJson(
        _$GoalAnswerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'question_id': instance.questionId,
      'user_goal_id': instance.userGoalId,
      'text': instance.text,
      'achieved': instance.achieved,
    };
