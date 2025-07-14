import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_habit_model.freezed.dart';
part 'dashboard_habit_model.g.dart';

@freezed
class DashboardHabitModel with _$DashboardHabitModel {
  const factory DashboardHabitModel({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') List<DashboardHabit>? data,
  }) = _DashboardHabitModel;

  factory DashboardHabitModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardHabitModelFromJson(json);
}

@freezed
class DashboardHabit with _$DashboardHabit {
  const factory DashboardHabit({
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'habits') List<Habit>? habits,
  }) = _DashboardHabit;

  factory DashboardHabit.fromJson(Map<String, dynamic> json) =>
      _$DashboardHabitFromJson(json);
}

@freezed
class Habit with _$Habit {
  const factory Habit({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'logo') String? logo,
    @JsonKey(name: 'status') int? status,
  }) = _Habit;

  factory Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);
}
