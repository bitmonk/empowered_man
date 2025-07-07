// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatePostResponseModelImpl _$$CreatePostResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreatePostResponseModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreatePostResponseModelImplToJson(
        _$CreatePostResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      post: json['post'] == null
          ? null
          : Post.fromJson(json['post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'post': instance.post,
    };

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String?,
      groupId: json['group_id'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      media:
          (json['media'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isBookmarked: json['is_bookmarked'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'group_id': instance.groupId,
      'user_id': instance.userId,
      'media': instance.media,
      'is_bookmarked': instance.isBookmarked,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
