// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_answer_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JournalAnswerResponseModel _$JournalAnswerResponseModelFromJson(
    Map<String, dynamic> json) {
  return _JournalAnswerResponseModel.fromJson(json);
}

/// @nodoc
mixin _$JournalAnswerResponseModel {
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  JournalEntry? get data => throw _privateConstructorUsedError;

  /// Serializes this JournalAnswerResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalAnswerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalAnswerResponseModelCopyWith<JournalAnswerResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalAnswerResponseModelCopyWith<$Res> {
  factory $JournalAnswerResponseModelCopyWith(JournalAnswerResponseModel value,
          $Res Function(JournalAnswerResponseModel) then) =
      _$JournalAnswerResponseModelCopyWithImpl<$Res,
          JournalAnswerResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') JournalEntry? data});

  $JournalEntryCopyWith<$Res>? get data;
}

/// @nodoc
class _$JournalAnswerResponseModelCopyWithImpl<$Res,
        $Val extends JournalAnswerResponseModel>
    implements $JournalAnswerResponseModelCopyWith<$Res> {
  _$JournalAnswerResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalAnswerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as JournalEntry?,
    ) as $Val);
  }

  /// Create a copy of JournalAnswerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JournalEntryCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $JournalEntryCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JournalAnswerResponseModelImplCopyWith<$Res>
    implements $JournalAnswerResponseModelCopyWith<$Res> {
  factory _$$JournalAnswerResponseModelImplCopyWith(
          _$JournalAnswerResponseModelImpl value,
          $Res Function(_$JournalAnswerResponseModelImpl) then) =
      __$$JournalAnswerResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') JournalEntry? data});

  @override
  $JournalEntryCopyWith<$Res>? get data;
}

/// @nodoc
class __$$JournalAnswerResponseModelImplCopyWithImpl<$Res>
    extends _$JournalAnswerResponseModelCopyWithImpl<$Res,
        _$JournalAnswerResponseModelImpl>
    implements _$$JournalAnswerResponseModelImplCopyWith<$Res> {
  __$$JournalAnswerResponseModelImplCopyWithImpl(
      _$JournalAnswerResponseModelImpl _value,
      $Res Function(_$JournalAnswerResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalAnswerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$JournalAnswerResponseModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as JournalEntry?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalAnswerResponseModelImpl implements _JournalAnswerResponseModel {
  const _$JournalAnswerResponseModelImpl(
      {@JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'message') required this.message,
      @JsonKey(name: 'data') this.data});

  factory _$JournalAnswerResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$JournalAnswerResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'data')
  final JournalEntry? data;

  @override
  String toString() {
    return 'JournalAnswerResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalAnswerResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of JournalAnswerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalAnswerResponseModelImplCopyWith<_$JournalAnswerResponseModelImpl>
      get copyWith => __$$JournalAnswerResponseModelImplCopyWithImpl<
          _$JournalAnswerResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalAnswerResponseModelImplToJson(
      this,
    );
  }
}

abstract class _JournalAnswerResponseModel
    implements JournalAnswerResponseModel {
  const factory _JournalAnswerResponseModel(
          {@JsonKey(name: 'status') required final bool status,
          @JsonKey(name: 'message') required final String message,
          @JsonKey(name: 'data') final JournalEntry? data}) =
      _$JournalAnswerResponseModelImpl;

  factory _JournalAnswerResponseModel.fromJson(Map<String, dynamic> json) =
      _$JournalAnswerResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'data')
  JournalEntry? get data;

  /// Create a copy of JournalAnswerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalAnswerResponseModelImplCopyWith<_$JournalAnswerResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

JournalEntry _$JournalEntryFromJson(Map<String, dynamic> json) {
  return _JournalEntry.fromJson(json);
}

/// @nodoc
mixin _$JournalEntry {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'images')
  List<String>? get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'voices')
  List<String>? get voices => throw _privateConstructorUsedError;
  @JsonKey(name: 'videos')
  List<String>? get videos => throw _privateConstructorUsedError;

  /// Serializes this JournalEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalEntryCopyWith<JournalEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalEntryCopyWith<$Res> {
  factory $JournalEntryCopyWith(
          JournalEntry value, $Res Function(JournalEntry) then) =
      _$JournalEntryCopyWithImpl<$Res, JournalEntry>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'images') List<String>? images,
      @JsonKey(name: 'voices') List<String>? voices,
      @JsonKey(name: 'videos') List<String>? videos});
}

/// @nodoc
class _$JournalEntryCopyWithImpl<$Res, $Val extends JournalEntry>
    implements $JournalEntryCopyWith<$Res> {
  _$JournalEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? images = freezed,
    Object? voices = freezed,
    Object? videos = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      voices: freezed == voices
          ? _value.voices
          : voices // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JournalEntryImplCopyWith<$Res>
    implements $JournalEntryCopyWith<$Res> {
  factory _$$JournalEntryImplCopyWith(
          _$JournalEntryImpl value, $Res Function(_$JournalEntryImpl) then) =
      __$$JournalEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'images') List<String>? images,
      @JsonKey(name: 'voices') List<String>? voices,
      @JsonKey(name: 'videos') List<String>? videos});
}

/// @nodoc
class __$$JournalEntryImplCopyWithImpl<$Res>
    extends _$JournalEntryCopyWithImpl<$Res, _$JournalEntryImpl>
    implements _$$JournalEntryImplCopyWith<$Res> {
  __$$JournalEntryImplCopyWithImpl(
      _$JournalEntryImpl _value, $Res Function(_$JournalEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? images = freezed,
    Object? voices = freezed,
    Object? videos = freezed,
  }) {
    return _then(_$JournalEntryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      voices: freezed == voices
          ? _value._voices
          : voices // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      videos: freezed == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalEntryImpl implements _JournalEntry {
  const _$JournalEntryImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'images') final List<String>? images,
      @JsonKey(name: 'voices') final List<String>? voices,
      @JsonKey(name: 'videos') final List<String>? videos})
      : _images = images,
        _voices = voices,
        _videos = videos;

  factory _$JournalEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalEntryImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'text')
  final String? text;
  final List<String>? _images;
  @override
  @JsonKey(name: 'images')
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _voices;
  @override
  @JsonKey(name: 'voices')
  List<String>? get voices {
    final value = _voices;
    if (value == null) return null;
    if (_voices is EqualUnmodifiableListView) return _voices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _videos;
  @override
  @JsonKey(name: 'videos')
  List<String>? get videos {
    final value = _videos;
    if (value == null) return null;
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'JournalEntry(id: $id, text: $text, images: $images, voices: $voices, videos: $videos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._voices, _voices) &&
            const DeepCollectionEquality().equals(other._videos, _videos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      text,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_voices),
      const DeepCollectionEquality().hash(_videos));

  /// Create a copy of JournalEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalEntryImplCopyWith<_$JournalEntryImpl> get copyWith =>
      __$$JournalEntryImplCopyWithImpl<_$JournalEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalEntryImplToJson(
      this,
    );
  }
}

abstract class _JournalEntry implements JournalEntry {
  const factory _JournalEntry(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'text') final String? text,
          @JsonKey(name: 'images') final List<String>? images,
          @JsonKey(name: 'voices') final List<String>? voices,
          @JsonKey(name: 'videos') final List<String>? videos}) =
      _$JournalEntryImpl;

  factory _JournalEntry.fromJson(Map<String, dynamic> json) =
      _$JournalEntryImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'images')
  List<String>? get images;
  @override
  @JsonKey(name: 'voices')
  List<String>? get voices;
  @override
  @JsonKey(name: 'videos')
  List<String>? get videos;

  /// Create a copy of JournalEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalEntryImplCopyWith<_$JournalEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
