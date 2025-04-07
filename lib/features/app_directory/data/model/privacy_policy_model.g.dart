// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_policy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrivacyPolicyModelImpl _$$PrivacyPolicyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PrivacyPolicyModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      privacyPolicyData: json['data'] == null
          ? null
          : PrivacyPolicyData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PrivacyPolicyModelImplToJson(
        _$PrivacyPolicyModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.privacyPolicyData,
    };

_$PrivacyPolicyDataImpl _$$PrivacyPolicyDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PrivacyPolicyDataImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$PrivacyPolicyDataImplToJson(
        _$PrivacyPolicyDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
    };
