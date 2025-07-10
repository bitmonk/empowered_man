// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_posts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedPostsModelImpl _$$FeedPostsModelImplFromJson(Map<String, dynamic> json) =>
    _$FeedPostsModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FeedPostsModelImplToJson(
        _$FeedPostsModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'posts': instance.posts,
      'meta': instance.meta,
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

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String?,
      groupId: (json['group_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      createdBy: json['created_by'] == null
          ? null
          : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
      media: json['media'] == null
          ? null
          : Media.fromJson(json['media'] as Map<String, dynamic>),
      likedByCurrentUser: json['liked_by_current_user'] as bool?,
      likesCount: (json['likes_count'] as num?)?.toInt(),
      commentsCount: (json['comments_count'] as num?)?.toInt(),
      isBookmarked: json['is_bookmarked'] as bool?,
      isHidden: json['is_hidden'] as bool?,
      taggedUsers: json['tagged_users'] as List<dynamic>?,
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
      'created_by': instance.createdBy,
      'media': instance.media,
      'liked_by_current_user': instance.likedByCurrentUser,
      'likes_count': instance.likesCount,
      'comments_count': instance.commentsCount,
      'is_bookmarked': instance.isBookmarked,
      'is_hidden': instance.isHidden,
      'tagged_users': instance.taggedUsers,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$CreatedByImpl _$$CreatedByImplFromJson(Map<String, dynamic> json) =>
    _$CreatedByImpl(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['full_name'] as String?,
      slug: json['slug'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      occupation: json['occupation'] as String?,
      image: json['image'] as String?,
      isCoach: json['is_coach'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      agoraChatToken: json['agora_chat_token'] as String?,
      agoraUserToken: json['agora_user_token'] as String?,
    );

Map<String, dynamic> _$$CreatedByImplToJson(_$CreatedByImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'slug': instance.slug,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'occupation': instance.occupation,
      'image': instance.image,
      'is_coach': instance.isCoach,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'agora_chat_token': instance.agoraChatToken,
      'agora_user_token': instance.agoraUserToken,
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
