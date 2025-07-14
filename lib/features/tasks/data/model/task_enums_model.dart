import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_enums_model.freezed.dart';
part 'task_enums_model.g.dart';

@freezed
class TaskEnumsModel with _$TaskEnumsModel {
  const factory TaskEnumsModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _TaskEnumsModel;

  factory TaskEnumsModel.fromJson(Map<String, dynamic> json) =>
      _$TaskEnumsModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'levels') List<String>? levels,
    @JsonKey(name: 'completion_status') List<String>? completionStatus,
    @JsonKey(name: 'priorities') List<String>? priorities,
    @JsonKey(name: 'week_days') List<String>? weekDays,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
