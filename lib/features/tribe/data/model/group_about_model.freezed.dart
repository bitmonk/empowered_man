// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_about_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupAboutModel _$GroupAboutModelFromJson(Map<String, dynamic> json) {
  return _GroupAboutModel.fromJson(json);
}

/// @nodoc
mixin _$GroupAboutModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Data? get data => throw _privateConstructorUsedError;

  /// Serializes this GroupAboutModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupAboutModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupAboutModelCopyWith<GroupAboutModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupAboutModelCopyWith<$Res> {
  factory $GroupAboutModelCopyWith(
          GroupAboutModel value, $Res Function(GroupAboutModel) then) =
      _$GroupAboutModelCopyWithImpl<$Res, GroupAboutModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GroupAboutModelCopyWithImpl<$Res, $Val extends GroupAboutModel>
    implements $GroupAboutModelCopyWith<$Res> {
  _$GroupAboutModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupAboutModel
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

  /// Create a copy of GroupAboutModel
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
abstract class _$$GroupAboutModelImplCopyWith<$Res>
    implements $GroupAboutModelCopyWith<$Res> {
  factory _$$GroupAboutModelImplCopyWith(_$GroupAboutModelImpl value,
          $Res Function(_$GroupAboutModelImpl) then) =
      __$$GroupAboutModelImplCopyWithImpl<$Res>;
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
class __$$GroupAboutModelImplCopyWithImpl<$Res>
    extends _$GroupAboutModelCopyWithImpl<$Res, _$GroupAboutModelImpl>
    implements _$$GroupAboutModelImplCopyWith<$Res> {
  __$$GroupAboutModelImplCopyWithImpl(
      _$GroupAboutModelImpl _value, $Res Function(_$GroupAboutModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupAboutModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GroupAboutModelImpl(
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
class _$GroupAboutModelImpl implements _GroupAboutModel {
  const _$GroupAboutModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$GroupAboutModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupAboutModelImplFromJson(json);

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
    return 'GroupAboutModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupAboutModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of GroupAboutModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupAboutModelImplCopyWith<_$GroupAboutModelImpl> get copyWith =>
      __$$GroupAboutModelImplCopyWithImpl<_$GroupAboutModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupAboutModelImplToJson(
      this,
    );
  }
}

abstract class _GroupAboutModel implements GroupAboutModel {
  const factory _GroupAboutModel(
      {@JsonKey(name: 'status') final bool? status,
      @JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'data') final Data? data}) = _$GroupAboutModelImpl;

  factory _GroupAboutModel.fromJson(Map<String, dynamic> json) =
      _$GroupAboutModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  Data? get data;

  /// Create a copy of GroupAboutModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupAboutModelImplCopyWith<_$GroupAboutModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'about')
  About? get about => throw _privateConstructorUsedError;

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
  $Res call({@JsonKey(name: 'about') About? about});

  $AboutCopyWith<$Res>? get about;
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
    Object? about = freezed,
  }) {
    return _then(_value.copyWith(
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as About?,
    ) as $Val);
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AboutCopyWith<$Res>? get about {
    if (_value.about == null) {
      return null;
    }

    return $AboutCopyWith<$Res>(_value.about!, (value) {
      return _then(_value.copyWith(about: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'about') About? about});

  @override
  $AboutCopyWith<$Res>? get about;
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
    Object? about = freezed,
  }) {
    return _then(_$DataImpl(
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as About?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl({@JsonKey(name: 'about') this.about});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: 'about')
  final About? about;

  @override
  String toString() {
    return 'Data(about: $about)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.about, about) || other.about == about));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, about);

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
  const factory _Data({@JsonKey(name: 'about') final About? about}) =
      _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: 'about')
  About? get about;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

About _$AboutFromJson(Map<String, dynamic> json) {
  return _About.fromJson(json);
}

/// @nodoc
mixin _$About {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'about')
  String? get about => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_type')
  String? get accessType => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_count')
  int? get memberCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_pinned')
  bool? get isPinned => throw _privateConstructorUsedError;
  @JsonKey(name: 'latest_post_time')
  String? get latestPostTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'members')
  List<Member>? get members => throw _privateConstructorUsedError;

  /// Serializes this About to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of About
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AboutCopyWith<About> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutCopyWith<$Res> {
  factory $AboutCopyWith(About value, $Res Function(About) then) =
      _$AboutCopyWithImpl<$Res, About>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'about') String? about,
      @JsonKey(name: 'access_type') String? accessType,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'member_count') int? memberCount,
      @JsonKey(name: 'is_pinned') bool? isPinned,
      @JsonKey(name: 'latest_post_time') String? latestPostTime,
      @JsonKey(name: 'members') List<Member>? members});
}

/// @nodoc
class _$AboutCopyWithImpl<$Res, $Val extends About>
    implements $AboutCopyWith<$Res> {
  _$AboutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of About
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? about = freezed,
    Object? accessType = freezed,
    Object? image = freezed,
    Object? memberCount = freezed,
    Object? isPinned = freezed,
    Object? latestPostTime = freezed,
    Object? members = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      accessType: freezed == accessType
          ? _value.accessType
          : accessType // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      memberCount: freezed == memberCount
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isPinned: freezed == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool?,
      latestPostTime: freezed == latestPostTime
          ? _value.latestPostTime
          : latestPostTime // ignore: cast_nullable_to_non_nullable
              as String?,
      members: freezed == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AboutImplCopyWith<$Res> implements $AboutCopyWith<$Res> {
  factory _$$AboutImplCopyWith(
          _$AboutImpl value, $Res Function(_$AboutImpl) then) =
      __$$AboutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'about') String? about,
      @JsonKey(name: 'access_type') String? accessType,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'member_count') int? memberCount,
      @JsonKey(name: 'is_pinned') bool? isPinned,
      @JsonKey(name: 'latest_post_time') String? latestPostTime,
      @JsonKey(name: 'members') List<Member>? members});
}

/// @nodoc
class __$$AboutImplCopyWithImpl<$Res>
    extends _$AboutCopyWithImpl<$Res, _$AboutImpl>
    implements _$$AboutImplCopyWith<$Res> {
  __$$AboutImplCopyWithImpl(
      _$AboutImpl _value, $Res Function(_$AboutImpl) _then)
      : super(_value, _then);

  /// Create a copy of About
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? about = freezed,
    Object? accessType = freezed,
    Object? image = freezed,
    Object? memberCount = freezed,
    Object? isPinned = freezed,
    Object? latestPostTime = freezed,
    Object? members = freezed,
  }) {
    return _then(_$AboutImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      accessType: freezed == accessType
          ? _value.accessType
          : accessType // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      memberCount: freezed == memberCount
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isPinned: freezed == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool?,
      latestPostTime: freezed == latestPostTime
          ? _value.latestPostTime
          : latestPostTime // ignore: cast_nullable_to_non_nullable
              as String?,
      members: freezed == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AboutImpl implements _About {
  const _$AboutImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'about') this.about,
      @JsonKey(name: 'access_type') this.accessType,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'member_count') this.memberCount,
      @JsonKey(name: 'is_pinned') this.isPinned,
      @JsonKey(name: 'latest_post_time') this.latestPostTime,
      @JsonKey(name: 'members') final List<Member>? members})
      : _members = members;

  factory _$AboutImpl.fromJson(Map<String, dynamic> json) =>
      _$$AboutImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'about')
  final String? about;
  @override
  @JsonKey(name: 'access_type')
  final String? accessType;
  @override
  @JsonKey(name: 'image')
  final String? image;
  @override
  @JsonKey(name: 'member_count')
  final int? memberCount;
  @override
  @JsonKey(name: 'is_pinned')
  final bool? isPinned;
  @override
  @JsonKey(name: 'latest_post_time')
  final String? latestPostTime;
  final List<Member>? _members;
  @override
  @JsonKey(name: 'members')
  List<Member>? get members {
    final value = _members;
    if (value == null) return null;
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'About(id: $id, name: $name, about: $about, accessType: $accessType, image: $image, memberCount: $memberCount, isPinned: $isPinned, latestPostTime: $latestPostTime, members: $members)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.accessType, accessType) ||
                other.accessType == accessType) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.memberCount, memberCount) ||
                other.memberCount == memberCount) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.latestPostTime, latestPostTime) ||
                other.latestPostTime == latestPostTime) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      about,
      accessType,
      image,
      memberCount,
      isPinned,
      latestPostTime,
      const DeepCollectionEquality().hash(_members));

  /// Create a copy of About
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutImplCopyWith<_$AboutImpl> get copyWith =>
      __$$AboutImplCopyWithImpl<_$AboutImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AboutImplToJson(
      this,
    );
  }
}

abstract class _About implements About {
  const factory _About(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'about') final String? about,
      @JsonKey(name: 'access_type') final String? accessType,
      @JsonKey(name: 'image') final String? image,
      @JsonKey(name: 'member_count') final int? memberCount,
      @JsonKey(name: 'is_pinned') final bool? isPinned,
      @JsonKey(name: 'latest_post_time') final String? latestPostTime,
      @JsonKey(name: 'members') final List<Member>? members}) = _$AboutImpl;

  factory _About.fromJson(Map<String, dynamic> json) = _$AboutImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'about')
  String? get about;
  @override
  @JsonKey(name: 'access_type')
  String? get accessType;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(name: 'member_count')
  int? get memberCount;
  @override
  @JsonKey(name: 'is_pinned')
  bool? get isPinned;
  @override
  @JsonKey(name: 'latest_post_time')
  String? get latestPostTime;
  @override
  @JsonKey(name: 'members')
  List<Member>? get members;

  /// Create a copy of About
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AboutImplCopyWith<_$AboutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Member _$MemberFromJson(Map<String, dynamic> json) {
  return _Member.fromJson(json);
}

/// @nodoc
mixin _$Member {
  @JsonKey(name: 'role')
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;

  /// Serializes this Member to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberCopyWith<Member> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) then) =
      _$MemberCopyWithImpl<$Res, Member>;
  @useResult
  $Res call(
      {@JsonKey(name: 'role') String? role, @JsonKey(name: 'user') User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$MemberCopyWithImpl<$Res, $Val extends Member>
    implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  /// Create a copy of Member
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
abstract class _$$MemberImplCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$$MemberImplCopyWith(
          _$MemberImpl value, $Res Function(_$MemberImpl) then) =
      __$$MemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'role') String? role, @JsonKey(name: 'user') User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$MemberImplCopyWithImpl<$Res>
    extends _$MemberCopyWithImpl<$Res, _$MemberImpl>
    implements _$$MemberImplCopyWith<$Res> {
  __$$MemberImplCopyWithImpl(
      _$MemberImpl _value, $Res Function(_$MemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? user = freezed,
  }) {
    return _then(_$MemberImpl(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberImpl implements _Member {
  const _$MemberImpl(
      {@JsonKey(name: 'role') this.role, @JsonKey(name: 'user') this.user});

  factory _$MemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberImplFromJson(json);

  @override
  @JsonKey(name: 'role')
  final String? role;
  @override
  @JsonKey(name: 'user')
  final User? user;

  @override
  String toString() {
    return 'Member(role: $role, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role, user);

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
      __$$MemberImplCopyWithImpl<_$MemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberImplToJson(
      this,
    );
  }
}

abstract class _Member implements Member {
  const factory _Member(
      {@JsonKey(name: 'role') final String? role,
      @JsonKey(name: 'user') final User? user}) = _$MemberImpl;

  factory _Member.fromJson(Map<String, dynamic> json) = _$MemberImpl.fromJson;

  @override
  @JsonKey(name: 'role')
  String? get role;
  @override
  @JsonKey(name: 'user')
  User? get user;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
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
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'occupation')
  String? get occupation => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_coach')
  bool? get isCoach => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'agora_chat_token')
  String? get agoraChatToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'agora_user_token')
  String? get agoraUserToken => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'occupation') String? occupation,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'is_coach') bool? isCoach,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'agora_chat_token') String? agoraChatToken,
      @JsonKey(name: 'agora_user_token') String? agoraUserToken});
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
    Object? isCoach = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? agoraChatToken = freezed,
    Object? agoraUserToken = freezed,
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
              as String?,
      occupation: freezed == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      isCoach: freezed == isCoach
          ? _value.isCoach
          : isCoach // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      agoraChatToken: freezed == agoraChatToken
          ? _value.agoraChatToken
          : agoraChatToken // ignore: cast_nullable_to_non_nullable
              as String?,
      agoraUserToken: freezed == agoraUserToken
          ? _value.agoraUserToken
          : agoraUserToken // ignore: cast_nullable_to_non_nullable
              as String?,
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
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'occupation') String? occupation,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'is_coach') bool? isCoach,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'agora_chat_token') String? agoraChatToken,
      @JsonKey(name: 'agora_user_token') String? agoraUserToken});
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
    Object? isCoach = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? agoraChatToken = freezed,
    Object? agoraUserToken = freezed,
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
              as String?,
      occupation: freezed == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      isCoach: freezed == isCoach
          ? _value.isCoach
          : isCoach // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      agoraChatToken: freezed == agoraChatToken
          ? _value.agoraChatToken
          : agoraChatToken // ignore: cast_nullable_to_non_nullable
              as String?,
      agoraUserToken: freezed == agoraUserToken
          ? _value.agoraUserToken
          : agoraUserToken // ignore: cast_nullable_to_non_nullable
              as String?,
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
      @JsonKey(name: 'is_coach') this.isCoach,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'agora_chat_token') this.agoraChatToken,
      @JsonKey(name: 'agora_user_token') this.agoraUserToken});

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
  final String? phoneNumber;
  @override
  @JsonKey(name: 'occupation')
  final String? occupation;
  @override
  @JsonKey(name: 'image')
  final String? image;
  @override
  @JsonKey(name: 'is_coach')
  final bool? isCoach;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'agora_chat_token')
  final String? agoraChatToken;
  @override
  @JsonKey(name: 'agora_user_token')
  final String? agoraUserToken;

  @override
  String toString() {
    return 'User(id: $id, fullName: $fullName, slug: $slug, email: $email, phoneNumber: $phoneNumber, occupation: $occupation, image: $image, isCoach: $isCoach, createdAt: $createdAt, updatedAt: $updatedAt, agoraChatToken: $agoraChatToken, agoraUserToken: $agoraUserToken)';
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
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.isCoach, isCoach) || other.isCoach == isCoach) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.agoraChatToken, agoraChatToken) ||
                other.agoraChatToken == agoraChatToken) &&
            (identical(other.agoraUserToken, agoraUserToken) ||
                other.agoraUserToken == agoraUserToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      slug,
      email,
      phoneNumber,
      occupation,
      image,
      isCoach,
      createdAt,
      updatedAt,
      agoraChatToken,
      agoraUserToken);

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
          @JsonKey(name: 'phone_number') final String? phoneNumber,
          @JsonKey(name: 'occupation') final String? occupation,
          @JsonKey(name: 'image') final String? image,
          @JsonKey(name: 'is_coach') final bool? isCoach,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt,
          @JsonKey(name: 'agora_chat_token') final String? agoraChatToken,
          @JsonKey(name: 'agora_user_token') final String? agoraUserToken}) =
      _$UserImpl;

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
  String? get phoneNumber;
  @override
  @JsonKey(name: 'occupation')
  String? get occupation;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(name: 'is_coach')
  bool? get isCoach;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'agora_chat_token')
  String? get agoraChatToken;
  @override
  @JsonKey(name: 'agora_user_token')
  String? get agoraUserToken;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
