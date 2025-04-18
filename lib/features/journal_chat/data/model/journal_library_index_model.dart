import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_library_index_model.freezed.dart';
part 'journal_library_index_model.g.dart';

@freezed
class JournalLibraryIndexModel with _$JournalLibraryIndexModel {
  const factory JournalLibraryIndexModel({
    @JsonKey(name:'status')  String? status,
    @JsonKey(name:'message')  String? message,
    @JsonKey(name:'data')  JournalLibraryIndexData? data,
  }) = _JournalLibraryIndexModel;

  factory JournalLibraryIndexModel.fromJson(Map<String, dynamic> json) =>
      _$JournalLibraryIndexModelFromJson(json);
}

@freezed
class JournalLibraryIndexData with _$JournalLibraryIndexData {
  const factory JournalLibraryIndexData({
    @JsonKey(name:'user_journals')  List<UserJournal>? userJournals,
    @JsonKey(name:'meta')  Meta? meta,
  }) = _JournalLibraryIndexData;

  factory JournalLibraryIndexData.fromJson(Map<String, dynamic> json) =>
      _$JournalLibraryIndexDataFromJson(json);
}

@freezed
class UserJournal with _$UserJournal {
  const factory UserJournal({
    @JsonKey(name:'id')  int? id,
    @JsonKey(name:'completed_at') String? completedAt,
    @JsonKey(name:'user_id')  int? userId,
    @JsonKey(name:'journal_id')  int? journalId,
    @JsonKey(name:'is_complete')  bool? isComplete,
    @JsonKey(name:'created_at')  String? createdAt,
    @JsonKey(name:'updated_at')  String? updatedAt,
    @JsonKey(name:'journal')  Journal? journal,
  }) = _UserJournal;

  factory UserJournal.fromJson(Map<String, dynamic> json) =>
      _$UserJournalFromJson(json);
}

@freezed
class Journal with _$Journal {
  const factory Journal({
    @JsonKey(name:'id')  int? id,
    @JsonKey(name:'emotion_name')  String? emotionName,
    @JsonKey(name:'main_questions')  List<MainQuestion>? mainQuestions,
  }) = _Journal;

  factory Journal.fromJson(Map<String, dynamic> json) =>
      _$JournalFromJson(json);
}

@freezed
class MainQuestion with _$MainQuestion {
  const factory MainQuestion({
    @JsonKey(name:'id')  int? id,
    @JsonKey(name: 'question')  String? question,
    @JsonKey(name: 'keywords')  String? keywords,
    @JsonKey(name:'answered')  bool? answered,
    @JsonKey(name:'answer') Answer? answer,
  }) = _MainQuestion;

  factory MainQuestion.fromJson(Map<String, dynamic> json) =>
      _$MainQuestionFromJson(json);
}

@freezed
class Answer with _$Answer {
  const factory Answer({
    @JsonKey(name:'id')  int? id,
    @JsonKey(name:'text')  String? text,
    @JsonKey(name:'media') Media? media,
    @JsonKey(name:'created_at')  String? createdAt,
    @JsonKey(name:'updated_at')  String? updatedAt,
    @JsonKey(name:'main_question_id')  int? mainQuestionId,
    @JsonKey(name:'follow_up_question_id') int? followUpQuestionId,
    @JsonKey(name:'user_journal_id')  int? userJournalId,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) =>
      _$AnswerFromJson(json);
}

@freezed
class Media with _$Media {
  const factory Media({
    @JsonKey(name:'images') List<String>? images,
    @JsonKey(name:'videos') List<String>? videos,
    @JsonKey(name:'voices') List<String>? voices,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) =>
      _$MediaFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name:'current_page')  int? currentPage,
    @JsonKey(name:'total')  int? total,
    @JsonKey(name:'per_page')  int? perPage,
    @JsonKey(name:'last_page')  int? lastPage,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) =>
      _$MetaFromJson(json);
}