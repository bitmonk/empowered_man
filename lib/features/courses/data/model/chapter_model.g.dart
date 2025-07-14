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
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChapterModelImplToJson(_$ChapterModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      chapterData: json['module'] == null
          ? null
          : ChapterData.fromJson(json['module'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'module': instance.chapterData,
    };

_$ChapterDataImpl _$$ChapterDataImplFromJson(Map<String, dynamic> json) =>
    _$ChapterDataImpl(
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
      chapters: (json['chapters'] as List<dynamic>?)
          ?.map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChapterDataImplToJson(_$ChapterDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'course_id': instance.courseId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'thumbnail': instance.thumbnail,
      'status': instance.status,
      'completion_percentage': instance.completionPercentage,
      'chapters': instance.chapters,
    };

_$ChapterImpl _$$ChapterImplFromJson(Map<String, dynamic> json) =>
    _$ChapterImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      moduleId: (json['module_id'] as num?)?.toInt(),
      videoUrl: json['video_url'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$ChapterImplToJson(_$ChapterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'module_id': instance.moduleId,
      'video_url': instance.videoUrl,
      'status': instance.status,
    };
