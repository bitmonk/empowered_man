import 'package:freezed_annotation/freezed_annotation.dart';

part 'assessment_history_model.freezed.dart';
part 'assessment_history_model.g.dart';

@freezed
class AssessmentHistoryModel with _$AssessmentHistoryModel {
  const factory AssessmentHistoryModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') AssessmentHistoryData? data,
  }) = _AssessmentHistoryModel;

  factory AssessmentHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$AssessmentHistoryModelFromJson(json);
}

@freezed
class AssessmentHistoryData with _$AssessmentHistoryData {
  const factory AssessmentHistoryData({
    @JsonKey(name: 'user_assessments')
        List<UserAssessment>? userAssessments,
    @JsonKey(name: 'meta') AssessmentMeta? meta,
  }) = _AssessmentHistoryData;

  factory AssessmentHistoryData.fromJson(Map<String, dynamic> json) =>
      _$AssessmentHistoryDataFromJson(json);
}

@freezed
class UserAssessment with _$UserAssessment {
  const factory UserAssessment({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'assessment_id') int? assessmentId,
    @JsonKey(name: 'assessment_name') String? assessmentName,
    @JsonKey(name: 'assessment_date') String? assessmentDate,
    @JsonKey(name: 'is_completed') bool? isCompleted,
    @JsonKey(name: 'total_score') int? totalScore,
    @JsonKey(name: 'total_obtained_score') int? totalObtainedScore,
    @JsonKey(name: 'image') String? image,
  }) = _UserAssessment;

  factory UserAssessment.fromJson(Map<String, dynamic> json) =>
      _$UserAssessmentFromJson(json);
}

@freezed
class AssessmentMeta with _$AssessmentMeta {
  const factory AssessmentMeta({
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'last_page') int? lastPage,
  }) = _AssessmentMeta;

  factory AssessmentMeta.fromJson(Map<String, dynamic> json) =>
      _$AssessmentMetaFromJson(json);
}
