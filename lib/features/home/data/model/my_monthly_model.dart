import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_monthly_model.freezed.dart';
part 'my_monthly_model.g.dart';

@freezed
class MyMonthlyModel with _$MyMonthlyModel {
  const factory MyMonthlyModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') MyMonthlyData? data,
  }) = _MyMonthlyModel;

  factory MyMonthlyModel.fromJson(Map<String, dynamic> json) =>
      _$MyMonthlyModelFromJson(json);
}

@freezed
class MyMonthlyData with _$MyMonthlyData {
  const factory MyMonthlyData({
    @JsonKey(name: 'My Monthly Targets')
    List<MyMonthlyTarget>? myMonthlyTargets,
  }) = _MyMonthlyData;

  factory MyMonthlyData.fromJson(Map<String, dynamic> json) =>
      _$MyMonthlyDataFromJson(json);
}

@freezed
class MyMonthlyTarget with _$MyMonthlyTarget {
  const factory MyMonthlyTarget({
    @JsonKey(name: 'target') String? target,
    @JsonKey(name: 'date') DateTime? date,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'status') String? status,
  }) = _MyMonthlyTarget;

  factory MyMonthlyTarget.fromJson(Map<String, dynamic> json) =>
      _$MyMonthlyTargetFromJson(json);
}
