// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserListModelImpl _$$UserListModelImplFromJson(Map<String, dynamic> json) =>
    _$UserListModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserListModelImplToJson(_$UserListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'users': instance.users,
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
      agoraChatToken: (json['agora_chat_token'] as num?)?.toInt(),
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
