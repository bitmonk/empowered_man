// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_assessment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAssessmentModelImpl _$$UserAssessmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAssessmentModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserAssessmentData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserAssessmentModelImplToJson(
        _$UserAssessmentModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$UserAssessmentDataImpl _$$UserAssessmentDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAssessmentDataImpl(
      userAssessment: json['user_assessment'] == null
          ? null
          : UserAssessmentDetail.fromJson(
              json['user_assessment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserAssessmentDataImplToJson(
        _$UserAssessmentDataImpl instance) =>
    <String, dynamic>{
      'user_assessment': instance.userAssessment,
    };

_$UserAssessmentDetailImpl _$$UserAssessmentDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAssessmentDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      assessmentId: (json['assessment_id'] as num?)?.toInt(),
      assessmentDate: json['assessment_date'] as String?,
      totalObtainedScore: (json['total_obtained_score'] as num?)?.toInt(),
      totalScore: (json['total_score'] as num?)?.toInt(),
      isCompleted: json['is_completed'] as bool?,
      assessment: json['assessment'] == null
          ? null
          : Assessment.fromJson(json['assessment'] as Map<String, dynamic>),
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => AssessmentQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserAssessmentDetailImplToJson(
        _$UserAssessmentDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'assessment_id': instance.assessmentId,
      'assessment_date': instance.assessmentDate,
      'total_obtained_score': instance.totalObtainedScore,
      'total_score': instance.totalScore,
      'is_completed': instance.isCompleted,
      'assessment': instance.assessment,
      'questions': instance.questions,
    };

_$AssessmentImpl _$$AssessmentImplFromJson(Map<String, dynamic> json) =>
    _$AssessmentImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      assessmentType: json['assessment_type'] as String?,
    );

Map<String, dynamic> _$$AssessmentImplToJson(_$AssessmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'assessment_type': instance.assessmentType,
    };

_$AssessmentQuestionImpl _$$AssessmentQuestionImplFromJson(
        Map<String, dynamic> json) =>
    _$AssessmentQuestionImpl(
      id: (json['id'] as num?)?.toInt(),
      assessmentId: (json['assessment_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      answered: json['answered'] as bool?,
      answer: json['answer'] == null
          ? null
          : Answer.fromJson(json['answer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AssessmentQuestionImplToJson(
        _$AssessmentQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assessment_id': instance.assessmentId,
      'title': instance.title,
      'description': instance.description,
      'answered': instance.answered,
      'answer': instance.answer,
    };

_$AnswerImpl _$$AnswerImplFromJson(Map<String, dynamic> json) => _$AnswerImpl(
      id: (json['id'] as num?)?.toInt(),
      userAssessmentScoreId:
          (json['user_assessment_score_id'] as num?)?.toInt(),
      score: (json['score'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_assessment_score_id': instance.userAssessmentScoreId,
      'score': instance.score,
    };
