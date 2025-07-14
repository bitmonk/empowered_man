// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModuleModelImpl _$$ModuleModelImplFromJson(Map<String, dynamic> json) =>
    _$ModuleModelImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      moduledata: json['data'] == null
          ? null
          : ModuleData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ModuleModelImplToJson(_$ModuleModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.moduledata,
    };

_$ModuleDataImpl _$$ModuleDataImplFromJson(Map<String, dynamic> json) =>
    _$ModuleDataImpl(
      course: json['course'] == null
          ? null
          : Course.fromJson(json['course'] as Map<String, dynamic>),
      modules: (json['modules'] as List<dynamic>?)
          ?.map((e) => Module.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ModuleDataImplToJson(_$ModuleDataImpl instance) =>
    <String, dynamic>{
      'course': instance.course,
      'modules': instance.modules,
    };

_$ModuleImpl _$$ModuleImplFromJson(Map<String, dynamic> json) => _$ModuleImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      courseId: (json['course_id'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      thumbnail: json['thumbnail'] as String?,
      status: json['status'] as String?,
      completionPercentage: (json['completion_percentage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ModuleImplToJson(_$ModuleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'course_id': instance.courseId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'thumbnail': instance.thumbnail,
      'status': instance.status,
      'completion_percentage': instance.completionPercentage,
    };
