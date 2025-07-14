// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_library_index_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JournalLibraryIndexModel _$JournalLibraryIndexModelFromJson(
    Map<String, dynamic> json) {
  return _JournalLibraryIndexModel.fromJson(json);
}

/// @nodoc
mixin _$JournalLibraryIndexModel {
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  JournalLibraryIndexData? get data => throw _privateConstructorUsedError;

  /// Serializes this JournalLibraryIndexModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalLibraryIndexModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalLibraryIndexModelCopyWith<JournalLibraryIndexModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalLibraryIndexModelCopyWith<$Res> {
  factory $JournalLibraryIndexModelCopyWith(JournalLibraryIndexModel value,
          $Res Function(JournalLibraryIndexModel) then) =
      _$JournalLibraryIndexModelCopyWithImpl<$Res, JournalLibraryIndexModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') JournalLibraryIndexData? data});

  $JournalLibraryIndexDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$JournalLibraryIndexModelCopyWithImpl<$Res,
        $Val extends JournalLibraryIndexModel>
    implements $JournalLibraryIndexModelCopyWith<$Res> {
  _$JournalLibraryIndexModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalLibraryIndexModel
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
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as JournalLibraryIndexData?,
    ) as $Val);
  }

  /// Create a copy of JournalLibraryIndexModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JournalLibraryIndexDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $JournalLibraryIndexDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JournalLibraryIndexModelImplCopyWith<$Res>
    implements $JournalLibraryIndexModelCopyWith<$Res> {
  factory _$$JournalLibraryIndexModelImplCopyWith(
          _$JournalLibraryIndexModelImpl value,
          $Res Function(_$JournalLibraryIndexModelImpl) then) =
      __$$JournalLibraryIndexModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') JournalLibraryIndexData? data});

  @override
  $JournalLibraryIndexDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$JournalLibraryIndexModelImplCopyWithImpl<$Res>
    extends _$JournalLibraryIndexModelCopyWithImpl<$Res,
        _$JournalLibraryIndexModelImpl>
    implements _$$JournalLibraryIndexModelImplCopyWith<$Res> {
  __$$JournalLibraryIndexModelImplCopyWithImpl(
      _$JournalLibraryIndexModelImpl _value,
      $Res Function(_$JournalLibraryIndexModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalLibraryIndexModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$JournalLibraryIndexModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as JournalLibraryIndexData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalLibraryIndexModelImpl implements _JournalLibraryIndexModel {
  const _$JournalLibraryIndexModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$JournalLibraryIndexModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalLibraryIndexModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'data')
  final JournalLibraryIndexData? data;

  @override
  String toString() {
    return 'JournalLibraryIndexModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalLibraryIndexModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of JournalLibraryIndexModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalLibraryIndexModelImplCopyWith<_$JournalLibraryIndexModelImpl>
      get copyWith => __$$JournalLibraryIndexModelImplCopyWithImpl<
          _$JournalLibraryIndexModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalLibraryIndexModelImplToJson(
      this,
    );
  }
}

abstract class _JournalLibraryIndexModel implements JournalLibraryIndexModel {
  const factory _JournalLibraryIndexModel(
          {@JsonKey(name: 'status') final String? status,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'data') final JournalLibraryIndexData? data}) =
      _$JournalLibraryIndexModelImpl;

  factory _JournalLibraryIndexModel.fromJson(Map<String, dynamic> json) =
      _$JournalLibraryIndexModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  JournalLibraryIndexData? get data;

  /// Create a copy of JournalLibraryIndexModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalLibraryIndexModelImplCopyWith<_$JournalLibraryIndexModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

JournalLibraryIndexData _$JournalLibraryIndexDataFromJson(
    Map<String, dynamic> json) {
  return _JournalLibraryIndexData.fromJson(json);
}

/// @nodoc
mixin _$JournalLibraryIndexData {
  @JsonKey(name: 'user_journals')
  List<UserJournal>? get userJournals => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta')
  Meta? get meta => throw _privateConstructorUsedError;

  /// Serializes this JournalLibraryIndexData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalLibraryIndexData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalLibraryIndexDataCopyWith<JournalLibraryIndexData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalLibraryIndexDataCopyWith<$Res> {
  factory $JournalLibraryIndexDataCopyWith(JournalLibraryIndexData value,
          $Res Function(JournalLibraryIndexData) then) =
      _$JournalLibraryIndexDataCopyWithImpl<$Res, JournalLibraryIndexData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_journals') List<UserJournal>? userJournals,
      @JsonKey(name: 'meta') Meta? meta});

  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$JournalLibraryIndexDataCopyWithImpl<$Res,
        $Val extends JournalLibraryIndexData>
    implements $JournalLibraryIndexDataCopyWith<$Res> {
  _$JournalLibraryIndexDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalLibraryIndexData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userJournals = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      userJournals: freezed == userJournals
          ? _value.userJournals
          : userJournals // ignore: cast_nullable_to_non_nullable
              as List<UserJournal>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ) as $Val);
  }

  /// Create a copy of JournalLibraryIndexData
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
abstract class _$$JournalLibraryIndexDataImplCopyWith<$Res>
    implements $JournalLibraryIndexDataCopyWith<$Res> {
  factory _$$JournalLibraryIndexDataImplCopyWith(
          _$JournalLibraryIndexDataImpl value,
          $Res Function(_$JournalLibraryIndexDataImpl) then) =
      __$$JournalLibraryIndexDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_journals') List<UserJournal>? userJournals,
      @JsonKey(name: 'meta') Meta? meta});

  @override
  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$JournalLibraryIndexDataImplCopyWithImpl<$Res>
    extends _$JournalLibraryIndexDataCopyWithImpl<$Res,
        _$JournalLibraryIndexDataImpl>
    implements _$$JournalLibraryIndexDataImplCopyWith<$Res> {
  __$$JournalLibraryIndexDataImplCopyWithImpl(
      _$JournalLibraryIndexDataImpl _value,
      $Res Function(_$JournalLibraryIndexDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalLibraryIndexData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userJournals = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$JournalLibraryIndexDataImpl(
      userJournals: freezed == userJournals
          ? _value._userJournals
          : userJournals // ignore: cast_nullable_to_non_nullable
              as List<UserJournal>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalLibraryIndexDataImpl implements _JournalLibraryIndexData {
  const _$JournalLibraryIndexDataImpl(
      {@JsonKey(name: 'user_journals') final List<UserJournal>? userJournals,
      @JsonKey(name: 'meta') this.meta})
      : _userJournals = userJournals;

  factory _$JournalLibraryIndexDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalLibraryIndexDataImplFromJson(json);

  final List<UserJournal>? _userJournals;
  @override
  @JsonKey(name: 'user_journals')
  List<UserJournal>? get userJournals {
    final value = _userJournals;
    if (value == null) return null;
    if (_userJournals is EqualUnmodifiableListView) return _userJournals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'meta')
  final Meta? meta;

  @override
  String toString() {
    return 'JournalLibraryIndexData(userJournals: $userJournals, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalLibraryIndexDataImpl &&
            const DeepCollectionEquality()
                .equals(other._userJournals, _userJournals) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_userJournals), meta);

  /// Create a copy of JournalLibraryIndexData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalLibraryIndexDataImplCopyWith<_$JournalLibraryIndexDataImpl>
      get copyWith => __$$JournalLibraryIndexDataImplCopyWithImpl<
          _$JournalLibraryIndexDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalLibraryIndexDataImplToJson(
      this,
    );
  }
}

abstract class _JournalLibraryIndexData implements JournalLibraryIndexData {
  const factory _JournalLibraryIndexData(
      {@JsonKey(name: 'user_journals') final List<UserJournal>? userJournals,
      @JsonKey(name: 'meta') final Meta? meta}) = _$JournalLibraryIndexDataImpl;

  factory _JournalLibraryIndexData.fromJson(Map<String, dynamic> json) =
      _$JournalLibraryIndexDataImpl.fromJson;

  @override
  @JsonKey(name: 'user_journals')
  List<UserJournal>? get userJournals;
  @override
  @JsonKey(name: 'meta')
  Meta? get meta;

  /// Create a copy of JournalLibraryIndexData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalLibraryIndexDataImplCopyWith<_$JournalLibraryIndexDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserJournal _$UserJournalFromJson(Map<String, dynamic> json) {
  return _UserJournal.fromJson(json);
}

/// @nodoc
mixin _$UserJournal {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  String? get completedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'journal_id')
  int? get journalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_complete')
  bool? get isComplete => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'journal')
  Journal? get journal => throw _privateConstructorUsedError;

  /// Serializes this UserJournal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserJournal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserJournalCopyWith<UserJournal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserJournalCopyWith<$Res> {
  factory $UserJournalCopyWith(
          UserJournal value, $Res Function(UserJournal) then) =
      _$UserJournalCopyWithImpl<$Res, UserJournal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'completed_at') String? completedAt,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'journal_id') int? journalId,
      @JsonKey(name: 'is_complete') bool? isComplete,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'journal') Journal? journal});

  $JournalCopyWith<$Res>? get journal;
}

/// @nodoc
class _$UserJournalCopyWithImpl<$Res, $Val extends UserJournal>
    implements $UserJournalCopyWith<$Res> {
  _$UserJournalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserJournal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? completedAt = freezed,
    Object? userId = freezed,
    Object? journalId = freezed,
    Object? isComplete = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? journal = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      journalId: freezed == journalId
          ? _value.journalId
          : journalId // ignore: cast_nullable_to_non_nullable
              as int?,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      journal: freezed == journal
          ? _value.journal
          : journal // ignore: cast_nullable_to_non_nullable
              as Journal?,
    ) as $Val);
  }

  /// Create a copy of UserJournal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JournalCopyWith<$Res>? get journal {
    if (_value.journal == null) {
      return null;
    }

    return $JournalCopyWith<$Res>(_value.journal!, (value) {
      return _then(_value.copyWith(journal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserJournalImplCopyWith<$Res>
    implements $UserJournalCopyWith<$Res> {
  factory _$$UserJournalImplCopyWith(
          _$UserJournalImpl value, $Res Function(_$UserJournalImpl) then) =
      __$$UserJournalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'completed_at') String? completedAt,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'journal_id') int? journalId,
      @JsonKey(name: 'is_complete') bool? isComplete,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'journal') Journal? journal});

  @override
  $JournalCopyWith<$Res>? get journal;
}

/// @nodoc
class __$$UserJournalImplCopyWithImpl<$Res>
    extends _$UserJournalCopyWithImpl<$Res, _$UserJournalImpl>
    implements _$$UserJournalImplCopyWith<$Res> {
  __$$UserJournalImplCopyWithImpl(
      _$UserJournalImpl _value, $Res Function(_$UserJournalImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserJournal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? completedAt = freezed,
    Object? userId = freezed,
    Object? journalId = freezed,
    Object? isComplete = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? journal = freezed,
  }) {
    return _then(_$UserJournalImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      journalId: freezed == journalId
          ? _value.journalId
          : journalId // ignore: cast_nullable_to_non_nullable
              as int?,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      journal: freezed == journal
          ? _value.journal
          : journal // ignore: cast_nullable_to_non_nullable
              as Journal?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserJournalImpl implements _UserJournal {
  const _$UserJournalImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'completed_at') this.completedAt,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'journal_id') this.journalId,
      @JsonKey(name: 'is_complete') this.isComplete,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'journal') this.journal});

  factory _$UserJournalImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserJournalImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'completed_at')
  final String? completedAt;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'journal_id')
  final int? journalId;
  @override
  @JsonKey(name: 'is_complete')
  final bool? isComplete;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'journal')
  final Journal? journal;

  @override
  String toString() {
    return 'UserJournal(id: $id, completedAt: $completedAt, userId: $userId, journalId: $journalId, isComplete: $isComplete, createdAt: $createdAt, updatedAt: $updatedAt, journal: $journal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserJournalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.journalId, journalId) ||
                other.journalId == journalId) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.journal, journal) || other.journal == journal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, completedAt, userId,
      journalId, isComplete, createdAt, updatedAt, journal);

  /// Create a copy of UserJournal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserJournalImplCopyWith<_$UserJournalImpl> get copyWith =>
      __$$UserJournalImplCopyWithImpl<_$UserJournalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserJournalImplToJson(
      this,
    );
  }
}

abstract class _UserJournal implements UserJournal {
  const factory _UserJournal(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'completed_at') final String? completedAt,
      @JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'journal_id') final int? journalId,
      @JsonKey(name: 'is_complete') final bool? isComplete,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      @JsonKey(name: 'journal') final Journal? journal}) = _$UserJournalImpl;

  factory _UserJournal.fromJson(Map<String, dynamic> json) =
      _$UserJournalImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'completed_at')
  String? get completedAt;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'journal_id')
  int? get journalId;
  @override
  @JsonKey(name: 'is_complete')
  bool? get isComplete;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'journal')
  Journal? get journal;

  /// Create a copy of UserJournal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserJournalImplCopyWith<_$UserJournalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Journal _$JournalFromJson(Map<String, dynamic> json) {
  return _Journal.fromJson(json);
}

/// @nodoc
mixin _$Journal {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'emotion_name')
  String? get emotionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'main_questions')
  List<MainQuestion>? get mainQuestions => throw _privateConstructorUsedError;

  /// Serializes this Journal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Journal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalCopyWith<Journal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalCopyWith<$Res> {
  factory $JournalCopyWith(Journal value, $Res Function(Journal) then) =
      _$JournalCopyWithImpl<$Res, Journal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'emotion_name') String? emotionName,
      @JsonKey(name: 'main_questions') List<MainQuestion>? mainQuestions});
}

/// @nodoc
class _$JournalCopyWithImpl<$Res, $Val extends Journal>
    implements $JournalCopyWith<$Res> {
  _$JournalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Journal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? emotionName = freezed,
    Object? mainQuestions = freezed,
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
      mainQuestions: freezed == mainQuestions
          ? _value.mainQuestions
          : mainQuestions // ignore: cast_nullable_to_non_nullable
              as List<MainQuestion>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JournalImplCopyWith<$Res> implements $JournalCopyWith<$Res> {
  factory _$$JournalImplCopyWith(
          _$JournalImpl value, $Res Function(_$JournalImpl) then) =
      __$$JournalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'emotion_name') String? emotionName,
      @JsonKey(name: 'main_questions') List<MainQuestion>? mainQuestions});
}

/// @nodoc
class __$$JournalImplCopyWithImpl<$Res>
    extends _$JournalCopyWithImpl<$Res, _$JournalImpl>
    implements _$$JournalImplCopyWith<$Res> {
  __$$JournalImplCopyWithImpl(
      _$JournalImpl _value, $Res Function(_$JournalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Journal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? emotionName = freezed,
    Object? mainQuestions = freezed,
  }) {
    return _then(_$JournalImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      emotionName: freezed == emotionName
          ? _value.emotionName
          : emotionName // ignore: cast_nullable_to_non_nullable
              as String?,
      mainQuestions: freezed == mainQuestions
          ? _value._mainQuestions
          : mainQuestions // ignore: cast_nullable_to_non_nullable
              as List<MainQuestion>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalImpl implements _Journal {
  const _$JournalImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'emotion_name') this.emotionName,
      @JsonKey(name: 'main_questions') final List<MainQuestion>? mainQuestions})
      : _mainQuestions = mainQuestions;

  factory _$JournalImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'emotion_name')
  final String? emotionName;
  final List<MainQuestion>? _mainQuestions;
  @override
  @JsonKey(name: 'main_questions')
  List<MainQuestion>? get mainQuestions {
    final value = _mainQuestions;
    if (value == null) return null;
    if (_mainQuestions is EqualUnmodifiableListView) return _mainQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Journal(id: $id, emotionName: $emotionName, mainQuestions: $mainQuestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emotionName, emotionName) ||
                other.emotionName == emotionName) &&
            const DeepCollectionEquality()
                .equals(other._mainQuestions, _mainQuestions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, emotionName,
      const DeepCollectionEquality().hash(_mainQuestions));

  /// Create a copy of Journal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalImplCopyWith<_$JournalImpl> get copyWith =>
      __$$JournalImplCopyWithImpl<_$JournalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalImplToJson(
      this,
    );
  }
}

abstract class _Journal implements Journal {
  const factory _Journal(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'emotion_name') final String? emotionName,
      @JsonKey(name: 'main_questions')
      final List<MainQuestion>? mainQuestions}) = _$JournalImpl;

  factory _Journal.fromJson(Map<String, dynamic> json) = _$JournalImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'emotion_name')
  String? get emotionName;
  @override
  @JsonKey(name: 'main_questions')
  List<MainQuestion>? get mainQuestions;

  /// Create a copy of Journal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalImplCopyWith<_$JournalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MainQuestion _$MainQuestionFromJson(Map<String, dynamic> json) {
  return _MainQuestion.fromJson(json);
}

/// @nodoc
mixin _$MainQuestion {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'question')
  String? get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'keywords')
  String? get keywords => throw _privateConstructorUsedError;
  @JsonKey(name: 'answered')
  bool? get answered => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer')
  Answer? get answer => throw _privateConstructorUsedError;

  /// Serializes this MainQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MainQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainQuestionCopyWith<MainQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainQuestionCopyWith<$Res> {
  factory $MainQuestionCopyWith(
          MainQuestion value, $Res Function(MainQuestion) then) =
      _$MainQuestionCopyWithImpl<$Res, MainQuestion>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'question') String? question,
      @JsonKey(name: 'keywords') String? keywords,
      @JsonKey(name: 'answered') bool? answered,
      @JsonKey(name: 'answer') Answer? answer});

  $AnswerCopyWith<$Res>? get answer;
}

/// @nodoc
class _$MainQuestionCopyWithImpl<$Res, $Val extends MainQuestion>
    implements $MainQuestionCopyWith<$Res> {
  _$MainQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? keywords = freezed,
    Object? answered = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      answered: freezed == answered
          ? _value.answered
          : answered // ignore: cast_nullable_to_non_nullable
              as bool?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Answer?,
    ) as $Val);
  }

  /// Create a copy of MainQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnswerCopyWith<$Res>? get answer {
    if (_value.answer == null) {
      return null;
    }

    return $AnswerCopyWith<$Res>(_value.answer!, (value) {
      return _then(_value.copyWith(answer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MainQuestionImplCopyWith<$Res>
    implements $MainQuestionCopyWith<$Res> {
  factory _$$MainQuestionImplCopyWith(
          _$MainQuestionImpl value, $Res Function(_$MainQuestionImpl) then) =
      __$$MainQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'question') String? question,
      @JsonKey(name: 'keywords') String? keywords,
      @JsonKey(name: 'answered') bool? answered,
      @JsonKey(name: 'answer') Answer? answer});

  @override
  $AnswerCopyWith<$Res>? get answer;
}

/// @nodoc
class __$$MainQuestionImplCopyWithImpl<$Res>
    extends _$MainQuestionCopyWithImpl<$Res, _$MainQuestionImpl>
    implements _$$MainQuestionImplCopyWith<$Res> {
  __$$MainQuestionImplCopyWithImpl(
      _$MainQuestionImpl _value, $Res Function(_$MainQuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? keywords = freezed,
    Object? answered = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$MainQuestionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      answered: freezed == answered
          ? _value.answered
          : answered // ignore: cast_nullable_to_non_nullable
              as bool?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Answer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainQuestionImpl implements _MainQuestion {
  const _$MainQuestionImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'question') this.question,
      @JsonKey(name: 'keywords') this.keywords,
      @JsonKey(name: 'answered') this.answered,
      @JsonKey(name: 'answer') this.answer});

  factory _$MainQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainQuestionImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'question')
  final String? question;
  @override
  @JsonKey(name: 'keywords')
  final String? keywords;
  @override
  @JsonKey(name: 'answered')
  final bool? answered;
  @override
  @JsonKey(name: 'answer')
  final Answer? answer;

  @override
  String toString() {
    return 'MainQuestion(id: $id, question: $question, keywords: $keywords, answered: $answered, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords) &&
            (identical(other.answered, answered) ||
                other.answered == answered) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, question, keywords, answered, answer);

  /// Create a copy of MainQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainQuestionImplCopyWith<_$MainQuestionImpl> get copyWith =>
      __$$MainQuestionImplCopyWithImpl<_$MainQuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainQuestionImplToJson(
      this,
    );
  }
}

abstract class _MainQuestion implements MainQuestion {
  const factory _MainQuestion(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'question') final String? question,
      @JsonKey(name: 'keywords') final String? keywords,
      @JsonKey(name: 'answered') final bool? answered,
      @JsonKey(name: 'answer') final Answer? answer}) = _$MainQuestionImpl;

  factory _MainQuestion.fromJson(Map<String, dynamic> json) =
      _$MainQuestionImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'question')
  String? get question;
  @override
  @JsonKey(name: 'keywords')
  String? get keywords;
  @override
  @JsonKey(name: 'answered')
  bool? get answered;
  @override
  @JsonKey(name: 'answer')
  Answer? get answer;

  /// Create a copy of MainQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainQuestionImplCopyWith<_$MainQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'media')
  Media? get media => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'main_question_id')
  int? get mainQuestionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'follow_up_question_id')
  int? get followUpQuestionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_journal_id')
  int? get userJournalId => throw _privateConstructorUsedError;

  /// Serializes this Answer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res, Answer>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'media') Media? media,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'main_question_id') int? mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') int? followUpQuestionId,
      @JsonKey(name: 'user_journal_id') int? userJournalId});

  $MediaCopyWith<$Res>? get media;
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res, $Val extends Answer>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? media = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? mainQuestionId = freezed,
    Object? followUpQuestionId = freezed,
    Object? userJournalId = freezed,
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
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      mainQuestionId: freezed == mainQuestionId
          ? _value.mainQuestionId
          : mainQuestionId // ignore: cast_nullable_to_non_nullable
              as int?,
      followUpQuestionId: freezed == followUpQuestionId
          ? _value.followUpQuestionId
          : followUpQuestionId // ignore: cast_nullable_to_non_nullable
              as int?,
      userJournalId: freezed == userJournalId
          ? _value.userJournalId
          : userJournalId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of Answer
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
abstract class _$$AnswerImplCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$AnswerImplCopyWith(
          _$AnswerImpl value, $Res Function(_$AnswerImpl) then) =
      __$$AnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'media') Media? media,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'main_question_id') int? mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') int? followUpQuestionId,
      @JsonKey(name: 'user_journal_id') int? userJournalId});

  @override
  $MediaCopyWith<$Res>? get media;
}

/// @nodoc
class __$$AnswerImplCopyWithImpl<$Res>
    extends _$AnswerCopyWithImpl<$Res, _$AnswerImpl>
    implements _$$AnswerImplCopyWith<$Res> {
  __$$AnswerImplCopyWithImpl(
      _$AnswerImpl _value, $Res Function(_$AnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? media = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? mainQuestionId = freezed,
    Object? followUpQuestionId = freezed,
    Object? userJournalId = freezed,
  }) {
    return _then(_$AnswerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      mainQuestionId: freezed == mainQuestionId
          ? _value.mainQuestionId
          : mainQuestionId // ignore: cast_nullable_to_non_nullable
              as int?,
      followUpQuestionId: freezed == followUpQuestionId
          ? _value.followUpQuestionId
          : followUpQuestionId // ignore: cast_nullable_to_non_nullable
              as int?,
      userJournalId: freezed == userJournalId
          ? _value.userJournalId
          : userJournalId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerImpl implements _Answer {
  const _$AnswerImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'media') this.media,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'main_question_id') this.mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') this.followUpQuestionId,
      @JsonKey(name: 'user_journal_id') this.userJournalId});

  factory _$AnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'text')
  final String? text;
  @override
  @JsonKey(name: 'media')
  final Media? media;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'main_question_id')
  final int? mainQuestionId;
  @override
  @JsonKey(name: 'follow_up_question_id')
  final int? followUpQuestionId;
  @override
  @JsonKey(name: 'user_journal_id')
  final int? userJournalId;

  @override
  String toString() {
    return 'Answer(id: $id, text: $text, media: $media, createdAt: $createdAt, updatedAt: $updatedAt, mainQuestionId: $mainQuestionId, followUpQuestionId: $followUpQuestionId, userJournalId: $userJournalId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.mainQuestionId, mainQuestionId) ||
                other.mainQuestionId == mainQuestionId) &&
            (identical(other.followUpQuestionId, followUpQuestionId) ||
                other.followUpQuestionId == followUpQuestionId) &&
            (identical(other.userJournalId, userJournalId) ||
                other.userJournalId == userJournalId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, media, createdAt,
      updatedAt, mainQuestionId, followUpQuestionId, userJournalId);

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      __$$AnswerImplCopyWithImpl<_$AnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerImplToJson(
      this,
    );
  }
}

abstract class _Answer implements Answer {
  const factory _Answer(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'text') final String? text,
          @JsonKey(name: 'media') final Media? media,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'updated_at') final String? updatedAt,
          @JsonKey(name: 'main_question_id') final int? mainQuestionId,
          @JsonKey(name: 'follow_up_question_id') final int? followUpQuestionId,
          @JsonKey(name: 'user_journal_id') final int? userJournalId}) =
      _$AnswerImpl;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$AnswerImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'media')
  Media? get media;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'main_question_id')
  int? get mainQuestionId;
  @override
  @JsonKey(name: 'follow_up_question_id')
  int? get followUpQuestionId;
  @override
  @JsonKey(name: 'user_journal_id')
  int? get userJournalId;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Media _$MediaFromJson(Map<String, dynamic> json) {
  return _Media.fromJson(json);
}

/// @nodoc
mixin _$Media {
  @JsonKey(name: 'images')
  List<String>? get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'videos')
  List<String>? get videos => throw _privateConstructorUsedError;
  @JsonKey(name: 'voices')
  List<String>? get voices => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'images') List<String>? images,
      @JsonKey(name: 'videos') List<String>? videos,
      @JsonKey(name: 'voices') List<String>? voices});
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
    Object? voices = freezed,
  }) {
    return _then(_value.copyWith(
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      voices: freezed == voices
          ? _value.voices
          : voices // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      {@JsonKey(name: 'images') List<String>? images,
      @JsonKey(name: 'videos') List<String>? videos,
      @JsonKey(name: 'voices') List<String>? voices});
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
    Object? voices = freezed,
  }) {
    return _then(_$MediaImpl(
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      videos: freezed == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      voices: freezed == voices
          ? _value._voices
          : voices // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaImpl implements _Media {
  const _$MediaImpl(
      {@JsonKey(name: 'images') final List<String>? images,
      @JsonKey(name: 'videos') final List<String>? videos,
      @JsonKey(name: 'voices') final List<String>? voices})
      : _images = images,
        _videos = videos,
        _voices = voices;

  factory _$MediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaImplFromJson(json);

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

  @override
  String toString() {
    return 'Media(images: $images, videos: $videos, voices: $voices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaImpl &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            const DeepCollectionEquality().equals(other._voices, _voices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_videos),
      const DeepCollectionEquality().hash(_voices));

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
      {@JsonKey(name: 'images') final List<String>? images,
      @JsonKey(name: 'videos') final List<String>? videos,
      @JsonKey(name: 'voices') final List<String>? voices}) = _$MediaImpl;

  factory _Media.fromJson(Map<String, dynamic> json) = _$MediaImpl.fromJson;

  @override
  @JsonKey(name: 'images')
  List<String>? get images;
  @override
  @JsonKey(name: 'videos')
  List<String>? get videos;
  @override
  @JsonKey(name: 'voices')
  List<String>? get voices;

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaImplCopyWith<_$MediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  @JsonKey(name: 'current_page')
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
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
      {@JsonKey(name: 'current_page') int? currentPage,
      @JsonKey(name: 'total') int? total,
      @JsonKey(name: 'per_page') int? perPage,
      @JsonKey(name: 'last_page') int? lastPage});
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
      {@JsonKey(name: 'current_page') int? currentPage,
      @JsonKey(name: 'total') int? total,
      @JsonKey(name: 'per_page') int? perPage,
      @JsonKey(name: 'last_page') int? lastPage});
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
      {@JsonKey(name: 'current_page') this.currentPage,
      @JsonKey(name: 'total') this.total,
      @JsonKey(name: 'per_page') this.perPage,
      @JsonKey(name: 'last_page') this.lastPage});

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @override
  @JsonKey(name: 'total')
  final int? total;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;
  @override
  @JsonKey(name: 'last_page')
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
      {@JsonKey(name: 'current_page') final int? currentPage,
      @JsonKey(name: 'total') final int? total,
      @JsonKey(name: 'per_page') final int? perPage,
      @JsonKey(name: 'last_page') final int? lastPage}) = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  @JsonKey(name: 'current_page')
  int? get currentPage;
  @override
  @JsonKey(name: 'total')
  int? get total;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  @JsonKey(name: 'last_page')
  int? get lastPage;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
