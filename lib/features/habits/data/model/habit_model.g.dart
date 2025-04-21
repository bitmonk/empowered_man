// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitModelImpl _$$HabitModelImplFromJson(Map<String, dynamic> json) =>
    _$HabitModelImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      domain: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as Map<String, dynamic>).map(
              (k, e) =>
                  MapEntry(k, SubDomain.fromJson(e as Map<String, dynamic>)),
            )),
      ),
    );

Map<String, dynamic> _$$HabitModelImplToJson(_$HabitModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.domain,
    };

_$SubDomainImpl _$$SubDomainImplFromJson(Map<String, dynamic> json) =>
    _$SubDomainImpl(
      id: (json['id'] as num?)?.toInt(),
      typeName: json['type_name'] as String?,
      trackedData: (json['tracked_data'] as List<dynamic>?)
          ?.map((e) => WeekData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SubDomainImplToJson(_$SubDomainImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type_name': instance.typeName,
      'tracked_data': instance.trackedData,
    };

_$WeekDataImpl _$$WeekDataImplFromJson(Map<String, dynamic> json) =>
    _$WeekDataImpl(
      id: json['id'],
      habitsId: (json['habits_id'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      habitDate: json['habit_date'] as String?,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );

Map<String, dynamic> _$$WeekDataImplToJson(_$WeekDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'habits_id': instance.habitsId,
      'status': instance.status,
      'habit_date': instance.habitDate,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
