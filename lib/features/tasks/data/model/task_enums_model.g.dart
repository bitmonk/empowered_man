// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_enums_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskEnumsModelImpl _$$TaskEnumsModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskEnumsModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaskEnumsModelImplToJson(
        _$TaskEnumsModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      levels:
          (json['levels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      completionStatus: (json['completion_status'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      priorities: (json['priorities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      weekDays: (json['week_days'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'levels': instance.levels,
      'completion_status': instance.completionStatus,
      'priorities': instance.priorities,
      'week_days': instance.weekDays,
    };
