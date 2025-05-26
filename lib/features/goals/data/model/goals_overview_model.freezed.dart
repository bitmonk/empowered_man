// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goals_overview_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GoalsOverviewModel _$GoalsOverviewModelFromJson(Map<String, dynamic> json) {
  return _GoalsOverviewModel.fromJson(json);
}

/// @nodoc
mixin _$GoalsOverviewModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Data? get data => throw _privateConstructorUsedError;

  /// Serializes this GoalsOverviewModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoalsOverviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalsOverviewModelCopyWith<GoalsOverviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalsOverviewModelCopyWith<$Res> {
  factory $GoalsOverviewModelCopyWith(
          GoalsOverviewModel value, $Res Function(GoalsOverviewModel) then) =
      _$GoalsOverviewModelCopyWithImpl<$Res, GoalsOverviewModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GoalsOverviewModelCopyWithImpl<$Res, $Val extends GoalsOverviewModel>
    implements $GoalsOverviewModelCopyWith<$Res> {
  _$GoalsOverviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalsOverviewModel
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

  /// Create a copy of GoalsOverviewModel
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
abstract class _$$GoalsOverviewModelImplCopyWith<$Res>
    implements $GoalsOverviewModelCopyWith<$Res> {
  factory _$$GoalsOverviewModelImplCopyWith(_$GoalsOverviewModelImpl value,
          $Res Function(_$GoalsOverviewModelImpl) then) =
      __$$GoalsOverviewModelImplCopyWithImpl<$Res>;
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
class __$$GoalsOverviewModelImplCopyWithImpl<$Res>
    extends _$GoalsOverviewModelCopyWithImpl<$Res, _$GoalsOverviewModelImpl>
    implements _$$GoalsOverviewModelImplCopyWith<$Res> {
  __$$GoalsOverviewModelImplCopyWithImpl(_$GoalsOverviewModelImpl _value,
      $Res Function(_$GoalsOverviewModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoalsOverviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GoalsOverviewModelImpl(
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
class _$GoalsOverviewModelImpl implements _GoalsOverviewModel {
  const _$GoalsOverviewModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$GoalsOverviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalsOverviewModelImplFromJson(json);

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
    return 'GoalsOverviewModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalsOverviewModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of GoalsOverviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalsOverviewModelImplCopyWith<_$GoalsOverviewModelImpl> get copyWith =>
      __$$GoalsOverviewModelImplCopyWithImpl<_$GoalsOverviewModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalsOverviewModelImplToJson(
      this,
    );
  }
}

abstract class _GoalsOverviewModel implements GoalsOverviewModel {
  const factory _GoalsOverviewModel(
      {@JsonKey(name: 'status') final bool? status,
      @JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'data') final Data? data}) = _$GoalsOverviewModelImpl;

  factory _GoalsOverviewModel.fromJson(Map<String, dynamic> json) =
      _$GoalsOverviewModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  Data? get data;

  /// Create a copy of GoalsOverviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalsOverviewModelImplCopyWith<_$GoalsOverviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'goal_overview')
  GoalOverview? get goalOverview => throw _privateConstructorUsedError;

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
  $Res call({@JsonKey(name: 'goal_overview') GoalOverview? goalOverview});

  $GoalOverviewCopyWith<$Res>? get goalOverview;
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
    Object? goalOverview = freezed,
  }) {
    return _then(_value.copyWith(
      goalOverview: freezed == goalOverview
          ? _value.goalOverview
          : goalOverview // ignore: cast_nullable_to_non_nullable
              as GoalOverview?,
    ) as $Val);
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GoalOverviewCopyWith<$Res>? get goalOverview {
    if (_value.goalOverview == null) {
      return null;
    }

    return $GoalOverviewCopyWith<$Res>(_value.goalOverview!, (value) {
      return _then(_value.copyWith(goalOverview: value) as $Val);
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
  $Res call({@JsonKey(name: 'goal_overview') GoalOverview? goalOverview});

  @override
  $GoalOverviewCopyWith<$Res>? get goalOverview;
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
    Object? goalOverview = freezed,
  }) {
    return _then(_$DataImpl(
      goalOverview: freezed == goalOverview
          ? _value.goalOverview
          : goalOverview // ignore: cast_nullable_to_non_nullable
              as GoalOverview?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl({@JsonKey(name: 'goal_overview') this.goalOverview});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: 'goal_overview')
  final GoalOverview? goalOverview;

  @override
  String toString() {
    return 'Data(goalOverview: $goalOverview)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.goalOverview, goalOverview) ||
                other.goalOverview == goalOverview));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, goalOverview);

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
          {@JsonKey(name: 'goal_overview') final GoalOverview? goalOverview}) =
      _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: 'goal_overview')
  GoalOverview? get goalOverview;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GoalOverview _$GoalOverviewFromJson(Map<String, dynamic> json) {
  return _GoalOverview.fromJson(json);
}

/// @nodoc
mixin _$GoalOverview {
  @JsonKey(name: 'Q1')
  Quarter? get q1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'Q2')
  Quarter? get q2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'Q3')
  Quarter? get q3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'Q4')
  Quarter? get q4 => throw _privateConstructorUsedError;
  @JsonKey(name: 'yearly_goals')
  Map<String, bool>? get yearlyGoals => throw _privateConstructorUsedError;

  /// Serializes this GoalOverview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoalOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalOverviewCopyWith<GoalOverview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalOverviewCopyWith<$Res> {
  factory $GoalOverviewCopyWith(
          GoalOverview value, $Res Function(GoalOverview) then) =
      _$GoalOverviewCopyWithImpl<$Res, GoalOverview>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Q1') Quarter? q1,
      @JsonKey(name: 'Q2') Quarter? q2,
      @JsonKey(name: 'Q3') Quarter? q3,
      @JsonKey(name: 'Q4') Quarter? q4,
      @JsonKey(name: 'yearly_goals') Map<String, bool>? yearlyGoals});

  $QuarterCopyWith<$Res>? get q1;
  $QuarterCopyWith<$Res>? get q2;
  $QuarterCopyWith<$Res>? get q3;
  $QuarterCopyWith<$Res>? get q4;
}

/// @nodoc
class _$GoalOverviewCopyWithImpl<$Res, $Val extends GoalOverview>
    implements $GoalOverviewCopyWith<$Res> {
  _$GoalOverviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? q1 = freezed,
    Object? q2 = freezed,
    Object? q3 = freezed,
    Object? q4 = freezed,
    Object? yearlyGoals = freezed,
  }) {
    return _then(_value.copyWith(
      q1: freezed == q1
          ? _value.q1
          : q1 // ignore: cast_nullable_to_non_nullable
              as Quarter?,
      q2: freezed == q2
          ? _value.q2
          : q2 // ignore: cast_nullable_to_non_nullable
              as Quarter?,
      q3: freezed == q3
          ? _value.q3
          : q3 // ignore: cast_nullable_to_non_nullable
              as Quarter?,
      q4: freezed == q4
          ? _value.q4
          : q4 // ignore: cast_nullable_to_non_nullable
              as Quarter?,
      yearlyGoals: freezed == yearlyGoals
          ? _value.yearlyGoals
          : yearlyGoals // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
    ) as $Val);
  }

  /// Create a copy of GoalOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuarterCopyWith<$Res>? get q1 {
    if (_value.q1 == null) {
      return null;
    }

    return $QuarterCopyWith<$Res>(_value.q1!, (value) {
      return _then(_value.copyWith(q1: value) as $Val);
    });
  }

  /// Create a copy of GoalOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuarterCopyWith<$Res>? get q2 {
    if (_value.q2 == null) {
      return null;
    }

    return $QuarterCopyWith<$Res>(_value.q2!, (value) {
      return _then(_value.copyWith(q2: value) as $Val);
    });
  }

  /// Create a copy of GoalOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuarterCopyWith<$Res>? get q3 {
    if (_value.q3 == null) {
      return null;
    }

    return $QuarterCopyWith<$Res>(_value.q3!, (value) {
      return _then(_value.copyWith(q3: value) as $Val);
    });
  }

  /// Create a copy of GoalOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuarterCopyWith<$Res>? get q4 {
    if (_value.q4 == null) {
      return null;
    }

    return $QuarterCopyWith<$Res>(_value.q4!, (value) {
      return _then(_value.copyWith(q4: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GoalOverviewImplCopyWith<$Res>
    implements $GoalOverviewCopyWith<$Res> {
  factory _$$GoalOverviewImplCopyWith(
          _$GoalOverviewImpl value, $Res Function(_$GoalOverviewImpl) then) =
      __$$GoalOverviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Q1') Quarter? q1,
      @JsonKey(name: 'Q2') Quarter? q2,
      @JsonKey(name: 'Q3') Quarter? q3,
      @JsonKey(name: 'Q4') Quarter? q4,
      @JsonKey(name: 'yearly_goals') Map<String, bool>? yearlyGoals});

  @override
  $QuarterCopyWith<$Res>? get q1;
  @override
  $QuarterCopyWith<$Res>? get q2;
  @override
  $QuarterCopyWith<$Res>? get q3;
  @override
  $QuarterCopyWith<$Res>? get q4;
}

/// @nodoc
class __$$GoalOverviewImplCopyWithImpl<$Res>
    extends _$GoalOverviewCopyWithImpl<$Res, _$GoalOverviewImpl>
    implements _$$GoalOverviewImplCopyWith<$Res> {
  __$$GoalOverviewImplCopyWithImpl(
      _$GoalOverviewImpl _value, $Res Function(_$GoalOverviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoalOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? q1 = freezed,
    Object? q2 = freezed,
    Object? q3 = freezed,
    Object? q4 = freezed,
    Object? yearlyGoals = freezed,
  }) {
    return _then(_$GoalOverviewImpl(
      q1: freezed == q1
          ? _value.q1
          : q1 // ignore: cast_nullable_to_non_nullable
              as Quarter?,
      q2: freezed == q2
          ? _value.q2
          : q2 // ignore: cast_nullable_to_non_nullable
              as Quarter?,
      q3: freezed == q3
          ? _value.q3
          : q3 // ignore: cast_nullable_to_non_nullable
              as Quarter?,
      q4: freezed == q4
          ? _value.q4
          : q4 // ignore: cast_nullable_to_non_nullable
              as Quarter?,
      yearlyGoals: freezed == yearlyGoals
          ? _value._yearlyGoals
          : yearlyGoals // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalOverviewImpl implements _GoalOverview {
  const _$GoalOverviewImpl(
      {@JsonKey(name: 'Q1') this.q1,
      @JsonKey(name: 'Q2') this.q2,
      @JsonKey(name: 'Q3') this.q3,
      @JsonKey(name: 'Q4') this.q4,
      @JsonKey(name: 'yearly_goals') final Map<String, bool>? yearlyGoals})
      : _yearlyGoals = yearlyGoals;

  factory _$GoalOverviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalOverviewImplFromJson(json);

  @override
  @JsonKey(name: 'Q1')
  final Quarter? q1;
  @override
  @JsonKey(name: 'Q2')
  final Quarter? q2;
  @override
  @JsonKey(name: 'Q3')
  final Quarter? q3;
  @override
  @JsonKey(name: 'Q4')
  final Quarter? q4;
  final Map<String, bool>? _yearlyGoals;
  @override
  @JsonKey(name: 'yearly_goals')
  Map<String, bool>? get yearlyGoals {
    final value = _yearlyGoals;
    if (value == null) return null;
    if (_yearlyGoals is EqualUnmodifiableMapView) return _yearlyGoals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GoalOverview(q1: $q1, q2: $q2, q3: $q3, q4: $q4, yearlyGoals: $yearlyGoals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalOverviewImpl &&
            (identical(other.q1, q1) || other.q1 == q1) &&
            (identical(other.q2, q2) || other.q2 == q2) &&
            (identical(other.q3, q3) || other.q3 == q3) &&
            (identical(other.q4, q4) || other.q4 == q4) &&
            const DeepCollectionEquality()
                .equals(other._yearlyGoals, _yearlyGoals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, q1, q2, q3, q4,
      const DeepCollectionEquality().hash(_yearlyGoals));

  /// Create a copy of GoalOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalOverviewImplCopyWith<_$GoalOverviewImpl> get copyWith =>
      __$$GoalOverviewImplCopyWithImpl<_$GoalOverviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalOverviewImplToJson(
      this,
    );
  }
}

abstract class _GoalOverview implements GoalOverview {
  const factory _GoalOverview(
      {@JsonKey(name: 'Q1') final Quarter? q1,
      @JsonKey(name: 'Q2') final Quarter? q2,
      @JsonKey(name: 'Q3') final Quarter? q3,
      @JsonKey(name: 'Q4') final Quarter? q4,
      @JsonKey(name: 'yearly_goals')
      final Map<String, bool>? yearlyGoals}) = _$GoalOverviewImpl;

  factory _GoalOverview.fromJson(Map<String, dynamic> json) =
      _$GoalOverviewImpl.fromJson;

  @override
  @JsonKey(name: 'Q1')
  Quarter? get q1;
  @override
  @JsonKey(name: 'Q2')
  Quarter? get q2;
  @override
  @JsonKey(name: 'Q3')
  Quarter? get q3;
  @override
  @JsonKey(name: 'Q4')
  Quarter? get q4;
  @override
  @JsonKey(name: 'yearly_goals')
  Map<String, bool>? get yearlyGoals;

  /// Create a copy of GoalOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalOverviewImplCopyWith<_$GoalOverviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Quarter _$QuarterFromJson(Map<String, dynamic> json) {
  return _Quarter.fromJson(json);
}

/// @nodoc
mixin _$Quarter {
  @JsonKey(name: 'months')
  List<Map<String, bool>>? get months => throw _privateConstructorUsedError;
  @JsonKey(name: 'quarterly_goals')
  Map<String, bool>? get quarterlyGoals => throw _privateConstructorUsedError;

  /// Serializes this Quarter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Quarter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuarterCopyWith<Quarter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuarterCopyWith<$Res> {
  factory $QuarterCopyWith(Quarter value, $Res Function(Quarter) then) =
      _$QuarterCopyWithImpl<$Res, Quarter>;
  @useResult
  $Res call(
      {@JsonKey(name: 'months') List<Map<String, bool>>? months,
      @JsonKey(name: 'quarterly_goals') Map<String, bool>? quarterlyGoals});
}

/// @nodoc
class _$QuarterCopyWithImpl<$Res, $Val extends Quarter>
    implements $QuarterCopyWith<$Res> {
  _$QuarterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Quarter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? months = freezed,
    Object? quarterlyGoals = freezed,
  }) {
    return _then(_value.copyWith(
      months: freezed == months
          ? _value.months
          : months // ignore: cast_nullable_to_non_nullable
              as List<Map<String, bool>>?,
      quarterlyGoals: freezed == quarterlyGoals
          ? _value.quarterlyGoals
          : quarterlyGoals // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuarterImplCopyWith<$Res> implements $QuarterCopyWith<$Res> {
  factory _$$QuarterImplCopyWith(
          _$QuarterImpl value, $Res Function(_$QuarterImpl) then) =
      __$$QuarterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'months') List<Map<String, bool>>? months,
      @JsonKey(name: 'quarterly_goals') Map<String, bool>? quarterlyGoals});
}

/// @nodoc
class __$$QuarterImplCopyWithImpl<$Res>
    extends _$QuarterCopyWithImpl<$Res, _$QuarterImpl>
    implements _$$QuarterImplCopyWith<$Res> {
  __$$QuarterImplCopyWithImpl(
      _$QuarterImpl _value, $Res Function(_$QuarterImpl) _then)
      : super(_value, _then);

  /// Create a copy of Quarter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? months = freezed,
    Object? quarterlyGoals = freezed,
  }) {
    return _then(_$QuarterImpl(
      months: freezed == months
          ? _value._months
          : months // ignore: cast_nullable_to_non_nullable
              as List<Map<String, bool>>?,
      quarterlyGoals: freezed == quarterlyGoals
          ? _value._quarterlyGoals
          : quarterlyGoals // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuarterImpl implements _Quarter {
  const _$QuarterImpl(
      {@JsonKey(name: 'months') final List<Map<String, bool>>? months,
      @JsonKey(name: 'quarterly_goals')
      final Map<String, bool>? quarterlyGoals})
      : _months = months,
        _quarterlyGoals = quarterlyGoals;

  factory _$QuarterImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuarterImplFromJson(json);

  final List<Map<String, bool>>? _months;
  @override
  @JsonKey(name: 'months')
  List<Map<String, bool>>? get months {
    final value = _months;
    if (value == null) return null;
    if (_months is EqualUnmodifiableListView) return _months;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, bool>? _quarterlyGoals;
  @override
  @JsonKey(name: 'quarterly_goals')
  Map<String, bool>? get quarterlyGoals {
    final value = _quarterlyGoals;
    if (value == null) return null;
    if (_quarterlyGoals is EqualUnmodifiableMapView) return _quarterlyGoals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Quarter(months: $months, quarterlyGoals: $quarterlyGoals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuarterImpl &&
            const DeepCollectionEquality().equals(other._months, _months) &&
            const DeepCollectionEquality()
                .equals(other._quarterlyGoals, _quarterlyGoals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_months),
      const DeepCollectionEquality().hash(_quarterlyGoals));

  /// Create a copy of Quarter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuarterImplCopyWith<_$QuarterImpl> get copyWith =>
      __$$QuarterImplCopyWithImpl<_$QuarterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuarterImplToJson(
      this,
    );
  }
}

abstract class _Quarter implements Quarter {
  const factory _Quarter(
      {@JsonKey(name: 'months') final List<Map<String, bool>>? months,
      @JsonKey(name: 'quarterly_goals')
      final Map<String, bool>? quarterlyGoals}) = _$QuarterImpl;

  factory _Quarter.fromJson(Map<String, dynamic> json) = _$QuarterImpl.fromJson;

  @override
  @JsonKey(name: 'months')
  List<Map<String, bool>>? get months;
  @override
  @JsonKey(name: 'quarterly_goals')
  Map<String, bool>? get quarterlyGoals;

  /// Create a copy of Quarter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuarterImplCopyWith<_$QuarterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
