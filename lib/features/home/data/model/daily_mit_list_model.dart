import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_mit_list_model.freezed.dart';
part 'daily_mit_list_model.g.dart';

@freezed
class DailyMitListModel with _$DailyMitListModel {
  const factory DailyMitListModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') List<List<DailyMIT>>? data,
  }) = _DailyMitListModel;

  factory DailyMitListModel.fromJson(Map<String, dynamic> json) =>
      _$DailyMitListModelFromJson(json);
}

@freezed
class DailyMIT with _$DailyMIT {
  const factory DailyMIT({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'source_type') dynamic sourceType,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') dynamic description,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'completion_status') dynamic completionStatus,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'due_date') DateTime? dueDate,
    @JsonKey(name: 'priority') String? priority,
    @JsonKey(name: 'level') String? level,
    @JsonKey(name: 'notes') String? notes,
    @JsonKey(name: 'sub_tasks') List<DailyMIT>? subTasks,
  }) = _DailyMIT;

  factory DailyMIT.fromJson(Map<String, dynamic> json) =>
      _$DailyMITFromJson(json);
}
