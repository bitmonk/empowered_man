// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_answer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoalsAnswerResponseModelImpl _$$GoalsAnswerResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GoalsAnswerResponseModelImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GoalsAnswerResponseModelImplToJson(
        _$GoalsAnswerResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      questionId: json['question_id'] as String?,
      userGoalId: json['user_goal_id'] as String?,
      text: json['text'] as String?,
      achieved: json['achieved'] as bool?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'question_id': instance.questionId,
      'user_goal_id': instance.userGoalId,
      'text': instance.text,
      'achieved': instance.achieved,
    };
