// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_habit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardHabitModelImpl _$$DashboardHabitModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardHabitModelImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DashboardHabit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DashboardHabitModelImplToJson(
        _$DashboardHabitModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$DashboardHabitImpl _$$DashboardHabitImplFromJson(Map<String, dynamic> json) =>
    _$DashboardHabitImpl(
      category: json['category'] as String?,
      habits: (json['habits'] as List<dynamic>?)
          ?.map((e) => Habit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DashboardHabitImplToJson(
        _$DashboardHabitImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'habits': instance.habits,
    };

_$HabitImpl _$$HabitImplFromJson(Map<String, dynamic> json) => _$HabitImpl(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      logo: json['logo'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$HabitImplToJson(_$HabitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'logo': instance.logo,
      'status': instance.status,
    };
