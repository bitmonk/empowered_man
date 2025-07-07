// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_group_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateGroupResponseModelImpl _$$CreateGroupResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateGroupResponseModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateGroupResponseModelImplToJson(
        _$CreateGroupResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      group: json['group'] == null
          ? null
          : Group.fromJson(json['group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'group': instance.group,
    };

_$GroupImpl _$$GroupImplFromJson(Map<String, dynamic> json) => _$GroupImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      about: json['about'] as String?,
      accessType: json['access_type'] as String?,
      image: json['image'] as String?,
      isPinned: json['is_pinned'] as bool?,
    );

Map<String, dynamic> _$$GroupImplToJson(_$GroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'about': instance.about,
      'access_type': instance.accessType,
      'image': instance.image,
      'is_pinned': instance.isPinned,
    };
