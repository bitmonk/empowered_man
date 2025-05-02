// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_assessment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetAssessmentModelImpl _$$GetAssessmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GetAssessmentModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetAssessmentModelImplToJson(
        _$GetAssessmentModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      assessments: json['assessments'] == null
          ? null
          : Assessments.fromJson(json['assessments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'assessments': instance.assessments,
    };

_$AssessmentsImpl _$$AssessmentsImplFromJson(Map<String, dynamic> json) =>
    _$AssessmentsImpl(
      growth: (json['Growth'] as List<dynamic>?)
          ?.map((e) => Growth.fromJson(e as Map<String, dynamic>))
          .toList(),
      wealth: (json['Wealth'] as List<dynamic>?)
          ?.map((e) => Growth.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AssessmentsImplToJson(_$AssessmentsImpl instance) =>
    <String, dynamic>{
      'Growth': instance.growth,
      'Wealth': instance.wealth,
    };

_$GrowthImpl _$$GrowthImplFromJson(Map<String, dynamic> json) => _$GrowthImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      assessmentType: json['assessment_type'] as String?,
      hasScore: json['has_score'] as bool?,
      currentScore: json['current_score'],
      totalScore: (json['total_score'] as num?)?.toInt(),
      status: json['status'] as String?,
      scoreHistory: (json['score_history'] as List<dynamic>?)
          ?.map((e) => ScoreHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GrowthImplToJson(_$GrowthImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'assessment_type': instance.assessmentType,
      'has_score': instance.hasScore,
      'current_score': instance.currentScore,
      'total_score': instance.totalScore,
      'status': instance.status,
      'score_history': instance.scoreHistory,
    };

_$ScoreHistoryImpl _$$ScoreHistoryImplFromJson(Map<String, dynamic> json) =>
    _$ScoreHistoryImpl(
      w1: (json['W1'] as num?)?.toInt(),
      w2: (json['W2'] as num?)?.toInt(),
      w3: (json['W3'] as num?)?.toInt(),
      w4: (json['W4'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ScoreHistoryImplToJson(_$ScoreHistoryImpl instance) =>
    <String, dynamic>{
      'W1': instance.w1,
      'W2': instance.w2,
      'W3': instance.w3,
      'W4': instance.w4,
    };
