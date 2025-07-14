// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TaskLevel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$TaskLevelImpl _$$TaskLevelImplFromJson(Map<String, dynamic> json) =>
    _$TaskLevelImpl(
      hitList: json['HIT List'] == null
          ? null
          : TaskCategory.fromJson(json['HIT List'] as Map<String, dynamic>),
      mitList: json['Mit List'] == null
          ? null
          : TaskCategory.fromJson(json['Mit List'] as Map<String, dynamic>),
      doList: json['Do List'] == null
          ? null
          : TaskCategory.fromJson(json['Do List'] as Map<String, dynamic>),
      achieved: json['Achieved'] == null
          ? null
          : TaskCategory.fromJson(json['Achieved'] as Map<String, dynamic>),
      done: json['Done'] == null
          ? null
          : TaskCategory.fromJson(json['Done'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaskLevelImplToJson(_$TaskLevelImpl instance) =>
    <String, dynamic>{
      'HIT List': instance.hitList,
      'Mit List': instance.mitList,
      'Do List': instance.doList,
      'Achieved': instance.achieved,
      'Done': instance.done,
    };

_$TaskCategoryImpl _$$TaskCategoryImplFromJson(Map<String, dynamic> json) =>
    _$TaskCategoryImpl(
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['_meta'] == null
          ? null
          : Meta.fromJson(json['_meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaskCategoryImplToJson(_$TaskCategoryImpl instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
      '_meta': instance.meta,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      count: (json['count'] as num?)?.toInt(),
      completed: json['completed'] == null
          ? null
          : Completed.fromJson(json['completed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'completed': instance.completed,
    };

_$CompletedImpl _$$CompletedImplFromJson(Map<String, dynamic> json) =>
    _$CompletedImpl(
      count: (json['count'] as num?)?.toInt(),
      percentage: (json['percentage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CompletedImplToJson(_$CompletedImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'percentage': instance.percentage,
    };

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
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
          ?.map((e) => SubTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
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

_$SubTaskImpl _$$SubTaskImplFromJson(Map<String, dynamic> json) =>
    _$SubTaskImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      dueDate: json['due_date'] == null
          ? null
          : DateTime.parse(json['due_date'] as String),
      priority: json['priority'] as String?,
      level: json['level'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$SubTaskImplToJson(_$SubTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'user_id': instance.userId,
      'due_date': instance.dueDate?.toIso8601String(),
      'priority': instance.priority,
      'level': instance.level,
      'notes': instance.notes,
    };
