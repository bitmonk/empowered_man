import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_memory_model.freezed.dart';
part 'my_memory_model.g.dart';

@freezed
class MyMemoryModel with _$MyMemoryModel {
  const factory MyMemoryModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Data? data,
  }) = _MyMemoryModel;

  factory MyMemoryModel.fromJson(Map<String, dynamic> json) =>
      _$MyMemoryModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'memory') Memory? memory,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Memory with _$Memory {
  const factory Memory({
    @JsonKey(name: 'journal_id') int? journalId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'emotion_name') String? emotionName,
    @JsonKey(name: 'answers') Answers? answers,
  }) = _Memory;

  factory Memory.fromJson(Map<String, dynamic> json) => _$MemoryFromJson(json);
}

@freezed
class Answers with _$Answers {
  const factory Answers({
    @JsonKey(name: 'action') List<Tion>? action,
    @JsonKey(name: 'revelation') List<Tion>? revelation,
    @JsonKey(name: 'story') List<dynamic>? story,
    @JsonKey(name: 'lesson') List<dynamic>? lesson,
  }) = _Answers;

  factory Answers.fromJson(Map<String, dynamic> json) =>
      _$AnswersFromJson(json);
}

@freezed
class Tion with _$Tion {
  const factory Tion({
    @JsonKey(name: 'text') String? text,
  }) = _Tion;

  factory Tion.fromJson(Map<String, dynamic> json) => _$TionFromJson(json);
}
