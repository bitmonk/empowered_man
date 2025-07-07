import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_posts_model.freezed.dart';
part 'feed_posts_model.g.dart';

@freezed
class FeedPostsModel with _$FeedPostsModel {
  const factory FeedPostsModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _FeedPostsModel;

  factory FeedPostsModel.fromJson(Map<String, dynamic> json) => _$FeedPostsModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'Feed_posts') FeedPosts? feedPosts,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class FeedPosts with _$FeedPosts {
  const factory FeedPosts({
    @JsonKey(name: 'posts') List<Post>? posts,
    @JsonKey(name: 'media') List<String>? media,
    @JsonKey(name: 'savedPosts') List<Post>? savedPosts, // Changed to List<Post>
  }) = _FeedPosts;

  factory FeedPosts.fromJson(Map<String, dynamic> json) => _$FeedPostsFromJson(json);
}

@freezed
class Post with _$Post {
  const factory Post({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'group_id') int? groupId,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'created_by') User? createdBy,
    @JsonKey(name: 'media') List<String>? media,
    @JsonKey(name: 'comments') List<Comment>? comments,
    @JsonKey(name: 'likes_count') int? likesCount,
    @JsonKey(name: 'comments_count') int? commentsCount,
    @JsonKey(name: 'is_liked') bool? isLiked,
    @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'slug') String? slug,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'occupation') String? occupation,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'is_coach') bool? isCoach,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'agora_chat_token') String? agoraChatToken,
    @JsonKey(name: 'agora_user_token') String? agoraUserToken,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}