// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_policy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrivacyPolicyModel _$PrivacyPolicyModelFromJson(Map<String, dynamic> json) {
  return _PrivacyPolicyModel.fromJson(json);
}

/// @nodoc
mixin _$PrivacyPolicyModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  PrivacyPolicyData? get privacyPolicyData =>
      throw _privateConstructorUsedError;

  /// Serializes this PrivacyPolicyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivacyPolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivacyPolicyModelCopyWith<PrivacyPolicyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacyPolicyModelCopyWith<$Res> {
  factory $PrivacyPolicyModelCopyWith(
          PrivacyPolicyModel value, $Res Function(PrivacyPolicyModel) then) =
      _$PrivacyPolicyModelCopyWithImpl<$Res, PrivacyPolicyModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') PrivacyPolicyData? privacyPolicyData});

  $PrivacyPolicyDataCopyWith<$Res>? get privacyPolicyData;
}

/// @nodoc
class _$PrivacyPolicyModelCopyWithImpl<$Res, $Val extends PrivacyPolicyModel>
    implements $PrivacyPolicyModelCopyWith<$Res> {
  _$PrivacyPolicyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivacyPolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? privacyPolicyData = freezed,
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
      privacyPolicyData: freezed == privacyPolicyData
          ? _value.privacyPolicyData
          : privacyPolicyData // ignore: cast_nullable_to_non_nullable
              as PrivacyPolicyData?,
    ) as $Val);
  }

  /// Create a copy of PrivacyPolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrivacyPolicyDataCopyWith<$Res>? get privacyPolicyData {
    if (_value.privacyPolicyData == null) {
      return null;
    }

    return $PrivacyPolicyDataCopyWith<$Res>(_value.privacyPolicyData!, (value) {
      return _then(_value.copyWith(privacyPolicyData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrivacyPolicyModelImplCopyWith<$Res>
    implements $PrivacyPolicyModelCopyWith<$Res> {
  factory _$$PrivacyPolicyModelImplCopyWith(_$PrivacyPolicyModelImpl value,
          $Res Function(_$PrivacyPolicyModelImpl) then) =
      __$$PrivacyPolicyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') PrivacyPolicyData? privacyPolicyData});

  @override
  $PrivacyPolicyDataCopyWith<$Res>? get privacyPolicyData;
}

/// @nodoc
class __$$PrivacyPolicyModelImplCopyWithImpl<$Res>
    extends _$PrivacyPolicyModelCopyWithImpl<$Res, _$PrivacyPolicyModelImpl>
    implements _$$PrivacyPolicyModelImplCopyWith<$Res> {
  __$$PrivacyPolicyModelImplCopyWithImpl(_$PrivacyPolicyModelImpl _value,
      $Res Function(_$PrivacyPolicyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrivacyPolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? privacyPolicyData = freezed,
  }) {
    return _then(_$PrivacyPolicyModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      privacyPolicyData: freezed == privacyPolicyData
          ? _value.privacyPolicyData
          : privacyPolicyData // ignore: cast_nullable_to_non_nullable
              as PrivacyPolicyData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivacyPolicyModelImpl implements _PrivacyPolicyModel {
  const _$PrivacyPolicyModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.privacyPolicyData});

  factory _$PrivacyPolicyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacyPolicyModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'data')
  final PrivacyPolicyData? privacyPolicyData;

  @override
  String toString() {
    return 'PrivacyPolicyModel(status: $status, message: $message, privacyPolicyData: $privacyPolicyData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacyPolicyModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.privacyPolicyData, privacyPolicyData) ||
                other.privacyPolicyData == privacyPolicyData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, message, privacyPolicyData);

  /// Create a copy of PrivacyPolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacyPolicyModelImplCopyWith<_$PrivacyPolicyModelImpl> get copyWith =>
      __$$PrivacyPolicyModelImplCopyWithImpl<_$PrivacyPolicyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacyPolicyModelImplToJson(
      this,
    );
  }
}

abstract class _PrivacyPolicyModel implements PrivacyPolicyModel {
  const factory _PrivacyPolicyModel(
          {@JsonKey(name: 'status') final bool? status,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'data') final PrivacyPolicyData? privacyPolicyData}) =
      _$PrivacyPolicyModelImpl;

  factory _PrivacyPolicyModel.fromJson(Map<String, dynamic> json) =
      _$PrivacyPolicyModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  PrivacyPolicyData? get privacyPolicyData;

  /// Create a copy of PrivacyPolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivacyPolicyModelImplCopyWith<_$PrivacyPolicyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrivacyPolicyData _$PrivacyPolicyDataFromJson(Map<String, dynamic> json) {
  return _PrivacyPolicyData.fromJson(json);
}

/// @nodoc
mixin _$PrivacyPolicyData {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String? get content => throw _privateConstructorUsedError;

  /// Serializes this PrivacyPolicyData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivacyPolicyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivacyPolicyDataCopyWith<PrivacyPolicyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacyPolicyDataCopyWith<$Res> {
  factory $PrivacyPolicyDataCopyWith(
          PrivacyPolicyData value, $Res Function(PrivacyPolicyData) then) =
      _$PrivacyPolicyDataCopyWithImpl<$Res, PrivacyPolicyData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content});
}

/// @nodoc
class _$PrivacyPolicyDataCopyWithImpl<$Res, $Val extends PrivacyPolicyData>
    implements $PrivacyPolicyDataCopyWith<$Res> {
  _$PrivacyPolicyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivacyPolicyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivacyPolicyDataImplCopyWith<$Res>
    implements $PrivacyPolicyDataCopyWith<$Res> {
  factory _$$PrivacyPolicyDataImplCopyWith(_$PrivacyPolicyDataImpl value,
          $Res Function(_$PrivacyPolicyDataImpl) then) =
      __$$PrivacyPolicyDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content});
}

/// @nodoc
class __$$PrivacyPolicyDataImplCopyWithImpl<$Res>
    extends _$PrivacyPolicyDataCopyWithImpl<$Res, _$PrivacyPolicyDataImpl>
    implements _$$PrivacyPolicyDataImplCopyWith<$Res> {
  __$$PrivacyPolicyDataImplCopyWithImpl(_$PrivacyPolicyDataImpl _value,
      $Res Function(_$PrivacyPolicyDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrivacyPolicyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_$PrivacyPolicyDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivacyPolicyDataImpl implements _PrivacyPolicyData {
  const _$PrivacyPolicyDataImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'content') this.content});

  factory _$PrivacyPolicyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacyPolicyDataImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'content')
  final String? content;

  @override
  String toString() {
    return 'PrivacyPolicyData(id: $id, title: $title, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacyPolicyDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, content);

  /// Create a copy of PrivacyPolicyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacyPolicyDataImplCopyWith<_$PrivacyPolicyDataImpl> get copyWith =>
      __$$PrivacyPolicyDataImplCopyWithImpl<_$PrivacyPolicyDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacyPolicyDataImplToJson(
      this,
    );
  }
}

abstract class _PrivacyPolicyData implements PrivacyPolicyData {
  const factory _PrivacyPolicyData(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'title') final String? title,
          @JsonKey(name: 'content') final String? content}) =
      _$PrivacyPolicyDataImpl;

  factory _PrivacyPolicyData.fromJson(Map<String, dynamic> json) =
      _$PrivacyPolicyDataImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'content')
  String? get content;

  /// Create a copy of PrivacyPolicyData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivacyPolicyDataImplCopyWith<_$PrivacyPolicyDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
