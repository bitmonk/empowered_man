import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_question_model.freezed.dart';
part 'score_question_model.g.dart';

@freezed
class ScoreQuestionModel with _$ScoreQuestionModel {
  const factory ScoreQuestionModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') ScoreQuestionData? data,
  }) = _ScoreQuestionModel;

  factory ScoreQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$ScoreQuestionModelFromJson(json);
}

@freezed
class ScoreQuestionData with _$ScoreQuestionData {
  const factory ScoreQuestionData({
    @JsonKey(name: 'question_score') QuestionScore? questionScore,
    @JsonKey(name: 'total_obtained_score') int? totalObtainedScore,
    @JsonKey(name: 'total_score') int? totalScore,
  }) = _ScoreQuestionData;

  factory ScoreQuestionData.fromJson(Map<String, dynamic> json) =>
      _$ScoreQuestionDataFromJson(json);
}

@freezed
class QuestionScore with _$QuestionScore {
  const factory QuestionScore({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user_assessment_score_id') dynamic userAssessmentScoreId,
    @JsonKey(name: 'assessment_question_id') dynamic assessmentQuestionId,
    @JsonKey(name: 'score') int? score,
  }) = _QuestionScore;

  factory QuestionScore.fromJson(Map<String, dynamic> json) =>
      _$QuestionScoreFromJson(json);
}
