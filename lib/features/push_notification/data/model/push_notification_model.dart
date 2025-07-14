import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_notification_model.freezed.dart';
part 'push_notification_model.g.dart';

@freezed
class PushNotificationModel with _$PushNotificationModel {
  const factory PushNotificationModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') PushNotificationModelData? data,
    @JsonKey(name: 'meta') Meta? meta,
  }) = _PushNotificationModel;

  factory PushNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationModelFromJson(json);
}

@freezed
class PushNotificationModelData with _$PushNotificationModelData {
  const factory PushNotificationModelData({
    @JsonKey(name: 'notifications') List<PushNotification>? notifications,
  }) = _PushNotificationModelData;

  factory PushNotificationModelData.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationModelDataFromJson(json);
}

@freezed
class PushNotification with _$PushNotification {
  const factory PushNotification({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'notifiable_type') String? notifiableType,
    @JsonKey(name: 'notifiable_id') int? notifiableId,
    @JsonKey(name: 'data') PushNotificationData? data,
    @JsonKey(name: 'read_at') dynamic readAt,
    @JsonKey(name: 'url') dynamic url,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _PushNotification;

  factory PushNotification.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationFromJson(json);
}

@freezed
class PushNotificationData with _$PushNotificationData {
  const factory PushNotificationData({
    @JsonKey(name: 'body') String? body,
    @JsonKey(name: 'data') List<dynamic>? data,
    @JsonKey(name: 'title') String? title,
  }) = _PushNotificationData;

  factory PushNotificationData.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationDataFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'last_page') int? lastPage,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'total') int? total,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
