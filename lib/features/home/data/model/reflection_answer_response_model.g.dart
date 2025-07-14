// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reflection_answer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReflectionAnswerResponseModelImpl
    _$$ReflectionAnswerResponseModelImplFromJson(Map<String, dynamic> json) =>
        _$ReflectionAnswerResponseModelImpl(
          status: json['status'] as bool?,
          message: json['message'] as String?,
          data: json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ReflectionAnswerResponseModelImplToJson(
        _$ReflectionAnswerResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String?,
      images: json['images'] as List<dynamic>?,
      voices: json['voices'] as List<dynamic>?,
      videos: json['videos'] as List<dynamic>?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'images': instance.images,
      'voices': instance.voices,
      'videos': instance.videos,
    };
