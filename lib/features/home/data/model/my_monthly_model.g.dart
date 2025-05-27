// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_monthly_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyMonthlyModelImpl _$$MyMonthlyModelImplFromJson(Map<String, dynamic> json) =>
    _$MyMonthlyModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : MyMonthlyData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MyMonthlyModelImplToJson(
        _$MyMonthlyModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$MyMonthlyDataImpl _$$MyMonthlyDataImplFromJson(Map<String, dynamic> json) =>
    _$MyMonthlyDataImpl(
      myMonthlyTargets: (json['My Monthly Targets'] as List<dynamic>?)
          ?.map((e) => MyMonthlyTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MyMonthlyDataImplToJson(_$MyMonthlyDataImpl instance) =>
    <String, dynamic>{
      'My Monthly Targets': instance.myMonthlyTargets,
    };

_$MyMonthlyTargetImpl _$$MyMonthlyTargetImplFromJson(
        Map<String, dynamic> json) =>
    _$MyMonthlyTargetImpl(
      target: json['target'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      type: json['type'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$MyMonthlyTargetImplToJson(
        _$MyMonthlyTargetImpl instance) =>
    <String, dynamic>{
      'target': instance.target,
      'date': instance.date?.toIso8601String(),
      'type': instance.type,
      'status': instance.status,
    };
