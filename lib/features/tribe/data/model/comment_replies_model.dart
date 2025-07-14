import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'comment_replies_model.freezed.dart';
part 'comment_replies_model.g.dart';

@freezed
class CommentRepliesModel with _$CommentRepliesModel {
  const factory CommentRepliesModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") RepliesData? repliesData,
  }) = _CommentRepliesModel;

  factory CommentRepliesModel.fromJson(Map<String, dynamic> json) =>
      _$CommentRepliesModelFromJson(json);
}

@freezed
class RepliesData with _$RepliesData {
  const factory RepliesData({
    @JsonKey(name: "comments") List<Comment>? comments,
    @JsonKey(name: "meta") Meta? meta,
  }) = _RepliesData;

  factory RepliesData.fromJson(Map<String, dynamic> json) =>
      _$RepliesDataFromJson(json);
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "text") String? text,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "user") User? user,
    @JsonKey(name: "likes_count") int? likesCount,
    @JsonKey(name: "comments_count") int? commentsCount,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
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
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
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
