import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'slug') String? slug,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'occupation') String? occupation,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'is_coach') bool? isCoach,
    @JsonKey(name: 'agora_chat_token') String? agoraChatToken,
    @JsonKey(name: 'agora_user_token') String? agoraUserToken,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}
