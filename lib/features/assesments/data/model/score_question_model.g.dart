// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreQuestionModelImpl _$$ScoreQuestionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ScoreQuestionModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ScoreQuestionData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ScoreQuestionModelImplToJson(
        _$ScoreQuestionModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$ScoreQuestionDataImpl _$$ScoreQuestionDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ScoreQuestionDataImpl(
      questionScore: json['question_score'] == null
          ? null
          : QuestionScore.fromJson(
              json['question_score'] as Map<String, dynamic>),
      totalObtainedScore: json['total_obtained_score'] as String?,
      totalScore: (json['total_score'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ScoreQuestionDataImplToJson(
        _$ScoreQuestionDataImpl instance) =>
    <String, dynamic>{
      'question_score': instance.questionScore,
      'total_obtained_score': instance.totalObtainedScore,
      'total_score': instance.totalScore,
    };

_$QuestionScoreImpl _$$QuestionScoreImplFromJson(Map<String, dynamic> json) =>
    _$QuestionScoreImpl(
      id: (json['id'] as num?)?.toInt(),
      userAssessmentScoreId:
          (json['user_assessment_score_id'] as num?)?.toInt(),
      assessmentQuestionId: (json['assessment_question_id'] as num?)?.toInt(),
      score: json['score'] as String?,
    );

Map<String, dynamic> _$$QuestionScoreImplToJson(_$QuestionScoreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_assessment_score_id': instance.userAssessmentScoreId,
      'assessment_question_id': instance.assessmentQuestionId,
      'score': instance.score,
    };
