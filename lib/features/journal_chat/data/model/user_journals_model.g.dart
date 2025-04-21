// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_journals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserJournalsResponseImpl _$$UserJournalsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserJournalsResponseImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserJournalsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserJournalsResponseImplToJson(
        _$UserJournalsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$UserJournalsDataImpl _$$UserJournalsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UserJournalsDataImpl(
      userJournals: (json['user_journals'] as List<dynamic>?)
          ?.map((e) => UserJournal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserJournalsDataImplToJson(
        _$UserJournalsDataImpl instance) =>
    <String, dynamic>{
      'user_journals': instance.userJournals,
    };

_$UserJournalImpl _$$UserJournalImplFromJson(Map<String, dynamic> json) =>
    _$UserJournalImpl(
      id: (json['id'] as num?)?.toInt(),
      completedAt: json['completed_at'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      journalId: (json['journal_id'] as num?)?.toInt(),
      isComplete: json['is_complete'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      journal: json['journal'] == null
          ? null
          : Journal.fromJson(json['journal'] as Map<String, dynamic>),
      journalAnswers: (json['journal_answers'] as List<dynamic>?)
          ?.map((e) => JournalAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserJournalImplToJson(_$UserJournalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'completed_at': instance.completedAt,
      'user_id': instance.userId,
      'journal_id': instance.journalId,
      'is_complete': instance.isComplete,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'journal': instance.journal,
      'journal_answers': instance.journalAnswers,
    };

_$JournalImpl _$$JournalImplFromJson(Map<String, dynamic> json) =>
    _$JournalImpl(
      id: (json['id'] as num?)?.toInt(),
      emotionName: json['emotion_name'] as String?,
    );

Map<String, dynamic> _$$JournalImplToJson(_$JournalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'emotion_name': instance.emotionName,
    };

_$JournalAnswerImpl _$$JournalAnswerImplFromJson(Map<String, dynamic> json) =>
    _$JournalAnswerImpl(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String?,
      media: json['media'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      mainQuestionId: (json['main_question_id'] as num?)?.toInt(),
      followUpQuestionId: (json['follow_up_question_id'] as num?)?.toInt(),
      userJournalId: (json['user_journal_id'] as num?)?.toInt(),
      mainQuestion: json['main_question'] == null
          ? null
          : Question.fromJson(json['main_question'] as Map<String, dynamic>),
      followUpQuestion: json['follow_up_question'] == null
          ? null
          : Question.fromJson(
              json['follow_up_question'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$JournalAnswerImplToJson(_$JournalAnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'media': instance.media,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'main_question_id': instance.mainQuestionId,
      'follow_up_question_id': instance.followUpQuestionId,
      'user_journal_id': instance.userJournalId,
      'main_question': instance.mainQuestion,
      'follow_up_question': instance.followUpQuestion,
    };

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
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

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
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
      media: json['media'] as String?,
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
