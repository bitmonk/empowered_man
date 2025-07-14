// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_enums_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskEnumsModel _$TaskEnumsModelFromJson(Map<String, dynamic> json) {
  return _TaskEnumsModel.fromJson(json);
}

/// @nodoc
mixin _$TaskEnumsModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Data? get data => throw _privateConstructorUsedError;

  /// Serializes this TaskEnumsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskEnumsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskEnumsModelCopyWith<TaskEnumsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEnumsModelCopyWith<$Res> {
  factory $TaskEnumsModelCopyWith(
          TaskEnumsModel value, $Res Function(TaskEnumsModel) then) =
      _$TaskEnumsModelCopyWithImpl<$Res, TaskEnumsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$TaskEnumsModelCopyWithImpl<$Res, $Val extends TaskEnumsModel>
    implements $TaskEnumsModelCopyWith<$Res> {
  _$TaskEnumsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskEnumsModel
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

  /// Create a copy of TaskEnumsModel
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
abstract class _$$TaskEnumsModelImplCopyWith<$Res>
    implements $TaskEnumsModelCopyWith<$Res> {
  factory _$$TaskEnumsModelImplCopyWith(_$TaskEnumsModelImpl value,
          $Res Function(_$TaskEnumsModelImpl) then) =
      __$$TaskEnumsModelImplCopyWithImpl<$Res>;
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
class __$$TaskEnumsModelImplCopyWithImpl<$Res>
    extends _$TaskEnumsModelCopyWithImpl<$Res, _$TaskEnumsModelImpl>
    implements _$$TaskEnumsModelImplCopyWith<$Res> {
  __$$TaskEnumsModelImplCopyWithImpl(
      _$TaskEnumsModelImpl _value, $Res Function(_$TaskEnumsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEnumsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$TaskEnumsModelImpl(
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
class _$TaskEnumsModelImpl implements _TaskEnumsModel {
  const _$TaskEnumsModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$TaskEnumsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskEnumsModelImplFromJson(json);

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
    return 'TaskEnumsModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEnumsModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of TaskEnumsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskEnumsModelImplCopyWith<_$TaskEnumsModelImpl> get copyWith =>
      __$$TaskEnumsModelImplCopyWithImpl<_$TaskEnumsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskEnumsModelImplToJson(
      this,
    );
  }
}

abstract class _TaskEnumsModel implements TaskEnumsModel {
  const factory _TaskEnumsModel(
      {@JsonKey(name: 'status') final bool? status,
      @JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'data') final Data? data}) = _$TaskEnumsModelImpl;

  factory _TaskEnumsModel.fromJson(Map<String, dynamic> json) =
      _$TaskEnumsModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  Data? get data;

  /// Create a copy of TaskEnumsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskEnumsModelImplCopyWith<_$TaskEnumsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'levels')
  List<String>? get levels => throw _privateConstructorUsedError;
  @JsonKey(name: 'completion_status')
  List<String>? get completionStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'priorities')
  List<String>? get priorities => throw _privateConstructorUsedError;
  @JsonKey(name: 'week_days')
  List<String>? get weekDays => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'levels') List<String>? levels,
      @JsonKey(name: 'completion_status') List<String>? completionStatus,
      @JsonKey(name: 'priorities') List<String>? priorities,
      @JsonKey(name: 'week_days') List<String>? weekDays});
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
    Object? levels = freezed,
    Object? completionStatus = freezed,
    Object? priorities = freezed,
    Object? weekDays = freezed,
  }) {
    return _then(_value.copyWith(
      levels: freezed == levels
          ? _value.levels
          : levels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      completionStatus: freezed == completionStatus
          ? _value.completionStatus
          : completionStatus // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      priorities: freezed == priorities
          ? _value.priorities
          : priorities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      weekDays: freezed == weekDays
          ? _value.weekDays
          : weekDays // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
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
      {@JsonKey(name: 'levels') List<String>? levels,
      @JsonKey(name: 'completion_status') List<String>? completionStatus,
      @JsonKey(name: 'priorities') List<String>? priorities,
      @JsonKey(name: 'week_days') List<String>? weekDays});
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
    Object? levels = freezed,
    Object? completionStatus = freezed,
    Object? priorities = freezed,
    Object? weekDays = freezed,
  }) {
    return _then(_$DataImpl(
      levels: freezed == levels
          ? _value._levels
          : levels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      completionStatus: freezed == completionStatus
          ? _value._completionStatus
          : completionStatus // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      priorities: freezed == priorities
          ? _value._priorities
          : priorities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      weekDays: freezed == weekDays
          ? _value._weekDays
          : weekDays // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: 'levels') final List<String>? levels,
      @JsonKey(name: 'completion_status') final List<String>? completionStatus,
      @JsonKey(name: 'priorities') final List<String>? priorities,
      @JsonKey(name: 'week_days') final List<String>? weekDays})
      : _levels = levels,
        _completionStatus = completionStatus,
        _priorities = priorities,
        _weekDays = weekDays;

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  final List<String>? _levels;
  @override
  @JsonKey(name: 'levels')
  List<String>? get levels {
    final value = _levels;
    if (value == null) return null;
    if (_levels is EqualUnmodifiableListView) return _levels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _completionStatus;
  @override
  @JsonKey(name: 'completion_status')
  List<String>? get completionStatus {
    final value = _completionStatus;
    if (value == null) return null;
    if (_completionStatus is EqualUnmodifiableListView)
      return _completionStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _priorities;
  @override
  @JsonKey(name: 'priorities')
  List<String>? get priorities {
    final value = _priorities;
    if (value == null) return null;
    if (_priorities is EqualUnmodifiableListView) return _priorities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _weekDays;
  @override
  @JsonKey(name: 'week_days')
  List<String>? get weekDays {
    final value = _weekDays;
    if (value == null) return null;
    if (_weekDays is EqualUnmodifiableListView) return _weekDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Data(levels: $levels, completionStatus: $completionStatus, priorities: $priorities, weekDays: $weekDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            const DeepCollectionEquality().equals(other._levels, _levels) &&
            const DeepCollectionEquality()
                .equals(other._completionStatus, _completionStatus) &&
            const DeepCollectionEquality()
                .equals(other._priorities, _priorities) &&
            const DeepCollectionEquality().equals(other._weekDays, _weekDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_levels),
      const DeepCollectionEquality().hash(_completionStatus),
      const DeepCollectionEquality().hash(_priorities),
      const DeepCollectionEquality().hash(_weekDays));

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
      {@JsonKey(name: 'levels') final List<String>? levels,
      @JsonKey(name: 'completion_status') final List<String>? completionStatus,
      @JsonKey(name: 'priorities') final List<String>? priorities,
      @JsonKey(name: 'week_days') final List<String>? weekDays}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: 'levels')
  List<String>? get levels;
  @override
  @JsonKey(name: 'completion_status')
  List<String>? get completionStatus;
  @override
  @JsonKey(name: 'priorities')
  List<String>? get priorities;
  @override
  @JsonKey(name: 'week_days')
  List<String>? get weekDays;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
