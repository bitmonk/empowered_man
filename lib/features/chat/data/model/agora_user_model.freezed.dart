// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agora_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgoraUserModel _$AgoraUserModelFromJson(Map<String, dynamic> json) {
  return _AgoraUserModel.fromJson(json);
}

/// @nodoc
mixin _$AgoraUserModel {
  @JsonKey(name: 'success')
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<AgoraUser>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int? get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'query')
  String? get query => throw _privateConstructorUsedError;
  @JsonKey(name: 'limit')
  String? get limit => throw _privateConstructorUsedError;
  @JsonKey(name: 'timestamp')
  DateTime? get timestamp => throw _privateConstructorUsedError;

  /// Serializes this AgoraUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgoraUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgoraUserModelCopyWith<AgoraUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgoraUserModelCopyWith<$Res> {
  factory $AgoraUserModelCopyWith(
          AgoraUserModel value, $Res Function(AgoraUserModel) then) =
      _$AgoraUserModelCopyWithImpl<$Res, AgoraUserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool? success,
      @JsonKey(name: 'data') List<AgoraUser>? data,
      @JsonKey(name: 'total_count') int? totalCount,
      @JsonKey(name: 'query') String? query,
      @JsonKey(name: 'limit') String? limit,
      @JsonKey(name: 'timestamp') DateTime? timestamp});
}

/// @nodoc
class _$AgoraUserModelCopyWithImpl<$Res, $Val extends AgoraUserModel>
    implements $AgoraUserModelCopyWith<$Res> {
  _$AgoraUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgoraUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
    Object? totalCount = freezed,
    Object? query = freezed,
    Object? limit = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AgoraUser>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgoraUserModelImplCopyWith<$Res>
    implements $AgoraUserModelCopyWith<$Res> {
  factory _$$AgoraUserModelImplCopyWith(_$AgoraUserModelImpl value,
          $Res Function(_$AgoraUserModelImpl) then) =
      __$$AgoraUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool? success,
      @JsonKey(name: 'data') List<AgoraUser>? data,
      @JsonKey(name: 'total_count') int? totalCount,
      @JsonKey(name: 'query') String? query,
      @JsonKey(name: 'limit') String? limit,
      @JsonKey(name: 'timestamp') DateTime? timestamp});
}

/// @nodoc
class __$$AgoraUserModelImplCopyWithImpl<$Res>
    extends _$AgoraUserModelCopyWithImpl<$Res, _$AgoraUserModelImpl>
    implements _$$AgoraUserModelImplCopyWith<$Res> {
  __$$AgoraUserModelImplCopyWithImpl(
      _$AgoraUserModelImpl _value, $Res Function(_$AgoraUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgoraUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
    Object? totalCount = freezed,
    Object? query = freezed,
    Object? limit = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$AgoraUserModelImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AgoraUser>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgoraUserModelImpl implements _AgoraUserModel {
  const _$AgoraUserModelImpl(
      {@JsonKey(name: 'success') this.success,
      @JsonKey(name: 'data') final List<AgoraUser>? data,
      @JsonKey(name: 'total_count') this.totalCount,
      @JsonKey(name: 'query') this.query,
      @JsonKey(name: 'limit') this.limit,
      @JsonKey(name: 'timestamp') this.timestamp})
      : _data = data;

  factory _$AgoraUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgoraUserModelImplFromJson(json);

  @override
  @JsonKey(name: 'success')
  final bool? success;
  final List<AgoraUser>? _data;
  @override
  @JsonKey(name: 'data')
  List<AgoraUser>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'total_count')
  final int? totalCount;
  @override
  @JsonKey(name: 'query')
  final String? query;
  @override
  @JsonKey(name: 'limit')
  final String? limit;
  @override
  @JsonKey(name: 'timestamp')
  final DateTime? timestamp;

  @override
  String toString() {
    return 'AgoraUserModel(success: $success, data: $data, totalCount: $totalCount, query: $query, limit: $limit, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgoraUserModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      success,
      const DeepCollectionEquality().hash(_data),
      totalCount,
      query,
      limit,
      timestamp);

  /// Create a copy of AgoraUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgoraUserModelImplCopyWith<_$AgoraUserModelImpl> get copyWith =>
      __$$AgoraUserModelImplCopyWithImpl<_$AgoraUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgoraUserModelImplToJson(
      this,
    );
  }
}

abstract class _AgoraUserModel implements AgoraUserModel {
  const factory _AgoraUserModel(
          {@JsonKey(name: 'success') final bool? success,
          @JsonKey(name: 'data') final List<AgoraUser>? data,
          @JsonKey(name: 'total_count') final int? totalCount,
          @JsonKey(name: 'query') final String? query,
          @JsonKey(name: 'limit') final String? limit,
          @JsonKey(name: 'timestamp') final DateTime? timestamp}) =
      _$AgoraUserModelImpl;

  factory _AgoraUserModel.fromJson(Map<String, dynamic> json) =
      _$AgoraUserModelImpl.fromJson;

  @override
  @JsonKey(name: 'success')
  bool? get success;
  @override
  @JsonKey(name: 'data')
  List<AgoraUser>? get data;
  @override
  @JsonKey(name: 'total_count')
  int? get totalCount;
  @override
  @JsonKey(name: 'query')
  String? get query;
  @override
  @JsonKey(name: 'limit')
  String? get limit;
  @override
  @JsonKey(name: 'timestamp')
  DateTime? get timestamp;

  /// Create a copy of AgoraUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgoraUserModelImplCopyWith<_$AgoraUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AgoraUser _$AgoraUserFromJson(Map<String, dynamic> json) {
  return _AgoraUser.fromJson(json);
}

/// @nodoc
mixin _$AgoraUser {
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'nickname')
  String? get nickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar')
  dynamic get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_online')
  bool? get isOnline => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_activated')
  bool? get isActivated => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_ago')
  String? get createdAgo => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_login_at')
  dynamic get lastLoginAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_login_ago')
  dynamic get lastLoginAgo => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified_at')
  DateTime? get modifiedAt => throw _privateConstructorUsedError;

  /// Serializes this AgoraUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgoraUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgoraUserCopyWith<AgoraUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgoraUserCopyWith<$Res> {
  factory $AgoraUserCopyWith(AgoraUser value, $Res Function(AgoraUser) then) =
      _$AgoraUserCopyWithImpl<$Res, AgoraUser>;
  @useResult
  $Res call(
      {@JsonKey(name: 'username') String? username,
      @JsonKey(name: 'nickname') String? nickname,
      @JsonKey(name: 'avatar') dynamic avatar,
      @JsonKey(name: 'is_online') bool? isOnline,
      @JsonKey(name: 'is_activated') bool? isActivated,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'created_ago') String? createdAgo,
      @JsonKey(name: 'last_login_at') dynamic lastLoginAt,
      @JsonKey(name: 'last_login_ago') dynamic lastLoginAgo,
      @JsonKey(name: 'modified_at') DateTime? modifiedAt});
}

/// @nodoc
class _$AgoraUserCopyWithImpl<$Res, $Val extends AgoraUser>
    implements $AgoraUserCopyWith<$Res> {
  _$AgoraUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgoraUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? nickname = freezed,
    Object? avatar = freezed,
    Object? isOnline = freezed,
    Object? isActivated = freezed,
    Object? createdAt = freezed,
    Object? createdAgo = freezed,
    Object? lastLoginAt = freezed,
    Object? lastLoginAgo = freezed,
    Object? modifiedAt = freezed,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActivated: freezed == isActivated
          ? _value.isActivated
          : isActivated // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAgo: freezed == createdAgo
          ? _value.createdAgo
          : createdAgo // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastLoginAgo: freezed == lastLoginAgo
          ? _value.lastLoginAgo
          : lastLoginAgo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgoraUserImplCopyWith<$Res>
    implements $AgoraUserCopyWith<$Res> {
  factory _$$AgoraUserImplCopyWith(
          _$AgoraUserImpl value, $Res Function(_$AgoraUserImpl) then) =
      __$$AgoraUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'username') String? username,
      @JsonKey(name: 'nickname') String? nickname,
      @JsonKey(name: 'avatar') dynamic avatar,
      @JsonKey(name: 'is_online') bool? isOnline,
      @JsonKey(name: 'is_activated') bool? isActivated,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'created_ago') String? createdAgo,
      @JsonKey(name: 'last_login_at') dynamic lastLoginAt,
      @JsonKey(name: 'last_login_ago') dynamic lastLoginAgo,
      @JsonKey(name: 'modified_at') DateTime? modifiedAt});
}

/// @nodoc
class __$$AgoraUserImplCopyWithImpl<$Res>
    extends _$AgoraUserCopyWithImpl<$Res, _$AgoraUserImpl>
    implements _$$AgoraUserImplCopyWith<$Res> {
  __$$AgoraUserImplCopyWithImpl(
      _$AgoraUserImpl _value, $Res Function(_$AgoraUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgoraUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? nickname = freezed,
    Object? avatar = freezed,
    Object? isOnline = freezed,
    Object? isActivated = freezed,
    Object? createdAt = freezed,
    Object? createdAgo = freezed,
    Object? lastLoginAt = freezed,
    Object? lastLoginAgo = freezed,
    Object? modifiedAt = freezed,
  }) {
    return _then(_$AgoraUserImpl(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActivated: freezed == isActivated
          ? _value.isActivated
          : isActivated // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAgo: freezed == createdAgo
          ? _value.createdAgo
          : createdAgo // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastLoginAgo: freezed == lastLoginAgo
          ? _value.lastLoginAgo
          : lastLoginAgo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgoraUserImpl implements _AgoraUser {
  const _$AgoraUserImpl(
      {@JsonKey(name: 'username') this.username,
      @JsonKey(name: 'nickname') this.nickname,
      @JsonKey(name: 'avatar') this.avatar,
      @JsonKey(name: 'is_online') this.isOnline,
      @JsonKey(name: 'is_activated') this.isActivated,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'created_ago') this.createdAgo,
      @JsonKey(name: 'last_login_at') this.lastLoginAt,
      @JsonKey(name: 'last_login_ago') this.lastLoginAgo,
      @JsonKey(name: 'modified_at') this.modifiedAt});

  factory _$AgoraUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgoraUserImplFromJson(json);

  @override
  @JsonKey(name: 'username')
  final String? username;
  @override
  @JsonKey(name: 'nickname')
  final String? nickname;
  @override
  @JsonKey(name: 'avatar')
  final dynamic avatar;
  @override
  @JsonKey(name: 'is_online')
  final bool? isOnline;
  @override
  @JsonKey(name: 'is_activated')
  final bool? isActivated;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'created_ago')
  final String? createdAgo;
  @override
  @JsonKey(name: 'last_login_at')
  final dynamic lastLoginAt;
  @override
  @JsonKey(name: 'last_login_ago')
  final dynamic lastLoginAgo;
  @override
  @JsonKey(name: 'modified_at')
  final DateTime? modifiedAt;

  @override
  String toString() {
    return 'AgoraUser(username: $username, nickname: $nickname, avatar: $avatar, isOnline: $isOnline, isActivated: $isActivated, createdAt: $createdAt, createdAgo: $createdAgo, lastLoginAt: $lastLoginAt, lastLoginAgo: $lastLoginAgo, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgoraUserImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.isActivated, isActivated) ||
                other.isActivated == isActivated) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdAgo, createdAgo) ||
                other.createdAgo == createdAgo) &&
            const DeepCollectionEquality()
                .equals(other.lastLoginAt, lastLoginAt) &&
            const DeepCollectionEquality()
                .equals(other.lastLoginAgo, lastLoginAgo) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      username,
      nickname,
      const DeepCollectionEquality().hash(avatar),
      isOnline,
      isActivated,
      createdAt,
      createdAgo,
      const DeepCollectionEquality().hash(lastLoginAt),
      const DeepCollectionEquality().hash(lastLoginAgo),
      modifiedAt);

  /// Create a copy of AgoraUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgoraUserImplCopyWith<_$AgoraUserImpl> get copyWith =>
      __$$AgoraUserImplCopyWithImpl<_$AgoraUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgoraUserImplToJson(
      this,
    );
  }
}

abstract class _AgoraUser implements AgoraUser {
  const factory _AgoraUser(
          {@JsonKey(name: 'username') final String? username,
          @JsonKey(name: 'nickname') final String? nickname,
          @JsonKey(name: 'avatar') final dynamic avatar,
          @JsonKey(name: 'is_online') final bool? isOnline,
          @JsonKey(name: 'is_activated') final bool? isActivated,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'created_ago') final String? createdAgo,
          @JsonKey(name: 'last_login_at') final dynamic lastLoginAt,
          @JsonKey(name: 'last_login_ago') final dynamic lastLoginAgo,
          @JsonKey(name: 'modified_at') final DateTime? modifiedAt}) =
      _$AgoraUserImpl;

  factory _AgoraUser.fromJson(Map<String, dynamic> json) =
      _$AgoraUserImpl.fromJson;

  @override
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'nickname')
  String? get nickname;
  @override
  @JsonKey(name: 'avatar')
  dynamic get avatar;
  @override
  @JsonKey(name: 'is_online')
  bool? get isOnline;
  @override
  @JsonKey(name: 'is_activated')
  bool? get isActivated;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'created_ago')
  String? get createdAgo;
  @override
  @JsonKey(name: 'last_login_at')
  dynamic get lastLoginAt;
  @override
  @JsonKey(name: 'last_login_ago')
  dynamic get lastLoginAgo;
  @override
  @JsonKey(name: 'modified_at')
  DateTime? get modifiedAt;

  /// Create a copy of AgoraUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgoraUserImplCopyWith<_$AgoraUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
