// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_emotion_names_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JournalEmotionNamesModel _$JournalEmotionNamesModelFromJson(
    Map<String, dynamic> json) {
  return _JournalEmotionNamesModel.fromJson(json);
}

/// @nodoc
mixin _$JournalEmotionNamesModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Data? get data => throw _privateConstructorUsedError;

  /// Serializes this JournalEmotionNamesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalEmotionNamesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalEmotionNamesModelCopyWith<JournalEmotionNamesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalEmotionNamesModelCopyWith<$Res> {
  factory $JournalEmotionNamesModelCopyWith(JournalEmotionNamesModel value,
          $Res Function(JournalEmotionNamesModel) then) =
      _$JournalEmotionNamesModelCopyWithImpl<$Res, JournalEmotionNamesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$JournalEmotionNamesModelCopyWithImpl<$Res,
        $Val extends JournalEmotionNamesModel>
    implements $JournalEmotionNamesModelCopyWith<$Res> {
  _$JournalEmotionNamesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalEmotionNamesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ) as $Val);
  }

  /// Create a copy of JournalEmotionNamesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JournalEmotionNamesModelImplCopyWith<$Res>
    implements $JournalEmotionNamesModelCopyWith<$Res> {
  factory _$$JournalEmotionNamesModelImplCopyWith(
          _$JournalEmotionNamesModelImpl value,
          $Res Function(_$JournalEmotionNamesModelImpl) then) =
      __$$JournalEmotionNamesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Data? data});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$JournalEmotionNamesModelImplCopyWithImpl<$Res>
    extends _$JournalEmotionNamesModelCopyWithImpl<$Res,
        _$JournalEmotionNamesModelImpl>
    implements _$$JournalEmotionNamesModelImplCopyWith<$Res> {
  __$$JournalEmotionNamesModelImplCopyWithImpl(
      _$JournalEmotionNamesModelImpl _value,
      $Res Function(_$JournalEmotionNamesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalEmotionNamesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$JournalEmotionNamesModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalEmotionNamesModelImpl implements _JournalEmotionNamesModel {
  const _$JournalEmotionNamesModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$JournalEmotionNamesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalEmotionNamesModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'data')
  final Data? data;

  @override
  String toString() {
    return 'JournalEmotionNamesModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalEmotionNamesModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of JournalEmotionNamesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalEmotionNamesModelImplCopyWith<_$JournalEmotionNamesModelImpl>
      get copyWith => __$$JournalEmotionNamesModelImplCopyWithImpl<
          _$JournalEmotionNamesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalEmotionNamesModelImplToJson(
      this,
    );
  }
}

abstract class _JournalEmotionNamesModel implements JournalEmotionNamesModel {
  const factory _JournalEmotionNamesModel(
          {@JsonKey(name: 'status') final bool? status,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'data') final Data? data}) =
      _$JournalEmotionNamesModelImpl;

  factory _JournalEmotionNamesModel.fromJson(Map<String, dynamic> json) =
      _$JournalEmotionNamesModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  Data? get data;

  /// Create a copy of JournalEmotionNamesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalEmotionNamesModelImplCopyWith<_$JournalEmotionNamesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'emotion_names')
  List<EmotionName>? get emotionNames => throw _privateConstructorUsedError;

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call({@JsonKey(name: 'emotion_names') List<EmotionName>? emotionNames});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emotionNames = freezed,
  }) {
    return _then(_value.copyWith(
      emotionNames: freezed == emotionNames
          ? _value.emotionNames
          : emotionNames // ignore: cast_nullable_to_non_nullable
              as List<EmotionName>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'emotion_names') List<EmotionName>? emotionNames});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emotionNames = freezed,
  }) {
    return _then(_$DataImpl(
      emotionNames: freezed == emotionNames
          ? _value._emotionNames
          : emotionNames // ignore: cast_nullable_to_non_nullable
              as List<EmotionName>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: 'emotion_names') final List<EmotionName>? emotionNames})
      : _emotionNames = emotionNames;

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  final List<EmotionName>? _emotionNames;
  @override
  @JsonKey(name: 'emotion_names')
  List<EmotionName>? get emotionNames {
    final value = _emotionNames;
    if (value == null) return null;
    if (_emotionNames is EqualUnmodifiableListView) return _emotionNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Data(emotionNames: $emotionNames)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            const DeepCollectionEquality()
                .equals(other._emotionNames, _emotionNames));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_emotionNames));

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {@JsonKey(name: 'emotion_names')
      final List<EmotionName>? emotionNames}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: 'emotion_names')
  List<EmotionName>? get emotionNames;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmotionName _$EmotionNameFromJson(Map<String, dynamic> json) {
  return _EmotionName.fromJson(json);
}

/// @nodoc
mixin _$EmotionName {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'emotion_name')
  String? get emotionName => throw _privateConstructorUsedError;

  /// Serializes this EmotionName to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmotionName
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmotionNameCopyWith<EmotionName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmotionNameCopyWith<$Res> {
  factory $EmotionNameCopyWith(
          EmotionName value, $Res Function(EmotionName) then) =
      _$EmotionNameCopyWithImpl<$Res, EmotionName>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'emotion_name') String? emotionName});
}

/// @nodoc
class _$EmotionNameCopyWithImpl<$Res, $Val extends EmotionName>
    implements $EmotionNameCopyWith<$Res> {
  _$EmotionNameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmotionName
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? emotionName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      emotionName: freezed == emotionName
          ? _value.emotionName
          : emotionName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmotionNameImplCopyWith<$Res>
    implements $EmotionNameCopyWith<$Res> {
  factory _$$EmotionNameImplCopyWith(
          _$EmotionNameImpl value, $Res Function(_$EmotionNameImpl) then) =
      __$$EmotionNameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'emotion_name') String? emotionName});
}

/// @nodoc
class __$$EmotionNameImplCopyWithImpl<$Res>
    extends _$EmotionNameCopyWithImpl<$Res, _$EmotionNameImpl>
    implements _$$EmotionNameImplCopyWith<$Res> {
  __$$EmotionNameImplCopyWithImpl(
      _$EmotionNameImpl _value, $Res Function(_$EmotionNameImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmotionName
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? emotionName = freezed,
  }) {
    return _then(_$EmotionNameImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      emotionName: freezed == emotionName
          ? _value.emotionName
          : emotionName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmotionNameImpl implements _EmotionName {
  const _$EmotionNameImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'emotion_name') this.emotionName});

  factory _$EmotionNameImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmotionNameImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'emotion_name')
  final String? emotionName;

  @override
  String toString() {
    return 'EmotionName(id: $id, emotionName: $emotionName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmotionNameImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emotionName, emotionName) ||
                other.emotionName == emotionName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, emotionName);

  /// Create a copy of EmotionName
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmotionNameImplCopyWith<_$EmotionNameImpl> get copyWith =>
      __$$EmotionNameImplCopyWithImpl<_$EmotionNameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmotionNameImplToJson(
      this,
    );
  }
}

abstract class _EmotionName implements EmotionName {
  const factory _EmotionName(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'emotion_name') final String? emotionName}) =
      _$EmotionNameImpl;

  factory _EmotionName.fromJson(Map<String, dynamic> json) =
      _$EmotionNameImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'emotion_name')
  String? get emotionName;

  /// Create a copy of EmotionName
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmotionNameImplCopyWith<_$EmotionNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
