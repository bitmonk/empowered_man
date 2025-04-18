// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'see_journal_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SeeJournalModelResponse _$SeeJournalModelResponseFromJson(
    Map<String, dynamic> json) {
  return _SeeJournalModelResponse.fromJson(json);
}

/// @nodoc
mixin _$SeeJournalModelResponse {
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  SeeJournalModelData? get data => throw _privateConstructorUsedError;

  /// Serializes this SeeJournalModelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeeJournalModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeeJournalModelResponseCopyWith<SeeJournalModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeeJournalModelResponseCopyWith<$Res> {
  factory $SeeJournalModelResponseCopyWith(SeeJournalModelResponse value,
          $Res Function(SeeJournalModelResponse) then) =
      _$SeeJournalModelResponseCopyWithImpl<$Res, SeeJournalModelResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') SeeJournalModelData? data});

  $SeeJournalModelDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SeeJournalModelResponseCopyWithImpl<$Res,
        $Val extends SeeJournalModelResponse>
    implements $SeeJournalModelResponseCopyWith<$Res> {
  _$SeeJournalModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeeJournalModelResponse
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
              as SeeJournalModelData?,
    ) as $Val);
  }

  /// Create a copy of SeeJournalModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeeJournalModelDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SeeJournalModelDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SeeJournalModelResponseImplCopyWith<$Res>
    implements $SeeJournalModelResponseCopyWith<$Res> {
  factory _$$SeeJournalModelResponseImplCopyWith(
          _$SeeJournalModelResponseImpl value,
          $Res Function(_$SeeJournalModelResponseImpl) then) =
      __$$SeeJournalModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') SeeJournalModelData? data});

  @override
  $SeeJournalModelDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SeeJournalModelResponseImplCopyWithImpl<$Res>
    extends _$SeeJournalModelResponseCopyWithImpl<$Res,
        _$SeeJournalModelResponseImpl>
    implements _$$SeeJournalModelResponseImplCopyWith<$Res> {
  __$$SeeJournalModelResponseImplCopyWithImpl(
      _$SeeJournalModelResponseImpl _value,
      $Res Function(_$SeeJournalModelResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeeJournalModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SeeJournalModelResponseImpl(
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
              as SeeJournalModelData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeeJournalModelResponseImpl implements _SeeJournalModelResponse {
  const _$SeeJournalModelResponseImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$SeeJournalModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeeJournalModelResponseImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'data')
  final SeeJournalModelData? data;

  @override
  String toString() {
    return 'SeeJournalModelResponse(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeeJournalModelResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of SeeJournalModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeeJournalModelResponseImplCopyWith<_$SeeJournalModelResponseImpl>
      get copyWith => __$$SeeJournalModelResponseImplCopyWithImpl<
          _$SeeJournalModelResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeeJournalModelResponseImplToJson(
      this,
    );
  }
}

abstract class _SeeJournalModelResponse implements SeeJournalModelResponse {
  const factory _SeeJournalModelResponse(
          {@JsonKey(name: 'status') final String? status,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'data') final SeeJournalModelData? data}) =
      _$SeeJournalModelResponseImpl;

  factory _SeeJournalModelResponse.fromJson(Map<String, dynamic> json) =
      _$SeeJournalModelResponseImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  SeeJournalModelData? get data;

  /// Create a copy of SeeJournalModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeeJournalModelResponseImplCopyWith<_$SeeJournalModelResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SeeJournalModelData _$SeeJournalModelDataFromJson(Map<String, dynamic> json) {
  return _SeeJournalModelData.fromJson(json);
}

/// @nodoc
mixin _$SeeJournalModelData {
  @JsonKey(name: 'user_journal')
  SeeJournalModelUserJournal? get userJournal =>
      throw _privateConstructorUsedError;

  /// Serializes this SeeJournalModelData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeeJournalModelData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeeJournalModelDataCopyWith<SeeJournalModelData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeeJournalModelDataCopyWith<$Res> {
  factory $SeeJournalModelDataCopyWith(
          SeeJournalModelData value, $Res Function(SeeJournalModelData) then) =
      _$SeeJournalModelDataCopyWithImpl<$Res, SeeJournalModelData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_journal') SeeJournalModelUserJournal? userJournal});

  $SeeJournalModelUserJournalCopyWith<$Res>? get userJournal;
}

/// @nodoc
class _$SeeJournalModelDataCopyWithImpl<$Res, $Val extends SeeJournalModelData>
    implements $SeeJournalModelDataCopyWith<$Res> {
  _$SeeJournalModelDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeeJournalModelData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userJournal = freezed,
  }) {
    return _then(_value.copyWith(
      userJournal: freezed == userJournal
          ? _value.userJournal
          : userJournal // ignore: cast_nullable_to_non_nullable
              as SeeJournalModelUserJournal?,
    ) as $Val);
  }

  /// Create a copy of SeeJournalModelData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeeJournalModelUserJournalCopyWith<$Res>? get userJournal {
    if (_value.userJournal == null) {
      return null;
    }

    return $SeeJournalModelUserJournalCopyWith<$Res>(_value.userJournal!,
        (value) {
      return _then(_value.copyWith(userJournal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SeeJournalModelDataImplCopyWith<$Res>
    implements $SeeJournalModelDataCopyWith<$Res> {
  factory _$$SeeJournalModelDataImplCopyWith(_$SeeJournalModelDataImpl value,
          $Res Function(_$SeeJournalModelDataImpl) then) =
      __$$SeeJournalModelDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_journal') SeeJournalModelUserJournal? userJournal});

  @override
  $SeeJournalModelUserJournalCopyWith<$Res>? get userJournal;
}

/// @nodoc
class __$$SeeJournalModelDataImplCopyWithImpl<$Res>
    extends _$SeeJournalModelDataCopyWithImpl<$Res, _$SeeJournalModelDataImpl>
    implements _$$SeeJournalModelDataImplCopyWith<$Res> {
  __$$SeeJournalModelDataImplCopyWithImpl(_$SeeJournalModelDataImpl _value,
      $Res Function(_$SeeJournalModelDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeeJournalModelData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userJournal = freezed,
  }) {
    return _then(_$SeeJournalModelDataImpl(
      userJournal: freezed == userJournal
          ? _value.userJournal
          : userJournal // ignore: cast_nullable_to_non_nullable
              as SeeJournalModelUserJournal?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeeJournalModelDataImpl implements _SeeJournalModelData {
  const _$SeeJournalModelDataImpl(
      {@JsonKey(name: 'user_journal') this.userJournal});

  factory _$SeeJournalModelDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeeJournalModelDataImplFromJson(json);

  @override
  @JsonKey(name: 'user_journal')
  final SeeJournalModelUserJournal? userJournal;

  @override
  String toString() {
    return 'SeeJournalModelData(userJournal: $userJournal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeeJournalModelDataImpl &&
            (identical(other.userJournal, userJournal) ||
                other.userJournal == userJournal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userJournal);

  /// Create a copy of SeeJournalModelData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeeJournalModelDataImplCopyWith<_$SeeJournalModelDataImpl> get copyWith =>
      __$$SeeJournalModelDataImplCopyWithImpl<_$SeeJournalModelDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeeJournalModelDataImplToJson(
      this,
    );
  }
}

abstract class _SeeJournalModelData implements SeeJournalModelData {
  const factory _SeeJournalModelData(
          {@JsonKey(name: 'user_journal')
          final SeeJournalModelUserJournal? userJournal}) =
      _$SeeJournalModelDataImpl;

  factory _SeeJournalModelData.fromJson(Map<String, dynamic> json) =
      _$SeeJournalModelDataImpl.fromJson;

  @override
  @JsonKey(name: 'user_journal')
  SeeJournalModelUserJournal? get userJournal;

  /// Create a copy of SeeJournalModelData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeeJournalModelDataImplCopyWith<_$SeeJournalModelDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SeeJournalModelUserJournal _$SeeJournalModelUserJournalFromJson(
    Map<String, dynamic> json) {
  return _SeeJournalModelUserJournal.fromJson(json);
}

/// @nodoc
mixin _$SeeJournalModelUserJournal {
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
  SeeJournalModelJournal? get journal => throw _privateConstructorUsedError;
  List<SeeJournalModelAnswer>? get journalAnswers =>
      throw _privateConstructorUsedError;

  /// Serializes this SeeJournalModelUserJournal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeeJournalModelUserJournal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeeJournalModelUserJournalCopyWith<SeeJournalModelUserJournal>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeeJournalModelUserJournalCopyWith<$Res> {
  factory $SeeJournalModelUserJournalCopyWith(SeeJournalModelUserJournal value,
          $Res Function(SeeJournalModelUserJournal) then) =
      _$SeeJournalModelUserJournalCopyWithImpl<$Res,
          SeeJournalModelUserJournal>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'completed_at') String? completedAt,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'journal_id') int? journalId,
      @JsonKey(name: 'is_complete') bool? isComplete,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      SeeJournalModelJournal? journal,
      List<SeeJournalModelAnswer>? journalAnswers});

  $SeeJournalModelJournalCopyWith<$Res>? get journal;
}

/// @nodoc
class _$SeeJournalModelUserJournalCopyWithImpl<$Res,
        $Val extends SeeJournalModelUserJournal>
    implements $SeeJournalModelUserJournalCopyWith<$Res> {
  _$SeeJournalModelUserJournalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeeJournalModelUserJournal
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
              as SeeJournalModelJournal?,
      journalAnswers: freezed == journalAnswers
          ? _value.journalAnswers
          : journalAnswers // ignore: cast_nullable_to_non_nullable
              as List<SeeJournalModelAnswer>?,
    ) as $Val);
  }

  /// Create a copy of SeeJournalModelUserJournal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeeJournalModelJournalCopyWith<$Res>? get journal {
    if (_value.journal == null) {
      return null;
    }

    return $SeeJournalModelJournalCopyWith<$Res>(_value.journal!, (value) {
      return _then(_value.copyWith(journal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SeeJournalModelUserJournalImplCopyWith<$Res>
    implements $SeeJournalModelUserJournalCopyWith<$Res> {
  factory _$$SeeJournalModelUserJournalImplCopyWith(
          _$SeeJournalModelUserJournalImpl value,
          $Res Function(_$SeeJournalModelUserJournalImpl) then) =
      __$$SeeJournalModelUserJournalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'completed_at') String? completedAt,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'journal_id') int? journalId,
      @JsonKey(name: 'is_complete') bool? isComplete,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      SeeJournalModelJournal? journal,
      List<SeeJournalModelAnswer>? journalAnswers});

  @override
  $SeeJournalModelJournalCopyWith<$Res>? get journal;
}

/// @nodoc
class __$$SeeJournalModelUserJournalImplCopyWithImpl<$Res>
    extends _$SeeJournalModelUserJournalCopyWithImpl<$Res,
        _$SeeJournalModelUserJournalImpl>
    implements _$$SeeJournalModelUserJournalImplCopyWith<$Res> {
  __$$SeeJournalModelUserJournalImplCopyWithImpl(
      _$SeeJournalModelUserJournalImpl _value,
      $Res Function(_$SeeJournalModelUserJournalImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeeJournalModelUserJournal
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
    return _then(_$SeeJournalModelUserJournalImpl(
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
              as SeeJournalModelJournal?,
      journalAnswers: freezed == journalAnswers
          ? _value._journalAnswers
          : journalAnswers // ignore: cast_nullable_to_non_nullable
              as List<SeeJournalModelAnswer>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeeJournalModelUserJournalImpl implements _SeeJournalModelUserJournal {
  const _$SeeJournalModelUserJournalImpl(
      {this.id,
      @JsonKey(name: 'completed_at') this.completedAt,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'journal_id') this.journalId,
      @JsonKey(name: 'is_complete') this.isComplete,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.journal,
      final List<SeeJournalModelAnswer>? journalAnswers})
      : _journalAnswers = journalAnswers;

  factory _$SeeJournalModelUserJournalImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SeeJournalModelUserJournalImplFromJson(json);

  @override
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
  final SeeJournalModelJournal? journal;
  final List<SeeJournalModelAnswer>? _journalAnswers;
  @override
  List<SeeJournalModelAnswer>? get journalAnswers {
    final value = _journalAnswers;
    if (value == null) return null;
    if (_journalAnswers is EqualUnmodifiableListView) return _journalAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SeeJournalModelUserJournal(id: $id, completedAt: $completedAt, userId: $userId, journalId: $journalId, isComplete: $isComplete, createdAt: $createdAt, updatedAt: $updatedAt, journal: $journal, journalAnswers: $journalAnswers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeeJournalModelUserJournalImpl &&
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

  /// Create a copy of SeeJournalModelUserJournal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeeJournalModelUserJournalImplCopyWith<_$SeeJournalModelUserJournalImpl>
      get copyWith => __$$SeeJournalModelUserJournalImplCopyWithImpl<
          _$SeeJournalModelUserJournalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeeJournalModelUserJournalImplToJson(
      this,
    );
  }
}

abstract class _SeeJournalModelUserJournal
    implements SeeJournalModelUserJournal {
  const factory _SeeJournalModelUserJournal(
          {final int? id,
          @JsonKey(name: 'completed_at') final String? completedAt,
          @JsonKey(name: 'user_id') final int? userId,
          @JsonKey(name: 'journal_id') final int? journalId,
          @JsonKey(name: 'is_complete') final bool? isComplete,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'updated_at') final String? updatedAt,
          final SeeJournalModelJournal? journal,
          final List<SeeJournalModelAnswer>? journalAnswers}) =
      _$SeeJournalModelUserJournalImpl;

  factory _SeeJournalModelUserJournal.fromJson(Map<String, dynamic> json) =
      _$SeeJournalModelUserJournalImpl.fromJson;

  @override
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
  SeeJournalModelJournal? get journal;
  @override
  List<SeeJournalModelAnswer>? get journalAnswers;

  /// Create a copy of SeeJournalModelUserJournal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeeJournalModelUserJournalImplCopyWith<_$SeeJournalModelUserJournalImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SeeJournalModelJournal _$SeeJournalModelJournalFromJson(
    Map<String, dynamic> json) {
  return _SeeJournalModelJournal.fromJson(json);
}

/// @nodoc
mixin _$SeeJournalModelJournal {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'emotion_name')
  String? get emotionName => throw _privateConstructorUsedError;

  /// Serializes this SeeJournalModelJournal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeeJournalModelJournal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeeJournalModelJournalCopyWith<SeeJournalModelJournal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeeJournalModelJournalCopyWith<$Res> {
  factory $SeeJournalModelJournalCopyWith(SeeJournalModelJournal value,
          $Res Function(SeeJournalModelJournal) then) =
      _$SeeJournalModelJournalCopyWithImpl<$Res, SeeJournalModelJournal>;
  @useResult
  $Res call({int? id, @JsonKey(name: 'emotion_name') String? emotionName});
}

/// @nodoc
class _$SeeJournalModelJournalCopyWithImpl<$Res,
        $Val extends SeeJournalModelJournal>
    implements $SeeJournalModelJournalCopyWith<$Res> {
  _$SeeJournalModelJournalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeeJournalModelJournal
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
abstract class _$$SeeJournalModelJournalImplCopyWith<$Res>
    implements $SeeJournalModelJournalCopyWith<$Res> {
  factory _$$SeeJournalModelJournalImplCopyWith(
          _$SeeJournalModelJournalImpl value,
          $Res Function(_$SeeJournalModelJournalImpl) then) =
      __$$SeeJournalModelJournalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, @JsonKey(name: 'emotion_name') String? emotionName});
}

/// @nodoc
class __$$SeeJournalModelJournalImplCopyWithImpl<$Res>
    extends _$SeeJournalModelJournalCopyWithImpl<$Res,
        _$SeeJournalModelJournalImpl>
    implements _$$SeeJournalModelJournalImplCopyWith<$Res> {
  __$$SeeJournalModelJournalImplCopyWithImpl(
      _$SeeJournalModelJournalImpl _value,
      $Res Function(_$SeeJournalModelJournalImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeeJournalModelJournal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? emotionName = freezed,
  }) {
    return _then(_$SeeJournalModelJournalImpl(
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
class _$SeeJournalModelJournalImpl implements _SeeJournalModelJournal {
  const _$SeeJournalModelJournalImpl(
      {this.id, @JsonKey(name: 'emotion_name') this.emotionName});

  factory _$SeeJournalModelJournalImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeeJournalModelJournalImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'emotion_name')
  final String? emotionName;

  @override
  String toString() {
    return 'SeeJournalModelJournal(id: $id, emotionName: $emotionName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeeJournalModelJournalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emotionName, emotionName) ||
                other.emotionName == emotionName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, emotionName);

  /// Create a copy of SeeJournalModelJournal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeeJournalModelJournalImplCopyWith<_$SeeJournalModelJournalImpl>
      get copyWith => __$$SeeJournalModelJournalImplCopyWithImpl<
          _$SeeJournalModelJournalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeeJournalModelJournalImplToJson(
      this,
    );
  }
}

abstract class _SeeJournalModelJournal implements SeeJournalModelJournal {
  const factory _SeeJournalModelJournal(
          {final int? id,
          @JsonKey(name: 'emotion_name') final String? emotionName}) =
      _$SeeJournalModelJournalImpl;

  factory _SeeJournalModelJournal.fromJson(Map<String, dynamic> json) =
      _$SeeJournalModelJournalImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'emotion_name')
  String? get emotionName;

  /// Create a copy of SeeJournalModelJournal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeeJournalModelJournalImplCopyWith<_$SeeJournalModelJournalImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SeeJournalModelAnswer _$SeeJournalModelAnswerFromJson(
    Map<String, dynamic> json) {
  return _SeeJournalModelAnswer.fromJson(json);
}

/// @nodoc
mixin _$SeeJournalModelAnswer {
  int? get id => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
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
  SeeJournalModelMainQuestion? get mainQuestion =>
      throw _privateConstructorUsedError;
  SeeJournalModelFollowUpQuestion? get followUpQuestion =>
      throw _privateConstructorUsedError;

  /// Serializes this SeeJournalModelAnswer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeeJournalModelAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeeJournalModelAnswerCopyWith<SeeJournalModelAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeeJournalModelAnswerCopyWith<$Res> {
  factory $SeeJournalModelAnswerCopyWith(SeeJournalModelAnswer value,
          $Res Function(SeeJournalModelAnswer) then) =
      _$SeeJournalModelAnswerCopyWithImpl<$Res, SeeJournalModelAnswer>;
  @useResult
  $Res call(
      {int? id,
      String? text,
      String? media,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'main_question_id') int? mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') int? followUpQuestionId,
      @JsonKey(name: 'user_journal_id') int? userJournalId,
      SeeJournalModelMainQuestion? mainQuestion,
      SeeJournalModelFollowUpQuestion? followUpQuestion});

  $SeeJournalModelMainQuestionCopyWith<$Res>? get mainQuestion;
  $SeeJournalModelFollowUpQuestionCopyWith<$Res>? get followUpQuestion;
}

/// @nodoc
class _$SeeJournalModelAnswerCopyWithImpl<$Res,
        $Val extends SeeJournalModelAnswer>
    implements $SeeJournalModelAnswerCopyWith<$Res> {
  _$SeeJournalModelAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeeJournalModelAnswer
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
              as SeeJournalModelMainQuestion?,
      followUpQuestion: freezed == followUpQuestion
          ? _value.followUpQuestion
          : followUpQuestion // ignore: cast_nullable_to_non_nullable
              as SeeJournalModelFollowUpQuestion?,
    ) as $Val);
  }

  /// Create a copy of SeeJournalModelAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeeJournalModelMainQuestionCopyWith<$Res>? get mainQuestion {
    if (_value.mainQuestion == null) {
      return null;
    }

    return $SeeJournalModelMainQuestionCopyWith<$Res>(_value.mainQuestion!,
        (value) {
      return _then(_value.copyWith(mainQuestion: value) as $Val);
    });
  }

  /// Create a copy of SeeJournalModelAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeeJournalModelFollowUpQuestionCopyWith<$Res>? get followUpQuestion {
    if (_value.followUpQuestion == null) {
      return null;
    }

    return $SeeJournalModelFollowUpQuestionCopyWith<$Res>(
        _value.followUpQuestion!, (value) {
      return _then(_value.copyWith(followUpQuestion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SeeJournalModelAnswerImplCopyWith<$Res>
    implements $SeeJournalModelAnswerCopyWith<$Res> {
  factory _$$SeeJournalModelAnswerImplCopyWith(
          _$SeeJournalModelAnswerImpl value,
          $Res Function(_$SeeJournalModelAnswerImpl) then) =
      __$$SeeJournalModelAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? text,
      String? media,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'main_question_id') int? mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') int? followUpQuestionId,
      @JsonKey(name: 'user_journal_id') int? userJournalId,
      SeeJournalModelMainQuestion? mainQuestion,
      SeeJournalModelFollowUpQuestion? followUpQuestion});

  @override
  $SeeJournalModelMainQuestionCopyWith<$Res>? get mainQuestion;
  @override
  $SeeJournalModelFollowUpQuestionCopyWith<$Res>? get followUpQuestion;
}

/// @nodoc
class __$$SeeJournalModelAnswerImplCopyWithImpl<$Res>
    extends _$SeeJournalModelAnswerCopyWithImpl<$Res,
        _$SeeJournalModelAnswerImpl>
    implements _$$SeeJournalModelAnswerImplCopyWith<$Res> {
  __$$SeeJournalModelAnswerImplCopyWithImpl(_$SeeJournalModelAnswerImpl _value,
      $Res Function(_$SeeJournalModelAnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeeJournalModelAnswer
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
    return _then(_$SeeJournalModelAnswerImpl(
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
              as SeeJournalModelMainQuestion?,
      followUpQuestion: freezed == followUpQuestion
          ? _value.followUpQuestion
          : followUpQuestion // ignore: cast_nullable_to_non_nullable
              as SeeJournalModelFollowUpQuestion?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeeJournalModelAnswerImpl implements _SeeJournalModelAnswer {
  const _$SeeJournalModelAnswerImpl(
      {this.id,
      this.text,
      this.media,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'main_question_id') this.mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') this.followUpQuestionId,
      @JsonKey(name: 'user_journal_id') this.userJournalId,
      this.mainQuestion,
      this.followUpQuestion});

  factory _$SeeJournalModelAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeeJournalModelAnswerImplFromJson(json);

  @override
  final int? id;
  @override
  final String? text;
  @override
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
  final SeeJournalModelMainQuestion? mainQuestion;
  @override
  final SeeJournalModelFollowUpQuestion? followUpQuestion;

  @override
  String toString() {
    return 'SeeJournalModelAnswer(id: $id, text: $text, media: $media, createdAt: $createdAt, updatedAt: $updatedAt, mainQuestionId: $mainQuestionId, followUpQuestionId: $followUpQuestionId, userJournalId: $userJournalId, mainQuestion: $mainQuestion, followUpQuestion: $followUpQuestion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeeJournalModelAnswerImpl &&
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

  /// Create a copy of SeeJournalModelAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeeJournalModelAnswerImplCopyWith<_$SeeJournalModelAnswerImpl>
      get copyWith => __$$SeeJournalModelAnswerImplCopyWithImpl<
          _$SeeJournalModelAnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeeJournalModelAnswerImplToJson(
      this,
    );
  }
}

abstract class _SeeJournalModelAnswer implements SeeJournalModelAnswer {
  const factory _SeeJournalModelAnswer(
          {final int? id,
          final String? text,
          final String? media,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'updated_at') final String? updatedAt,
          @JsonKey(name: 'main_question_id') final int? mainQuestionId,
          @JsonKey(name: 'follow_up_question_id') final int? followUpQuestionId,
          @JsonKey(name: 'user_journal_id') final int? userJournalId,
          final SeeJournalModelMainQuestion? mainQuestion,
          final SeeJournalModelFollowUpQuestion? followUpQuestion}) =
      _$SeeJournalModelAnswerImpl;

  factory _SeeJournalModelAnswer.fromJson(Map<String, dynamic> json) =
      _$SeeJournalModelAnswerImpl.fromJson;

  @override
  int? get id;
  @override
  String? get text;
  @override
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
  SeeJournalModelMainQuestion? get mainQuestion;
  @override
  SeeJournalModelFollowUpQuestion? get followUpQuestion;

  /// Create a copy of SeeJournalModelAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeeJournalModelAnswerImplCopyWith<_$SeeJournalModelAnswerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SeeJournalModelMainQuestion _$SeeJournalModelMainQuestionFromJson(
    Map<String, dynamic> json) {
  return _SeeJournalModelMainQuestion.fromJson(json);
}

/// @nodoc
mixin _$SeeJournalModelMainQuestion {
  int? get id => throw _privateConstructorUsedError;
  String? get question => throw _privateConstructorUsedError;
  String? get keywords => throw _privateConstructorUsedError;
  @JsonKey(name: 'answered')
  bool? get answered => throw _privateConstructorUsedError;
  SeeJournalModelAnswer? get answer => throw _privateConstructorUsedError;

  /// Serializes this SeeJournalModelMainQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeeJournalModelMainQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeeJournalModelMainQuestionCopyWith<SeeJournalModelMainQuestion>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeeJournalModelMainQuestionCopyWith<$Res> {
  factory $SeeJournalModelMainQuestionCopyWith(
          SeeJournalModelMainQuestion value,
          $Res Function(SeeJournalModelMainQuestion) then) =
      _$SeeJournalModelMainQuestionCopyWithImpl<$Res,
          SeeJournalModelMainQuestion>;
  @useResult
  $Res call(
      {int? id,
      String? question,
      String? keywords,
      @JsonKey(name: 'answered') bool? answered,
      SeeJournalModelAnswer? answer});

  $SeeJournalModelAnswerCopyWith<$Res>? get answer;
}

/// @nodoc
class _$SeeJournalModelMainQuestionCopyWithImpl<$Res,
        $Val extends SeeJournalModelMainQuestion>
    implements $SeeJournalModelMainQuestionCopyWith<$Res> {
  _$SeeJournalModelMainQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeeJournalModelMainQuestion
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
              as SeeJournalModelAnswer?,
    ) as $Val);
  }

  /// Create a copy of SeeJournalModelMainQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeeJournalModelAnswerCopyWith<$Res>? get answer {
    if (_value.answer == null) {
      return null;
    }

    return $SeeJournalModelAnswerCopyWith<$Res>(_value.answer!, (value) {
      return _then(_value.copyWith(answer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SeeJournalModelMainQuestionImplCopyWith<$Res>
    implements $SeeJournalModelMainQuestionCopyWith<$Res> {
  factory _$$SeeJournalModelMainQuestionImplCopyWith(
          _$SeeJournalModelMainQuestionImpl value,
          $Res Function(_$SeeJournalModelMainQuestionImpl) then) =
      __$$SeeJournalModelMainQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? question,
      String? keywords,
      @JsonKey(name: 'answered') bool? answered,
      SeeJournalModelAnswer? answer});

  @override
  $SeeJournalModelAnswerCopyWith<$Res>? get answer;
}

/// @nodoc
class __$$SeeJournalModelMainQuestionImplCopyWithImpl<$Res>
    extends _$SeeJournalModelMainQuestionCopyWithImpl<$Res,
        _$SeeJournalModelMainQuestionImpl>
    implements _$$SeeJournalModelMainQuestionImplCopyWith<$Res> {
  __$$SeeJournalModelMainQuestionImplCopyWithImpl(
      _$SeeJournalModelMainQuestionImpl _value,
      $Res Function(_$SeeJournalModelMainQuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeeJournalModelMainQuestion
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
    return _then(_$SeeJournalModelMainQuestionImpl(
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
              as SeeJournalModelAnswer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeeJournalModelMainQuestionImpl
    implements _SeeJournalModelMainQuestion {
  const _$SeeJournalModelMainQuestionImpl(
      {this.id,
      this.question,
      this.keywords,
      @JsonKey(name: 'answered') this.answered,
      this.answer});

  factory _$SeeJournalModelMainQuestionImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SeeJournalModelMainQuestionImplFromJson(json);

  @override
  final int? id;
  @override
  final String? question;
  @override
  final String? keywords;
  @override
  @JsonKey(name: 'answered')
  final bool? answered;
  @override
  final SeeJournalModelAnswer? answer;

  @override
  String toString() {
    return 'SeeJournalModelMainQuestion(id: $id, question: $question, keywords: $keywords, answered: $answered, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeeJournalModelMainQuestionImpl &&
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

  /// Create a copy of SeeJournalModelMainQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeeJournalModelMainQuestionImplCopyWith<_$SeeJournalModelMainQuestionImpl>
      get copyWith => __$$SeeJournalModelMainQuestionImplCopyWithImpl<
          _$SeeJournalModelMainQuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeeJournalModelMainQuestionImplToJson(
      this,
    );
  }
}

abstract class _SeeJournalModelMainQuestion
    implements SeeJournalModelMainQuestion {
  const factory _SeeJournalModelMainQuestion(
      {final int? id,
      final String? question,
      final String? keywords,
      @JsonKey(name: 'answered') final bool? answered,
      final SeeJournalModelAnswer? answer}) = _$SeeJournalModelMainQuestionImpl;

  factory _SeeJournalModelMainQuestion.fromJson(Map<String, dynamic> json) =
      _$SeeJournalModelMainQuestionImpl.fromJson;

  @override
  int? get id;
  @override
  String? get question;
  @override
  String? get keywords;
  @override
  @JsonKey(name: 'answered')
  bool? get answered;
  @override
  SeeJournalModelAnswer? get answer;

  /// Create a copy of SeeJournalModelMainQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeeJournalModelMainQuestionImplCopyWith<_$SeeJournalModelMainQuestionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SeeJournalModelFollowUpQuestion _$SeeJournalModelFollowUpQuestionFromJson(
    Map<String, dynamic> json) {
  return _SeeJournalModelFollowUpQuestion.fromJson(json);
}

/// @nodoc
mixin _$SeeJournalModelFollowUpQuestion {
  int? get id => throw _privateConstructorUsedError;
  String? get question => throw _privateConstructorUsedError;
  String? get keywords => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_type')
  String? get questionType => throw _privateConstructorUsedError;
  List<String>? get options => throw _privateConstructorUsedError;
  @JsonKey(name: 'answered')
  bool? get answered => throw _privateConstructorUsedError;
  SeeJournalModelAnswer? get answer => throw _privateConstructorUsedError;

  /// Serializes this SeeJournalModelFollowUpQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeeJournalModelFollowUpQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeeJournalModelFollowUpQuestionCopyWith<SeeJournalModelFollowUpQuestion>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeeJournalModelFollowUpQuestionCopyWith<$Res> {
  factory $SeeJournalModelFollowUpQuestionCopyWith(
          SeeJournalModelFollowUpQuestion value,
          $Res Function(SeeJournalModelFollowUpQuestion) then) =
      _$SeeJournalModelFollowUpQuestionCopyWithImpl<$Res,
          SeeJournalModelFollowUpQuestion>;
  @useResult
  $Res call(
      {int? id,
      String? question,
      String? keywords,
      @JsonKey(name: 'question_type') String? questionType,
      List<String>? options,
      @JsonKey(name: 'answered') bool? answered,
      SeeJournalModelAnswer? answer});

  $SeeJournalModelAnswerCopyWith<$Res>? get answer;
}

/// @nodoc
class _$SeeJournalModelFollowUpQuestionCopyWithImpl<$Res,
        $Val extends SeeJournalModelFollowUpQuestion>
    implements $SeeJournalModelFollowUpQuestionCopyWith<$Res> {
  _$SeeJournalModelFollowUpQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeeJournalModelFollowUpQuestion
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
              as List<String>?,
      answered: freezed == answered
          ? _value.answered
          : answered // ignore: cast_nullable_to_non_nullable
              as bool?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as SeeJournalModelAnswer?,
    ) as $Val);
  }

  /// Create a copy of SeeJournalModelFollowUpQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeeJournalModelAnswerCopyWith<$Res>? get answer {
    if (_value.answer == null) {
      return null;
    }

    return $SeeJournalModelAnswerCopyWith<$Res>(_value.answer!, (value) {
      return _then(_value.copyWith(answer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SeeJournalModelFollowUpQuestionImplCopyWith<$Res>
    implements $SeeJournalModelFollowUpQuestionCopyWith<$Res> {
  factory _$$SeeJournalModelFollowUpQuestionImplCopyWith(
          _$SeeJournalModelFollowUpQuestionImpl value,
          $Res Function(_$SeeJournalModelFollowUpQuestionImpl) then) =
      __$$SeeJournalModelFollowUpQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? question,
      String? keywords,
      @JsonKey(name: 'question_type') String? questionType,
      List<String>? options,
      @JsonKey(name: 'answered') bool? answered,
      SeeJournalModelAnswer? answer});

  @override
  $SeeJournalModelAnswerCopyWith<$Res>? get answer;
}

/// @nodoc
class __$$SeeJournalModelFollowUpQuestionImplCopyWithImpl<$Res>
    extends _$SeeJournalModelFollowUpQuestionCopyWithImpl<$Res,
        _$SeeJournalModelFollowUpQuestionImpl>
    implements _$$SeeJournalModelFollowUpQuestionImplCopyWith<$Res> {
  __$$SeeJournalModelFollowUpQuestionImplCopyWithImpl(
      _$SeeJournalModelFollowUpQuestionImpl _value,
      $Res Function(_$SeeJournalModelFollowUpQuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeeJournalModelFollowUpQuestion
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
    return _then(_$SeeJournalModelFollowUpQuestionImpl(
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
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      answered: freezed == answered
          ? _value.answered
          : answered // ignore: cast_nullable_to_non_nullable
              as bool?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as SeeJournalModelAnswer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeeJournalModelFollowUpQuestionImpl
    implements _SeeJournalModelFollowUpQuestion {
  const _$SeeJournalModelFollowUpQuestionImpl(
      {this.id,
      this.question,
      this.keywords,
      @JsonKey(name: 'question_type') this.questionType,
      final List<String>? options,
      @JsonKey(name: 'answered') this.answered,
      this.answer})
      : _options = options;

  factory _$SeeJournalModelFollowUpQuestionImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SeeJournalModelFollowUpQuestionImplFromJson(json);

  @override
  final int? id;
  @override
  final String? question;
  @override
  final String? keywords;
  @override
  @JsonKey(name: 'question_type')
  final String? questionType;
  final List<String>? _options;
  @override
  List<String>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'answered')
  final bool? answered;
  @override
  final SeeJournalModelAnswer? answer;

  @override
  String toString() {
    return 'SeeJournalModelFollowUpQuestion(id: $id, question: $question, keywords: $keywords, questionType: $questionType, options: $options, answered: $answered, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeeJournalModelFollowUpQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.answered, answered) ||
                other.answered == answered) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      question,
      keywords,
      questionType,
      const DeepCollectionEquality().hash(_options),
      answered,
      answer);

  /// Create a copy of SeeJournalModelFollowUpQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeeJournalModelFollowUpQuestionImplCopyWith<
          _$SeeJournalModelFollowUpQuestionImpl>
      get copyWith => __$$SeeJournalModelFollowUpQuestionImplCopyWithImpl<
          _$SeeJournalModelFollowUpQuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeeJournalModelFollowUpQuestionImplToJson(
      this,
    );
  }
}

abstract class _SeeJournalModelFollowUpQuestion
    implements SeeJournalModelFollowUpQuestion {
  const factory _SeeJournalModelFollowUpQuestion(
          {final int? id,
          final String? question,
          final String? keywords,
          @JsonKey(name: 'question_type') final String? questionType,
          final List<String>? options,
          @JsonKey(name: 'answered') final bool? answered,
          final SeeJournalModelAnswer? answer}) =
      _$SeeJournalModelFollowUpQuestionImpl;

  factory _SeeJournalModelFollowUpQuestion.fromJson(Map<String, dynamic> json) =
      _$SeeJournalModelFollowUpQuestionImpl.fromJson;

  @override
  int? get id;
  @override
  String? get question;
  @override
  String? get keywords;
  @override
  @JsonKey(name: 'question_type')
  String? get questionType;
  @override
  List<String>? get options;
  @override
  @JsonKey(name: 'answered')
  bool? get answered;
  @override
  SeeJournalModelAnswer? get answer;

  /// Create a copy of SeeJournalModelFollowUpQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeeJournalModelFollowUpQuestionImplCopyWith<
          _$SeeJournalModelFollowUpQuestionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
