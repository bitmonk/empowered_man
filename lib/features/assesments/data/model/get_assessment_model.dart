import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_assessment_model.g.dart';
part 'get_assessment_model.freezed.dart';

@freezed
class GetAssessmentModel with _$GetAssessmentModel {
  const factory GetAssessmentModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _GetAssessmentModel;
  factory GetAssessmentModel.fromJson(Map<String, dynamic> json) =>
      _$GetAssessmentModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'assessments') Assessments? assessments,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Assessments with _$Assessments {
  const factory Assessments({
    @JsonKey(name: 'Growth') List<Growth>? growth,
    @JsonKey(name: 'Wealth') List<Growth>? wealth,
  }) = _Assessments;
  factory Assessments.fromJson(Map<String, dynamic> json) =>
      _$AssessmentsFromJson(json);
}

@freezed
class Growth with _$Growth {
  const factory Growth({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'assessment_type') String? assessmentType,
    @JsonKey(name: 'has_score') bool? hasScore,
    @JsonKey(name: 'current_score') dynamic currentScore,
    @JsonKey(name: 'total_score') int? totalScore,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'score_history') List<ScoreHistory>? scoreHistory,
  }) = _Growth;

  factory Growth.fromJson(Map<String, dynamic> json) => _$GrowthFromJson(json);
}

// @freezed
// class ScoreHistory with _$ScoreHistory {
//   const factory ScoreHistory({
//     @JsonKey(name: 'id') int? id,
//     @JsonKey(name: 'assessment_date') String? assessmentDate,
//     @JsonKey(name: 'total_score') int? totalScore,
//     @JsonKey(name: 'is_completed') bool? isCompleted,
//   }) = _ScoreHistory;

//   factory ScoreHistory.fromJson(Map<String, dynamic> json) =>
//       _$ScoreHistoryFromJson(json);
// }
@freezed
class ScoreHistory with _$ScoreHistory {
  const factory ScoreHistory({
    @JsonKey(name: 'W1') int? w1,
    @JsonKey(name: 'W2') int? w2,
    @JsonKey(name: 'W3') int? w3,
    @JsonKey(name: 'W4') int? w4,
  }) = _ScoreHistory;

  factory ScoreHistory.fromJson(Map<String, dynamic> json) =>
      _$ScoreHistoryFromJson(json);
}
