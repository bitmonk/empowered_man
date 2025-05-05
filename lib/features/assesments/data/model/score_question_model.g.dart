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
      totalObtainedScore: (json['total_obtained_score'] as num?)?.toInt(),
      totalScore: (json['total_score'] as num?)?.toInt(),
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ScoreQuestionDataImplToJson(
        _$ScoreQuestionDataImpl instance) =>
    <String, dynamic>{
      'question_score': instance.questionScore,
      'total_obtained_score': instance.totalObtainedScore,
      'total_score': instance.totalScore,
      'questions': instance.questions,
    };

_$QuestionScoreImpl _$$QuestionScoreImplFromJson(Map<String, dynamic> json) =>
    _$QuestionScoreImpl(
      id: (json['id'] as num?)?.toInt(),
      userAssessmentScoreId: json['user_assessment_score_id'],
      assessmentQuestionId: json['assessment_question_id'],
      score: (json['score'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$QuestionScoreImplToJson(_$QuestionScoreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_assessment_score_id': instance.userAssessmentScoreId,
      'assessment_question_id': instance.assessmentQuestionId,
      'score': instance.score,
    };

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: (json['id'] as num?)?.toInt(),
      assessmentId: (json['assessment_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      answered: json['answered'] as bool?,
      answer: json['answer'] == null
          ? null
          : Answer.fromJson(json['answer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
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
