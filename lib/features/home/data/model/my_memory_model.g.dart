// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_memory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyMemoryModelImpl _$$MyMemoryModelImplFromJson(Map<String, dynamic> json) =>
    _$MyMemoryModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MyMemoryModelImplToJson(_$MyMemoryModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      memory: json['memory'] == null
          ? null
          : Memory.fromJson(json['memory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'memory': instance.memory,
    };

_$MemoryImpl _$$MemoryImplFromJson(Map<String, dynamic> json) => _$MemoryImpl(
      journalId: (json['journal_id'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      emotionName: json['emotion_name'] as String?,
      answers: json['answers'] == null
          ? null
          : Answers.fromJson(json['answers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MemoryImplToJson(_$MemoryImpl instance) =>
    <String, dynamic>{
      'journal_id': instance.journalId,
      'created_at': instance.createdAt?.toIso8601String(),
      'emotion_name': instance.emotionName,
      'answers': instance.answers,
    };

_$AnswersImpl _$$AnswersImplFromJson(Map<String, dynamic> json) =>
    _$AnswersImpl(
      action: (json['action'] as List<dynamic>?)
          ?.map((e) => Tion.fromJson(e as Map<String, dynamic>))
          .toList(),
      revelation: (json['revelation'] as List<dynamic>?)
          ?.map((e) => Tion.fromJson(e as Map<String, dynamic>))
          .toList(),
      story: json['story'] as List<dynamic>?,
      lesson: json['lesson'] as List<dynamic>?,
    );

Map<String, dynamic> _$$AnswersImplToJson(_$AnswersImpl instance) =>
    <String, dynamic>{
      'action': instance.action,
      'revelation': instance.revelation,
      'story': instance.story,
      'lesson': instance.lesson,
    };

_$TionImpl _$$TionImplFromJson(Map<String, dynamic> json) => _$TionImpl(
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$TionImplToJson(_$TionImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
    };
