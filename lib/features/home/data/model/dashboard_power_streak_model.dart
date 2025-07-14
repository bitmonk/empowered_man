import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_power_streak_model.freezed.dart';
part 'dashboard_power_streak_model.g.dart';

@freezed
class DashboardPowerStreakModel with _$DashboardPowerStreakModel {
  const factory DashboardPowerStreakModel({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'data') DashboardPowerStreakData? data,
    @JsonKey(name: 'message') String? message,
  }) = _DashboardPowerStreakModel;

  factory DashboardPowerStreakModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardPowerStreakModelFromJson(json);
}

@freezed
class DashboardPowerStreakData with _$DashboardPowerStreakData {
  const factory DashboardPowerStreakData({
    @JsonKey(name: 'weeklyDetails') Map<String, int>? weeklyDetails,
    @JsonKey(name: 'powerStreaks') Map<String, int>? powerStreaks,
    @JsonKey(name: 'totalScores') Map<String, int>? totalScores,
  }) = _DashboardPowerStreakData;

  factory DashboardPowerStreakData.fromJson(Map<String, dynamic> json) =>
      _$DashboardPowerStreakDataFromJson(json);
}
