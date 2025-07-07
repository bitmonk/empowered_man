import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_details_model.freezed.dart';
part 'group_details_model.g.dart';

@freezed
class GroupDetailsModel with _$GroupDetailsModel {
  const factory GroupDetailsModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') GroupData? data,
  }) = _GroupDetailsModel;

  factory GroupDetailsModel.fromJson(Map<String, dynamic> json) => _$GroupDetailsModelFromJson(json);
}

@freezed
class GroupData with _$GroupData {
  const factory GroupData({
    @JsonKey(name: 'group_details') GroupDetail? groupDetails,
  }) = _GroupData;

  factory GroupData.fromJson(Map<String, dynamic> json) => _$GroupDataFromJson(json);
}

@freezed
class GroupDetail with _$GroupDetail {
  const factory GroupDetail({
    List<Post>? posts,
    About? about,
    List<String>? media,
    List<Post>? savedPosts,
  }) = _GroupDetail;

  factory GroupDetail.fromJson(Map<String, dynamic> json) => _$GroupDetailFromJson(json);
}

@freezed
class Post with _$Post {
  const factory Post({
    int? id,
    String? text,
    @JsonKey(name: 'group_id') int? groupId,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'created_by') User? createdBy,
    List<String>? media,
    List<dynamic>? comments,
    @JsonKey(name: 'likes_count') int? likesCount,
    @JsonKey(name: 'comments_count') int? commentsCount,
    @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class About with _$About {
  const factory About({
    int? id,
    String? name,
    String? about,
    @JsonKey(name: 'access_type') String? accessType,
    String? image,
    @JsonKey(name: 'member_count') int? memberCount,
    @JsonKey(name: 'is_pinned') bool? isPinned,
    List<Member>? members,
  }) = _About;

  factory About.fromJson(Map<String, dynamic> json) => _$AboutFromJson(json);
}

@freezed
class Member with _$Member {
  const factory Member({
    String? role,
    User? user,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    int? id,
    @JsonKey(name: 'full_name') String? fullName,
    String? slug,
    String? email,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    String? occupation,
    String? image,
    @JsonKey(name: 'is_coach') bool? isCoach,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'agora_chat_token') String? agoraChatToken,
    @JsonKey(name: 'agora_user_token') String? agoraUserToken,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}