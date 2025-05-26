import 'package:freezed_annotation/freezed_annotation.dart';

part 'goals_overview_model.freezed.dart';
part 'goals_overview_model.g.dart';

@freezed
class GoalsOverviewModel with _$GoalsOverviewModel {
  const factory GoalsOverviewModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _GoalsOverviewModel;

  factory GoalsOverviewModel.fromJson(Map<String, dynamic> json) =>
      _$GoalsOverviewModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'goal_overview') GoalOverview? goalOverview,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class GoalOverview with _$GoalOverview {
  const factory GoalOverview({
    @JsonKey(name: 'Q1') Quarter? q1,
    @JsonKey(name: 'Q2') Quarter? q2,
    @JsonKey(name: 'Q3') Quarter? q3,
    @JsonKey(name: 'Q4') Quarter? q4,
    @JsonKey(name: 'yearly_goals') Map<String,bool>? yearlyGoals,
  }) = _GoalOverview;

  factory GoalOverview.fromJson(Map<String, dynamic> json) =>
      _$GoalOverviewFromJson(json);
}

@freezed
class Quarter with _$Quarter {
  const factory Quarter({
    @JsonKey(name: 'months') List<Map<String,bool>>? months,
    @JsonKey(name: 'quarterly_goals') Map<String,bool>? quarterlyGoals,
  }) = _Quarter;

  factory Quarter.fromJson(Map<String, dynamic> json) => _$QuarterFromJson(json);
}
