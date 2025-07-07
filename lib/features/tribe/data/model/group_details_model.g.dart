// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupDetailsModelImpl _$$GroupDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupDetailsModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : GroupData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GroupDetailsModelImplToJson(
        _$GroupDetailsModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$GroupDataImpl _$$GroupDataImplFromJson(Map<String, dynamic> json) =>
    _$GroupDataImpl(
      groupDetails: json['group_details'] == null
          ? null
          : GroupDetail.fromJson(json['group_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GroupDataImplToJson(_$GroupDataImpl instance) =>
    <String, dynamic>{
      'group_details': instance.groupDetails,
    };

_$GroupDetailImpl _$$GroupDetailImplFromJson(Map<String, dynamic> json) =>
    _$GroupDetailImpl(
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      about: json['about'] == null
          ? null
          : About.fromJson(json['about'] as Map<String, dynamic>),
      media:
          (json['media'] as List<dynamic>?)?.map((e) => e as String).toList(),
      savedPosts: (json['savedPosts'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GroupDetailImplToJson(_$GroupDetailImpl instance) =>
    <String, dynamic>{
      'posts': instance.posts,
      'about': instance.about,
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
      comments: json['comments'] as List<dynamic>?,
      likesCount: (json['likes_count'] as num?)?.toInt(),
      commentsCount: (json['comments_count'] as num?)?.toInt(),
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
      'is_bookmarked': instance.isBookmarked,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$AboutImpl _$$AboutImplFromJson(Map<String, dynamic> json) => _$AboutImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      about: json['about'] as String?,
      accessType: json['access_type'] as String?,
      image: json['image'] as String?,
      memberCount: (json['member_count'] as num?)?.toInt(),
      isPinned: json['is_pinned'] as bool?,
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AboutImplToJson(_$AboutImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'about': instance.about,
      'access_type': instance.accessType,
      'image': instance.image,
      'member_count': instance.memberCount,
      'is_pinned': instance.isPinned,
      'members': instance.members,
    };

_$MemberImpl _$$MemberImplFromJson(Map<String, dynamic> json) => _$MemberImpl(
      role: json['role'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MemberImplToJson(_$MemberImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'user': instance.user,
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
