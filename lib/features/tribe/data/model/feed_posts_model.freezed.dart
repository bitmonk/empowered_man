// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_posts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeedPostsModel _$FeedPostsModelFromJson(Map<String, dynamic> json) {
  return _FeedPostsModel.fromJson(json);
}

/// @nodoc
mixin _$FeedPostsModel {
  @JsonKey(name: "status")
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  Data? get data => throw _privateConstructorUsedError;

  /// Serializes this FeedPostsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedPostsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedPostsModelCopyWith<FeedPostsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedPostsModelCopyWith<$Res> {
  factory $FeedPostsModelCopyWith(
          FeedPostsModel value, $Res Function(FeedPostsModel) then) =
      _$FeedPostsModelCopyWithImpl<$Res, FeedPostsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$FeedPostsModelCopyWithImpl<$Res, $Val extends FeedPostsModel>
    implements $FeedPostsModelCopyWith<$Res> {
  _$FeedPostsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedPostsModel
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

  /// Create a copy of FeedPostsModel
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
abstract class _$$FeedPostsModelImplCopyWith<$Res>
    implements $FeedPostsModelCopyWith<$Res> {
  factory _$$FeedPostsModelImplCopyWith(_$FeedPostsModelImpl value,
          $Res Function(_$FeedPostsModelImpl) then) =
      __$$FeedPostsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") Data? data});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$FeedPostsModelImplCopyWithImpl<$Res>
    extends _$FeedPostsModelCopyWithImpl<$Res, _$FeedPostsModelImpl>
    implements _$$FeedPostsModelImplCopyWith<$Res> {
  __$$FeedPostsModelImplCopyWithImpl(
      _$FeedPostsModelImpl _value, $Res Function(_$FeedPostsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedPostsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$FeedPostsModelImpl(
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
class _$FeedPostsModelImpl implements _FeedPostsModel {
  const _$FeedPostsModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$FeedPostsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedPostsModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final bool? status;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "data")
  final Data? data;

  @override
  String toString() {
    return 'FeedPostsModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedPostsModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of FeedPostsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedPostsModelImplCopyWith<_$FeedPostsModelImpl> get copyWith =>
      __$$FeedPostsModelImplCopyWithImpl<_$FeedPostsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedPostsModelImplToJson(
      this,
    );
  }
}

abstract class _FeedPostsModel implements FeedPostsModel {
  const factory _FeedPostsModel(
      {@JsonKey(name: "status") final bool? status,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data") final Data? data}) = _$FeedPostsModelImpl;

  factory _FeedPostsModel.fromJson(Map<String, dynamic> json) =
      _$FeedPostsModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  bool? get status;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "data")
  Data? get data;

  /// Create a copy of FeedPostsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedPostsModelImplCopyWith<_$FeedPostsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "posts")
  List<Post>? get posts => throw _privateConstructorUsedError;
  @JsonKey(name: "meta")
  Meta? get meta => throw _privateConstructorUsedError;

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
  $Res call(
      {@JsonKey(name: "posts") List<Post>? posts,
      @JsonKey(name: "meta") Meta? meta});

  $MetaCopyWith<$Res>? get meta;
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
    Object? posts = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      posts: freezed == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ) as $Val);
  }

  /// Create a copy of Data
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
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "posts") List<Post>? posts,
      @JsonKey(name: "meta") Meta? meta});

  @override
  $MetaCopyWith<$Res>? get meta;
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
    Object? posts = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$DataImpl(
      posts: freezed == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: "posts") final List<Post>? posts,
      @JsonKey(name: "meta") this.meta})
      : _posts = posts;

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  final List<Post>? _posts;
  @override
  @JsonKey(name: "posts")
  List<Post>? get posts {
    final value = _posts;
    if (value == null) return null;
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "meta")
  final Meta? meta;

  @override
  String toString() {
    return 'Data(posts: $posts, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_posts), meta);

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
      {@JsonKey(name: "posts") final List<Post>? posts,
      @JsonKey(name: "meta") final Meta? meta}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "posts")
  List<Post>? get posts;
  @override
  @JsonKey(name: "meta")
  Meta? get meta;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
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

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "text")
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: "group_id")
  int? get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "created_by")
  CreatedBy? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: "media")
  Media? get media => throw _privateConstructorUsedError;
  @JsonKey(name: "liked_by_current_user")
  bool? get likedByCurrentUser => throw _privateConstructorUsedError;
  @JsonKey(name: "likes_count")
  int? get likesCount => throw _privateConstructorUsedError;
  @JsonKey(name: "comments_count")
  int? get commentsCount => throw _privateConstructorUsedError;
  @JsonKey(name: "is_bookmarked")
  bool? get isBookmarked => throw _privateConstructorUsedError;
  @JsonKey(name: "is_hidden")
  bool? get isHidden => throw _privateConstructorUsedError;
  @JsonKey(name: "tagged_users")
  List<dynamic>? get taggedUsers => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "text") String? text,
      @JsonKey(name: "group_id") int? groupId,
      @JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "created_by") CreatedBy? createdBy,
      @JsonKey(name: "media") Media? media,
      @JsonKey(name: "liked_by_current_user") bool? likedByCurrentUser,
      @JsonKey(name: "likes_count") int? likesCount,
      @JsonKey(name: "comments_count") int? commentsCount,
      @JsonKey(name: "is_bookmarked") bool? isBookmarked,
      @JsonKey(name: "is_hidden") bool? isHidden,
      @JsonKey(name: "tagged_users") List<dynamic>? taggedUsers,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt});

  $CreatedByCopyWith<$Res>? get createdBy;
  $MediaCopyWith<$Res>? get media;
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
    Object? likedByCurrentUser = freezed,
    Object? likesCount = freezed,
    Object? commentsCount = freezed,
    Object? isBookmarked = freezed,
    Object? isHidden = freezed,
    Object? taggedUsers = freezed,
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
              as CreatedBy?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media?,
      likedByCurrentUser: freezed == likedByCurrentUser
          ? _value.likedByCurrentUser
          : likedByCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      isHidden: freezed == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      taggedUsers: freezed == taggedUsers
          ? _value.taggedUsers
          : taggedUsers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
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

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreatedByCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $CreatedByCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MediaCopyWith<$Res>? get media {
    if (_value.media == null) {
      return null;
    }

    return $MediaCopyWith<$Res>(_value.media!, (value) {
      return _then(_value.copyWith(media: value) as $Val);
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
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "text") String? text,
      @JsonKey(name: "group_id") int? groupId,
      @JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "created_by") CreatedBy? createdBy,
      @JsonKey(name: "media") Media? media,
      @JsonKey(name: "liked_by_current_user") bool? likedByCurrentUser,
      @JsonKey(name: "likes_count") int? likesCount,
      @JsonKey(name: "comments_count") int? commentsCount,
      @JsonKey(name: "is_bookmarked") bool? isBookmarked,
      @JsonKey(name: "is_hidden") bool? isHidden,
      @JsonKey(name: "tagged_users") List<dynamic>? taggedUsers,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt});

  @override
  $CreatedByCopyWith<$Res>? get createdBy;
  @override
  $MediaCopyWith<$Res>? get media;
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
    Object? likedByCurrentUser = freezed,
    Object? likesCount = freezed,
    Object? commentsCount = freezed,
    Object? isBookmarked = freezed,
    Object? isHidden = freezed,
    Object? taggedUsers = freezed,
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
              as CreatedBy?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media?,
      likedByCurrentUser: freezed == likedByCurrentUser
          ? _value.likedByCurrentUser
          : likedByCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      isHidden: freezed == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      taggedUsers: freezed == taggedUsers
          ? _value._taggedUsers
          : taggedUsers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
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
class _$PostImpl implements _Post {
  const _$PostImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "text") this.text,
      @JsonKey(name: "group_id") this.groupId,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "created_by") this.createdBy,
      @JsonKey(name: "media") this.media,
      @JsonKey(name: "liked_by_current_user") this.likedByCurrentUser,
      @JsonKey(name: "likes_count") this.likesCount,
      @JsonKey(name: "comments_count") this.commentsCount,
      @JsonKey(name: "is_bookmarked") this.isBookmarked,
      @JsonKey(name: "is_hidden") this.isHidden,
      @JsonKey(name: "tagged_users") final List<dynamic>? taggedUsers,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt})
      : _taggedUsers = taggedUsers;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "text")
  final String? text;
  @override
  @JsonKey(name: "group_id")
  final int? groupId;
  @override
  @JsonKey(name: "user_id")
  final int? userId;
  @override
  @JsonKey(name: "created_by")
  final CreatedBy? createdBy;
  @override
  @JsonKey(name: "media")
  final Media? media;
  @override
  @JsonKey(name: "liked_by_current_user")
  final bool? likedByCurrentUser;
  @override
  @JsonKey(name: "likes_count")
  final int? likesCount;
  @override
  @JsonKey(name: "comments_count")
  final int? commentsCount;
  @override
  @JsonKey(name: "is_bookmarked")
  final bool? isBookmarked;
  @override
  @JsonKey(name: "is_hidden")
  final bool? isHidden;
  final List<dynamic>? _taggedUsers;
  @override
  @JsonKey(name: "tagged_users")
  List<dynamic>? get taggedUsers {
    final value = _taggedUsers;
    if (value == null) return null;
    if (_taggedUsers is EqualUnmodifiableListView) return _taggedUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Post(id: $id, text: $text, groupId: $groupId, userId: $userId, createdBy: $createdBy, media: $media, likedByCurrentUser: $likedByCurrentUser, likesCount: $likesCount, commentsCount: $commentsCount, isBookmarked: $isBookmarked, isHidden: $isHidden, taggedUsers: $taggedUsers, createdAt: $createdAt, updatedAt: $updatedAt)';
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
            (identical(other.media, media) || other.media == media) &&
            (identical(other.likedByCurrentUser, likedByCurrentUser) ||
                other.likedByCurrentUser == likedByCurrentUser) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            const DeepCollectionEquality()
                .equals(other._taggedUsers, _taggedUsers) &&
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
      media,
      likedByCurrentUser,
      likesCount,
      commentsCount,
      isBookmarked,
      isHidden,
      const DeepCollectionEquality().hash(_taggedUsers),
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
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "text") final String? text,
      @JsonKey(name: "group_id") final int? groupId,
      @JsonKey(name: "user_id") final int? userId,
      @JsonKey(name: "created_by") final CreatedBy? createdBy,
      @JsonKey(name: "media") final Media? media,
      @JsonKey(name: "liked_by_current_user") final bool? likedByCurrentUser,
      @JsonKey(name: "likes_count") final int? likesCount,
      @JsonKey(name: "comments_count") final int? commentsCount,
      @JsonKey(name: "is_bookmarked") final bool? isBookmarked,
      @JsonKey(name: "is_hidden") final bool? isHidden,
      @JsonKey(name: "tagged_users") final List<dynamic>? taggedUsers,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      @JsonKey(name: "updated_at") final DateTime? updatedAt}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "text")
  String? get text;
  @override
  @JsonKey(name: "group_id")
  int? get groupId;
  @override
  @JsonKey(name: "user_id")
  int? get userId;
  @override
  @JsonKey(name: "created_by")
  CreatedBy? get createdBy;
  @override
  @JsonKey(name: "media")
  Media? get media;
  @override
  @JsonKey(name: "liked_by_current_user")
  bool? get likedByCurrentUser;
  @override
  @JsonKey(name: "likes_count")
  int? get likesCount;
  @override
  @JsonKey(name: "comments_count")
  int? get commentsCount;
  @override
  @JsonKey(name: "is_bookmarked")
  bool? get isBookmarked;
  @override
  @JsonKey(name: "is_hidden")
  bool? get isHidden;
  @override
  @JsonKey(name: "tagged_users")
  List<dynamic>? get taggedUsers;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) {
  return _CreatedBy.fromJson(json);
}

/// @nodoc
mixin _$CreatedBy {
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

  /// Serializes this CreatedBy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatedBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatedByCopyWith<CreatedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedByCopyWith<$Res> {
  factory $CreatedByCopyWith(CreatedBy value, $Res Function(CreatedBy) then) =
      _$CreatedByCopyWithImpl<$Res, CreatedBy>;
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
class _$CreatedByCopyWithImpl<$Res, $Val extends CreatedBy>
    implements $CreatedByCopyWith<$Res> {
  _$CreatedByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatedBy
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
abstract class _$$CreatedByImplCopyWith<$Res>
    implements $CreatedByCopyWith<$Res> {
  factory _$$CreatedByImplCopyWith(
          _$CreatedByImpl value, $Res Function(_$CreatedByImpl) then) =
      __$$CreatedByImplCopyWithImpl<$Res>;
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
class __$$CreatedByImplCopyWithImpl<$Res>
    extends _$CreatedByCopyWithImpl<$Res, _$CreatedByImpl>
    implements _$$CreatedByImplCopyWith<$Res> {
  __$$CreatedByImplCopyWithImpl(
      _$CreatedByImpl _value, $Res Function(_$CreatedByImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatedBy
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
    return _then(_$CreatedByImpl(
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
class _$CreatedByImpl implements _CreatedBy {
  const _$CreatedByImpl(
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

  factory _$CreatedByImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatedByImplFromJson(json);

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
    return 'CreatedBy(id: $id, fullName: $fullName, slug: $slug, email: $email, phoneNumber: $phoneNumber, occupation: $occupation, image: $image, isCoach: $isCoach, createdAt: $createdAt, updatedAt: $updatedAt, agoraChatToken: $agoraChatToken, agoraUserToken: $agoraUserToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedByImpl &&
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

  /// Create a copy of CreatedBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatedByImplCopyWith<_$CreatedByImpl> get copyWith =>
      __$$CreatedByImplCopyWithImpl<_$CreatedByImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatedByImplToJson(
      this,
    );
  }
}

abstract class _CreatedBy implements CreatedBy {
  const factory _CreatedBy(
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
      _$CreatedByImpl;

  factory _CreatedBy.fromJson(Map<String, dynamic> json) =
      _$CreatedByImpl.fromJson;

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

  /// Create a copy of CreatedBy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatedByImplCopyWith<_$CreatedByImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Media _$MediaFromJson(Map<String, dynamic> json) {
  return _Media.fromJson(json);
}

/// @nodoc
mixin _$Media {
  @JsonKey(name: "images")
  List<String>? get images => throw _privateConstructorUsedError;
  @JsonKey(name: "videos")
  List<dynamic>? get videos => throw _privateConstructorUsedError;
  @JsonKey(name: "documents")
  List<dynamic>? get documents => throw _privateConstructorUsedError;

  /// Serializes this Media to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaCopyWith<Media> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCopyWith<$Res> {
  factory $MediaCopyWith(Media value, $Res Function(Media) then) =
      _$MediaCopyWithImpl<$Res, Media>;
  @useResult
  $Res call(
      {@JsonKey(name: "images") List<String>? images,
      @JsonKey(name: "videos") List<dynamic>? videos,
      @JsonKey(name: "documents") List<dynamic>? documents});
}

/// @nodoc
class _$MediaCopyWithImpl<$Res, $Val extends Media>
    implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = freezed,
    Object? videos = freezed,
    Object? documents = freezed,
  }) {
    return _then(_value.copyWith(
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      documents: freezed == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaImplCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$$MediaImplCopyWith(
          _$MediaImpl value, $Res Function(_$MediaImpl) then) =
      __$$MediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "images") List<String>? images,
      @JsonKey(name: "videos") List<dynamic>? videos,
      @JsonKey(name: "documents") List<dynamic>? documents});
}

/// @nodoc
class __$$MediaImplCopyWithImpl<$Res>
    extends _$MediaCopyWithImpl<$Res, _$MediaImpl>
    implements _$$MediaImplCopyWith<$Res> {
  __$$MediaImplCopyWithImpl(
      _$MediaImpl _value, $Res Function(_$MediaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = freezed,
    Object? videos = freezed,
    Object? documents = freezed,
  }) {
    return _then(_$MediaImpl(
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      videos: freezed == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      documents: freezed == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaImpl implements _Media {
  const _$MediaImpl(
      {@JsonKey(name: "images") final List<String>? images,
      @JsonKey(name: "videos") final List<dynamic>? videos,
      @JsonKey(name: "documents") final List<dynamic>? documents})
      : _images = images,
        _videos = videos,
        _documents = documents;

  factory _$MediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaImplFromJson(json);

  final List<String>? _images;
  @override
  @JsonKey(name: "images")
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _videos;
  @override
  @JsonKey(name: "videos")
  List<dynamic>? get videos {
    final value = _videos;
    if (value == null) return null;
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _documents;
  @override
  @JsonKey(name: "documents")
  List<dynamic>? get documents {
    final value = _documents;
    if (value == null) return null;
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Media(images: $images, videos: $videos, documents: $documents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaImpl &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_videos),
      const DeepCollectionEquality().hash(_documents));

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaImplCopyWith<_$MediaImpl> get copyWith =>
      __$$MediaImplCopyWithImpl<_$MediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaImplToJson(
      this,
    );
  }
}

abstract class _Media implements Media {
  const factory _Media(
          {@JsonKey(name: "images") final List<String>? images,
          @JsonKey(name: "videos") final List<dynamic>? videos,
          @JsonKey(name: "documents") final List<dynamic>? documents}) =
      _$MediaImpl;

  factory _Media.fromJson(Map<String, dynamic> json) = _$MediaImpl.fromJson;

  @override
  @JsonKey(name: "images")
  List<String>? get images;
  @override
  @JsonKey(name: "videos")
  List<dynamic>? get videos;
  @override
  @JsonKey(name: "documents")
  List<dynamic>? get documents;

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaImplCopyWith<_$MediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
