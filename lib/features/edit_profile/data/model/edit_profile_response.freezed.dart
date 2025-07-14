// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EditProfileResponse _$EditProfileResponseFromJson(Map<String, dynamic> json) {
  return _EditProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$EditProfileResponse {
  String get message => throw _privateConstructorUsedError;
  UserProfileModel get user => throw _privateConstructorUsedError;

  /// Serializes this EditProfileResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EditProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditProfileResponseCopyWith<EditProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileResponseCopyWith<$Res> {
  factory $EditProfileResponseCopyWith(
          EditProfileResponse value, $Res Function(EditProfileResponse) then) =
      _$EditProfileResponseCopyWithImpl<$Res, EditProfileResponse>;
  @useResult
  $Res call({String message, UserProfileModel user});

  $UserProfileModelCopyWith<$Res> get user;
}

/// @nodoc
class _$EditProfileResponseCopyWithImpl<$Res, $Val extends EditProfileResponse>
    implements $EditProfileResponseCopyWith<$Res> {
  _$EditProfileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
    ) as $Val);
  }

  /// Create a copy of EditProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileModelCopyWith<$Res> get user {
    return $UserProfileModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditProfileResponseImplCopyWith<$Res>
    implements $EditProfileResponseCopyWith<$Res> {
  factory _$$EditProfileResponseImplCopyWith(_$EditProfileResponseImpl value,
          $Res Function(_$EditProfileResponseImpl) then) =
      __$$EditProfileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, UserProfileModel user});

  @override
  $UserProfileModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$EditProfileResponseImplCopyWithImpl<$Res>
    extends _$EditProfileResponseCopyWithImpl<$Res, _$EditProfileResponseImpl>
    implements _$$EditProfileResponseImplCopyWith<$Res> {
  __$$EditProfileResponseImplCopyWithImpl(_$EditProfileResponseImpl _value,
      $Res Function(_$EditProfileResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? user = null,
  }) {
    return _then(_$EditProfileResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditProfileResponseImpl implements _EditProfileResponse {
  const _$EditProfileResponseImpl({required this.message, required this.user});

  factory _$EditProfileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditProfileResponseImplFromJson(json);

  @override
  final String message;
  @override
  final UserProfileModel user;

  @override
  String toString() {
    return 'EditProfileResponse(message: $message, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfileResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, user);

  /// Create a copy of EditProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfileResponseImplCopyWith<_$EditProfileResponseImpl> get copyWith =>
      __$$EditProfileResponseImplCopyWithImpl<_$EditProfileResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditProfileResponseImplToJson(
      this,
    );
  }
}

abstract class _EditProfileResponse implements EditProfileResponse {
  const factory _EditProfileResponse(
      {required final String message,
      required final UserProfileModel user}) = _$EditProfileResponseImpl;

  factory _EditProfileResponse.fromJson(Map<String, dynamic> json) =
      _$EditProfileResponseImpl.fromJson;

  @override
  String get message;
  @override
  UserProfileModel get user;

  /// Create a copy of EditProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditProfileResponseImplCopyWith<_$EditProfileResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
