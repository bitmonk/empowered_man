import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'feed_saved_posts_model.freezed.dart';
part 'feed_saved_posts_model.g.dart';

@freezed
class FeedSavedPostsModel with _$FeedSavedPostsModel {
  const factory FeedSavedPostsModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") Data? data,
  }) = _FeedSavedPostsModel;

  factory FeedSavedPostsModel.fromJson(Map<String, dynamic> json) =>
      _$FeedSavedPostsModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "saved_posts") List<SavedPost>? savedPosts,
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
class SavedPost with _$SavedPost {
  const factory SavedPost({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "text") String? text,
    @JsonKey(name: "group_id") int? groupId,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "created_by") CreatedBy? createdBy,
    @JsonKey(name: "media") List<String>? media,
    @JsonKey(name: "liked_by_current_user") bool? likedByCurrentUser,
    @JsonKey(name: "likes_count") int? likesCount,
    @JsonKey(name: "comments_count") int? commentsCount,
    @JsonKey(name: "is_bookmarked") bool? isBookmarked,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _SavedPost;

  factory SavedPost.fromJson(Map<String, dynamic> json) =>
      _$SavedPostFromJson(json);
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
