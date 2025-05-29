// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agora_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgoraUserModelImpl _$$AgoraUserModelImplFromJson(Map<String, dynamic> json) =>
    _$AgoraUserModelImpl(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AgoraUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['total_count'] as num?)?.toInt(),
      query: json['query'] as String?,
      limit: json['limit'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$AgoraUserModelImplToJson(
        _$AgoraUserModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'total_count': instance.totalCount,
      'query': instance.query,
      'limit': instance.limit,
      'timestamp': instance.timestamp?.toIso8601String(),
    };

_$AgoraUserImpl _$$AgoraUserImplFromJson(Map<String, dynamic> json) =>
    _$AgoraUserImpl(
      username: json['username'] as String?,
      nickname: json['nickname'] as String?,
      avatar: json['avatar'],
      isOnline: json['is_online'] as bool?,
      isActivated: json['is_activated'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      createdAgo: json['created_ago'] as String?,
      lastLoginAt: json['last_login_at'],
      lastLoginAgo: json['last_login_ago'],
      modifiedAt: json['modified_at'] == null
          ? null
          : DateTime.parse(json['modified_at'] as String),
    );

Map<String, dynamic> _$$AgoraUserImplToJson(_$AgoraUserImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'is_online': instance.isOnline,
      'is_activated': instance.isActivated,
      'created_at': instance.createdAt?.toIso8601String(),
      'created_ago': instance.createdAgo,
      'last_login_at': instance.lastLoginAt,
      'last_login_ago': instance.lastLoginAgo,
      'modified_at': instance.modifiedAt?.toIso8601String(),
    };
