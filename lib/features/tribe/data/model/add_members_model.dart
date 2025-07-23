import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_members_model.freezed.dart';
part 'add_members_model.g.dart';

@freezed
class GroupMembersModel with _$GroupMembersModel {
  const factory GroupMembersModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') AddMembersData? addMembersData,
  }) = _GroupMembersModel;

  factory GroupMembersModel.fromJson(Map<String, dynamic> json) =>
      _$GroupMembersModelFromJson(json);
}

@freezed
class AddMembersData with _$AddMembersData {
  const factory AddMembersData({
    @JsonKey(name: 'users') List<User>? users,
  }) = _AddMembersData;

  factory AddMembersData.fromJson(Map<String, dynamic> json) =>
      _$AddMembersDataFromJson(json);
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
    @JsonKey(name: 'agora_chat_token') int? agoraChatToken,
    @JsonKey(name: 'agora_user_token') String? agoraUserToken,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
