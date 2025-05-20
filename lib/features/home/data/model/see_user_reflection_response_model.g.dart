// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'see_user_reflection_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeeUserReflectionResponseModelImpl
    _$$SeeUserReflectionResponseModelImplFromJson(Map<String, dynamic> json) =>
        _$SeeUserReflectionResponseModelImpl(
          status: json['status'] as bool?,
          message: json['message'] as String?,
          data: json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$SeeUserReflectionResponseModelImplToJson(
        _$SeeUserReflectionResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      userReflections: (json['user_reflections'] as List<dynamic>?)
          ?.map((e) => SeeUserReflection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'user_reflections': instance.userReflections,
    };

_$SeeUserReflectionImpl _$$SeeUserReflectionImplFromJson(
        Map<String, dynamic> json) =>
    _$SeeUserReflectionImpl(
      id: (json['id'] as num?)?.toInt(),
      completedAt: json['completed_at'],
      userId: (json['user_id'] as num?)?.toInt(),
      reflectionId: (json['reflection_id'] as num?)?.toInt(),
      isComplete: json['is_complete'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      reflection: json['reflection'] == null
          ? null
          : Reflection.fromJson(json['reflection'] as Map<String, dynamic>),
      reflectionAnswers: (json['reflection_answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SeeUserReflectionImplToJson(
        _$SeeUserReflectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'completed_at': instance.completedAt,
      'user_id': instance.userId,
      'reflection_id': instance.reflectionId,
      'is_complete': instance.isComplete,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'reflection': instance.reflection,
      'reflection_answers': instance.reflectionAnswers,
    };

_$ReflectionImpl _$$ReflectionImplFromJson(Map<String, dynamic> json) =>
    _$ReflectionImpl(
      id: (json['id'] as num?)?.toInt(),
      emotionName: json['emotion_name'] as String?,
      reflectionType: json['reflection_type'] as String?,
    );

Map<String, dynamic> _$$ReflectionImplToJson(_$ReflectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'emotion_name': instance.emotionName,
      'reflection_type': instance.reflectionType,
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
    );

Map<String, dynamic> _$$MainQuestionImplToJson(_$MainQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'keywords': instance.keywords,
      'answered': instance.answered,
      'answer': instance.answer,
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
      followUpQuestionId: json['follow_up_question_id'],
      userJournalId: json['user_journal_id'],
      mainQuestion: json['main_question'] == null
          ? null
          : MainQuestion.fromJson(
              json['main_question'] as Map<String, dynamic>),
      followUpQuestion: json['follow_up_question'] == null
          ? null
          : FollowUpQuestion.fromJson(
              json['follow_up_question'] as Map<String, dynamic>),
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
      'main_question': instance.mainQuestion,
      'follow_up_question': instance.followUpQuestion,
    };

_$FollowUpQuestionImpl _$$FollowUpQuestionImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowUpQuestionImpl(
      id: (json['id'] as num?)?.toInt(),
      question: json['question'] as String?,
      keywords: json['keywords'] as String?,
      questionType: json['question_type'] as String?,
      options: json['options'] as String?,
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
