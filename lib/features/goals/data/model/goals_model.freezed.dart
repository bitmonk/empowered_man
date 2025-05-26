// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goals_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GoalsModel _$GoalsModelFromJson(Map<String, dynamic> json) {
  return _GoalsModel.fromJson(json);
}

/// @nodoc
mixin _$GoalsModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Data? get data => throw _privateConstructorUsedError;

  /// Serializes this GoalsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoalsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalsModelCopyWith<GoalsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalsModelCopyWith<$Res> {
  factory $GoalsModelCopyWith(
          GoalsModel value, $Res Function(GoalsModel) then) =
      _$GoalsModelCopyWithImpl<$Res, GoalsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GoalsModelCopyWithImpl<$Res, $Val extends GoalsModel>
    implements $GoalsModelCopyWith<$Res> {
  _$GoalsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalsModel
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

  /// Create a copy of GoalsModel
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
abstract class _$$GoalsModelImplCopyWith<$Res>
    implements $GoalsModelCopyWith<$Res> {
  factory _$$GoalsModelImplCopyWith(
          _$GoalsModelImpl value, $Res Function(_$GoalsModelImpl) then) =
      __$$GoalsModelImplCopyWithImpl<$Res>;
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
class __$$GoalsModelImplCopyWithImpl<$Res>
    extends _$GoalsModelCopyWithImpl<$Res, _$GoalsModelImpl>
    implements _$$GoalsModelImplCopyWith<$Res> {
  __$$GoalsModelImplCopyWithImpl(
      _$GoalsModelImpl _value, $Res Function(_$GoalsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoalsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GoalsModelImpl(
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
class _$GoalsModelImpl implements _GoalsModel {
  const _$GoalsModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$GoalsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalsModelImplFromJson(json);

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
    return 'GoalsModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalsModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of GoalsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalsModelImplCopyWith<_$GoalsModelImpl> get copyWith =>
      __$$GoalsModelImplCopyWithImpl<_$GoalsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalsModelImplToJson(
      this,
    );
  }
}

abstract class _GoalsModel implements GoalsModel {
  const factory _GoalsModel(
      {@JsonKey(name: 'status') final bool? status,
      @JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'data') final Data? data}) = _$GoalsModelImpl;

  factory _GoalsModel.fromJson(Map<String, dynamic> json) =
      _$GoalsModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  Data? get data;

  /// Create a copy of GoalsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalsModelImplCopyWith<_$GoalsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'goals')
  List<Goal>? get goals => throw _privateConstructorUsedError;

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
  $Res call({@JsonKey(name: 'goals') List<Goal>? goals});
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
    Object? goals = freezed,
  }) {
    return _then(_value.copyWith(
      goals: freezed == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<Goal>?,
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
  $Res call({@JsonKey(name: 'goals') List<Goal>? goals});
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
    Object? goals = freezed,
  }) {
    return _then(_$DataImpl(
      goals: freezed == goals
          ? _value._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<Goal>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl({@JsonKey(name: 'goals') final List<Goal>? goals})
      : _goals = goals;

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  final List<Goal>? _goals;
  @override
  @JsonKey(name: 'goals')
  List<Goal>? get goals {
    final value = _goals;
    if (value == null) return null;
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Data(goals: $goals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            const DeepCollectionEquality().equals(other._goals, _goals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_goals));

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
  const factory _Data({@JsonKey(name: 'goals') final List<Goal>? goals}) =
      _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: 'goals')
  List<Goal>? get goals;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Goal _$GoalFromJson(Map<String, dynamic> json) {
  return _Goal.fromJson(json);
}

/// @nodoc
mixin _$Goal {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'details')
  List<Detail>? get details => throw _privateConstructorUsedError;

  /// Serializes this Goal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalCopyWith<Goal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalCopyWith<$Res> {
  factory $GoalCopyWith(Goal value, $Res Function(Goal) then) =
      _$GoalCopyWithImpl<$Res, Goal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'details') List<Detail>? details});
}

/// @nodoc
class _$GoalCopyWithImpl<$Res, $Val extends Goal>
    implements $GoalCopyWith<$Res> {
  _$GoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<Detail>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoalImplCopyWith<$Res> implements $GoalCopyWith<$Res> {
  factory _$$GoalImplCopyWith(
          _$GoalImpl value, $Res Function(_$GoalImpl) then) =
      __$$GoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'details') List<Detail>? details});
}

/// @nodoc
class __$$GoalImplCopyWithImpl<$Res>
    extends _$GoalCopyWithImpl<$Res, _$GoalImpl>
    implements _$$GoalImplCopyWith<$Res> {
  __$$GoalImplCopyWithImpl(_$GoalImpl _value, $Res Function(_$GoalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? details = freezed,
  }) {
    return _then(_$GoalImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<Detail>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalImpl implements _Goal {
  const _$GoalImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'details') final List<Detail>? details})
      : _details = details;

  factory _$GoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  final List<Detail>? _details;
  @override
  @JsonKey(name: 'details')
  List<Detail>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Goal(id: $id, title: $title, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, const DeepCollectionEquality().hash(_details));

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalImplCopyWith<_$GoalImpl> get copyWith =>
      __$$GoalImplCopyWithImpl<_$GoalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalImplToJson(
      this,
    );
  }
}

abstract class _Goal implements Goal {
  const factory _Goal(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'details') final List<Detail>? details}) = _$GoalImpl;

  factory _Goal.fromJson(Map<String, dynamic> json) = _$GoalImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'details')
  List<Detail>? get details;

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalImplCopyWith<_$GoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Detail _$DetailFromJson(Map<String, dynamic> json) {
  return _Detail.fromJson(json);
}

/// @nodoc
mixin _$Detail {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'goal_id')
  int? get goalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_period')
  String? get timePeriod => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_completed')
  bool? get isCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_goals')
  List<UserGoal>? get userGoals => throw _privateConstructorUsedError;

  /// Serializes this Detail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Detail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailCopyWith<Detail> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCopyWith<$Res> {
  factory $DetailCopyWith(Detail value, $Res Function(Detail) then) =
      _$DetailCopyWithImpl<$Res, Detail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'goal_id') int? goalId,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'time_period') String? timePeriod,
      @JsonKey(name: 'is_completed') bool? isCompleted,
      @JsonKey(name: 'user_goals') List<UserGoal>? userGoals});
}

/// @nodoc
class _$DetailCopyWithImpl<$Res, $Val extends Detail>
    implements $DetailCopyWith<$Res> {
  _$DetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Detail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? goalId = freezed,
    Object? type = freezed,
    Object? timePeriod = freezed,
    Object? isCompleted = freezed,
    Object? userGoals = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      goalId: freezed == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      timePeriod: freezed == timePeriod
          ? _value.timePeriod
          : timePeriod // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      userGoals: freezed == userGoals
          ? _value.userGoals
          : userGoals // ignore: cast_nullable_to_non_nullable
              as List<UserGoal>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailImplCopyWith<$Res> implements $DetailCopyWith<$Res> {
  factory _$$DetailImplCopyWith(
          _$DetailImpl value, $Res Function(_$DetailImpl) then) =
      __$$DetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'goal_id') int? goalId,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'time_period') String? timePeriod,
      @JsonKey(name: 'is_completed') bool? isCompleted,
      @JsonKey(name: 'user_goals') List<UserGoal>? userGoals});
}

/// @nodoc
class __$$DetailImplCopyWithImpl<$Res>
    extends _$DetailCopyWithImpl<$Res, _$DetailImpl>
    implements _$$DetailImplCopyWith<$Res> {
  __$$DetailImplCopyWithImpl(
      _$DetailImpl _value, $Res Function(_$DetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of Detail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? goalId = freezed,
    Object? type = freezed,
    Object? timePeriod = freezed,
    Object? isCompleted = freezed,
    Object? userGoals = freezed,
  }) {
    return _then(_$DetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      goalId: freezed == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      timePeriod: freezed == timePeriod
          ? _value.timePeriod
          : timePeriod // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      userGoals: freezed == userGoals
          ? _value._userGoals
          : userGoals // ignore: cast_nullable_to_non_nullable
              as List<UserGoal>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailImpl implements _Detail {
  const _$DetailImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'goal_id') this.goalId,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'time_period') this.timePeriod,
      @JsonKey(name: 'is_completed') this.isCompleted,
      @JsonKey(name: 'user_goals') final List<UserGoal>? userGoals})
      : _userGoals = userGoals;

  factory _$DetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'goal_id')
  final int? goalId;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'time_period')
  final String? timePeriod;
  @override
  @JsonKey(name: 'is_completed')
  final bool? isCompleted;
  final List<UserGoal>? _userGoals;
  @override
  @JsonKey(name: 'user_goals')
  List<UserGoal>? get userGoals {
    final value = _userGoals;
    if (value == null) return null;
    if (_userGoals is EqualUnmodifiableListView) return _userGoals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Detail(id: $id, goalId: $goalId, type: $type, timePeriod: $timePeriod, isCompleted: $isCompleted, userGoals: $userGoals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.goalId, goalId) || other.goalId == goalId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timePeriod, timePeriod) ||
                other.timePeriod == timePeriod) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            const DeepCollectionEquality()
                .equals(other._userGoals, _userGoals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, goalId, type, timePeriod,
      isCompleted, const DeepCollectionEquality().hash(_userGoals));

  /// Create a copy of Detail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      __$$DetailImplCopyWithImpl<_$DetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailImplToJson(
      this,
    );
  }
}

abstract class _Detail implements Detail {
  const factory _Detail(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'goal_id') final int? goalId,
          @JsonKey(name: 'type') final String? type,
          @JsonKey(name: 'time_period') final String? timePeriod,
          @JsonKey(name: 'is_completed') final bool? isCompleted,
          @JsonKey(name: 'user_goals') final List<UserGoal>? userGoals}) =
      _$DetailImpl;

  factory _Detail.fromJson(Map<String, dynamic> json) = _$DetailImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'goal_id')
  int? get goalId;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'time_period')
  String? get timePeriod;
  @override
  @JsonKey(name: 'is_completed')
  bool? get isCompleted;
  @override
  @JsonKey(name: 'user_goals')
  List<UserGoal>? get userGoals;

  /// Create a copy of Detail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserGoal _$UserGoalFromJson(Map<String, dynamic> json) {
  return _UserGoal.fromJson(json);
}

/// @nodoc
mixin _$UserGoal {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'goal_id')
  int? get goalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'goal_detail_id')
  int? get goalDetailId => throw _privateConstructorUsedError;
  @JsonKey(name: 'progress')
  String? get progress => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_ontrack')
  dynamic get isOntrack => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_complete')
  dynamic get isComplete => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_won_question')
  bool? get showWonQuestion => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_track_question')
  bool? get showTrackQuestion => throw _privateConstructorUsedError;
  @JsonKey(name: 'goal_answers')
  List<GoalAnswer>? get goalAnswers => throw _privateConstructorUsedError;

  /// Serializes this UserGoal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserGoalCopyWith<UserGoal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserGoalCopyWith<$Res> {
  factory $UserGoalCopyWith(UserGoal value, $Res Function(UserGoal) then) =
      _$UserGoalCopyWithImpl<$Res, UserGoal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'goal_id') int? goalId,
      @JsonKey(name: 'goal_detail_id') int? goalDetailId,
      @JsonKey(name: 'progress') String? progress,
      @JsonKey(name: 'is_ontrack') dynamic isOntrack,
      @JsonKey(name: 'is_complete') dynamic isComplete,
      @JsonKey(name: 'show_won_question') bool? showWonQuestion,
      @JsonKey(name: 'show_track_question') bool? showTrackQuestion,
      @JsonKey(name: 'goal_answers') List<GoalAnswer>? goalAnswers});
}

/// @nodoc
class _$UserGoalCopyWithImpl<$Res, $Val extends UserGoal>
    implements $UserGoalCopyWith<$Res> {
  _$UserGoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? goalId = freezed,
    Object? goalDetailId = freezed,
    Object? progress = freezed,
    Object? isOntrack = freezed,
    Object? isComplete = freezed,
    Object? showWonQuestion = freezed,
    Object? showTrackQuestion = freezed,
    Object? goalAnswers = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      goalId: freezed == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as int?,
      goalDetailId: freezed == goalDetailId
          ? _value.goalDetailId
          : goalDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String?,
      isOntrack: freezed == isOntrack
          ? _value.isOntrack
          : isOntrack // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as dynamic,
      showWonQuestion: freezed == showWonQuestion
          ? _value.showWonQuestion
          : showWonQuestion // ignore: cast_nullable_to_non_nullable
              as bool?,
      showTrackQuestion: freezed == showTrackQuestion
          ? _value.showTrackQuestion
          : showTrackQuestion // ignore: cast_nullable_to_non_nullable
              as bool?,
      goalAnswers: freezed == goalAnswers
          ? _value.goalAnswers
          : goalAnswers // ignore: cast_nullable_to_non_nullable
              as List<GoalAnswer>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserGoalImplCopyWith<$Res>
    implements $UserGoalCopyWith<$Res> {
  factory _$$UserGoalImplCopyWith(
          _$UserGoalImpl value, $Res Function(_$UserGoalImpl) then) =
      __$$UserGoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'goal_id') int? goalId,
      @JsonKey(name: 'goal_detail_id') int? goalDetailId,
      @JsonKey(name: 'progress') String? progress,
      @JsonKey(name: 'is_ontrack') dynamic isOntrack,
      @JsonKey(name: 'is_complete') dynamic isComplete,
      @JsonKey(name: 'show_won_question') bool? showWonQuestion,
      @JsonKey(name: 'show_track_question') bool? showTrackQuestion,
      @JsonKey(name: 'goal_answers') List<GoalAnswer>? goalAnswers});
}

/// @nodoc
class __$$UserGoalImplCopyWithImpl<$Res>
    extends _$UserGoalCopyWithImpl<$Res, _$UserGoalImpl>
    implements _$$UserGoalImplCopyWith<$Res> {
  __$$UserGoalImplCopyWithImpl(
      _$UserGoalImpl _value, $Res Function(_$UserGoalImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? goalId = freezed,
    Object? goalDetailId = freezed,
    Object? progress = freezed,
    Object? isOntrack = freezed,
    Object? isComplete = freezed,
    Object? showWonQuestion = freezed,
    Object? showTrackQuestion = freezed,
    Object? goalAnswers = freezed,
  }) {
    return _then(_$UserGoalImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      goalId: freezed == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as int?,
      goalDetailId: freezed == goalDetailId
          ? _value.goalDetailId
          : goalDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String?,
      isOntrack: freezed == isOntrack
          ? _value.isOntrack
          : isOntrack // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as dynamic,
      showWonQuestion: freezed == showWonQuestion
          ? _value.showWonQuestion
          : showWonQuestion // ignore: cast_nullable_to_non_nullable
              as bool?,
      showTrackQuestion: freezed == showTrackQuestion
          ? _value.showTrackQuestion
          : showTrackQuestion // ignore: cast_nullable_to_non_nullable
              as bool?,
      goalAnswers: freezed == goalAnswers
          ? _value._goalAnswers
          : goalAnswers // ignore: cast_nullable_to_non_nullable
              as List<GoalAnswer>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserGoalImpl implements _UserGoal {
  const _$UserGoalImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'goal_id') this.goalId,
      @JsonKey(name: 'goal_detail_id') this.goalDetailId,
      @JsonKey(name: 'progress') this.progress,
      @JsonKey(name: 'is_ontrack') this.isOntrack,
      @JsonKey(name: 'is_complete') this.isComplete,
      @JsonKey(name: 'show_won_question') this.showWonQuestion,
      @JsonKey(name: 'show_track_question') this.showTrackQuestion,
      @JsonKey(name: 'goal_answers') final List<GoalAnswer>? goalAnswers})
      : _goalAnswers = goalAnswers;

  factory _$UserGoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserGoalImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'goal_id')
  final int? goalId;
  @override
  @JsonKey(name: 'goal_detail_id')
  final int? goalDetailId;
  @override
  @JsonKey(name: 'progress')
  final String? progress;
  @override
  @JsonKey(name: 'is_ontrack')
  final dynamic isOntrack;
  @override
  @JsonKey(name: 'is_complete')
  final dynamic isComplete;
  @override
  @JsonKey(name: 'show_won_question')
  final bool? showWonQuestion;
  @override
  @JsonKey(name: 'show_track_question')
  final bool? showTrackQuestion;
  final List<GoalAnswer>? _goalAnswers;
  @override
  @JsonKey(name: 'goal_answers')
  List<GoalAnswer>? get goalAnswers {
    final value = _goalAnswers;
    if (value == null) return null;
    if (_goalAnswers is EqualUnmodifiableListView) return _goalAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserGoal(id: $id, userId: $userId, goalId: $goalId, goalDetailId: $goalDetailId, progress: $progress, isOntrack: $isOntrack, isComplete: $isComplete, showWonQuestion: $showWonQuestion, showTrackQuestion: $showTrackQuestion, goalAnswers: $goalAnswers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserGoalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.goalId, goalId) || other.goalId == goalId) &&
            (identical(other.goalDetailId, goalDetailId) ||
                other.goalDetailId == goalDetailId) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            const DeepCollectionEquality().equals(other.isOntrack, isOntrack) &&
            const DeepCollectionEquality()
                .equals(other.isComplete, isComplete) &&
            (identical(other.showWonQuestion, showWonQuestion) ||
                other.showWonQuestion == showWonQuestion) &&
            (identical(other.showTrackQuestion, showTrackQuestion) ||
                other.showTrackQuestion == showTrackQuestion) &&
            const DeepCollectionEquality()
                .equals(other._goalAnswers, _goalAnswers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      goalId,
      goalDetailId,
      progress,
      const DeepCollectionEquality().hash(isOntrack),
      const DeepCollectionEquality().hash(isComplete),
      showWonQuestion,
      showTrackQuestion,
      const DeepCollectionEquality().hash(_goalAnswers));

  /// Create a copy of UserGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserGoalImplCopyWith<_$UserGoalImpl> get copyWith =>
      __$$UserGoalImplCopyWithImpl<_$UserGoalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserGoalImplToJson(
      this,
    );
  }
}

abstract class _UserGoal implements UserGoal {
  const factory _UserGoal(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'user_id') final int? userId,
          @JsonKey(name: 'goal_id') final int? goalId,
          @JsonKey(name: 'goal_detail_id') final int? goalDetailId,
          @JsonKey(name: 'progress') final String? progress,
          @JsonKey(name: 'is_ontrack') final dynamic isOntrack,
          @JsonKey(name: 'is_complete') final dynamic isComplete,
          @JsonKey(name: 'show_won_question') final bool? showWonQuestion,
          @JsonKey(name: 'show_track_question') final bool? showTrackQuestion,
          @JsonKey(name: 'goal_answers') final List<GoalAnswer>? goalAnswers}) =
      _$UserGoalImpl;

  factory _UserGoal.fromJson(Map<String, dynamic> json) =
      _$UserGoalImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'goal_id')
  int? get goalId;
  @override
  @JsonKey(name: 'goal_detail_id')
  int? get goalDetailId;
  @override
  @JsonKey(name: 'progress')
  String? get progress;
  @override
  @JsonKey(name: 'is_ontrack')
  dynamic get isOntrack;
  @override
  @JsonKey(name: 'is_complete')
  dynamic get isComplete;
  @override
  @JsonKey(name: 'show_won_question')
  bool? get showWonQuestion;
  @override
  @JsonKey(name: 'show_track_question')
  bool? get showTrackQuestion;
  @override
  @JsonKey(name: 'goal_answers')
  List<GoalAnswer>? get goalAnswers;

  /// Create a copy of UserGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserGoalImplCopyWith<_$UserGoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GoalAnswer _$GoalAnswerFromJson(Map<String, dynamic> json) {
  return _GoalAnswer.fromJson(json);
}

/// @nodoc
mixin _$GoalAnswer {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_id')
  int? get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_goal_id')
  int? get userGoalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'achieved')
  bool? get achieved => throw _privateConstructorUsedError;

  /// Serializes this GoalAnswer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoalAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalAnswerCopyWith<GoalAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalAnswerCopyWith<$Res> {
  factory $GoalAnswerCopyWith(
          GoalAnswer value, $Res Function(GoalAnswer) then) =
      _$GoalAnswerCopyWithImpl<$Res, GoalAnswer>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'question_id') int? questionId,
      @JsonKey(name: 'user_goal_id') int? userGoalId,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'achieved') bool? achieved});
}

/// @nodoc
class _$GoalAnswerCopyWithImpl<$Res, $Val extends GoalAnswer>
    implements $GoalAnswerCopyWith<$Res> {
  _$GoalAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? questionId = freezed,
    Object? userGoalId = freezed,
    Object? text = freezed,
    Object? achieved = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      userGoalId: freezed == userGoalId
          ? _value.userGoalId
          : userGoalId // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      achieved: freezed == achieved
          ? _value.achieved
          : achieved // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoalAnswerImplCopyWith<$Res>
    implements $GoalAnswerCopyWith<$Res> {
  factory _$$GoalAnswerImplCopyWith(
          _$GoalAnswerImpl value, $Res Function(_$GoalAnswerImpl) then) =
      __$$GoalAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'question_id') int? questionId,
      @JsonKey(name: 'user_goal_id') int? userGoalId,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'achieved') bool? achieved});
}

/// @nodoc
class __$$GoalAnswerImplCopyWithImpl<$Res>
    extends _$GoalAnswerCopyWithImpl<$Res, _$GoalAnswerImpl>
    implements _$$GoalAnswerImplCopyWith<$Res> {
  __$$GoalAnswerImplCopyWithImpl(
      _$GoalAnswerImpl _value, $Res Function(_$GoalAnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoalAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? questionId = freezed,
    Object? userGoalId = freezed,
    Object? text = freezed,
    Object? achieved = freezed,
  }) {
    return _then(_$GoalAnswerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      userGoalId: freezed == userGoalId
          ? _value.userGoalId
          : userGoalId // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      achieved: freezed == achieved
          ? _value.achieved
          : achieved // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalAnswerImpl implements _GoalAnswer {
  const _$GoalAnswerImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'question_id') this.questionId,
      @JsonKey(name: 'user_goal_id') this.userGoalId,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'achieved') this.achieved});

  factory _$GoalAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalAnswerImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'question_id')
  final int? questionId;
  @override
  @JsonKey(name: 'user_goal_id')
  final int? userGoalId;
  @override
  @JsonKey(name: 'text')
  final String? text;
  @override
  @JsonKey(name: 'achieved')
  final bool? achieved;

  @override
  String toString() {
    return 'GoalAnswer(id: $id, userId: $userId, questionId: $questionId, userGoalId: $userGoalId, text: $text, achieved: $achieved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalAnswerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.userGoalId, userGoalId) ||
                other.userGoalId == userGoalId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.achieved, achieved) ||
                other.achieved == achieved));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, questionId, userGoalId, text, achieved);

  /// Create a copy of GoalAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalAnswerImplCopyWith<_$GoalAnswerImpl> get copyWith =>
      __$$GoalAnswerImplCopyWithImpl<_$GoalAnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalAnswerImplToJson(
      this,
    );
  }
}

abstract class _GoalAnswer implements GoalAnswer {
  const factory _GoalAnswer(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'question_id') final int? questionId,
      @JsonKey(name: 'user_goal_id') final int? userGoalId,
      @JsonKey(name: 'text') final String? text,
      @JsonKey(name: 'achieved') final bool? achieved}) = _$GoalAnswerImpl;

  factory _GoalAnswer.fromJson(Map<String, dynamic> json) =
      _$GoalAnswerImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'question_id')
  int? get questionId;
  @override
  @JsonKey(name: 'user_goal_id')
  int? get userGoalId;
  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'achieved')
  bool? get achieved;

  /// Create a copy of GoalAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalAnswerImplCopyWith<_$GoalAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
