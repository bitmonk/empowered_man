import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_answer_response_model.freezed.dart';
part 'journal_answer_response_model.g.dart';

@freezed
class JournalAnswerResponseModel with _$JournalAnswerResponseModel {
  const factory JournalAnswerResponseModel({
    @JsonKey(name: 'status') required bool status,
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'data') JournalEntry? data,
  }) = _JournalAnswerResponseModel;

  factory JournalAnswerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$JournalAnswerResponseModelFromJson(json);
}

@freezed
class JournalEntry with _$JournalEntry {
  const factory JournalEntry({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'images') List<String>? images,
    @JsonKey(name: 'voices') List<String>? voices,
    @JsonKey(name: 'videos') List<String>? videos,
  }) = _JournalEntry;

  factory JournalEntry.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryFromJson(json);
}
