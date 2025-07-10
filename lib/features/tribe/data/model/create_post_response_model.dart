import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_post_response_model.freezed.dart';
part 'create_post_response_model.g.dart';

@freezed
class CreatePostResponseModel with _$CreatePostResponseModel {
  const factory CreatePostResponseModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") Data? data,
  }) = _CreatePostResponseModel;

  factory CreatePostResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePostResponseModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "post") Post? post,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Post with _$Post {
  const factory Post({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "text") String? text,
    @JsonKey(name: "group_id") String? groupId,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "media") Media? media,
    @JsonKey(name: "liked_by_current_user") bool? likedByCurrentUser,
    @JsonKey(name: "comments_count") int? commentsCount,
    @JsonKey(name: "is_bookmarked") bool? isBookmarked,
    @JsonKey(name: "is_hidden") bool? isHidden,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class Media with _$Media {
  const factory Media({
    @JsonKey(name: "images") List<String>? images,
    @JsonKey(name: "videos") List<dynamic>? videos,
    @JsonKey(name: "documents") List<dynamic>? documents,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}
