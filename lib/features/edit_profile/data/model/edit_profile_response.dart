import 'package:empowered/features/profile/data/model/user_profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_response.freezed.dart';
part 'edit_profile_response.g.dart';

@freezed
class EditProfileResponse with _$EditProfileResponse {
  const factory EditProfileResponse({
    required String message,
    required UserProfileModel user,
  }) = _EditProfileResponse;

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseFromJson(json);
}