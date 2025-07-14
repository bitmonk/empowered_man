// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_replies_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentRepliesModel _$CommentRepliesModelFromJson(Map<String, dynamic> json) {
  return _CommentRepliesModel.fromJson(json);
}

/// @nodoc
mixin _$CommentRepliesModel {
  @JsonKey(name: "status")
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  RepliesData? get repliesData => throw _privateConstructorUsedError;

  /// Serializes this CommentRepliesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentRepliesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentRepliesModelCopyWith<CommentRepliesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentRepliesModelCopyWith<$Res> {
  factory $CommentRepliesModelCopyWith(
          CommentRepliesModel value, $Res Function(CommentRepliesModel) then) =
      _$CommentRepliesModelCopyWithImpl<$Res, CommentRepliesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") RepliesData? repliesData});

  $RepliesDataCopyWith<$Res>? get repliesData;
}

/// @nodoc
class _$CommentRepliesModelCopyWithImpl<$Res, $Val extends CommentRepliesModel>
    implements $CommentRepliesModelCopyWith<$Res> {
  _$CommentRepliesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentRepliesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? repliesData = freezed,
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
      repliesData: freezed == repliesData
          ? _value.repliesData
          : repliesData // ignore: cast_nullable_to_non_nullable
              as RepliesData?,
    ) as $Val);
  }

  /// Create a copy of CommentRepliesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepliesDataCopyWith<$Res>? get repliesData {
    if (_value.repliesData == null) {
      return null;
    }

    return $RepliesDataCopyWith<$Res>(_value.repliesData!, (value) {
      return _then(_value.copyWith(repliesData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentRepliesModelImplCopyWith<$Res>
    implements $CommentRepliesModelCopyWith<$Res> {
  factory _$$CommentRepliesModelImplCopyWith(_$CommentRepliesModelImpl value,
          $Res Function(_$CommentRepliesModelImpl) then) =
      __$$CommentRepliesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") RepliesData? repliesData});

  @override
  $RepliesDataCopyWith<$Res>? get repliesData;
}

/// @nodoc
class __$$CommentRepliesModelImplCopyWithImpl<$Res>
    extends _$CommentRepliesModelCopyWithImpl<$Res, _$CommentRepliesModelImpl>
    implements _$$CommentRepliesModelImplCopyWith<$Res> {
  __$$CommentRepliesModelImplCopyWithImpl(_$CommentRepliesModelImpl _value,
      $Res Function(_$CommentRepliesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentRepliesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? repliesData = freezed,
  }) {
    return _then(_$CommentRepliesModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      repliesData: freezed == repliesData
          ? _value.repliesData
          : repliesData // ignore: cast_nullable_to_non_nullable
              as RepliesData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentRepliesModelImpl implements _CommentRepliesModel {
  const _$CommentRepliesModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.repliesData});

  factory _$CommentRepliesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentRepliesModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final bool? status;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "data")
  final RepliesData? repliesData;

  @override
  String toString() {
    return 'CommentRepliesModel(status: $status, message: $message, repliesData: $repliesData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentRepliesModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.repliesData, repliesData) ||
                other.repliesData == repliesData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, repliesData);

  /// Create a copy of CommentRepliesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentRepliesModelImplCopyWith<_$CommentRepliesModelImpl> get copyWith =>
      __$$CommentRepliesModelImplCopyWithImpl<_$CommentRepliesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentRepliesModelImplToJson(
      this,
    );
  }
}

abstract class _CommentRepliesModel implements CommentRepliesModel {
  const factory _CommentRepliesModel(
          {@JsonKey(name: "status") final bool? status,
          @JsonKey(name: "message") final String? message,
          @JsonKey(name: "data") final RepliesData? repliesData}) =
      _$CommentRepliesModelImpl;

  factory _CommentRepliesModel.fromJson(Map<String, dynamic> json) =
      _$CommentRepliesModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  bool? get status;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "data")
  RepliesData? get repliesData;

  /// Create a copy of CommentRepliesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentRepliesModelImplCopyWith<_$CommentRepliesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RepliesData _$RepliesDataFromJson(Map<String, dynamic> json) {
  return _RepliesData.fromJson(json);
}

/// @nodoc
mixin _$RepliesData {
  @JsonKey(name: "comments")
  List<Comment>? get comments => throw _privateConstructorUsedError;
  @JsonKey(name: "meta")
  Meta? get meta => throw _privateConstructorUsedError;

  /// Serializes this RepliesData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepliesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepliesDataCopyWith<RepliesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepliesDataCopyWith<$Res> {
  factory $RepliesDataCopyWith(
          RepliesData value, $Res Function(RepliesData) then) =
      _$RepliesDataCopyWithImpl<$Res, RepliesData>;
  @useResult
  $Res call(
      {@JsonKey(name: "comments") List<Comment>? comments,
      @JsonKey(name: "meta") Meta? meta});

  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$RepliesDataCopyWithImpl<$Res, $Val extends RepliesData>
    implements $RepliesDataCopyWith<$Res> {
  _$RepliesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepliesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ) as $Val);
  }

  /// Create a copy of RepliesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RepliesDataImplCopyWith<$Res>
    implements $RepliesDataCopyWith<$Res> {
  factory _$$RepliesDataImplCopyWith(
          _$RepliesDataImpl value, $Res Function(_$RepliesDataImpl) then) =
      __$$RepliesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "comments") List<Comment>? comments,
      @JsonKey(name: "meta") Meta? meta});

  @override
  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$RepliesDataImplCopyWithImpl<$Res>
    extends _$RepliesDataCopyWithImpl<$Res, _$RepliesDataImpl>
    implements _$$RepliesDataImplCopyWith<$Res> {
  __$$RepliesDataImplCopyWithImpl(
      _$RepliesDataImpl _value, $Res Function(_$RepliesDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepliesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$RepliesDataImpl(
      comments: freezed == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepliesDataImpl implements _RepliesData {
  const _$RepliesDataImpl(
      {@JsonKey(name: "comments") final List<Comment>? comments,
      @JsonKey(name: "meta") this.meta})
      : _comments = comments;

  factory _$RepliesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepliesDataImplFromJson(json);

  final List<Comment>? _comments;
  @override
  @JsonKey(name: "comments")
  List<Comment>? get comments {
    final value = _comments;
    if (value == null) return null;
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "meta")
  final Meta? meta;

  @override
  String toString() {
    return 'RepliesData(comments: $comments, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepliesDataImpl &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_comments), meta);

  /// Create a copy of RepliesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepliesDataImplCopyWith<_$RepliesDataImpl> get copyWith =>
      __$$RepliesDataImplCopyWithImpl<_$RepliesDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepliesDataImplToJson(
      this,
    );
  }
}

abstract class _RepliesData implements RepliesData {
  const factory _RepliesData(
      {@JsonKey(name: "comments") final List<Comment>? comments,
      @JsonKey(name: "meta") final Meta? meta}) = _$RepliesDataImpl;

  factory _RepliesData.fromJson(Map<String, dynamic> json) =
      _$RepliesDataImpl.fromJson;

  @override
  @JsonKey(name: "comments")
  List<Comment>? get comments;
  @override
  @JsonKey(name: "meta")
  Meta? get meta;

  /// Create a copy of RepliesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepliesDataImplCopyWith<_$RepliesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "text")
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "user")
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: "likes_count")
  int? get likesCount => throw _privateConstructorUsedError;
  @JsonKey(name: "comments_count")
  int? get commentsCount => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Comment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "text") String? text,
      @JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "user") User? user,
      @JsonKey(name: "likes_count") int? likesCount,
      @JsonKey(name: "comments_count") int? commentsCount,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? userId = freezed,
    Object? user = freezed,
    Object? likesCount = freezed,
    Object? commentsCount = freezed,
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
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      likesCount: freezed == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      commentsCount: freezed == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
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

  /// Create a copy of Comment
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
abstract class _$$CommentImplCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$CommentImplCopyWith(
          _$CommentImpl value, $Res Function(_$CommentImpl) then) =
      __$$CommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "text") String? text,
      @JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "user") User? user,
      @JsonKey(name: "likes_count") int? likesCount,
      @JsonKey(name: "comments_count") int? commentsCount,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$CommentImplCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$CommentImpl>
    implements _$$CommentImplCopyWith<$Res> {
  __$$CommentImplCopyWithImpl(
      _$CommentImpl _value, $Res Function(_$CommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? userId = freezed,
    Object? user = freezed,
    Object? likesCount = freezed,
    Object? commentsCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CommentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      likesCount: freezed == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      commentsCount: freezed == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$CommentImpl implements _Comment {
  const _$CommentImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "text") this.text,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "user") this.user,
      @JsonKey(name: "likes_count") this.likesCount,
      @JsonKey(name: "comments_count") this.commentsCount,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt});

  factory _$CommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "text")
  final String? text;
  @override
  @JsonKey(name: "user_id")
  final int? userId;
  @override
  @JsonKey(name: "user")
  final User? user;
  @override
  @JsonKey(name: "likes_count")
  final int? likesCount;
  @override
  @JsonKey(name: "comments_count")
  final int? commentsCount;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Comment(id: $id, text: $text, userId: $userId, user: $user, likesCount: $likesCount, commentsCount: $commentsCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, userId, user,
      likesCount, commentsCount, createdAt, updatedAt);

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      __$$CommentImplCopyWithImpl<_$CommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentImplToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "text") final String? text,
      @JsonKey(name: "user_id") final int? userId,
      @JsonKey(name: "user") final User? user,
      @JsonKey(name: "likes_count") final int? likesCount,
      @JsonKey(name: "comments_count") final int? commentsCount,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      @JsonKey(name: "updated_at") final DateTime? updatedAt}) = _$CommentImpl;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$CommentImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "text")
  String? get text;
  @override
  @JsonKey(name: "user_id")
  int? get userId;
  @override
  @JsonKey(name: "user")
  User? get user;
  @override
  @JsonKey(name: "likes_count")
  int? get likesCount;
  @override
  @JsonKey(name: "comments_count")
  int? get commentsCount;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "full_name")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "occupation")
  String? get occupation => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "is_coach")
  bool? get isCoach => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "agora_chat_token")
  String? get agoraChatToken => throw _privateConstructorUsedError;
  @JsonKey(name: "agora_user_token")
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
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "occupation") String? occupation,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "is_coach") bool? isCoach,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      @JsonKey(name: "agora_chat_token") String? agoraChatToken,
      @JsonKey(name: "agora_user_token") String? agoraUserToken});
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
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "occupation") String? occupation,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "is_coach") bool? isCoach,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      @JsonKey(name: "agora_chat_token") String? agoraChatToken,
      @JsonKey(name: "agora_user_token") String? agoraUserToken});
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
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "full_name") this.fullName,
      @JsonKey(name: "slug") this.slug,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "phone_number") this.phoneNumber,
      @JsonKey(name: "occupation") this.occupation,
      @JsonKey(name: "image") this.image,
      @JsonKey(name: "is_coach") this.isCoach,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      @JsonKey(name: "agora_chat_token") this.agoraChatToken,
      @JsonKey(name: "agora_user_token") this.agoraUserToken});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "full_name")
  final String? fullName;
  @override
  @JsonKey(name: "slug")
  final String? slug;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @override
  @JsonKey(name: "occupation")
  final String? occupation;
  @override
  @JsonKey(name: "image")
  final String? image;
  @override
  @JsonKey(name: "is_coach")
  final bool? isCoach;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @override
  @JsonKey(name: "agora_chat_token")
  final String? agoraChatToken;
  @override
  @JsonKey(name: "agora_user_token")
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
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "full_name") final String? fullName,
          @JsonKey(name: "slug") final String? slug,
          @JsonKey(name: "email") final String? email,
          @JsonKey(name: "phone_number") final String? phoneNumber,
          @JsonKey(name: "occupation") final String? occupation,
          @JsonKey(name: "image") final String? image,
          @JsonKey(name: "is_coach") final bool? isCoach,
          @JsonKey(name: "created_at") final DateTime? createdAt,
          @JsonKey(name: "updated_at") final DateTime? updatedAt,
          @JsonKey(name: "agora_chat_token") final String? agoraChatToken,
          @JsonKey(name: "agora_user_token") final String? agoraUserToken}) =
      _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "full_name")
  String? get fullName;
  @override
  @JsonKey(name: "slug")
  String? get slug;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "phone_number")
  String? get phoneNumber;
  @override
  @JsonKey(name: "occupation")
  String? get occupation;
  @override
  @JsonKey(name: "image")
  String? get image;
  @override
  @JsonKey(name: "is_coach")
  bool? get isCoach;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "agora_chat_token")
  String? get agoraChatToken;
  @override
  @JsonKey(name: "agora_user_token")
  String? get agoraUserToken;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  @JsonKey(name: "current_page")
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "per_page")
  int? get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: "last_page")
  int? get lastPage => throw _privateConstructorUsedError;

  /// Serializes this Meta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call(
      {@JsonKey(name: "current_page") int? currentPage,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "per_page") int? perPage,
      @JsonKey(name: "last_page") int? lastPage});
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? total = freezed,
    Object? perPage = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaImplCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
          _$MetaImpl value, $Res Function(_$MetaImpl) then) =
      __$$MetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "current_page") int? currentPage,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "per_page") int? perPage,
      @JsonKey(name: "last_page") int? lastPage});
}

/// @nodoc
class __$$MetaImplCopyWithImpl<$Res>
    extends _$MetaCopyWithImpl<$Res, _$MetaImpl>
    implements _$$MetaImplCopyWith<$Res> {
  __$$MetaImplCopyWithImpl(_$MetaImpl _value, $Res Function(_$MetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? total = freezed,
    Object? perPage = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(_$MetaImpl(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaImpl implements _Meta {
  const _$MetaImpl(
      {@JsonKey(name: "current_page") this.currentPage,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "per_page") this.perPage,
      @JsonKey(name: "last_page") this.lastPage});

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  @JsonKey(name: "current_page")
  final int? currentPage;
  @override
  @JsonKey(name: "total")
  final int? total;
  @override
  @JsonKey(name: "per_page")
  final int? perPage;
  @override
  @JsonKey(name: "last_page")
  final int? lastPage;

  @override
  String toString() {
    return 'Meta(currentPage: $currentPage, total: $total, perPage: $perPage, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, total, perPage, lastPage);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      __$$MetaImplCopyWithImpl<_$MetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaImplToJson(
      this,
    );
  }
}

abstract class _Meta implements Meta {
  const factory _Meta(
      {@JsonKey(name: "current_page") final int? currentPage,
      @JsonKey(name: "total") final int? total,
      @JsonKey(name: "per_page") final int? perPage,
      @JsonKey(name: "last_page") final int? lastPage}) = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  @JsonKey(name: "current_page")
  int? get currentPage;
  @override
  @JsonKey(name: "total")
  int? get total;
  @override
  @JsonKey(name: "per_page")
  int? get perPage;
  @override
  @JsonKey(name: "last_page")
  int? get lastPage;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
