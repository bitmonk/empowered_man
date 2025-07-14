// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_level_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DaashboardLevelModelImpl _$$DaashboardLevelModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DaashboardLevelModelImpl(
      userProgressbarPoints: json['user_progressbar_points'] as String?,
      totalPointsProgressbar: json['total_points_progressbar'] as String?,
      currentLevel: json['current_level'] as String?,
      upcomingLevel: json['upcoming_level'] as String?,
    );

Map<String, dynamic> _$$DaashboardLevelModelImplToJson(
        _$DaashboardLevelModelImpl instance) =>
    <String, dynamic>{
      'user_progressbar_points': instance.userProgressbarPoints,
      'total_points_progressbar': instance.totalPointsProgressbar,
      'current_level': instance.currentLevel,
      'upcoming_level': instance.upcomingLevel,
    };
