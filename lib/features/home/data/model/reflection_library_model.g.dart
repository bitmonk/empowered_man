// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reflection_library_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReflectionLibraryModelImpl _$$ReflectionLibraryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReflectionLibraryModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReflectionLibraryModelImplToJson(
        _$ReflectionLibraryModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      userReflections: (json['user_reflections'] as List<dynamic>?)
          ?.map((e) => UserReflection.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'user_reflections': instance.userReflections,
      'meta': instance.meta,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      currentPage: (json['current_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'total': instance.total,
      'per_page': instance.perPage,
      'last_page': instance.lastPage,
    };

_$UserReflectionImpl _$$UserReflectionImplFromJson(Map<String, dynamic> json) =>
    _$UserReflectionImpl(
      id: (json['id'] as num?)?.toInt(),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
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
    );

Map<String, dynamic> _$$UserReflectionImplToJson(
        _$UserReflectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'completed_at': instance.completedAt?.toIso8601String(),
      'user_id': instance.userId,
      'reflection_id': instance.reflectionId,
      'is_complete': instance.isComplete,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'reflection': instance.reflection,
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
