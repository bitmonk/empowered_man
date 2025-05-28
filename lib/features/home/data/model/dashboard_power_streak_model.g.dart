// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_power_streak_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardPowerStreakModelImpl _$$DashboardPowerStreakModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardPowerStreakModelImpl(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : DashboardPowerStreakData.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$DashboardPowerStreakModelImplToJson(
        _$DashboardPowerStreakModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

_$DashboardPowerStreakDataImpl _$$DashboardPowerStreakDataImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardPowerStreakDataImpl(
      weeklyDetails: (json['weeklyDetails'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      powerStreaks: (json['powerStreaks'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      totalScores: (json['totalScores'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
    );

Map<String, dynamic> _$$DashboardPowerStreakDataImplToJson(
        _$DashboardPowerStreakDataImpl instance) =>
    <String, dynamic>{
      'weeklyDetails': instance.weeklyDetails,
      'powerStreaks': instance.powerStreaks,
      'totalScores': instance.totalScores,
    };
