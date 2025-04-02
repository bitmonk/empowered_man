// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignupModel _$SignupModelFromJson(Map<String, dynamic> json) {
  return _SignupModel.fromJson(json);
}

/// @nodoc
mixin _$SignupModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  SignupData? get data => throw _privateConstructorUsedError;

  /// Serializes this SignupModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignupModelCopyWith<SignupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupModelCopyWith<$Res> {
  factory $SignupModelCopyWith(
          SignupModel value, $Res Function(SignupModel) then) =
      _$SignupModelCopyWithImpl<$Res, SignupModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') SignupData? data});

  $SignupDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SignupModelCopyWithImpl<$Res, $Val extends SignupModel>
    implements $SignupModelCopyWith<$Res> {
  _$SignupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignupModel
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
              as SignupData?,
    ) as $Val);
  }

  /// Create a copy of SignupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignupDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SignupDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignupModelImplCopyWith<$Res>
    implements $SignupModelCopyWith<$Res> {
  factory _$$SignupModelImplCopyWith(
          _$SignupModelImpl value, $Res Function(_$SignupModelImpl) then) =
      __$$SignupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') SignupData? data});

  @override
  $SignupDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SignupModelImplCopyWithImpl<$Res>
    extends _$SignupModelCopyWithImpl<$Res, _$SignupModelImpl>
    implements _$$SignupModelImplCopyWith<$Res> {
  __$$SignupModelImplCopyWithImpl(
      _$SignupModelImpl _value, $Res Function(_$SignupModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SignupModelImpl(
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
              as SignupData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupModelImpl implements _SignupModel {
  const _$SignupModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$SignupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'data')
  final SignupData? data;

  @override
  String toString() {
    return 'SignupModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of SignupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupModelImplCopyWith<_$SignupModelImpl> get copyWith =>
      __$$SignupModelImplCopyWithImpl<_$SignupModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupModelImplToJson(
      this,
    );
  }
}

abstract class _SignupModel implements SignupModel {
  const factory _SignupModel(
      {@JsonKey(name: 'status') final bool? status,
      @JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'data') final SignupData? data}) = _$SignupModelImpl;

  factory _SignupModel.fromJson(Map<String, dynamic> json) =
      _$SignupModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  SignupData? get data;

  /// Create a copy of SignupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignupModelImplCopyWith<_$SignupModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SignupData _$SignupDataFromJson(Map<String, dynamic> json) {
  return _SignupData.fromJson(json);
}

/// @nodoc
mixin _$SignupData {
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'token')
  String? get token => throw _privateConstructorUsedError;

  /// Serializes this SignupData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignupData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignupDataCopyWith<SignupData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupDataCopyWith<$Res> {
  factory $SignupDataCopyWith(
          SignupData value, $Res Function(SignupData) then) =
      _$SignupDataCopyWithImpl<$Res, SignupData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user') User? user,
      @JsonKey(name: 'token') String? token});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$SignupDataCopyWithImpl<$Res, $Val extends SignupData>
    implements $SignupDataCopyWith<$Res> {
  _$SignupDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignupData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of SignupData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignupDataImplCopyWith<$Res>
    implements $SignupDataCopyWith<$Res> {
  factory _$$SignupDataImplCopyWith(
          _$SignupDataImpl value, $Res Function(_$SignupDataImpl) then) =
      __$$SignupDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user') User? user,
      @JsonKey(name: 'token') String? token});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$SignupDataImplCopyWithImpl<$Res>
    extends _$SignupDataCopyWithImpl<$Res, _$SignupDataImpl>
    implements _$$SignupDataImplCopyWith<$Res> {
  __$$SignupDataImplCopyWithImpl(
      _$SignupDataImpl _value, $Res Function(_$SignupDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignupData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? token = freezed,
  }) {
    return _then(_$SignupDataImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupDataImpl implements _SignupData {
  const _$SignupDataImpl(
      {@JsonKey(name: 'user') this.user, @JsonKey(name: 'token') this.token});

  factory _$SignupDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupDataImplFromJson(json);

  @override
  @JsonKey(name: 'user')
  final User? user;
  @override
  @JsonKey(name: 'token')
  final String? token;

  @override
  String toString() {
    return 'SignupData(user: $user, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupDataImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, token);

  /// Create a copy of SignupData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupDataImplCopyWith<_$SignupDataImpl> get copyWith =>
      __$$SignupDataImplCopyWithImpl<_$SignupDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupDataImplToJson(
      this,
    );
  }
}

abstract class _SignupData implements SignupData {
  const factory _SignupData(
      {@JsonKey(name: 'user') final User? user,
      @JsonKey(name: 'token') final String? token}) = _$SignupDataImpl;

  factory _SignupData.fromJson(Map<String, dynamic> json) =
      _$SignupDataImpl.fromJson;

  @override
  @JsonKey(name: 'user')
  User? get user;
  @override
  @JsonKey(name: 'token')
  String? get token;

  /// Create a copy of SignupData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignupDataImplCopyWith<_$SignupDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug')
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  dynamic get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'occupation')
  dynamic get occupation => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  dynamic get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'phone_number') dynamic phoneNumber,
      @JsonKey(name: 'occupation') dynamic occupation,
      @JsonKey(name: 'image') dynamic image,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? slug = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? occupation = freezed,
    Object? image = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      occupation: freezed == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as dynamic,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'phone_number') dynamic phoneNumber,
      @JsonKey(name: 'occupation') dynamic occupation,
      @JsonKey(name: 'image') dynamic image,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? slug = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? occupation = freezed,
    Object? image = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      occupation: freezed == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as dynamic,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'slug') this.slug,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'phone_number') this.phoneNumber,
      @JsonKey(name: 'occupation') this.occupation,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'slug')
  final String? slug;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'phone_number')
  final dynamic phoneNumber;
  @override
  @JsonKey(name: 'occupation')
  final dynamic occupation;
  @override
  @JsonKey(name: 'image')
  final dynamic image;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'User(id: $id, fullName: $fullName, slug: $slug, email: $email, phoneNumber: $phoneNumber, occupation: $occupation, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.occupation, occupation) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      slug,
      email,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(occupation),
      const DeepCollectionEquality().hash(image),
      createdAt,
      updatedAt);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'full_name') final String? fullName,
      @JsonKey(name: 'slug') final String? slug,
      @JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'phone_number') final dynamic phoneNumber,
      @JsonKey(name: 'occupation') final dynamic occupation,
      @JsonKey(name: 'image') final dynamic image,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'slug')
  String? get slug;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'phone_number')
  dynamic get phoneNumber;
  @override
  @JsonKey(name: 'occupation')
  dynamic get occupation;
  @override
  @JsonKey(name: 'image')
  dynamic get image;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
