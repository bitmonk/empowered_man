// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupDetailsModel _$GroupDetailsModelFromJson(Map<String, dynamic> json) {
  return _GroupDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$GroupDetailsModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  GroupData? get data => throw _privateConstructorUsedError;

  /// Serializes this GroupDetailsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupDetailsModelCopyWith<GroupDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupDetailsModelCopyWith<$Res> {
  factory $GroupDetailsModelCopyWith(
          GroupDetailsModel value, $Res Function(GroupDetailsModel) then) =
      _$GroupDetailsModelCopyWithImpl<$Res, GroupDetailsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') GroupData? data});

  $GroupDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GroupDetailsModelCopyWithImpl<$Res, $Val extends GroupDetailsModel>
    implements $GroupDetailsModelCopyWith<$Res> {
  _$GroupDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupDetailsModel
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
              as GroupData?,
    ) as $Val);
  }

  /// Create a copy of GroupDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $GroupDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroupDetailsModelImplCopyWith<$Res>
    implements $GroupDetailsModelCopyWith<$Res> {
  factory _$$GroupDetailsModelImplCopyWith(_$GroupDetailsModelImpl value,
          $Res Function(_$GroupDetailsModelImpl) then) =
      __$$GroupDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') GroupData? data});

  @override
  $GroupDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$GroupDetailsModelImplCopyWithImpl<$Res>
    extends _$GroupDetailsModelCopyWithImpl<$Res, _$GroupDetailsModelImpl>
    implements _$$GroupDetailsModelImplCopyWith<$Res> {
  __$$GroupDetailsModelImplCopyWithImpl(_$GroupDetailsModelImpl _value,
      $Res Function(_$GroupDetailsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GroupDetailsModelImpl(
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
              as GroupData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupDetailsModelImpl implements _GroupDetailsModel {
  const _$GroupDetailsModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$GroupDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupDetailsModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'data')
  final GroupData? data;

  @override
  String toString() {
    return 'GroupDetailsModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupDetailsModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of GroupDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupDetailsModelImplCopyWith<_$GroupDetailsModelImpl> get copyWith =>
      __$$GroupDetailsModelImplCopyWithImpl<_$GroupDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _GroupDetailsModel implements GroupDetailsModel {
  const factory _GroupDetailsModel(
      {@JsonKey(name: 'status') final bool? status,
      @JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'data') final GroupData? data}) = _$GroupDetailsModelImpl;

  factory _GroupDetailsModel.fromJson(Map<String, dynamic> json) =
      _$GroupDetailsModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  GroupData? get data;

  /// Create a copy of GroupDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupDetailsModelImplCopyWith<_$GroupDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroupData _$GroupDataFromJson(Map<String, dynamic> json) {
  return _GroupData.fromJson(json);
}

/// @nodoc
mixin _$GroupData {
  @JsonKey(name: 'group_details')
  GroupDetail? get groupDetails => throw _privateConstructorUsedError;

  /// Serializes this GroupData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupDataCopyWith<GroupData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupDataCopyWith<$Res> {
  factory $GroupDataCopyWith(GroupData value, $Res Function(GroupData) then) =
      _$GroupDataCopyWithImpl<$Res, GroupData>;
  @useResult
  $Res call({@JsonKey(name: 'group_details') GroupDetail? groupDetails});

  $GroupDetailCopyWith<$Res>? get groupDetails;
}

/// @nodoc
class _$GroupDataCopyWithImpl<$Res, $Val extends GroupData>
    implements $GroupDataCopyWith<$Res> {
  _$GroupDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupDetails = freezed,
  }) {
    return _then(_value.copyWith(
      groupDetails: freezed == groupDetails
          ? _value.groupDetails
          : groupDetails // ignore: cast_nullable_to_non_nullable
              as GroupDetail?,
    ) as $Val);
  }

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupDetailCopyWith<$Res>? get groupDetails {
    if (_value.groupDetails == null) {
      return null;
    }

    return $GroupDetailCopyWith<$Res>(_value.groupDetails!, (value) {
      return _then(_value.copyWith(groupDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroupDataImplCopyWith<$Res>
    implements $GroupDataCopyWith<$Res> {
  factory _$$GroupDataImplCopyWith(
          _$GroupDataImpl value, $Res Function(_$GroupDataImpl) then) =
      __$$GroupDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'group_details') GroupDetail? groupDetails});

  @override
  $GroupDetailCopyWith<$Res>? get groupDetails;
}

/// @nodoc
class __$$GroupDataImplCopyWithImpl<$Res>
    extends _$GroupDataCopyWithImpl<$Res, _$GroupDataImpl>
    implements _$$GroupDataImplCopyWith<$Res> {
  __$$GroupDataImplCopyWithImpl(
      _$GroupDataImpl _value, $Res Function(_$GroupDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupDetails = freezed,
  }) {
    return _then(_$GroupDataImpl(
      groupDetails: freezed == groupDetails
          ? _value.groupDetails
          : groupDetails // ignore: cast_nullable_to_non_nullable
              as GroupDetail?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupDataImpl implements _GroupData {
  const _$GroupDataImpl({@JsonKey(name: 'group_details') this.groupDetails});

  factory _$GroupDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupDataImplFromJson(json);

  @override
  @JsonKey(name: 'group_details')
  final GroupDetail? groupDetails;

  @override
  String toString() {
    return 'GroupData(groupDetails: $groupDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupDataImpl &&
            (identical(other.groupDetails, groupDetails) ||
                other.groupDetails == groupDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, groupDetails);

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupDataImplCopyWith<_$GroupDataImpl> get copyWith =>
      __$$GroupDataImplCopyWithImpl<_$GroupDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupDataImplToJson(
      this,
    );
  }
}

abstract class _GroupData implements GroupData {
  const factory _GroupData(
          {@JsonKey(name: 'group_details') final GroupDetail? groupDetails}) =
      _$GroupDataImpl;

  factory _GroupData.fromJson(Map<String, dynamic> json) =
      _$GroupDataImpl.fromJson;

  @override
  @JsonKey(name: 'group_details')
  GroupDetail? get groupDetails;

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupDataImplCopyWith<_$GroupDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroupDetail _$GroupDetailFromJson(Map<String, dynamic> json) {
  return _GroupDetail.fromJson(json);
}

/// @nodoc
mixin _$GroupDetail {
  List<Post>? get posts => throw _privateConstructorUsedError;
  About? get about => throw _privateConstructorUsedError;
  List<String>? get media => throw _privateConstructorUsedError;
  List<Post>? get savedPosts => throw _privateConstructorUsedError;

  /// Serializes this GroupDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupDetailCopyWith<GroupDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupDetailCopyWith<$Res> {
  factory $GroupDetailCopyWith(
          GroupDetail value, $Res Function(GroupDetail) then) =
      _$GroupDetailCopyWithImpl<$Res, GroupDetail>;
  @useResult
  $Res call(
      {List<Post>? posts,
      About? about,
      List<String>? media,
      List<Post>? savedPosts});

  $AboutCopyWith<$Res>? get about;
}

/// @nodoc
class _$GroupDetailCopyWithImpl<$Res, $Val extends GroupDetail>
    implements $GroupDetailCopyWith<$Res> {
  _$GroupDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = freezed,
    Object? about = freezed,
    Object? media = freezed,
    Object? savedPosts = freezed,
  }) {
    return _then(_value.copyWith(
      posts: freezed == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as About?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      savedPosts: freezed == savedPosts
          ? _value.savedPosts
          : savedPosts // ignore: cast_nullable_to_non_nullable
              as List<Post>?,
    ) as $Val);
  }

  /// Create a copy of GroupDetail
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
abstract class _$$GroupDetailImplCopyWith<$Res>
    implements $GroupDetailCopyWith<$Res> {
  factory _$$GroupDetailImplCopyWith(
          _$GroupDetailImpl value, $Res Function(_$GroupDetailImpl) then) =
      __$$GroupDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Post>? posts,
      About? about,
      List<String>? media,
      List<Post>? savedPosts});

  @override
  $AboutCopyWith<$Res>? get about;
}

/// @nodoc
class __$$GroupDetailImplCopyWithImpl<$Res>
    extends _$GroupDetailCopyWithImpl<$Res, _$GroupDetailImpl>
    implements _$$GroupDetailImplCopyWith<$Res> {
  __$$GroupDetailImplCopyWithImpl(
      _$GroupDetailImpl _value, $Res Function(_$GroupDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = freezed,
    Object? about = freezed,
    Object? media = freezed,
    Object? savedPosts = freezed,
  }) {
    return _then(_$GroupDetailImpl(
      posts: freezed == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as About?,
      media: freezed == media
          ? _value._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      savedPosts: freezed == savedPosts
          ? _value._savedPosts
          : savedPosts // ignore: cast_nullable_to_non_nullable
              as List<Post>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupDetailImpl implements _GroupDetail {
  const _$GroupDetailImpl(
      {final List<Post>? posts,
      this.about,
      final List<String>? media,
      final List<Post>? savedPosts})
      : _posts = posts,
        _media = media,
        _savedPosts = savedPosts;

  factory _$GroupDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupDetailImplFromJson(json);

  final List<Post>? _posts;
  @override
  List<Post>? get posts {
    final value = _posts;
    if (value == null) return null;
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final About? about;
  final List<String>? _media;
  @override
  List<String>? get media {
    final value = _media;
    if (value == null) return null;
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Post>? _savedPosts;
  @override
  List<Post>? get savedPosts {
    final value = _savedPosts;
    if (value == null) return null;
    if (_savedPosts is EqualUnmodifiableListView) return _savedPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GroupDetail(posts: $posts, about: $about, media: $media, savedPosts: $savedPosts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupDetailImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.about, about) || other.about == about) &&
            const DeepCollectionEquality().equals(other._media, _media) &&
            const DeepCollectionEquality()
                .equals(other._savedPosts, _savedPosts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_posts),
      about,
      const DeepCollectionEquality().hash(_media),
      const DeepCollectionEquality().hash(_savedPosts));

  /// Create a copy of GroupDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupDetailImplCopyWith<_$GroupDetailImpl> get copyWith =>
      __$$GroupDetailImplCopyWithImpl<_$GroupDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupDetailImplToJson(
      this,
    );
  }
}

abstract class _GroupDetail implements GroupDetail {
  const factory _GroupDetail(
      {final List<Post>? posts,
      final About? about,
      final List<String>? media,
      final List<Post>? savedPosts}) = _$GroupDetailImpl;

  factory _GroupDetail.fromJson(Map<String, dynamic> json) =
      _$GroupDetailImpl.fromJson;

  @override
  List<Post>? get posts;
  @override
  About? get about;
  @override
  List<String>? get media;
  @override
  List<Post>? get savedPosts;

  /// Create a copy of GroupDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupDetailImplCopyWith<_$GroupDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  int? get id => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_id')
  int? get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  User? get createdBy => throw _privateConstructorUsedError;
  List<String>? get media => throw _privateConstructorUsedError;
  List<dynamic>? get comments => throw _privateConstructorUsedError;
  @JsonKey(name: 'likes_count')
  int? get likesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'comments_count')
  int? get commentsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_bookmarked')
  bool? get isBookmarked => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {int? id,
      String? text,
      @JsonKey(name: 'group_id') int? groupId,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'created_by') User? createdBy,
      List<String>? media,
      List<dynamic>? comments,
      @JsonKey(name: 'likes_count') int? likesCount,
      @JsonKey(name: 'comments_count') int? commentsCount,
      @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});

  $UserCopyWith<$Res>? get createdBy;
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? groupId = freezed,
    Object? userId = freezed,
    Object? createdBy = freezed,
    Object? media = freezed,
    Object? comments = freezed,
    Object? likesCount = freezed,
    Object? commentsCount = freezed,
    Object? isBookmarked = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      likesCount: freezed == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      commentsCount: freezed == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? text,
      @JsonKey(name: 'group_id') int? groupId,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'created_by') User? createdBy,
      List<String>? media,
      List<dynamic>? comments,
      @JsonKey(name: 'likes_count') int? likesCount,
      @JsonKey(name: 'comments_count') int? commentsCount,
      @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});

  @override
  $UserCopyWith<$Res>? get createdBy;
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? groupId = freezed,
    Object? userId = freezed,
    Object? createdBy = freezed,
    Object? media = freezed,
    Object? comments = freezed,
    Object? likesCount = freezed,
    Object? commentsCount = freezed,
    Object? isBookmarked = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PostImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User?,
      media: freezed == media
          ? _value._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      comments: freezed == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      likesCount: freezed == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      commentsCount: freezed == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {this.id,
      this.text,
      @JsonKey(name: 'group_id') this.groupId,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'created_by') this.createdBy,
      final List<String>? media,
      final List<dynamic>? comments,
      @JsonKey(name: 'likes_count') this.likesCount,
      @JsonKey(name: 'comments_count') this.commentsCount,
      @JsonKey(name: 'is_bookmarked') this.isBookmarked,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : _media = media,
        _comments = comments;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  final int? id;
  @override
  final String? text;
  @override
  @JsonKey(name: 'group_id')
  final int? groupId;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'created_by')
  final User? createdBy;
  final List<String>? _media;
  @override
  List<String>? get media {
    final value = _media;
    if (value == null) return null;
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _comments;
  @override
  List<dynamic>? get comments {
    final value = _comments;
    if (value == null) return null;
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'likes_count')
  final int? likesCount;
  @override
  @JsonKey(name: 'comments_count')
  final int? commentsCount;
  @override
  @JsonKey(name: 'is_bookmarked')
  final bool? isBookmarked;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'Post(id: $id, text: $text, groupId: $groupId, userId: $userId, createdBy: $createdBy, media: $media, comments: $comments, likesCount: $likesCount, commentsCount: $commentsCount, isBookmarked: $isBookmarked, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            const DeepCollectionEquality().equals(other._media, _media) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
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
      text,
      groupId,
      userId,
      createdBy,
      const DeepCollectionEquality().hash(_media),
      const DeepCollectionEquality().hash(_comments),
      likesCount,
      commentsCount,
      isBookmarked,
      createdAt,
      updatedAt);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {final int? id,
      final String? text,
      @JsonKey(name: 'group_id') final int? groupId,
      @JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'created_by') final User? createdBy,
      final List<String>? media,
      final List<dynamic>? comments,
      @JsonKey(name: 'likes_count') final int? likesCount,
      @JsonKey(name: 'comments_count') final int? commentsCount,
      @JsonKey(name: 'is_bookmarked') final bool? isBookmarked,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  int? get id;
  @override
  String? get text;
  @override
  @JsonKey(name: 'group_id')
  int? get groupId;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'created_by')
  User? get createdBy;
  @override
  List<String>? get media;
  @override
  List<dynamic>? get comments;
  @override
  @JsonKey(name: 'likes_count')
  int? get likesCount;
  @override
  @JsonKey(name: 'comments_count')
  int? get commentsCount;
  @override
  @JsonKey(name: 'is_bookmarked')
  bool? get isBookmarked;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

About _$AboutFromJson(Map<String, dynamic> json) {
  return _About.fromJson(json);
}

/// @nodoc
mixin _$About {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_type')
  String? get accessType => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_count')
  int? get memberCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_pinned')
  bool? get isPinned => throw _privateConstructorUsedError;
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
      {int? id,
      String? name,
      String? about,
      @JsonKey(name: 'access_type') String? accessType,
      String? image,
      @JsonKey(name: 'member_count') int? memberCount,
      @JsonKey(name: 'is_pinned') bool? isPinned,
      List<Member>? members});
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
      {int? id,
      String? name,
      String? about,
      @JsonKey(name: 'access_type') String? accessType,
      String? image,
      @JsonKey(name: 'member_count') int? memberCount,
      @JsonKey(name: 'is_pinned') bool? isPinned,
      List<Member>? members});
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
      {this.id,
      this.name,
      this.about,
      @JsonKey(name: 'access_type') this.accessType,
      this.image,
      @JsonKey(name: 'member_count') this.memberCount,
      @JsonKey(name: 'is_pinned') this.isPinned,
      final List<Member>? members})
      : _members = members;

  factory _$AboutImpl.fromJson(Map<String, dynamic> json) =>
      _$$AboutImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? about;
  @override
  @JsonKey(name: 'access_type')
  final String? accessType;
  @override
  final String? image;
  @override
  @JsonKey(name: 'member_count')
  final int? memberCount;
  @override
  @JsonKey(name: 'is_pinned')
  final bool? isPinned;
  final List<Member>? _members;
  @override
  List<Member>? get members {
    final value = _members;
    if (value == null) return null;
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'About(id: $id, name: $name, about: $about, accessType: $accessType, image: $image, memberCount: $memberCount, isPinned: $isPinned, members: $members)';
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
      {final int? id,
      final String? name,
      final String? about,
      @JsonKey(name: 'access_type') final String? accessType,
      final String? image,
      @JsonKey(name: 'member_count') final int? memberCount,
      @JsonKey(name: 'is_pinned') final bool? isPinned,
      final List<Member>? members}) = _$AboutImpl;

  factory _About.fromJson(Map<String, dynamic> json) = _$AboutImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get about;
  @override
  @JsonKey(name: 'access_type')
  String? get accessType;
  @override
  String? get image;
  @override
  @JsonKey(name: 'member_count')
  int? get memberCount;
  @override
  @JsonKey(name: 'is_pinned')
  bool? get isPinned;
  @override
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
  String? get role => throw _privateConstructorUsedError;
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
  $Res call({String? role, User? user});

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
  $Res call({String? role, User? user});

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
  const _$MemberImpl({this.role, this.user});

  factory _$MemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberImplFromJson(json);

  @override
  final String? role;
  @override
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
  const factory _Member({final String? role, final User? user}) = _$MemberImpl;

  factory _Member.fromJson(Map<String, dynamic> json) = _$MemberImpl.fromJson;

  @override
  String? get role;
  @override
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
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get occupation => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_coach')
  bool? get isCoach => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
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
      {int? id,
      @JsonKey(name: 'full_name') String? fullName,
      String? slug,
      String? email,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      String? occupation,
      String? image,
      @JsonKey(name: 'is_coach') bool? isCoach,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
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
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {int? id,
      @JsonKey(name: 'full_name') String? fullName,
      String? slug,
      String? email,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      String? occupation,
      String? image,
      @JsonKey(name: 'is_coach') bool? isCoach,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
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
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {this.id,
      @JsonKey(name: 'full_name') this.fullName,
      this.slug,
      this.email,
      @JsonKey(name: 'phone_number') this.phoneNumber,
      this.occupation,
      this.image,
      @JsonKey(name: 'is_coach') this.isCoach,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'agora_chat_token') this.agoraChatToken,
      @JsonKey(name: 'agora_user_token') this.agoraUserToken});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  final String? slug;
  @override
  final String? email;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  final String? occupation;
  @override
  final String? image;
  @override
  @JsonKey(name: 'is_coach')
  final bool? isCoach;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
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
          {final int? id,
          @JsonKey(name: 'full_name') final String? fullName,
          final String? slug,
          final String? email,
          @JsonKey(name: 'phone_number') final String? phoneNumber,
          final String? occupation,
          final String? image,
          @JsonKey(name: 'is_coach') final bool? isCoach,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'updated_at') final String? updatedAt,
          @JsonKey(name: 'agora_chat_token') final String? agoraChatToken,
          @JsonKey(name: 'agora_user_token') final String? agoraUserToken}) =
      _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  String? get slug;
  @override
  String? get email;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  String? get occupation;
  @override
  String? get image;
  @override
  @JsonKey(name: 'is_coach')
  bool? get isCoach;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
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
