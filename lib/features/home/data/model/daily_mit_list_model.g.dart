// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_mit_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyMitListModelImpl _$$DailyMitListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyMitListModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>)
              .map((e) => DailyMIT.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$$DailyMitListModelImplToJson(
        _$DailyMitListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DailyMITImpl _$$DailyMITImplFromJson(Map<String, dynamic> json) =>
    _$DailyMITImpl(
      id: (json['id'] as num?)?.toInt(),
      sourceType: json['source_type'],
      title: json['title'] as String?,
      description: json['description'],
      status: json['status'] as String?,
      completionStatus: json['completion_status'],
      userId: (json['user_id'] as num?)?.toInt(),
      dueDate: json['due_date'] == null
          ? null
          : DateTime.parse(json['due_date'] as String),
      priority: json['priority'] as String?,
      level: json['level'] as String?,
      notes: json['notes'] as String?,
      subTasks: (json['sub_tasks'] as List<dynamic>?)
          ?.map((e) => DailyMIT.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DailyMITImplToJson(_$DailyMITImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'source_type': instance.sourceType,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'completion_status': instance.completionStatus,
      'user_id': instance.userId,
      'due_date': instance.dueDate?.toIso8601String(),
      'priority': instance.priority,
      'level': instance.level,
      'notes': instance.notes,
      'sub_tasks': instance.subTasks,
    };
