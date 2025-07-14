// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reflection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReflectionModelImpl _$$ReflectionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReflectionModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReflectionModelImplToJson(
        _$ReflectionModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      reflection: json['Reflection'] == null
          ? null
          : Reflection.fromJson(json['Reflection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'Reflection': instance.reflection,
    };

_$ReflectionImpl _$$ReflectionImplFromJson(Map<String, dynamic> json) =>
    _$ReflectionImpl(
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReflectionImplToJson(_$ReflectionImpl instance) =>
    <String, dynamic>{
      'questions': instance.questions,
    };

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: (json['id'] as num?)?.toInt(),
      goalDetailId: (json['goal_detail_id'] as num?)?.toInt(),
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
      questionId: (json['question_id'] as num?)?.toInt(),
      userGoalId: (json['user_goal_id'] as num?)?.toInt(),
      text: json['text'] as String?,
      achieved: json['achieved'] as bool?,
    );

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'question_id': instance.questionId,
      'user_goal_id': instance.userGoalId,
      'text': instance.text,
      'achieved': instance.achieved,
    };
