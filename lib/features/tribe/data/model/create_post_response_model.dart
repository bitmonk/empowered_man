import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_post_response_model.freezed.dart';
part 'create_post_response_model.g.dart';

@freezed
class CreatePostResponseModel with _$CreatePostResponseModel {
  const factory CreatePostResponseModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _CreatePostResponseModel;

  factory CreatePostResponseModel.fromJson(Map<String, dynamic> json) => _$CreatePostResponseModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'post') Post? post,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Post with _$Post {
  const factory Post({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'group_id') String? groupId,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'media') List<String>? media,
    @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}