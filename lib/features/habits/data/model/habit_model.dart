import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_model.freezed.dart';
part 'habit_model.g.dart';

@freezed
class HabitModel with _$HabitModel {
  const factory HabitModel({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Map<String, Map<String, SubDomain>>? domain,
  }) = _HabitModel;

  factory HabitModel.fromJson(Map<String, dynamic> json) =>
      _$HabitModelFromJson(json);
}

@freezed
class SubDomain with _$SubDomain {
  const factory SubDomain({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'type_name') String? typeName,
    @JsonKey(name: 'logo') String? logo,
    @JsonKey(name: 'tracked_data') List<WeekData>? trackedData,
  }) = _SubDomain;

  factory SubDomain.fromJson(Map<String, dynamic> json) =>
      _$SubDomainFromJson(json);
}

@freezed
class WeekData with _$WeekData {
  const factory WeekData({
    @JsonKey(name: 'id') dynamic id,
    @JsonKey(name: 'habits_id') int? habitsId,
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'habit_date') String? habitDate,
    @JsonKey(name: 'created_at') dynamic createdAt,
    @JsonKey(name: 'updated_at') dynamic updatedAt,
  }) = _WeekData;

  factory WeekData.fromJson(Map<String, dynamic> json) =>
      _$WeekDataFromJson(json);
}
