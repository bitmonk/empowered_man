import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'feed_media_model.freezed.dart';
part 'feed_media_model.g.dart';

@freezed
class FeedMediaModel with _$FeedMediaModel {
  const factory FeedMediaModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") Data? data,
  }) = _FeedMediaModel;

  factory FeedMediaModel.fromJson(Map<String, dynamic> json) =>
      _$FeedMediaModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "medias") List<String>? medias,
    @JsonKey(name: "meta") Meta? meta,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name: "current_page") int? currentPage,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "per_page") int? perPage,
    @JsonKey(name: "last_page") int? lastPage,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
