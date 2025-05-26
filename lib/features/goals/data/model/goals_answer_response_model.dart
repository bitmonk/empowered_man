import 'package:freezed_annotation/freezed_annotation.dart';

part 'goals_answer_response_model.freezed.dart';
part 'goals_answer_response_model.g.dart';

@freezed
class GoalsAnswerResponseModel with _$GoalsAnswerResponseModel {
  const factory GoalsAnswerResponseModel({
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _GoalsAnswerResponseModel;

  factory GoalsAnswerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GoalsAnswerResponseModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'question_id') String? questionId,
    @JsonKey(name: 'user_goal_id') String? userGoalId,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'achieved') bool? achieved,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
