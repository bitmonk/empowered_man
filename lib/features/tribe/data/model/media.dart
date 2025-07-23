import 'package:freezed_annotation/freezed_annotation.dart';

part 'media.freezed.dart';
part 'media.g.dart';

@freezed
class Media with _$Media {
  const factory Media({
    @JsonKey(name: 'images') List<String>? images,
    @JsonKey(name: 'videos') List<dynamic>? videos,
    @JsonKey(name: 'documents') List<dynamic>? documents,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}
