import 'package:freezed_annotation/freezed_annotation.dart';

part 'agora_user_model.freezed.dart';
part 'agora_user_model.g.dart';

@freezed
class AgoraUserModel with _$AgoraUserModel {
  const factory AgoraUserModel({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'data') List<AgoraUser>? data,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'query') String? query,
    @JsonKey(name: 'limit') String? limit,
    @JsonKey(name: 'timestamp') DateTime? timestamp,
  }) = _AgoraUserModel;

  factory AgoraUserModel.fromJson(Map<String, dynamic> json) =>
      _$AgoraUserModelFromJson(json);
}

@freezed
class AgoraUser with _$AgoraUser {
  const factory AgoraUser({
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'nickname') String? nickname,
    @JsonKey(name: 'avatar') dynamic avatar,
    @JsonKey(name: 'is_online') bool? isOnline,
    @JsonKey(name: 'is_activated') bool? isActivated,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'created_ago') String? createdAgo,
    @JsonKey(name: 'last_login_at') dynamic lastLoginAt,
    @JsonKey(name: 'last_login_ago') dynamic lastLoginAgo,
    @JsonKey(name: 'modified_at') DateTime? modifiedAt,
  }) = _AgoraUser;

  factory AgoraUser.fromJson(Map<String, dynamic> json) =>
      _$AgoraUserFromJson(json);
}
