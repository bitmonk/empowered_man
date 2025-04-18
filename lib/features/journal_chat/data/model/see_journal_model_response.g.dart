// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'see_journal_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeeJournalModelResponseImpl _$$SeeJournalModelResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SeeJournalModelResponseImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : SeeJournalModelData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SeeJournalModelResponseImplToJson(
        _$SeeJournalModelResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$SeeJournalModelDataImpl _$$SeeJournalModelDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SeeJournalModelDataImpl(
      userJournal: json['user_journal'] == null
          ? null
          : SeeJournalModelUserJournal.fromJson(
              json['user_journal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SeeJournalModelDataImplToJson(
        _$SeeJournalModelDataImpl instance) =>
    <String, dynamic>{
      'user_journal': instance.userJournal,
    };

_$SeeJournalModelUserJournalImpl _$$SeeJournalModelUserJournalImplFromJson(
        Map<String, dynamic> json) =>
    _$SeeJournalModelUserJournalImpl(
      id: (json['id'] as num?)?.toInt(),
      completedAt: json['completed_at'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      journalId: (json['journal_id'] as num?)?.toInt(),
      isComplete: json['is_complete'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      journal: json['journal'] == null
          ? null
          : SeeJournalModelJournal.fromJson(
              json['journal'] as Map<String, dynamic>),
      journalAnswers: (json['journalAnswers'] as List<dynamic>?)
          ?.map(
              (e) => SeeJournalModelAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SeeJournalModelUserJournalImplToJson(
        _$SeeJournalModelUserJournalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'completed_at': instance.completedAt,
      'user_id': instance.userId,
      'journal_id': instance.journalId,
      'is_complete': instance.isComplete,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'journal': instance.journal,
      'journalAnswers': instance.journalAnswers,
    };

_$SeeJournalModelJournalImpl _$$SeeJournalModelJournalImplFromJson(
        Map<String, dynamic> json) =>
    _$SeeJournalModelJournalImpl(
      id: (json['id'] as num?)?.toInt(),
      emotionName: json['emotion_name'] as String?,
    );

Map<String, dynamic> _$$SeeJournalModelJournalImplToJson(
        _$SeeJournalModelJournalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'emotion_name': instance.emotionName,
    };

_$SeeJournalModelAnswerImpl _$$SeeJournalModelAnswerImplFromJson(
        Map<String, dynamic> json) =>
    _$SeeJournalModelAnswerImpl(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String?,
      media: json['media'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      mainQuestionId: (json['main_question_id'] as num?)?.toInt(),
      followUpQuestionId: (json['follow_up_question_id'] as num?)?.toInt(),
      userJournalId: (json['user_journal_id'] as num?)?.toInt(),
      mainQuestion: json['mainQuestion'] == null
          ? null
          : SeeJournalModelMainQuestion.fromJson(
              json['mainQuestion'] as Map<String, dynamic>),
      followUpQuestion: json['followUpQuestion'] == null
          ? null
          : SeeJournalModelFollowUpQuestion.fromJson(
              json['followUpQuestion'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SeeJournalModelAnswerImplToJson(
        _$SeeJournalModelAnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'media': instance.media,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'main_question_id': instance.mainQuestionId,
      'follow_up_question_id': instance.followUpQuestionId,
      'user_journal_id': instance.userJournalId,
      'mainQuestion': instance.mainQuestion,
      'followUpQuestion': instance.followUpQuestion,
    };

_$SeeJournalModelMainQuestionImpl _$$SeeJournalModelMainQuestionImplFromJson(
        Map<String, dynamic> json) =>
    _$SeeJournalModelMainQuestionImpl(
      id: (json['id'] as num?)?.toInt(),
      question: json['question'] as String?,
      keywords: json['keywords'] as String?,
      answered: json['answered'] as bool?,
      answer: json['answer'] == null
          ? null
          : SeeJournalModelAnswer.fromJson(
              json['answer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SeeJournalModelMainQuestionImplToJson(
        _$SeeJournalModelMainQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'keywords': instance.keywords,
      'answered': instance.answered,
      'answer': instance.answer,
    };

_$SeeJournalModelFollowUpQuestionImpl
    _$$SeeJournalModelFollowUpQuestionImplFromJson(Map<String, dynamic> json) =>
        _$SeeJournalModelFollowUpQuestionImpl(
          id: (json['id'] as num?)?.toInt(),
          question: json['question'] as String?,
          keywords: json['keywords'] as String?,
          questionType: json['question_type'] as String?,
          options: (json['options'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
          answered: json['answered'] as bool?,
          answer: json['answer'] == null
              ? null
              : SeeJournalModelAnswer.fromJson(
                  json['answer'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$SeeJournalModelFollowUpQuestionImplToJson(
        _$SeeJournalModelFollowUpQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'keywords': instance.keywords,
      'question_type': instance.questionType,
      'options': instance.options,
      'answered': instance.answered,
      'answer': instance.answer,
    };
