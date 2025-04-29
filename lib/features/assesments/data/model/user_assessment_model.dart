import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_assessment_model.freezed.dart';
part 'user_assessment_model.g.dart';

@freezed
class UserAssessmentModel with _$UserAssessmentModel {
  const factory UserAssessmentModel({
    bool? status,
    String? message,
    @JsonKey(name: 'data') UserAssessmentData? data,
  }) = _UserAssessmentModel;

  factory UserAssessmentModel.fromJson(Map<String, dynamic> json) =>
      _$UserAssessmentModelFromJson(json);
}

@freezed
class UserAssessmentData with _$UserAssessmentData {
  const factory UserAssessmentData({
    @JsonKey(name: 'user_assessment') UserAssessmentDetail? userAssessment,
  }) = _UserAssessmentData;

  factory UserAssessmentData.fromJson(Map<String, dynamic> json) =>
      _$UserAssessmentDataFromJson(json);
}

@freezed
class UserAssessmentDetail with _$UserAssessmentDetail {
  const factory UserAssessmentDetail({
    int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'assessment_id') int? assessmentId,
    @JsonKey(name: 'assessment_date') String? assessmentDate,
    @JsonKey(name: 'total_obtained_score') int? totalObtainedScore,
    @JsonKey(name: 'total_score') int? totalScore,
    @JsonKey(name: 'is_completed') bool? isCompleted,
    @JsonKey(name: 'assessment') Assessment? assessment,
    @JsonKey(name: 'questions') List<AssessmentQuestion>? questions,
  }) = _UserAssessmentDetail;

  factory UserAssessmentDetail.fromJson(Map<String, dynamic> json) =>
      _$UserAssessmentDetailFromJson(json);
}

@freezed
class Assessment with _$Assessment {
  const factory Assessment({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'assessment_type') String? assessmentType,
  }) = _Assessment;
  factory Assessment.fromJson(Map<String, dynamic> json) =>
      _$AssessmentFromJson(json);
}

@freezed
class AssessmentQuestion with _$AssessmentQuestion {
  const factory AssessmentQuestion({
    int? id,
    @JsonKey(name: 'assessment_id') int? assessmentId,
    String? title,
    String? description,
    bool? answered,
    Answer? answer,
  }) = _AssessmentQuestion;

  factory AssessmentQuestion.fromJson(Map<String, dynamic> json) =>
      _$AssessmentQuestionFromJson(json);
}
@freezed
class Answer with _$Answer {
    const factory Answer({
        @JsonKey(name: 'id')
        required int id,
        @JsonKey(name: 'user_assessment_score_id')
        required int userAssessmentScoreId,
        @JsonKey(name: 'score')
        required int score,
    }) = _Answer;
    factory Answer.fromJson(Map<String, dynamic> json) =>
      _$AnswerFromJson(json);
}