import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_policy_model.freezed.dart';
part 'privacy_policy_model.g.dart';

@freezed
class PrivacyPolicyModel with _$PrivacyPolicyModel {
  const factory PrivacyPolicyModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') PrivacyPolicyData? privacyPolicyData,
  }) = _PrivacyPolicyModel;

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyPolicyModelFromJson(json);
}

@freezed
class PrivacyPolicyData with _$PrivacyPolicyData {
  const factory PrivacyPolicyData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'content') String? content,
  }) = _PrivacyPolicyData;

  factory PrivacyPolicyData.fromJson(Map<String, dynamic> json) =>
      _$PrivacyPolicyDataFromJson(json);
}
