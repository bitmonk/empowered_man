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
      media: json['media'] == null
          ? null
          : Media.fromJson(json['media'] as Map<String, dynamic>),
      likedByCurrentUser: json['liked_by_current_user'] as bool?,
      commentsCount: (json['comments_count'] as num?)?.toInt(),
      isBookmarked: json['is_bookmarked'] as bool?,
      isHidden: json['is_hidden'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'group_id': instance.groupId,
      'user_id': instance.userId,
      'media': instance.media,
      'liked_by_current_user': instance.likedByCurrentUser,
      'comments_count': instance.commentsCount,
      'is_bookmarked': instance.isBookmarked,
      'is_hidden': instance.isHidden,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$MediaImpl _$$MediaImplFromJson(Map<String, dynamic> json) => _$MediaImpl(
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      videos: json['videos'] as List<dynamic>?,
      documents: json['documents'] as List<dynamic>?,
    );

Map<String, dynamic> _$$MediaImplToJson(_$MediaImpl instance) =>
    <String, dynamic>{
      'images': instance.images,
      'videos': instance.videos,
      'documents': instance.documents,
    };
