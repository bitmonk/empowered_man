// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditProfileResponseImpl _$$EditProfileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EditProfileResponseImpl(
      message: json['message'] as String,
      user: UserProfileModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EditProfileResponseImplToJson(
        _$EditProfileResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };
