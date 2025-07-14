// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'power_stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PowerStatModelImpl _$$PowerStatModelImplFromJson(Map<String, dynamic> json) =>
    _$PowerStatModelImpl(
      userProgressbarPoints: json['user_progressbar_points'] as String?,
      totalPointsProgressbar: json['total_points_progressbar'] as String?,
      currentLevel: json['current_level'] as String?,
      upcomingLevel: json['upcoming_level'] as String?,
      userHabits: json['user_habits'] as String?,
      totalHabits: json['total_habits'] as String?,
      userGrowthHabits: json['user_growth_habits'] as String?,
      userJournals: json['user_journals'] as String?,
      totalJournals: json['total_journals'] as String?,
      userJournalsHabits: json['user_journals_habits'] as String?,
      userTotalGoals: json['user_total_goals'] as String?,
      totalGoals: json['total_goals'] as String?,
      userGoalsHabits: json['user_goals_habits'] as String?,
      userAssessments: json['user_assessments'] as String?,
      totalAssessments: json['total_assessments'] as String?,
      userAssessmentsHabits: json['user_assessments_habits'] as String?,
      userTasks: json['user_tasks'] as String?,
      totalTasks: json['total_tasks'] as String?,
      userTasksHabits: json['user_tasks_habits'] as String?,
      previousWeekAverage: json['previous_week_average'] as String?,
      fourWeekAverage: json['four_week_average'] as String?,
      yearAverage: json['year_average'] as String?,
      overallAverage: json['overall_average'] as String?,
      averageTotalPercentage: json['average_total_percentage'] as String?,
      averageTotalGrowthPercentage:
          json['average_total_growth_percentage'] as String?,
      averageGrowthHabitsPercentage:
          json['average_growth_habits_percentage'] as String?,
      averageGrowthJournalsPercentage:
          json['average_growth_journals_percentage'] as String?,
      averageGrowthTasksPercentage:
          json['average_growth_tasks_percentage'] as String?,
      averageGrowthGoalPercentage:
          json['average_growth_goal_percentage'] as String?,
      averageHabitsPercentage: json['average_habits_percentage'] as String?,
      averageJournalsPercentage: json['average_journals_percentage'] as String?,
      averageTasksPercentage: json['average_tasks_percentage'] as String?,
      averageGoalPercentage: json['average_goal_percentage'] as String?,
      weeklystatus: json['weeklystatus'] == null
          ? null
          : Weeklystatus.fromJson(json['weeklystatus'] as Map<String, dynamic>),
      monthlystatus: json['monthlystatus'] == null
          ? null
          : Monthlystatus.fromJson(
              json['monthlystatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PowerStatModelImplToJson(
        _$PowerStatModelImpl instance) =>
    <String, dynamic>{
      'user_progressbar_points': instance.userProgressbarPoints,
      'total_points_progressbar': instance.totalPointsProgressbar,
      'current_level': instance.currentLevel,
      'upcoming_level': instance.upcomingLevel,
      'user_habits': instance.userHabits,
      'total_habits': instance.totalHabits,
      'user_growth_habits': instance.userGrowthHabits,
      'user_journals': instance.userJournals,
      'total_journals': instance.totalJournals,
      'user_journals_habits': instance.userJournalsHabits,
      'user_total_goals': instance.userTotalGoals,
      'total_goals': instance.totalGoals,
      'user_goals_habits': instance.userGoalsHabits,
      'user_assessments': instance.userAssessments,
      'total_assessments': instance.totalAssessments,
      'user_assessments_habits': instance.userAssessmentsHabits,
      'user_tasks': instance.userTasks,
      'total_tasks': instance.totalTasks,
      'user_tasks_habits': instance.userTasksHabits,
      'previous_week_average': instance.previousWeekAverage,
      'four_week_average': instance.fourWeekAverage,
      'year_average': instance.yearAverage,
      'overall_average': instance.overallAverage,
      'average_total_percentage': instance.averageTotalPercentage,
      'average_total_growth_percentage': instance.averageTotalGrowthPercentage,
      'average_growth_habits_percentage':
          instance.averageGrowthHabitsPercentage,
      'average_growth_journals_percentage':
          instance.averageGrowthJournalsPercentage,
      'average_growth_tasks_percentage': instance.averageGrowthTasksPercentage,
      'average_growth_goal_percentage': instance.averageGrowthGoalPercentage,
      'average_habits_percentage': instance.averageHabitsPercentage,
      'average_journals_percentage': instance.averageJournalsPercentage,
      'average_tasks_percentage': instance.averageTasksPercentage,
      'average_goal_percentage': instance.averageGoalPercentage,
      'weeklystatus': instance.weeklystatus,
      'monthlystatus': instance.monthlystatus,
    };

_$MonthlystatusImpl _$$MonthlystatusImplFromJson(Map<String, dynamic> json) =>
    _$MonthlystatusImpl(
      journal: json['journal'] == null
          ? null
          : MonthlystatusGoals.fromJson(
              json['journal'] as Map<String, dynamic>),
      habits: json['habits'] == null
          ? null
          : MonthlystatusGoals.fromJson(json['habits'] as Map<String, dynamic>),
      goals: json['goals'] == null
          ? null
          : MonthlystatusGoals.fromJson(json['goals'] as Map<String, dynamic>),
      tasks: json['tasks'] == null
          ? null
          : MonthlystatusGoals.fromJson(json['tasks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MonthlystatusImplToJson(_$MonthlystatusImpl instance) =>
    <String, dynamic>{
      'journal': instance.journal,
      'habits': instance.habits,
      'goals': instance.goals,
      'tasks': instance.tasks,
    };

_$MonthlystatusGoalsImpl _$$MonthlystatusGoalsImplFromJson(
        Map<String, dynamic> json) =>
    _$MonthlystatusGoalsImpl(
      jan: json['jan'],
      feb: json['feb'],
      mar: json['mar'],
      apr: json['apr'],
      may: json['may'],
      jun: json['jun'],
      jul: json['jul'],
      aug: json['aug'],
      sep: json['sep'],
      oct: json['oct'],
      nov: json['nov'],
      dec: json['dec'],
    );

Map<String, dynamic> _$$MonthlystatusGoalsImplToJson(
        _$MonthlystatusGoalsImpl instance) =>
    <String, dynamic>{
      'jan': instance.jan,
      'feb': instance.feb,
      'mar': instance.mar,
      'apr': instance.apr,
      'may': instance.may,
      'jun': instance.jun,
      'jul': instance.jul,
      'aug': instance.aug,
      'sep': instance.sep,
      'oct': instance.oct,
      'nov': instance.nov,
      'dec': instance.dec,
    };

_$WeeklystatusImpl _$$WeeklystatusImplFromJson(Map<String, dynamic> json) =>
    _$WeeklystatusImpl(
      journal: json['journal'] == null
          ? null
          : WeeklystatusGoals.fromJson(json['journal'] as Map<String, dynamic>),
      habits: json['habits'] == null
          ? null
          : WeeklystatusGoals.fromJson(json['habits'] as Map<String, dynamic>),
      goals: json['goals'] == null
          ? null
          : WeeklystatusGoals.fromJson(json['goals'] as Map<String, dynamic>),
      tasks: json['tasks'] == null
          ? null
          : WeeklystatusGoals.fromJson(json['tasks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeeklystatusImplToJson(_$WeeklystatusImpl instance) =>
    <String, dynamic>{
      'journal': instance.journal,
      'habits': instance.habits,
      'goals': instance.goals,
      'tasks': instance.tasks,
    };

_$WeeklystatusGoalsImpl _$$WeeklystatusGoalsImplFromJson(
        Map<String, dynamic> json) =>
    _$WeeklystatusGoalsImpl(
      mon: json['mon'],
      tue: json['tue'],
      wed: json['wed'],
      thu: json['thu'],
      fri: json['fri'],
      sat: json['sat'],
      sun: json['sun'],
    );

Map<String, dynamic> _$$WeeklystatusGoalsImplToJson(
        _$WeeklystatusGoalsImpl instance) =>
    <String, dynamic>{
      'mon': instance.mon,
      'tue': instance.tue,
      'wed': instance.wed,
      'thu': instance.thu,
      'fri': instance.fri,
      'sat': instance.sat,
      'sun': instance.sun,
    };
