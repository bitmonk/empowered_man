// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssessmentHistoryModelImpl _$$AssessmentHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AssessmentHistoryModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AssessmentHistoryData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AssessmentHistoryModelImplToJson(
        _$AssessmentHistoryModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$AssessmentHistoryDataImpl _$$AssessmentHistoryDataImplFromJson(
        Map<String, dynamic> json) =>
    _$AssessmentHistoryDataImpl(
      userAssessments: (json['user_assessments'] as List<dynamic>?)
          ?.map((e) => UserAssessment.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : AssessmentMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AssessmentHistoryDataImplToJson(
        _$AssessmentHistoryDataImpl instance) =>
    <String, dynamic>{
      'user_assessments': instance.userAssessments,
      'meta': instance.meta,
    };

_$UserAssessmentImpl _$$UserAssessmentImplFromJson(Map<String, dynamic> json) =>
    _$UserAssessmentImpl(
      id: (json['id'] as num?)?.toInt(),
      assessmentId: (json['assessment_id'] as num?)?.toInt(),
      assessmentName: json['assessment_name'] as String?,
      assessmentDate: json['assessment_date'] as String?,
      isCompleted: json['is_completed'] as bool?,
      totalScore: (json['total_score'] as num?)?.toInt(),
      totalObtainedScore: (json['total_obtained_score'] as num?)?.toInt(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$UserAssessmentImplToJson(
        _$UserAssessmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assessment_id': instance.assessmentId,
      'assessment_name': instance.assessmentName,
      'assessment_date': instance.assessmentDate,
      'is_completed': instance.isCompleted,
      'total_score': instance.totalScore,
      'total_obtained_score': instance.totalObtainedScore,
      'image': instance.image,
    };

_$AssessmentMetaImpl _$$AssessmentMetaImplFromJson(Map<String, dynamic> json) =>
    _$AssessmentMetaImpl(
      currentPage: (json['current_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AssessmentMetaImplToJson(
        _$AssessmentMetaImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'total': instance.total,
      'per_page': instance.perPage,
      'last_page': instance.lastPage,
    };
