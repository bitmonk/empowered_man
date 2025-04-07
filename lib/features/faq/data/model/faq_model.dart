// class FaqItemDetailsModel {
//   FaqItemDetailsModel({
//     required this.title,
//     required this.titleNumber,
//     required this.description,
//   });

//   final String title;
//   final String titleNumber;
//   final String description;
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_model.freezed.dart';
part 'faq_model.g.dart';

@freezed
class FaqModel with _$FaqModel {
  const factory FaqModel({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') List<FaqData>? data,
  }) = _FaqModel;

  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);
}

@freezed
class FaqData with _$FaqData {
  const factory FaqData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'question') String? question,
    @JsonKey(name: 'answer') String? answer,
    @JsonKey(name: 'created_by') dynamic createdBy,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _FaqData;

  factory FaqData.fromJson(Map<String, dynamic> json) =>
      _$FaqDataFromJson(json);
}
