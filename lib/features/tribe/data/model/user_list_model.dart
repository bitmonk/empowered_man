import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list_model.freezed.dart';
part 'user_list_model.g.dart';

@freezed
class UserListModel with _$UserListModel {
  const factory UserListModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _UserListModel;

  factory UserListModel.fromJson(Map<String, dynamic> json) => _$UserListModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'users') List<User>? users,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
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
    @JsonKey(name: 'agora_chat_token') int? agoraChatToken,
    @JsonKey(name: 'agora_user_token') String? agoraUserToken,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}