// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_answer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JournalAnswerResponseModelImpl _$$JournalAnswerResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JournalAnswerResponseModelImpl(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : JournalEntry.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$JournalAnswerResponseModelImplToJson(
        _$JournalAnswerResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$JournalEntryImpl _$$JournalEntryImplFromJson(Map<String, dynamic> json) =>
    _$JournalEntryImpl(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      voices:
          (json['voices'] as List<dynamic>?)?.map((e) => e as String).toList(),
      videos:
          (json['videos'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$JournalEntryImplToJson(_$JournalEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'images': instance.images,
      'voices': instance.voices,
      'videos': instance.videos,
    };
