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
    List<Question>? questions,
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

@freezed
class Question with _$Question {
  const factory Question({
    int? id,
    @JsonKey(name: 'assessment_id') int? assessmentId,
    String? title,
    String? description,
    bool? answered,
    Answer? answer,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

@freezed
class Answer with _$Answer {
  const factory Answer({
    int? id,
    @JsonKey(name: 'user_assessment_score_id') int? userAssessmentScoreId,
    int? score,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
