// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_about_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupAboutModelImpl _$$GroupAboutModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupAboutModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GroupAboutModelImplToJson(
        _$GroupAboutModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      about: json['about'] == null
          ? null
          : About.fromJson(json['about'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'about': instance.about,
    };

_$AboutImpl _$$AboutImplFromJson(Map<String, dynamic> json) => _$AboutImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      about: json['about'] as String?,
      accessType: json['access_type'] as String?,
      image: json['image'] as String?,
      memberCount: (json['member_count'] as num?)?.toInt(),
      isPinned: json['is_pinned'] as bool?,
      latestPostTime: json['latest_post_time'] as String?,
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
      'latest_post_time': instance.latestPostTime,
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
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
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
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'agora_chat_token': instance.agoraChatToken,
      'agora_user_token': instance.agoraUserToken,
    };
