// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_monthly_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyMonthlyModel _$MyMonthlyModelFromJson(Map<String, dynamic> json) {
  return _MyMonthlyModel.fromJson(json);
}

/// @nodoc
mixin _$MyMonthlyModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  MyMonthlyData? get data => throw _privateConstructorUsedError;

  /// Serializes this MyMonthlyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyMonthlyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyMonthlyModelCopyWith<MyMonthlyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyMonthlyModelCopyWith<$Res> {
  factory $MyMonthlyModelCopyWith(
          MyMonthlyModel value, $Res Function(MyMonthlyModel) then) =
      _$MyMonthlyModelCopyWithImpl<$Res, MyMonthlyModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') MyMonthlyData? data});

  $MyMonthlyDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$MyMonthlyModelCopyWithImpl<$Res, $Val extends MyMonthlyModel>
    implements $MyMonthlyModelCopyWith<$Res> {
  _$MyMonthlyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyMonthlyModel
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
              as MyMonthlyData?,
    ) as $Val);
  }

  /// Create a copy of MyMonthlyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MyMonthlyDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $MyMonthlyDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyMonthlyModelImplCopyWith<$Res>
    implements $MyMonthlyModelCopyWith<$Res> {
  factory _$$MyMonthlyModelImplCopyWith(_$MyMonthlyModelImpl value,
          $Res Function(_$MyMonthlyModelImpl) then) =
      __$$MyMonthlyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') MyMonthlyData? data});

  @override
  $MyMonthlyDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$MyMonthlyModelImplCopyWithImpl<$Res>
    extends _$MyMonthlyModelCopyWithImpl<$Res, _$MyMonthlyModelImpl>
    implements _$$MyMonthlyModelImplCopyWith<$Res> {
  __$$MyMonthlyModelImplCopyWithImpl(
      _$MyMonthlyModelImpl _value, $Res Function(_$MyMonthlyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyMonthlyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$MyMonthlyModelImpl(
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
              as MyMonthlyData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyMonthlyModelImpl implements _MyMonthlyModel {
  const _$MyMonthlyModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$MyMonthlyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyMonthlyModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'data')
  final MyMonthlyData? data;

  @override
  String toString() {
    return 'MyMonthlyModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyMonthlyModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of MyMonthlyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyMonthlyModelImplCopyWith<_$MyMonthlyModelImpl> get copyWith =>
      __$$MyMonthlyModelImplCopyWithImpl<_$MyMonthlyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyMonthlyModelImplToJson(
      this,
    );
  }
}

abstract class _MyMonthlyModel implements MyMonthlyModel {
  const factory _MyMonthlyModel(
      {@JsonKey(name: 'status') final bool? status,
      @JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'data') final MyMonthlyData? data}) = _$MyMonthlyModelImpl;

  factory _MyMonthlyModel.fromJson(Map<String, dynamic> json) =
      _$MyMonthlyModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  MyMonthlyData? get data;

  /// Create a copy of MyMonthlyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyMonthlyModelImplCopyWith<_$MyMonthlyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MyMonthlyData _$MyMonthlyDataFromJson(Map<String, dynamic> json) {
  return _MyMonthlyData.fromJson(json);
}

/// @nodoc
mixin _$MyMonthlyData {
  @JsonKey(name: 'My Monthly Targets')
  List<MyMonthlyTarget>? get myMonthlyTargets =>
      throw _privateConstructorUsedError;

  /// Serializes this MyMonthlyData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyMonthlyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyMonthlyDataCopyWith<MyMonthlyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyMonthlyDataCopyWith<$Res> {
  factory $MyMonthlyDataCopyWith(
          MyMonthlyData value, $Res Function(MyMonthlyData) then) =
      _$MyMonthlyDataCopyWithImpl<$Res, MyMonthlyData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'My Monthly Targets')
      List<MyMonthlyTarget>? myMonthlyTargets});
}

/// @nodoc
class _$MyMonthlyDataCopyWithImpl<$Res, $Val extends MyMonthlyData>
    implements $MyMonthlyDataCopyWith<$Res> {
  _$MyMonthlyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyMonthlyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myMonthlyTargets = freezed,
  }) {
    return _then(_value.copyWith(
      myMonthlyTargets: freezed == myMonthlyTargets
          ? _value.myMonthlyTargets
          : myMonthlyTargets // ignore: cast_nullable_to_non_nullable
              as List<MyMonthlyTarget>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyMonthlyDataImplCopyWith<$Res>
    implements $MyMonthlyDataCopyWith<$Res> {
  factory _$$MyMonthlyDataImplCopyWith(
          _$MyMonthlyDataImpl value, $Res Function(_$MyMonthlyDataImpl) then) =
      __$$MyMonthlyDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'My Monthly Targets')
      List<MyMonthlyTarget>? myMonthlyTargets});
}

/// @nodoc
class __$$MyMonthlyDataImplCopyWithImpl<$Res>
    extends _$MyMonthlyDataCopyWithImpl<$Res, _$MyMonthlyDataImpl>
    implements _$$MyMonthlyDataImplCopyWith<$Res> {
  __$$MyMonthlyDataImplCopyWithImpl(
      _$MyMonthlyDataImpl _value, $Res Function(_$MyMonthlyDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyMonthlyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myMonthlyTargets = freezed,
  }) {
    return _then(_$MyMonthlyDataImpl(
      myMonthlyTargets: freezed == myMonthlyTargets
          ? _value._myMonthlyTargets
          : myMonthlyTargets // ignore: cast_nullable_to_non_nullable
              as List<MyMonthlyTarget>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyMonthlyDataImpl implements _MyMonthlyData {
  const _$MyMonthlyDataImpl(
      {@JsonKey(name: 'My Monthly Targets')
      final List<MyMonthlyTarget>? myMonthlyTargets})
      : _myMonthlyTargets = myMonthlyTargets;

  factory _$MyMonthlyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyMonthlyDataImplFromJson(json);

  final List<MyMonthlyTarget>? _myMonthlyTargets;
  @override
  @JsonKey(name: 'My Monthly Targets')
  List<MyMonthlyTarget>? get myMonthlyTargets {
    final value = _myMonthlyTargets;
    if (value == null) return null;
    if (_myMonthlyTargets is EqualUnmodifiableListView)
      return _myMonthlyTargets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MyMonthlyData(myMonthlyTargets: $myMonthlyTargets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyMonthlyDataImpl &&
            const DeepCollectionEquality()
                .equals(other._myMonthlyTargets, _myMonthlyTargets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_myMonthlyTargets));

  /// Create a copy of MyMonthlyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyMonthlyDataImplCopyWith<_$MyMonthlyDataImpl> get copyWith =>
      __$$MyMonthlyDataImplCopyWithImpl<_$MyMonthlyDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyMonthlyDataImplToJson(
      this,
    );
  }
}

abstract class _MyMonthlyData implements MyMonthlyData {
  const factory _MyMonthlyData(
      {@JsonKey(name: 'My Monthly Targets')
      final List<MyMonthlyTarget>? myMonthlyTargets}) = _$MyMonthlyDataImpl;

  factory _MyMonthlyData.fromJson(Map<String, dynamic> json) =
      _$MyMonthlyDataImpl.fromJson;

  @override
  @JsonKey(name: 'My Monthly Targets')
  List<MyMonthlyTarget>? get myMonthlyTargets;

  /// Create a copy of MyMonthlyData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyMonthlyDataImplCopyWith<_$MyMonthlyDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MyMonthlyTarget _$MyMonthlyTargetFromJson(Map<String, dynamic> json) {
  return _MyMonthlyTarget.fromJson(json);
}

/// @nodoc
mixin _$MyMonthlyTarget {
  @JsonKey(name: 'target')
  String? get target => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this MyMonthlyTarget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyMonthlyTarget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyMonthlyTargetCopyWith<MyMonthlyTarget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyMonthlyTargetCopyWith<$Res> {
  factory $MyMonthlyTargetCopyWith(
          MyMonthlyTarget value, $Res Function(MyMonthlyTarget) then) =
      _$MyMonthlyTargetCopyWithImpl<$Res, MyMonthlyTarget>;
  @useResult
  $Res call(
      {@JsonKey(name: 'target') String? target,
      @JsonKey(name: 'date') DateTime? date,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'status') String? status});
}

/// @nodoc
class _$MyMonthlyTargetCopyWithImpl<$Res, $Val extends MyMonthlyTarget>
    implements $MyMonthlyTargetCopyWith<$Res> {
  _$MyMonthlyTargetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyMonthlyTarget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? target = freezed,
    Object? date = freezed,
    Object? type = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyMonthlyTargetImplCopyWith<$Res>
    implements $MyMonthlyTargetCopyWith<$Res> {
  factory _$$MyMonthlyTargetImplCopyWith(_$MyMonthlyTargetImpl value,
          $Res Function(_$MyMonthlyTargetImpl) then) =
      __$$MyMonthlyTargetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'target') String? target,
      @JsonKey(name: 'date') DateTime? date,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'status') String? status});
}

/// @nodoc
class __$$MyMonthlyTargetImplCopyWithImpl<$Res>
    extends _$MyMonthlyTargetCopyWithImpl<$Res, _$MyMonthlyTargetImpl>
    implements _$$MyMonthlyTargetImplCopyWith<$Res> {
  __$$MyMonthlyTargetImplCopyWithImpl(
      _$MyMonthlyTargetImpl _value, $Res Function(_$MyMonthlyTargetImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyMonthlyTarget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? target = freezed,
    Object? date = freezed,
    Object? type = freezed,
    Object? status = freezed,
  }) {
    return _then(_$MyMonthlyTargetImpl(
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyMonthlyTargetImpl implements _MyMonthlyTarget {
  const _$MyMonthlyTargetImpl(
      {@JsonKey(name: 'target') this.target,
      @JsonKey(name: 'date') this.date,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'status') this.status});

  factory _$MyMonthlyTargetImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyMonthlyTargetImplFromJson(json);

  @override
  @JsonKey(name: 'target')
  final String? target;
  @override
  @JsonKey(name: 'date')
  final DateTime? date;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'status')
  final String? status;

  @override
  String toString() {
    return 'MyMonthlyTarget(target: $target, date: $date, type: $type, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyMonthlyTargetImpl &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, target, date, type, status);

  /// Create a copy of MyMonthlyTarget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyMonthlyTargetImplCopyWith<_$MyMonthlyTargetImpl> get copyWith =>
      __$$MyMonthlyTargetImplCopyWithImpl<_$MyMonthlyTargetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyMonthlyTargetImplToJson(
      this,
    );
  }
}

abstract class _MyMonthlyTarget implements MyMonthlyTarget {
  const factory _MyMonthlyTarget(
      {@JsonKey(name: 'target') final String? target,
      @JsonKey(name: 'date') final DateTime? date,
      @JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'status') final String? status}) = _$MyMonthlyTargetImpl;

  factory _MyMonthlyTarget.fromJson(Map<String, dynamic> json) =
      _$MyMonthlyTargetImpl.fromJson;

  @override
  @JsonKey(name: 'target')
  String? get target;
  @override
  @JsonKey(name: 'date')
  DateTime? get date;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'status')
  String? get status;

  /// Create a copy of MyMonthlyTarget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyMonthlyTargetImplCopyWith<_$MyMonthlyTargetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
