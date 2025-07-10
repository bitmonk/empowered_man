import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_about_model.freezed.dart';
part 'group_about_model.g.dart';

@freezed
class GroupAboutModel with _$GroupAboutModel {
  const factory GroupAboutModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _GroupAboutModel;

  factory GroupAboutModel.fromJson(Map<String, dynamic> json) =>
      _$GroupAboutModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'about') About? about,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class About with _$About {
  const factory About({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'about') String? about,
    @JsonKey(name: 'access_type') String? accessType,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'member_count') int? memberCount,
    @JsonKey(name: 'is_pinned') bool? isPinned,
    @JsonKey(name: 'latest_post_time') String? latestPostTime,
    @JsonKey(name: 'members') List<Member>? members,
  }) = _About;

  factory About.fromJson(Map<String, dynamic> json) => _$AboutFromJson(json);
}

@freezed
class Member with _$Member {
  const factory Member({
    @JsonKey(name: 'role') String? role,
    @JsonKey(name: 'user') User? user,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
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
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'agora_chat_token') String? agoraChatToken,
    @JsonKey(name: 'agora_user_token') String? agoraUserToken,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
