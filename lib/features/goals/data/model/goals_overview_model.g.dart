// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_overview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoalsOverviewModelImpl _$$GoalsOverviewModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GoalsOverviewModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GoalsOverviewModelImplToJson(
        _$GoalsOverviewModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      goalOverview: json['goal_overview'] == null
          ? null
          : GoalOverview.fromJson(
              json['goal_overview'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'goal_overview': instance.goalOverview,
    };

_$GoalOverviewImpl _$$GoalOverviewImplFromJson(Map<String, dynamic> json) =>
    _$GoalOverviewImpl(
      q1: json['Q1'] == null
          ? null
          : Quarter.fromJson(json['Q1'] as Map<String, dynamic>),
      q2: json['Q2'] == null
          ? null
          : Quarter.fromJson(json['Q2'] as Map<String, dynamic>),
      q3: json['Q3'] == null
          ? null
          : Quarter.fromJson(json['Q3'] as Map<String, dynamic>),
      q4: json['Q4'] == null
          ? null
          : Quarter.fromJson(json['Q4'] as Map<String, dynamic>),
      yearlyGoals: (json['yearly_goals'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
    );

Map<String, dynamic> _$$GoalOverviewImplToJson(_$GoalOverviewImpl instance) =>
    <String, dynamic>{
      'Q1': instance.q1,
      'Q2': instance.q2,
      'Q3': instance.q3,
      'Q4': instance.q4,
      'yearly_goals': instance.yearlyGoals,
    };

_$QuarterImpl _$$QuarterImplFromJson(Map<String, dynamic> json) =>
    _$QuarterImpl(
      months: (json['months'] as List<dynamic>?)
          ?.map((e) => Map<String, bool>.from(e as Map))
          .toList(),
      quarterlyGoals: (json['quarterly_goals'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
    );

Map<String, dynamic> _$$QuarterImplToJson(_$QuarterImpl instance) =>
    <String, dynamic>{
      'months': instance.months,
      'quarterly_goals': instance.quarterlyGoals,
    };
