import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') List<TaskLevel>? data,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}

@freezed
class TaskLevel with _$TaskLevel {
  const factory TaskLevel({
    @JsonKey(name: 'HIT List') TaskCategory? hitList,
    @JsonKey(name: 'Mit List') TaskCategory? mitList,
    @JsonKey(name: 'Do List') TaskCategory? doList,
    @JsonKey(name: 'Achieved') TaskCategory? achieved,
    @JsonKey(name: 'Done') TaskCategory? done,
  }) = _TaskLevel;

  factory TaskLevel.fromJson(Map<String, dynamic> json) =>
      _$TaskLevelFromJson(json);
}

@freezed
class TaskCategory with _$TaskCategory {
  const factory TaskCategory({
    @JsonKey(name: 'tasks') List<Task>? tasks,
    @JsonKey(name: '_meta') Meta? meta,
  }) = _TaskCategory;

  factory TaskCategory.fromJson(Map<String, dynamic> json) =>
      _$TaskCategoryFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'completed') Completed? completed,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class Completed with _$Completed {
  const factory Completed({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'percentage') int? percentage,
  }) = _Completed;

  factory Completed.fromJson(Map<String, dynamic> json) =>
      _$CompletedFromJson(json);
}

@freezed
class Task with _$Task {
  const factory Task({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'completion_status') dynamic completionStatus,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'due_date') DateTime? dueDate,
    @JsonKey(name: 'priority') String? priority,
    @JsonKey(name: 'level') String? level,
    @JsonKey(name: 'notes') String? notes,
    @JsonKey(name: 'sub_tasks') List<SubTask>? subTasks,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

@freezed
class SubTask with _$SubTask {
  const factory SubTask({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'due_date') DateTime? dueDate,
    @JsonKey(name: 'priority') String? priority,
    @JsonKey(name: 'level') String? level,
    @JsonKey(name: 'notes') String? notes,
  }) = _SubTask;

  factory SubTask.fromJson(Map<String, dynamic> json) =>
      _$SubTaskFromJson(json);
}
