import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'feed_posts_model.freezed.dart';
part 'feed_posts_model.g.dart';

@freezed
class FeedPostsModel with _$FeedPostsModel {
  const factory FeedPostsModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") Data? data,
  }) = _FeedPostsModel;

  factory FeedPostsModel.fromJson(Map<String, dynamic> json) =>
      _$FeedPostsModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "posts") List<Post>? posts,
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

@freezed
class Post with _$Post {
  const factory Post({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "text") String? text,
    @JsonKey(name: "group_id") int? groupId,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "created_by") CreatedBy? createdBy,
    @JsonKey(name: "media") Media? media,
    @JsonKey(name: "liked_by_current_user") bool? likedByCurrentUser,
    @JsonKey(name: "likes_count") int? likesCount,
    @JsonKey(name: "comments_count") int? commentsCount,
    @JsonKey(name: "is_bookmarked") bool? isBookmarked,
    @JsonKey(name: "is_hidden") bool? isHidden,
    @JsonKey(name: "tagged_users") List<dynamic>? taggedUsers,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class CreatedBy with _$CreatedBy {
  const factory CreatedBy({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "occupation") String? occupation,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "is_coach") bool? isCoach,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "agora_chat_token") String? agoraChatToken,
    @JsonKey(name: "agora_user_token") String? agoraUserToken,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);
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
