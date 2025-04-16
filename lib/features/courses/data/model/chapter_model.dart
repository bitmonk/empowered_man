import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_model.freezed.dart';
part 'chapter_model.g.dart';

@freezed
class ChapterModel with _$ChapterModel {
  const factory ChapterModel({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') ChapterData? data,
  }) = _ChapterModel;

  factory ChapterModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterModelFromJson(json);
}

@freezed
class ChapterData with _$ChapterData {
  const factory ChapterData({
    @JsonKey(name: 'course') Course? course,
    @JsonKey(name: 'chapters') List<Chapter>? chapters,
  }) = _ChapterData;

  factory ChapterData.fromJson(Map<String, dynamic> json) =>
      _$ChapterDataFromJson(json);
}

@freezed
class Chapter with _$Chapter {
  const factory Chapter({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'course_id') int? courseId,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'video_url') String? videoUrl,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);
}

@freezed
class Course with _$Course {
  const factory Course({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}
