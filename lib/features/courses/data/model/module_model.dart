import 'package:empowered/features/courses/data/model/course_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'module_model.freezed.dart';
part 'module_model.g.dart';

@freezed
class ModuleModel with _$ModuleModel {
  const factory ModuleModel({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') ModuleData? moduledata,
  }) = _ModuleModel;

  factory ModuleModel.fromJson(Map<String, dynamic> json) =>
      _$ModuleModelFromJson(json);
}

@freezed
class ModuleData with _$ModuleData {
  const factory ModuleData({
    @JsonKey(name: 'course') Course? course,
    @JsonKey(name: 'modules') List<Module>? modules,
  }) = _ModuleData;

  factory ModuleData.fromJson(Map<String, dynamic> json) =>
      _$ModuleDataFromJson(json);
}

@freezed
class Module with _$Module {
  const factory Module({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'course_id') int? courseId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'thumbnail') String? thumbnail,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'completion_percentage') int? completionPercentage,
  }) = _Module;

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);
}
