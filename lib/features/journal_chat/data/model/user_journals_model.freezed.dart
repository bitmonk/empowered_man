// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_journals_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserJournalsResponse _$UserJournalsResponseFromJson(Map<String, dynamic> json) {
  return _UserJournalsResponse.fromJson(json);
}

/// @nodoc
mixin _$UserJournalsResponse {
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  UserJournalsData? get data => throw _privateConstructorUsedError;

  /// Serializes this UserJournalsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserJournalsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserJournalsResponseCopyWith<UserJournalsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserJournalsResponseCopyWith<$Res> {
  factory $UserJournalsResponseCopyWith(UserJournalsResponse value,
          $Res Function(UserJournalsResponse) then) =
      _$UserJournalsResponseCopyWithImpl<$Res, UserJournalsResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') UserJournalsData? data});

  $UserJournalsDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$UserJournalsResponseCopyWithImpl<$Res,
        $Val extends UserJournalsResponse>
    implements $UserJournalsResponseCopyWith<$Res> {
  _$UserJournalsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserJournalsResponse
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
              as UserJournalsData?,
    ) as $Val);
  }

  /// Create a copy of UserJournalsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserJournalsDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UserJournalsDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserJournalsResponseImplCopyWith<$Res>
    implements $UserJournalsResponseCopyWith<$Res> {
  factory _$$UserJournalsResponseImplCopyWith(_$UserJournalsResponseImpl value,
          $Res Function(_$UserJournalsResponseImpl) then) =
      __$$UserJournalsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') UserJournalsData? data});

  @override
  $UserJournalsDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$UserJournalsResponseImplCopyWithImpl<$Res>
    extends _$UserJournalsResponseCopyWithImpl<$Res, _$UserJournalsResponseImpl>
    implements _$$UserJournalsResponseImplCopyWith<$Res> {
  __$$UserJournalsResponseImplCopyWithImpl(_$UserJournalsResponseImpl _value,
      $Res Function(_$UserJournalsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserJournalsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$UserJournalsResponseImpl(
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
              as UserJournalsData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserJournalsResponseImpl implements _UserJournalsResponse {
  const _$UserJournalsResponseImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$UserJournalsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserJournalsResponseImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'data')
  final UserJournalsData? data;

  @override
  String toString() {
    return 'UserJournalsResponse(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserJournalsResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of UserJournalsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserJournalsResponseImplCopyWith<_$UserJournalsResponseImpl>
      get copyWith =>
          __$$UserJournalsResponseImplCopyWithImpl<_$UserJournalsResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserJournalsResponseImplToJson(
      this,
    );
  }
}

abstract class _UserJournalsResponse implements UserJournalsResponse {
  const factory _UserJournalsResponse(
          {@JsonKey(name: 'status') final String? status,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'data') final UserJournalsData? data}) =
      _$UserJournalsResponseImpl;

  factory _UserJournalsResponse.fromJson(Map<String, dynamic> json) =
      _$UserJournalsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  UserJournalsData? get data;

  /// Create a copy of UserJournalsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserJournalsResponseImplCopyWith<_$UserJournalsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserJournalsData _$UserJournalsDataFromJson(Map<String, dynamic> json) {
  return _UserJournalsData.fromJson(json);
}

/// @nodoc
mixin _$UserJournalsData {
  @JsonKey(name: 'user_journals')
  List<UserJournal>? get userJournals => throw _privateConstructorUsedError;

  /// Serializes this UserJournalsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserJournalsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserJournalsDataCopyWith<UserJournalsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserJournalsDataCopyWith<$Res> {
  factory $UserJournalsDataCopyWith(
          UserJournalsData value, $Res Function(UserJournalsData) then) =
      _$UserJournalsDataCopyWithImpl<$Res, UserJournalsData>;
  @useResult
  $Res call({@JsonKey(name: 'user_journals') List<UserJournal>? userJournals});
}

/// @nodoc
class _$UserJournalsDataCopyWithImpl<$Res, $Val extends UserJournalsData>
    implements $UserJournalsDataCopyWith<$Res> {
  _$UserJournalsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserJournalsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userJournals = freezed,
  }) {
    return _then(_value.copyWith(
      userJournals: freezed == userJournals
          ? _value.userJournals
          : userJournals // ignore: cast_nullable_to_non_nullable
              as List<UserJournal>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserJournalsDataImplCopyWith<$Res>
    implements $UserJournalsDataCopyWith<$Res> {
  factory _$$UserJournalsDataImplCopyWith(_$UserJournalsDataImpl value,
          $Res Function(_$UserJournalsDataImpl) then) =
      __$$UserJournalsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'user_journals') List<UserJournal>? userJournals});
}

/// @nodoc
class __$$UserJournalsDataImplCopyWithImpl<$Res>
    extends _$UserJournalsDataCopyWithImpl<$Res, _$UserJournalsDataImpl>
    implements _$$UserJournalsDataImplCopyWith<$Res> {
  __$$UserJournalsDataImplCopyWithImpl(_$UserJournalsDataImpl _value,
      $Res Function(_$UserJournalsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserJournalsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userJournals = freezed,
  }) {
    return _then(_$UserJournalsDataImpl(
      userJournals: freezed == userJournals
          ? _value._userJournals
          : userJournals // ignore: cast_nullable_to_non_nullable
              as List<UserJournal>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserJournalsDataImpl implements _UserJournalsData {
  const _$UserJournalsDataImpl(
      {@JsonKey(name: 'user_journals') final List<UserJournal>? userJournals})
      : _userJournals = userJournals;

  factory _$UserJournalsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserJournalsDataImplFromJson(json);

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
  String toString() {
    return 'UserJournalsData(userJournals: $userJournals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserJournalsDataImpl &&
            const DeepCollectionEquality()
                .equals(other._userJournals, _userJournals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_userJournals));

  /// Create a copy of UserJournalsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserJournalsDataImplCopyWith<_$UserJournalsDataImpl> get copyWith =>
      __$$UserJournalsDataImplCopyWithImpl<_$UserJournalsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserJournalsDataImplToJson(
      this,
    );
  }
}

abstract class _UserJournalsData implements UserJournalsData {
  const factory _UserJournalsData(
      {@JsonKey(name: 'user_journals')
      final List<UserJournal>? userJournals}) = _$UserJournalsDataImpl;

  factory _UserJournalsData.fromJson(Map<String, dynamic> json) =
      _$UserJournalsDataImpl.fromJson;

  @override
  @JsonKey(name: 'user_journals')
  List<UserJournal>? get userJournals;

  /// Create a copy of UserJournalsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserJournalsDataImplCopyWith<_$UserJournalsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
  @JsonKey(name: 'journal_answers')
  List<JournalAnswer>? get journalAnswers => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'journal') Journal? journal,
      @JsonKey(name: 'journal_answers') List<JournalAnswer>? journalAnswers});

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
    Object? journalAnswers = freezed,
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
      journalAnswers: freezed == journalAnswers
          ? _value.journalAnswers
          : journalAnswers // ignore: cast_nullable_to_non_nullable
              as List<JournalAnswer>?,
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
      @JsonKey(name: 'journal') Journal? journal,
      @JsonKey(name: 'journal_answers') List<JournalAnswer>? journalAnswers});

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
    Object? journalAnswers = freezed,
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
      journalAnswers: freezed == journalAnswers
          ? _value._journalAnswers
          : journalAnswers // ignore: cast_nullable_to_non_nullable
              as List<JournalAnswer>?,
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
      @JsonKey(name: 'journal') this.journal,
      @JsonKey(name: 'journal_answers')
      final List<JournalAnswer>? journalAnswers})
      : _journalAnswers = journalAnswers;

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
  final List<JournalAnswer>? _journalAnswers;
  @override
  @JsonKey(name: 'journal_answers')
  List<JournalAnswer>? get journalAnswers {
    final value = _journalAnswers;
    if (value == null) return null;
    if (_journalAnswers is EqualUnmodifiableListView) return _journalAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserJournal(id: $id, completedAt: $completedAt, userId: $userId, journalId: $journalId, isComplete: $isComplete, createdAt: $createdAt, updatedAt: $updatedAt, journal: $journal, journalAnswers: $journalAnswers)';
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
            (identical(other.journal, journal) || other.journal == journal) &&
            const DeepCollectionEquality()
                .equals(other._journalAnswers, _journalAnswers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      completedAt,
      userId,
      journalId,
      isComplete,
      createdAt,
      updatedAt,
      journal,
      const DeepCollectionEquality().hash(_journalAnswers));

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
      @JsonKey(name: 'journal') final Journal? journal,
      @JsonKey(name: 'journal_answers')
      final List<JournalAnswer>? journalAnswers}) = _$UserJournalImpl;

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
  @override
  @JsonKey(name: 'journal_answers')
  List<JournalAnswer>? get journalAnswers;

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
      @JsonKey(name: 'emotion_name') String? emotionName});
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
abstract class _$$JournalImplCopyWith<$Res> implements $JournalCopyWith<$Res> {
  factory _$$JournalImplCopyWith(
          _$JournalImpl value, $Res Function(_$JournalImpl) then) =
      __$$JournalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'emotion_name') String? emotionName});
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalImpl implements _Journal {
  const _$JournalImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'emotion_name') this.emotionName});

  factory _$JournalImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'emotion_name')
  final String? emotionName;

  @override
  String toString() {
    return 'Journal(id: $id, emotionName: $emotionName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emotionName, emotionName) ||
                other.emotionName == emotionName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, emotionName);

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
          @JsonKey(name: 'emotion_name') final String? emotionName}) =
      _$JournalImpl;

  factory _Journal.fromJson(Map<String, dynamic> json) = _$JournalImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'emotion_name')
  String? get emotionName;

  /// Create a copy of Journal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalImplCopyWith<_$JournalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JournalAnswer _$JournalAnswerFromJson(Map<String, dynamic> json) {
  return _JournalAnswer.fromJson(json);
}

/// @nodoc
mixin _$JournalAnswer {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'media')
  String? get media => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'main_question')
  Question? get mainQuestion => throw _privateConstructorUsedError;
  @JsonKey(name: 'follow_up_question')
  Question? get followUpQuestion => throw _privateConstructorUsedError;

  /// Serializes this JournalAnswer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalAnswerCopyWith<JournalAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalAnswerCopyWith<$Res> {
  factory $JournalAnswerCopyWith(
          JournalAnswer value, $Res Function(JournalAnswer) then) =
      _$JournalAnswerCopyWithImpl<$Res, JournalAnswer>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'media') String? media,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'main_question_id') int? mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') int? followUpQuestionId,
      @JsonKey(name: 'user_journal_id') int? userJournalId,
      @JsonKey(name: 'main_question') Question? mainQuestion,
      @JsonKey(name: 'follow_up_question') Question? followUpQuestion});

  $QuestionCopyWith<$Res>? get mainQuestion;
  $QuestionCopyWith<$Res>? get followUpQuestion;
}

/// @nodoc
class _$JournalAnswerCopyWithImpl<$Res, $Val extends JournalAnswer>
    implements $JournalAnswerCopyWith<$Res> {
  _$JournalAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalAnswer
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
    Object? mainQuestion = freezed,
    Object? followUpQuestion = freezed,
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
              as String?,
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
      mainQuestion: freezed == mainQuestion
          ? _value.mainQuestion
          : mainQuestion // ignore: cast_nullable_to_non_nullable
              as Question?,
      followUpQuestion: freezed == followUpQuestion
          ? _value.followUpQuestion
          : followUpQuestion // ignore: cast_nullable_to_non_nullable
              as Question?,
    ) as $Val);
  }

  /// Create a copy of JournalAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<$Res>? get mainQuestion {
    if (_value.mainQuestion == null) {
      return null;
    }

    return $QuestionCopyWith<$Res>(_value.mainQuestion!, (value) {
      return _then(_value.copyWith(mainQuestion: value) as $Val);
    });
  }

  /// Create a copy of JournalAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<$Res>? get followUpQuestion {
    if (_value.followUpQuestion == null) {
      return null;
    }

    return $QuestionCopyWith<$Res>(_value.followUpQuestion!, (value) {
      return _then(_value.copyWith(followUpQuestion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JournalAnswerImplCopyWith<$Res>
    implements $JournalAnswerCopyWith<$Res> {
  factory _$$JournalAnswerImplCopyWith(
          _$JournalAnswerImpl value, $Res Function(_$JournalAnswerImpl) then) =
      __$$JournalAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'media') String? media,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'main_question_id') int? mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') int? followUpQuestionId,
      @JsonKey(name: 'user_journal_id') int? userJournalId,
      @JsonKey(name: 'main_question') Question? mainQuestion,
      @JsonKey(name: 'follow_up_question') Question? followUpQuestion});

  @override
  $QuestionCopyWith<$Res>? get mainQuestion;
  @override
  $QuestionCopyWith<$Res>? get followUpQuestion;
}

/// @nodoc
class __$$JournalAnswerImplCopyWithImpl<$Res>
    extends _$JournalAnswerCopyWithImpl<$Res, _$JournalAnswerImpl>
    implements _$$JournalAnswerImplCopyWith<$Res> {
  __$$JournalAnswerImplCopyWithImpl(
      _$JournalAnswerImpl _value, $Res Function(_$JournalAnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalAnswer
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
    Object? mainQuestion = freezed,
    Object? followUpQuestion = freezed,
  }) {
    return _then(_$JournalAnswerImpl(
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
              as String?,
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
      mainQuestion: freezed == mainQuestion
          ? _value.mainQuestion
          : mainQuestion // ignore: cast_nullable_to_non_nullable
              as Question?,
      followUpQuestion: freezed == followUpQuestion
          ? _value.followUpQuestion
          : followUpQuestion // ignore: cast_nullable_to_non_nullable
              as Question?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalAnswerImpl implements _JournalAnswer {
  const _$JournalAnswerImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'media') this.media,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'main_question_id') this.mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') this.followUpQuestionId,
      @JsonKey(name: 'user_journal_id') this.userJournalId,
      @JsonKey(name: 'main_question') this.mainQuestion,
      @JsonKey(name: 'follow_up_question') this.followUpQuestion});

  factory _$JournalAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalAnswerImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'text')
  final String? text;
  @override
  @JsonKey(name: 'media')
  final String? media;
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
  @JsonKey(name: 'main_question')
  final Question? mainQuestion;
  @override
  @JsonKey(name: 'follow_up_question')
  final Question? followUpQuestion;

  @override
  String toString() {
    return 'JournalAnswer(id: $id, text: $text, media: $media, createdAt: $createdAt, updatedAt: $updatedAt, mainQuestionId: $mainQuestionId, followUpQuestionId: $followUpQuestionId, userJournalId: $userJournalId, mainQuestion: $mainQuestion, followUpQuestion: $followUpQuestion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalAnswerImpl &&
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
                other.userJournalId == userJournalId) &&
            (identical(other.mainQuestion, mainQuestion) ||
                other.mainQuestion == mainQuestion) &&
            (identical(other.followUpQuestion, followUpQuestion) ||
                other.followUpQuestion == followUpQuestion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      text,
      media,
      createdAt,
      updatedAt,
      mainQuestionId,
      followUpQuestionId,
      userJournalId,
      mainQuestion,
      followUpQuestion);

  /// Create a copy of JournalAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalAnswerImplCopyWith<_$JournalAnswerImpl> get copyWith =>
      __$$JournalAnswerImplCopyWithImpl<_$JournalAnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalAnswerImplToJson(
      this,
    );
  }
}

abstract class _JournalAnswer implements JournalAnswer {
  const factory _JournalAnswer(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'text') final String? text,
      @JsonKey(name: 'media') final String? media,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      @JsonKey(name: 'main_question_id') final int? mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') final int? followUpQuestionId,
      @JsonKey(name: 'user_journal_id') final int? userJournalId,
      @JsonKey(name: 'main_question') final Question? mainQuestion,
      @JsonKey(name: 'follow_up_question')
      final Question? followUpQuestion}) = _$JournalAnswerImpl;

  factory _JournalAnswer.fromJson(Map<String, dynamic> json) =
      _$JournalAnswerImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'media')
  String? get media;
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
  @override
  @JsonKey(name: 'main_question')
  Question? get mainQuestion;
  @override
  @JsonKey(name: 'follow_up_question')
  Question? get followUpQuestion;

  /// Create a copy of JournalAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalAnswerImplCopyWith<_$JournalAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'question')
  String? get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'keywords')
  String? get keywords => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_type')
  String? get questionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'options')
  String? get options => throw _privateConstructorUsedError;
  @JsonKey(name: 'answered')
  bool? get answered => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer')
  Answer? get answer => throw _privateConstructorUsedError;

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'question') String? question,
      @JsonKey(name: 'keywords') String? keywords,
      @JsonKey(name: 'question_type') String? questionType,
      @JsonKey(name: 'options') String? options,
      @JsonKey(name: 'answered') bool? answered,
      @JsonKey(name: 'answer') Answer? answer});

  $AnswerCopyWith<$Res>? get answer;
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? keywords = freezed,
    Object? questionType = freezed,
    Object? options = freezed,
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
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of Question
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
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
          _$QuestionImpl value, $Res Function(_$QuestionImpl) then) =
      __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'question') String? question,
      @JsonKey(name: 'keywords') String? keywords,
      @JsonKey(name: 'question_type') String? questionType,
      @JsonKey(name: 'options') String? options,
      @JsonKey(name: 'answered') bool? answered,
      @JsonKey(name: 'answer') Answer? answer});

  @override
  $AnswerCopyWith<$Res>? get answer;
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
      _$QuestionImpl _value, $Res Function(_$QuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? keywords = freezed,
    Object? questionType = freezed,
    Object? options = freezed,
    Object? answered = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$QuestionImpl(
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
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
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
class _$QuestionImpl implements _Question {
  const _$QuestionImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'question') this.question,
      @JsonKey(name: 'keywords') this.keywords,
      @JsonKey(name: 'question_type') this.questionType,
      @JsonKey(name: 'options') this.options,
      @JsonKey(name: 'answered') this.answered,
      @JsonKey(name: 'answer') this.answer});

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

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
  @JsonKey(name: 'question_type')
  final String? questionType;
  @override
  @JsonKey(name: 'options')
  final String? options;
  @override
  @JsonKey(name: 'answered')
  final bool? answered;
  @override
  @JsonKey(name: 'answer')
  final Answer? answer;

  @override
  String toString() {
    return 'Question(id: $id, question: $question, keywords: $keywords, questionType: $questionType, options: $options, answered: $answered, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.options, options) || other.options == options) &&
            (identical(other.answered, answered) ||
                other.answered == answered) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, question, keywords,
      questionType, options, answered, answer);

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionImplToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  const factory _Question(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'question') final String? question,
      @JsonKey(name: 'keywords') final String? keywords,
      @JsonKey(name: 'question_type') final String? questionType,
      @JsonKey(name: 'options') final String? options,
      @JsonKey(name: 'answered') final bool? answered,
      @JsonKey(name: 'answer') final Answer? answer}) = _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

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
  @JsonKey(name: 'question_type')
  String? get questionType;
  @override
  @JsonKey(name: 'options')
  String? get options;
  @override
  @JsonKey(name: 'answered')
  bool? get answered;
  @override
  @JsonKey(name: 'answer')
  Answer? get answer;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
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
  String? get media => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'media') String? media,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'main_question_id') int? mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') int? followUpQuestionId,
      @JsonKey(name: 'user_journal_id') int? userJournalId});
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
              as String?,
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
      @JsonKey(name: 'media') String? media,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'main_question_id') int? mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') int? followUpQuestionId,
      @JsonKey(name: 'user_journal_id') int? userJournalId});
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
              as String?,
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
  final String? media;
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
          @JsonKey(name: 'media') final String? media,
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
  String? get media;
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
