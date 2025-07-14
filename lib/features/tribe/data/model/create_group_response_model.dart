import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_group_response_model.freezed.dart';
part 'create_group_response_model.g.dart';

@freezed
class CreateGroupResponseModel with _$CreateGroupResponseModel {
  const factory CreateGroupResponseModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _CreateGroupResponseModel;

  factory CreateGroupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupResponseModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'group') Group? group,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Group with _$Group {
  const factory Group({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'about') String? about,
    @JsonKey(name: 'access_type') String? accessType,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'is_pinned') bool? isPinned,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}