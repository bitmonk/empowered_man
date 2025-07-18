// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_memory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyMemoryModel _$MyMemoryModelFromJson(Map<String, dynamic> json) {
  return _MyMemoryModel.fromJson(json);
}

/// @nodoc
mixin _$MyMemoryModel {
  @JsonKey(name: "status")
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  Data? get data => throw _privateConstructorUsedError;

  /// Serializes this MyMemoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyMemoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyMemoryModelCopyWith<MyMemoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyMemoryModelCopyWith<$Res> {
  factory $MyMemoryModelCopyWith(
          MyMemoryModel value, $Res Function(MyMemoryModel) then) =
      _$MyMemoryModelCopyWithImpl<$Res, MyMemoryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$MyMemoryModelCopyWithImpl<$Res, $Val extends MyMemoryModel>
    implements $MyMemoryModelCopyWith<$Res> {
  _$MyMemoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyMemoryModel
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

  /// Create a copy of MyMemoryModel
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
abstract class _$$MyMemoryModelImplCopyWith<$Res>
    implements $MyMemoryModelCopyWith<$Res> {
  factory _$$MyMemoryModelImplCopyWith(
          _$MyMemoryModelImpl value, $Res Function(_$MyMemoryModelImpl) then) =
      __$$MyMemoryModelImplCopyWithImpl<$Res>;
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
class __$$MyMemoryModelImplCopyWithImpl<$Res>
    extends _$MyMemoryModelCopyWithImpl<$Res, _$MyMemoryModelImpl>
    implements _$$MyMemoryModelImplCopyWith<$Res> {
  __$$MyMemoryModelImplCopyWithImpl(
      _$MyMemoryModelImpl _value, $Res Function(_$MyMemoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyMemoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$MyMemoryModelImpl(
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
class _$MyMemoryModelImpl implements _MyMemoryModel {
  const _$MyMemoryModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$MyMemoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyMemoryModelImplFromJson(json);

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
    return 'MyMemoryModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyMemoryModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of MyMemoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyMemoryModelImplCopyWith<_$MyMemoryModelImpl> get copyWith =>
      __$$MyMemoryModelImplCopyWithImpl<_$MyMemoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyMemoryModelImplToJson(
      this,
    );
  }
}

abstract class _MyMemoryModel implements MyMemoryModel {
  const factory _MyMemoryModel(
      {@JsonKey(name: "status") final bool? status,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data") final Data? data}) = _$MyMemoryModelImpl;

  factory _MyMemoryModel.fromJson(Map<String, dynamic> json) =
      _$MyMemoryModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  bool? get status;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "data")
  Data? get data;

  /// Create a copy of MyMemoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyMemoryModelImplCopyWith<_$MyMemoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "memory")
  Memory? get memory => throw _privateConstructorUsedError;

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
  $Res call({@JsonKey(name: "memory") Memory? memory});

  $MemoryCopyWith<$Res>? get memory;
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
    Object? memory = freezed,
  }) {
    return _then(_value.copyWith(
      memory: freezed == memory
          ? _value.memory
          : memory // ignore: cast_nullable_to_non_nullable
              as Memory?,
    ) as $Val);
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemoryCopyWith<$Res>? get memory {
    if (_value.memory == null) {
      return null;
    }

    return $MemoryCopyWith<$Res>(_value.memory!, (value) {
      return _then(_value.copyWith(memory: value) as $Val);
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
  $Res call({@JsonKey(name: "memory") Memory? memory});

  @override
  $MemoryCopyWith<$Res>? get memory;
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
    Object? memory = freezed,
  }) {
    return _then(_$DataImpl(
      memory: freezed == memory
          ? _value.memory
          : memory // ignore: cast_nullable_to_non_nullable
              as Memory?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl({@JsonKey(name: "memory") this.memory});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "memory")
  final Memory? memory;

  @override
  String toString() {
    return 'Data(memory: $memory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.memory, memory) || other.memory == memory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, memory);

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
  const factory _Data({@JsonKey(name: "memory") final Memory? memory}) =
      _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "memory")
  Memory? get memory;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Memory _$MemoryFromJson(Map<String, dynamic> json) {
  return _Memory.fromJson(json);
}

/// @nodoc
mixin _$Memory {
  @JsonKey(name: "journal_id")
  int? get journalId => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "emotion_name")
  String? get emotionName => throw _privateConstructorUsedError;
  @JsonKey(name: "answers")
  Answers? get answers => throw _privateConstructorUsedError;

  /// Serializes this Memory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Memory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemoryCopyWith<Memory> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoryCopyWith<$Res> {
  factory $MemoryCopyWith(Memory value, $Res Function(Memory) then) =
      _$MemoryCopyWithImpl<$Res, Memory>;
  @useResult
  $Res call(
      {@JsonKey(name: "journal_id") int? journalId,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "emotion_name") String? emotionName,
      @JsonKey(name: "answers") Answers? answers});

  $AnswersCopyWith<$Res>? get answers;
}

/// @nodoc
class _$MemoryCopyWithImpl<$Res, $Val extends Memory>
    implements $MemoryCopyWith<$Res> {
  _$MemoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Memory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? journalId = freezed,
    Object? createdAt = freezed,
    Object? emotionName = freezed,
    Object? answers = freezed,
  }) {
    return _then(_value.copyWith(
      journalId: freezed == journalId
          ? _value.journalId
          : journalId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      emotionName: freezed == emotionName
          ? _value.emotionName
          : emotionName // ignore: cast_nullable_to_non_nullable
              as String?,
      answers: freezed == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Answers?,
    ) as $Val);
  }

  /// Create a copy of Memory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnswersCopyWith<$Res>? get answers {
    if (_value.answers == null) {
      return null;
    }

    return $AnswersCopyWith<$Res>(_value.answers!, (value) {
      return _then(_value.copyWith(answers: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MemoryImplCopyWith<$Res> implements $MemoryCopyWith<$Res> {
  factory _$$MemoryImplCopyWith(
          _$MemoryImpl value, $Res Function(_$MemoryImpl) then) =
      __$$MemoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "journal_id") int? journalId,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "emotion_name") String? emotionName,
      @JsonKey(name: "answers") Answers? answers});

  @override
  $AnswersCopyWith<$Res>? get answers;
}

/// @nodoc
class __$$MemoryImplCopyWithImpl<$Res>
    extends _$MemoryCopyWithImpl<$Res, _$MemoryImpl>
    implements _$$MemoryImplCopyWith<$Res> {
  __$$MemoryImplCopyWithImpl(
      _$MemoryImpl _value, $Res Function(_$MemoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Memory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? journalId = freezed,
    Object? createdAt = freezed,
    Object? emotionName = freezed,
    Object? answers = freezed,
  }) {
    return _then(_$MemoryImpl(
      journalId: freezed == journalId
          ? _value.journalId
          : journalId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      emotionName: freezed == emotionName
          ? _value.emotionName
          : emotionName // ignore: cast_nullable_to_non_nullable
              as String?,
      answers: freezed == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Answers?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemoryImpl implements _Memory {
  const _$MemoryImpl(
      {@JsonKey(name: "journal_id") this.journalId,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "emotion_name") this.emotionName,
      @JsonKey(name: "answers") this.answers});

  factory _$MemoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemoryImplFromJson(json);

  @override
  @JsonKey(name: "journal_id")
  final int? journalId;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "emotion_name")
  final String? emotionName;
  @override
  @JsonKey(name: "answers")
  final Answers? answers;

  @override
  String toString() {
    return 'Memory(journalId: $journalId, createdAt: $createdAt, emotionName: $emotionName, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoryImpl &&
            (identical(other.journalId, journalId) ||
                other.journalId == journalId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.emotionName, emotionName) ||
                other.emotionName == emotionName) &&
            (identical(other.answers, answers) || other.answers == answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, journalId, createdAt, emotionName, answers);

  /// Create a copy of Memory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoryImplCopyWith<_$MemoryImpl> get copyWith =>
      __$$MemoryImplCopyWithImpl<_$MemoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemoryImplToJson(
      this,
    );
  }
}

abstract class _Memory implements Memory {
  const factory _Memory(
      {@JsonKey(name: "journal_id") final int? journalId,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      @JsonKey(name: "emotion_name") final String? emotionName,
      @JsonKey(name: "answers") final Answers? answers}) = _$MemoryImpl;

  factory _Memory.fromJson(Map<String, dynamic> json) = _$MemoryImpl.fromJson;

  @override
  @JsonKey(name: "journal_id")
  int? get journalId;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "emotion_name")
  String? get emotionName;
  @override
  @JsonKey(name: "answers")
  Answers? get answers;

  /// Create a copy of Memory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemoryImplCopyWith<_$MemoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Answers _$AnswersFromJson(Map<String, dynamic> json) {
  return _Answers.fromJson(json);
}

/// @nodoc
mixin _$Answers {
  @JsonKey(name: "action")
  List<Tion>? get action => throw _privateConstructorUsedError;
  @JsonKey(name: "revelation")
  List<Tion>? get revelation => throw _privateConstructorUsedError;
  @JsonKey(name: "story")
  List<dynamic>? get story => throw _privateConstructorUsedError;
  @JsonKey(name: "lesson")
  List<dynamic>? get lesson => throw _privateConstructorUsedError;

  /// Serializes this Answers to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Answers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswersCopyWith<Answers> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswersCopyWith<$Res> {
  factory $AnswersCopyWith(Answers value, $Res Function(Answers) then) =
      _$AnswersCopyWithImpl<$Res, Answers>;
  @useResult
  $Res call(
      {@JsonKey(name: "action") List<Tion>? action,
      @JsonKey(name: "revelation") List<Tion>? revelation,
      @JsonKey(name: "story") List<dynamic>? story,
      @JsonKey(name: "lesson") List<dynamic>? lesson});
}

/// @nodoc
class _$AnswersCopyWithImpl<$Res, $Val extends Answers>
    implements $AnswersCopyWith<$Res> {
  _$AnswersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Answers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? revelation = freezed,
    Object? story = freezed,
    Object? lesson = freezed,
  }) {
    return _then(_value.copyWith(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as List<Tion>?,
      revelation: freezed == revelation
          ? _value.revelation
          : revelation // ignore: cast_nullable_to_non_nullable
              as List<Tion>?,
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      lesson: freezed == lesson
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswersImplCopyWith<$Res> implements $AnswersCopyWith<$Res> {
  factory _$$AnswersImplCopyWith(
          _$AnswersImpl value, $Res Function(_$AnswersImpl) then) =
      __$$AnswersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "action") List<Tion>? action,
      @JsonKey(name: "revelation") List<Tion>? revelation,
      @JsonKey(name: "story") List<dynamic>? story,
      @JsonKey(name: "lesson") List<dynamic>? lesson});
}

/// @nodoc
class __$$AnswersImplCopyWithImpl<$Res>
    extends _$AnswersCopyWithImpl<$Res, _$AnswersImpl>
    implements _$$AnswersImplCopyWith<$Res> {
  __$$AnswersImplCopyWithImpl(
      _$AnswersImpl _value, $Res Function(_$AnswersImpl) _then)
      : super(_value, _then);

  /// Create a copy of Answers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? revelation = freezed,
    Object? story = freezed,
    Object? lesson = freezed,
  }) {
    return _then(_$AnswersImpl(
      action: freezed == action
          ? _value._action
          : action // ignore: cast_nullable_to_non_nullable
              as List<Tion>?,
      revelation: freezed == revelation
          ? _value._revelation
          : revelation // ignore: cast_nullable_to_non_nullable
              as List<Tion>?,
      story: freezed == story
          ? _value._story
          : story // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      lesson: freezed == lesson
          ? _value._lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswersImpl implements _Answers {
  const _$AnswersImpl(
      {@JsonKey(name: "action") final List<Tion>? action,
      @JsonKey(name: "revelation") final List<Tion>? revelation,
      @JsonKey(name: "story") final List<dynamic>? story,
      @JsonKey(name: "lesson") final List<dynamic>? lesson})
      : _action = action,
        _revelation = revelation,
        _story = story,
        _lesson = lesson;

  factory _$AnswersImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswersImplFromJson(json);

  final List<Tion>? _action;
  @override
  @JsonKey(name: "action")
  List<Tion>? get action {
    final value = _action;
    if (value == null) return null;
    if (_action is EqualUnmodifiableListView) return _action;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Tion>? _revelation;
  @override
  @JsonKey(name: "revelation")
  List<Tion>? get revelation {
    final value = _revelation;
    if (value == null) return null;
    if (_revelation is EqualUnmodifiableListView) return _revelation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _story;
  @override
  @JsonKey(name: "story")
  List<dynamic>? get story {
    final value = _story;
    if (value == null) return null;
    if (_story is EqualUnmodifiableListView) return _story;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _lesson;
  @override
  @JsonKey(name: "lesson")
  List<dynamic>? get lesson {
    final value = _lesson;
    if (value == null) return null;
    if (_lesson is EqualUnmodifiableListView) return _lesson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Answers(action: $action, revelation: $revelation, story: $story, lesson: $lesson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswersImpl &&
            const DeepCollectionEquality().equals(other._action, _action) &&
            const DeepCollectionEquality()
                .equals(other._revelation, _revelation) &&
            const DeepCollectionEquality().equals(other._story, _story) &&
            const DeepCollectionEquality().equals(other._lesson, _lesson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_action),
      const DeepCollectionEquality().hash(_revelation),
      const DeepCollectionEquality().hash(_story),
      const DeepCollectionEquality().hash(_lesson));

  /// Create a copy of Answers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswersImplCopyWith<_$AnswersImpl> get copyWith =>
      __$$AnswersImplCopyWithImpl<_$AnswersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswersImplToJson(
      this,
    );
  }
}

abstract class _Answers implements Answers {
  const factory _Answers(
      {@JsonKey(name: "action") final List<Tion>? action,
      @JsonKey(name: "revelation") final List<Tion>? revelation,
      @JsonKey(name: "story") final List<dynamic>? story,
      @JsonKey(name: "lesson") final List<dynamic>? lesson}) = _$AnswersImpl;

  factory _Answers.fromJson(Map<String, dynamic> json) = _$AnswersImpl.fromJson;

  @override
  @JsonKey(name: "action")
  List<Tion>? get action;
  @override
  @JsonKey(name: "revelation")
  List<Tion>? get revelation;
  @override
  @JsonKey(name: "story")
  List<dynamic>? get story;
  @override
  @JsonKey(name: "lesson")
  List<dynamic>? get lesson;

  /// Create a copy of Answers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswersImplCopyWith<_$AnswersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tion _$TionFromJson(Map<String, dynamic> json) {
  return _Tion.fromJson(json);
}

/// @nodoc
mixin _$Tion {
  @JsonKey(name: "text")
  String? get text => throw _privateConstructorUsedError;

  /// Serializes this Tion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Tion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TionCopyWith<Tion> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TionCopyWith<$Res> {
  factory $TionCopyWith(Tion value, $Res Function(Tion) then) =
      _$TionCopyWithImpl<$Res, Tion>;
  @useResult
  $Res call({@JsonKey(name: "text") String? text});
}

/// @nodoc
class _$TionCopyWithImpl<$Res, $Val extends Tion>
    implements $TionCopyWith<$Res> {
  _$TionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TionImplCopyWith<$Res> implements $TionCopyWith<$Res> {
  factory _$$TionImplCopyWith(
          _$TionImpl value, $Res Function(_$TionImpl) then) =
      __$$TionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "text") String? text});
}

/// @nodoc
class __$$TionImplCopyWithImpl<$Res>
    extends _$TionCopyWithImpl<$Res, _$TionImpl>
    implements _$$TionImplCopyWith<$Res> {
  __$$TionImplCopyWithImpl(_$TionImpl _value, $Res Function(_$TionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Tion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$TionImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TionImpl implements _Tion {
  const _$TionImpl({@JsonKey(name: "text") this.text});

  factory _$TionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TionImplFromJson(json);

  @override
  @JsonKey(name: "text")
  final String? text;

  @override
  String toString() {
    return 'Tion(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TionImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of Tion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TionImplCopyWith<_$TionImpl> get copyWith =>
      __$$TionImplCopyWithImpl<_$TionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TionImplToJson(
      this,
    );
  }
}

abstract class _Tion implements Tion {
  const factory _Tion({@JsonKey(name: "text") final String? text}) = _$TionImpl;

  factory _Tion.fromJson(Map<String, dynamic> json) = _$TionImpl.fromJson;

  @override
  @JsonKey(name: "text")
  String? get text;

  /// Create a copy of Tion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TionImplCopyWith<_$TionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
