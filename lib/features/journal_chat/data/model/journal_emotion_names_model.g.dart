// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_emotion_names_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JournalEmotionNamesModelImpl _$$JournalEmotionNamesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JournalEmotionNamesModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$JournalEmotionNamesModelImplToJson(
        _$JournalEmotionNamesModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      emotionNames: (json['emotion_names'] as List<dynamic>?)
          ?.map((e) => EmotionName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'emotion_names': instance.emotionNames,
    };

_$EmotionNameImpl _$$EmotionNameImplFromJson(Map<String, dynamic> json) =>
    _$EmotionNameImpl(
      id: (json['id'] as num?)?.toInt(),
      emotionName: json['emotion_name'] as String?,
    );

Map<String, dynamic> _$$EmotionNameImplToJson(_$EmotionNameImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'emotion_name': instance.emotionName,
    };
