import 'package:freezed_annotation/freezed_annotation.dart';

part 'power_stat_model.freezed.dart';
part 'power_stat_model.g.dart';

@freezed
class PowerStatModel with _$PowerStatModel {
  const factory PowerStatModel({
    @JsonKey(name: 'user_progressbar_points') String? userProgressbarPoints,
    @JsonKey(name: 'total_points_progressbar') String? totalPointsProgressbar,
    @JsonKey(name: 'current_level') String? currentLevel,
    @JsonKey(name: 'upcoming_level') String? upcomingLevel,
    @JsonKey(name: 'user_habits') String? userHabits,
    @JsonKey(name: 'total_habits') String? totalHabits,
    @JsonKey(name: 'user_growth_habits') String? userGrowthHabits,
    @JsonKey(name: 'user_journals') String? userJournals,
    @JsonKey(name: 'total_journals') String? totalJournals,
    @JsonKey(name: 'user_journals_habits') String? userJournalsHabits,
    @JsonKey(name: 'user_total_goals') String? userTotalGoals,
    @JsonKey(name: 'total_goals') String? totalGoals,
    @JsonKey(name: 'user_goals_habits') String? userGoalsHabits,
    @JsonKey(name: 'user_assessments') String? userAssessments,
    @JsonKey(name: 'total_assessments') String? totalAssessments,
    @JsonKey(name: 'user_assessments_habits') String? userAssessmentsHabits,
    @JsonKey(name: 'user_tasks') String? userTasks,
    @JsonKey(name: 'total_tasks') String? totalTasks,
    @JsonKey(name: 'user_tasks_habits') String? userTasksHabits,
    @JsonKey(name: 'previous_week_average') String? previousWeekAverage,
    @JsonKey(name: 'four_week_average') String? fourWeekAverage,
    @JsonKey(name: 'year_average') String? yearAverage,
    @JsonKey(name: 'overall_average') String? overallAverage,
    @JsonKey(name: 'average_total_percentage') String? averageTotalPercentage,
    @JsonKey(name: 'average_total_growth_percentage')
    String? averageTotalGrowthPercentage,
    @JsonKey(name: 'average_growth_habits_percentage')
    String? averageGrowthHabitsPercentage,
    @JsonKey(name: 'average_growth_journals_percentage')
    String? averageGrowthJournalsPercentage,
    @JsonKey(name: 'average_growth_tasks_percentage')
    String? averageGrowthTasksPercentage,
    @JsonKey(name: 'average_growth_goal_percentage')
    String? averageGrowthGoalPercentage,
    @JsonKey(name: 'average_habits_percentage') String? averageHabitsPercentage,
    @JsonKey(name: 'average_journals_percentage')
    String? averageJournalsPercentage,
    @JsonKey(name: 'average_tasks_percentage') String? averageTasksPercentage,
    @JsonKey(name: 'average_goal_percentage') String? averageGoalPercentage,
    @JsonKey(name: 'weeklystatus') Weeklystatus? weeklystatus,
    @JsonKey(name: 'monthlystatus') Monthlystatus? monthlystatus,
  }) = _PowerStatModel;

  factory PowerStatModel.fromJson(Map<String, dynamic> json) =>
      _$PowerStatModelFromJson(json);
}

@freezed
class Monthlystatus with _$Monthlystatus {
  const factory Monthlystatus({
    @JsonKey(name: 'journal') MonthlystatusGoals? journal,
    @JsonKey(name: 'habits') MonthlystatusGoals? habits,
    @JsonKey(name: 'goals') MonthlystatusGoals? goals,
    @JsonKey(name: 'tasks') MonthlystatusGoals? tasks,
  }) = _Monthlystatus;

  factory Monthlystatus.fromJson(Map<String, dynamic> json) =>
      _$MonthlystatusFromJson(json);
}

@freezed
class MonthlystatusGoals with _$MonthlystatusGoals {
  const factory MonthlystatusGoals({
    @JsonKey(name: 'jan') dynamic jan,
    @JsonKey(name: 'feb') dynamic feb,
    @JsonKey(name: 'mar') dynamic mar,
    @JsonKey(name: 'apr') dynamic apr,
    @JsonKey(name: 'may') dynamic may,
    @JsonKey(name: 'jun') dynamic jun,
    @JsonKey(name: 'jul') dynamic jul,
    @JsonKey(name: 'aug') dynamic aug,
    @JsonKey(name: 'sep') dynamic sep,
    @JsonKey(name: 'oct') dynamic oct,
    @JsonKey(name: 'nov') dynamic nov,
    @JsonKey(name: 'dec') dynamic dec,
  }) = _MonthlystatusGoals;

  factory MonthlystatusGoals.fromJson(Map<String, dynamic> json) =>
      _$MonthlystatusGoalsFromJson(json);
}

@freezed
class Weeklystatus with _$Weeklystatus {
  const factory Weeklystatus({
    @JsonKey(name: 'journal') WeeklystatusGoals? journal,
    @JsonKey(name: 'habits') WeeklystatusGoals? habits,
    @JsonKey(name: 'goals') WeeklystatusGoals? goals,
    @JsonKey(name: 'tasks') WeeklystatusGoals? tasks,
  }) = _Weeklystatus;

  factory Weeklystatus.fromJson(Map<String, dynamic> json) =>
      _$WeeklystatusFromJson(json);
}

@freezed
class WeeklystatusGoals with _$WeeklystatusGoals {
  const factory WeeklystatusGoals({
    @JsonKey(name: 'mon') dynamic mon,
    @JsonKey(name: 'tue') dynamic tue,
    @JsonKey(name: 'wed') dynamic wed,
    @JsonKey(name: 'thu') dynamic thu,
    @JsonKey(name: 'fri') dynamic fri,
    @JsonKey(name: 'sat') dynamic sat,
    @JsonKey(name: 'sun') dynamic sun,
  }) = _WeeklystatusGoals;

  factory WeeklystatusGoals.fromJson(Map<String, dynamic> json) =>
      _$WeeklystatusGoalsFromJson(json);
}
