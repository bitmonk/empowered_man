// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChapterModelImpl _$$ChapterModelImplFromJson(Map<String, dynamic> json) =>
    _$ChapterModelImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ChapterData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChapterModelImplToJson(_$ChapterModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$ChapterDataImpl _$$ChapterDataImplFromJson(Map<String, dynamic> json) =>
    _$ChapterDataImpl(
      course: json['course'] == null
          ? null
          : Course.fromJson(json['course'] as Map<String, dynamic>),
      chapters: (json['chapters'] as List<dynamic>?)
          ?.map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChapterDataImplToJson(_$ChapterDataImpl instance) =>
    <String, dynamic>{
      'course': instance.course,
      'chapters': instance.chapters,
    };

_$ChapterImpl _$$ChapterImplFromJson(Map<String, dynamic> json) =>
    _$ChapterImpl(
      id: (json['id'] as num?)?.toInt(),
      courseId: (json['course_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      videoUrl: json['video_url'] as String?,
    );

Map<String, dynamic> _$$ChapterImplToJson(_$ChapterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'video_url': instance.videoUrl,
    };

_$CourseImpl _$$CourseImplFromJson(Map<String, dynamic> json) => _$CourseImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$CourseImplToJson(_$CourseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
