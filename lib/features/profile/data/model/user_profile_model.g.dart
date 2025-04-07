// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileModelImpl _$$UserProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileModelImpl(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['full_name'] as String?,
      slug: json['slug'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      occupation: json['occupation'] as String?,
      image: json['image'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserProfileModelImplToJson(
        _$UserProfileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'slug': instance.slug,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'occupation': instance.occupation,
      'image': instance.image,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
