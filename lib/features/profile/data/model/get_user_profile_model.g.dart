// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUserProfileModelImpl _$$GetUserProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUserProfileModelImpl(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetUserProfileModelImplToJson(
        _$GetUserProfileModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      user: UserProfileModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
    };
