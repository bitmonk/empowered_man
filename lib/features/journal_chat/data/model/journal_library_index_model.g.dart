// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_library_index_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JournalLibraryIndexModelImpl _$$JournalLibraryIndexModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JournalLibraryIndexModelImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : JournalLibraryIndexData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$JournalLibraryIndexModelImplToJson(
        _$JournalLibraryIndexModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$JournalLibraryIndexDataImpl _$$JournalLibraryIndexDataImplFromJson(
        Map<String, dynamic> json) =>
    _$JournalLibraryIndexDataImpl(
      userJournals: (json['user_journals'] as List<dynamic>?)
          ?.map((e) => UserJournal.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$JournalLibraryIndexDataImplToJson(
        _$JournalLibraryIndexDataImpl instance) =>
    <String, dynamic>{
      'user_journals': instance.userJournals,
      'meta': instance.meta,
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
    };

_$JournalImpl _$$JournalImplFromJson(Map<String, dynamic> json) =>
    _$JournalImpl(
      id: (json['id'] as num?)?.toInt(),
      emotionName: json['emotion_name'] as String?,
      mainQuestions: (json['main_questions'] as List<dynamic>?)
          ?.map((e) => MainQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$JournalImplToJson(_$JournalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'emotion_name': instance.emotionName,
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
      voices:
          (json['voices'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$MediaImplToJson(_$MediaImpl instance) =>
    <String, dynamic>{
      'images': instance.images,
      'videos': instance.videos,
      'voices': instance.voices,
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
