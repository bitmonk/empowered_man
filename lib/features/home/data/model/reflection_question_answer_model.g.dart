// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reflection_question_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReflectionQuestionAnswerModelImpl
    _$$ReflectionQuestionAnswerModelImplFromJson(Map<String, dynamic> json) =>
        _$ReflectionQuestionAnswerModelImpl(
          status: json['status'] as bool?,
          message: json['message'] as String?,
          data: json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ReflectionQuestionAnswerModelImplToJson(
        _$ReflectionQuestionAnswerModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      reflection: json['reflection'] == null
          ? null
          : Reflection.fromJson(json['reflection'] as Map<String, dynamic>),
      isCompleted: json['is_completed'] as bool?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'reflection': instance.reflection,
      'is_completed': instance.isCompleted,
    };

_$ReflectionImpl _$$ReflectionImplFromJson(Map<String, dynamic> json) =>
    _$ReflectionImpl(
      id: (json['id'] as num?)?.toInt(),
      emotionName: json['emotion_name'] as String?,
      reflectionType: json['reflection_type'] as String?,
      mainQuestions: (json['main_questions'] as List<dynamic>?)
          ?.map((e) => MainQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReflectionImplToJson(_$ReflectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'emotion_name': instance.emotionName,
      'reflection_type': instance.reflectionType,
      'main_questions': instance.mainQuestions,
    };

_$MainQuestionImpl _$$MainQuestionImplFromJson(Map<String, dynamic> json) =>
    _$MainQuestionImpl(
      id: (json['id'] as num?)?.toInt(),
      question: json['question'] as String?,
      keywords: json['keywords'] as String?,
      answered: json['answered'] as bool?,
      answer: json['answer'] == null
          ? null
          : Answer.fromJson(json['answer'] as Map<String, dynamic>),
      followUpQuestions: (json['follow_up_questions'] as List<dynamic>?)
          ?.map((e) => FollowUpQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MainQuestionImplToJson(_$MainQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'keywords': instance.keywords,
      'answered': instance.answered,
      'answer': instance.answer,
      'follow_up_questions': instance.followUpQuestions,
    };

_$AnswerImpl _$$AnswerImplFromJson(Map<String, dynamic> json) => _$AnswerImpl(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String?,
      media: json['media'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      mainQuestionId: (json['main_question_id'] as num?)?.toInt(),
      followUpQuestionId: (json['follow_up_question_id'] as num?)?.toInt(),
      userJournalId: json['user_journal_id'],
    );

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'media': instance.media,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'main_question_id': instance.mainQuestionId,
      'follow_up_question_id': instance.followUpQuestionId,
      'user_journal_id': instance.userJournalId,
    };

_$FollowUpQuestionImpl _$$FollowUpQuestionImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowUpQuestionImpl(
      id: (json['id'] as num?)?.toInt(),
      question: json['question'] as String?,
      keywords: json['keywords'] as String?,
      questionType: json['question_type'] as String?,
      options: json['options'],
      answered: json['answered'] as bool?,
      answer: json['answer'] == null
          ? null
          : Answer.fromJson(json['answer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FollowUpQuestionImplToJson(
        _$FollowUpQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'keywords': instance.keywords,
      'question_type': instance.questionType,
      'options': instance.options,
      'answered': instance.answered,
      'answer': instance.answer,
    };
