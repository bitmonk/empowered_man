// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatConversationModelImpl _$$ChatConversationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatConversationModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : JournalData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatConversationModelImplToJson(
        _$ChatConversationModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$JournalDataImpl _$$JournalDataImplFromJson(Map<String, dynamic> json) =>
    _$JournalDataImpl(
      journal: json['journal'] == null
          ? null
          : Journal.fromJson(json['journal'] as Map<String, dynamic>),
      isCompleted: json['is_completed'] as bool?,
    );

Map<String, dynamic> _$$JournalDataImplToJson(_$JournalDataImpl instance) =>
    <String, dynamic>{
      'journal': instance.journal,
      'is_completed': instance.isCompleted,
    };

_$JournalImpl _$$JournalImplFromJson(Map<String, dynamic> json) =>
    _$JournalImpl(
      id: (json['id'] as num?)?.toInt(),
      emotionName: json['emotion_name'] as String?,
      mainQuestions: (json['main_questions'] as List<dynamic>?)
          ?.map((e) => MainQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      followUpQuestions: (json['follow_up_questions'] as List<dynamic>?)
          ?.map((e) => FollowUpQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$JournalImplToJson(_$JournalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'emotion_name': instance.emotionName,
      'main_questions': instance.mainQuestions,
      'follow_up_questions': instance.followUpQuestions,
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

_$AnswerImpl _$$AnswerImplFromJson(Map<String, dynamic> json) => _$AnswerImpl(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String?,
      media: json['media'] == null
          ? null
          : Media.fromJson(json['media'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      mainQuestionId: (json['main_question_id'] as num?)?.toInt(),
      followUpQuestionId: (json['follow_up_question_id'] as num?)?.toInt(),
      userJournalId: (json['user_journal_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'media': instance.media,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'main_question_id': instance.mainQuestionId,
      'follow_up_question_id': instance.followUpQuestionId,
      'user_journal_id': instance.userJournalId,
    };

_$MediaImpl _$$MediaImplFromJson(Map<String, dynamic> json) => _$MediaImpl(
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      videos:
          (json['videos'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$MediaImplToJson(_$MediaImpl instance) =>
    <String, dynamic>{
      'images': instance.images,
      'videos': instance.videos,
    };
