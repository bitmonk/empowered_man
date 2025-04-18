import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_emotion_names_model.freezed.dart';
part 'journal_emotion_names_model.g.dart';

@freezed
class JournalEmotionNamesModel with _$JournalEmotionNamesModel {
  const factory JournalEmotionNamesModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _JournalEmotionNamesModel;

  factory JournalEmotionNamesModel.fromJson(Map<String, dynamic> json) =>
      _$JournalEmotionNamesModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'emotion_names') List<EmotionName>? emotionNames,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class EmotionName with _$EmotionName {
  const factory EmotionName({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'emotion_name') String? emotionName,
  }) = _EmotionName;

  factory EmotionName.fromJson(Map<String, dynamic> json) =>
      _$EmotionNameFromJson(json);
}