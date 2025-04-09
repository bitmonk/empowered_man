import 'package:empowered/features/profile/data/model/user_profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_profile_model.freezed.dart';
part 'get_user_profile_model.g.dart';

@freezed
class GetUserProfileModel with _$GetUserProfileModel {
  const factory GetUserProfileModel({
    required bool status,
    required String message,
    required Data data,
  }) = _GetUserProfileModel;

  factory GetUserProfileModel.fromJson(Map<String, dynamic> json) => 
      _$GetUserProfileModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    required UserProfileModel user,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => 
      _$DataFromJson(json);
}

