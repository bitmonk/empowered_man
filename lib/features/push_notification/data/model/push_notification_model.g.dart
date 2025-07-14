// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PushNotificationModelImpl _$$PushNotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PushNotificationModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : PushNotificationModelData.fromJson(
              json['data'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PushNotificationModelImplToJson(
        _$PushNotificationModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };

_$PushNotificationModelDataImpl _$$PushNotificationModelDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PushNotificationModelDataImpl(
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => PushNotification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PushNotificationModelDataImplToJson(
        _$PushNotificationModelDataImpl instance) =>
    <String, dynamic>{
      'notifications': instance.notifications,
    };

_$PushNotificationImpl _$$PushNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$PushNotificationImpl(
      id: json['id'] as String?,
      type: json['type'] as String?,
      notifiableType: json['notifiable_type'] as String?,
      notifiableId: (json['notifiable_id'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : PushNotificationData.fromJson(json['data'] as Map<String, dynamic>),
      readAt: json['read_at'],
      url: json['url'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PushNotificationImplToJson(
        _$PushNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'notifiable_type': instance.notifiableType,
      'notifiable_id': instance.notifiableId,
      'data': instance.data,
      'read_at': instance.readAt,
      'url': instance.url,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$PushNotificationDataImpl _$$PushNotificationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PushNotificationDataImpl(
      body: json['body'] as String?,
      data: json['data'] as List<dynamic>?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$PushNotificationDataImplToJson(
        _$PushNotificationDataImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
      'data': instance.data,
      'title': instance.title,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      currentPage: (json['current_page'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };
