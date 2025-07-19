import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_media_model.freezed.dart';
part 'group_media_model.g.dart';

@freezed
class GroupMediaModel with _$GroupMediaModel {
  const factory GroupMediaModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _GroupMediaModel;

  factory GroupMediaModel.fromJson(Map<String, dynamic> json) =>
      _$GroupMediaModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'medias') List<Media>? medias,
    @JsonKey(name: 'meta') Meta? meta,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Media with _$Media {
  const factory Media({
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'url') String? url,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'last_page') int? lastPage,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
