import 'package:freezed_annotation/freezed_annotation.dart';

part 'on_track_model.freezed.dart';
part 'on_track_model.g.dart';



@freezed
class OnTrackModel with _$OnTrackModel {
  const factory OnTrackModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _OnTrackModel;

  factory OnTrackModel.fromJson(Map<String, dynamic> json) =>
      _$OnTrackModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'user_goal') UserGoal? userGoal,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class UserGoal with _$UserGoal {
  const factory UserGoal({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'goal_id') int? goalId,
    @JsonKey(name: 'goal_detail_id') int? goalDetailId,
    @JsonKey(name: 'progress') dynamic progress,
    @JsonKey(name: 'is_ontrack') bool? isOntrack,
    @JsonKey(name: 'is_complete') bool? isComplete,
    @JsonKey(name: 'show_won_question') dynamic showWonQuestion,
    @JsonKey(name: 'show_track_question') dynamic showTrackQuestion,
  }) = _UserGoal;

  factory UserGoal.fromJson(Map<String, dynamic> json) =>
      _$UserGoalFromJson(json);
}
