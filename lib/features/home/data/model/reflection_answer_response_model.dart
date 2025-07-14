import 'package:freezed_annotation/freezed_annotation.dart';

part 'reflection_answer_response_model.freezed.dart';
part 'reflection_answer_response_model.g.dart';



@freezed
class ReflectionAnswerResponseModel with _$ReflectionAnswerResponseModel {
    const factory ReflectionAnswerResponseModel({
        @JsonKey(name: 'status')
        required bool? status,
        @JsonKey(name: 'message')
        required String? message,
        @JsonKey(name: 'data')
        required Data? data,
    }) = _ReflectionAnswerResponseModel;

    factory ReflectionAnswerResponseModel.fromJson(Map<String, dynamic> json) => _$ReflectionAnswerResponseModelFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        @JsonKey(name: 'id')
        required int? id,
        @JsonKey(name: 'text')
        required String? text,
        @JsonKey(name: 'images')
        required List<dynamic>? images,
        @JsonKey(name: 'voices')
        required List<dynamic>? voices,
        @JsonKey(name: 'videos')
        required List<dynamic>? videos,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}