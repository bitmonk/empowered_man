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
      feedPosts: json['Feed_posts'] == null
          ? null
          : FeedPosts.fromJson(json['Feed_posts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'Feed_posts': instance.feedPosts,
    };

_$FeedPostsImpl _$$FeedPostsImplFromJson(Map<String, dynamic> json) =>
    _$FeedPostsImpl(
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      media:
          (json['media'] as List<dynamic>?)?.map((e) => e as String).toList(),
      savedPosts: (json['savedPosts'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FeedPostsImplToJson(_$FeedPostsImpl instance) =>
    <String, dynamic>{
      'posts': instance.posts,
      'media': instance.media,
      'savedPosts': instance.savedPosts,
    };

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String?,
      groupId: (json['group_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      createdBy: json['created_by'] == null
          ? null
          : User.fromJson(json['created_by'] as Map<String, dynamic>),
      media:
          (json['media'] as List<dynamic>?)?.map((e) => e as String).toList(),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      likesCount: (json['likes_count'] as num?)?.toInt(),
      commentsCount: (json['comments_count'] as num?)?.toInt(),
      isLiked: json['is_liked'] as bool?,
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
      'created_by': instance.createdBy,
      'media': instance.media,
      'comments': instance.comments,
      'likes_count': instance.likesCount,
      'comments_count': instance.commentsCount,
      'is_liked': instance.isLiked,
      'is_bookmarked': instance.isBookmarked,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['full_name'] as String?,
      slug: json['slug'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      occupation: json['occupation'] as String?,
      image: json['image'] as String?,
      isCoach: json['is_coach'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      agoraChatToken: json['agora_chat_token'] as String?,
      agoraUserToken: json['agora_user_token'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'slug': instance.slug,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'occupation': instance.occupation,
      'image': instance.image,
      'is_coach': instance.isCoach,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'agora_chat_token': instance.agoraChatToken,
      'agora_user_token': instance.agoraUserToken,
    };

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
