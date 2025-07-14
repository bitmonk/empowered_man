// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_habit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardHabitModel _$DashboardHabitModelFromJson(Map<String, dynamic> json) {
  return _DashboardHabitModel.fromJson(json);
}

/// @nodoc
mixin _$DashboardHabitModel {
  @JsonKey(name: 'success')
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<DashboardHabit>? get data => throw _privateConstructorUsedError;

  /// Serializes this DashboardHabitModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardHabitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardHabitModelCopyWith<DashboardHabitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardHabitModelCopyWith<$Res> {
  factory $DashboardHabitModelCopyWith(
          DashboardHabitModel value, $Res Function(DashboardHabitModel) then) =
      _$DashboardHabitModelCopyWithImpl<$Res, DashboardHabitModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool? success,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') List<DashboardHabit>? data});
}

/// @nodoc
class _$DashboardHabitModelCopyWithImpl<$Res, $Val extends DashboardHabitModel>
    implements $DashboardHabitModelCopyWith<$Res> {
  _$DashboardHabitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardHabitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DashboardHabit>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardHabitModelImplCopyWith<$Res>
    implements $DashboardHabitModelCopyWith<$Res> {
  factory _$$DashboardHabitModelImplCopyWith(_$DashboardHabitModelImpl value,
          $Res Function(_$DashboardHabitModelImpl) then) =
      __$$DashboardHabitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool? success,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') List<DashboardHabit>? data});
}

/// @nodoc
class __$$DashboardHabitModelImplCopyWithImpl<$Res>
    extends _$DashboardHabitModelCopyWithImpl<$Res, _$DashboardHabitModelImpl>
    implements _$$DashboardHabitModelImplCopyWith<$Res> {
  __$$DashboardHabitModelImplCopyWithImpl(_$DashboardHabitModelImpl _value,
      $Res Function(_$DashboardHabitModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardHabitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$DashboardHabitModelImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DashboardHabit>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardHabitModelImpl implements _DashboardHabitModel {
  const _$DashboardHabitModelImpl(
      {@JsonKey(name: 'success') this.success,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') final List<DashboardHabit>? data})
      : _data = data;

  factory _$DashboardHabitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardHabitModelImplFromJson(json);

  @override
  @JsonKey(name: 'success')
  final bool? success;
  @override
  @JsonKey(name: 'message')
  final String? message;
  final List<DashboardHabit>? _data;
  @override
  @JsonKey(name: 'data')
  List<DashboardHabit>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DashboardHabitModel(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardHabitModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_data));

  /// Create a copy of DashboardHabitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardHabitModelImplCopyWith<_$DashboardHabitModelImpl> get copyWith =>
      __$$DashboardHabitModelImplCopyWithImpl<_$DashboardHabitModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardHabitModelImplToJson(
      this,
    );
  }
}

abstract class _DashboardHabitModel implements DashboardHabitModel {
  const factory _DashboardHabitModel(
          {@JsonKey(name: 'success') final bool? success,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'data') final List<DashboardHabit>? data}) =
      _$DashboardHabitModelImpl;

  factory _DashboardHabitModel.fromJson(Map<String, dynamic> json) =
      _$DashboardHabitModelImpl.fromJson;

  @override
  @JsonKey(name: 'success')
  bool? get success;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  List<DashboardHabit>? get data;

  /// Create a copy of DashboardHabitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardHabitModelImplCopyWith<_$DashboardHabitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardHabit _$DashboardHabitFromJson(Map<String, dynamic> json) {
  return _DashboardHabit.fromJson(json);
}

/// @nodoc
mixin _$DashboardHabit {
  @JsonKey(name: 'category')
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'habits')
  List<Habit>? get habits => throw _privateConstructorUsedError;

  /// Serializes this DashboardHabit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardHabit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardHabitCopyWith<DashboardHabit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardHabitCopyWith<$Res> {
  factory $DashboardHabitCopyWith(
          DashboardHabit value, $Res Function(DashboardHabit) then) =
      _$DashboardHabitCopyWithImpl<$Res, DashboardHabit>;
  @useResult
  $Res call(
      {@JsonKey(name: 'category') String? category,
      @JsonKey(name: 'habits') List<Habit>? habits});
}

/// @nodoc
class _$DashboardHabitCopyWithImpl<$Res, $Val extends DashboardHabit>
    implements $DashboardHabitCopyWith<$Res> {
  _$DashboardHabitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardHabit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? habits = freezed,
  }) {
    return _then(_value.copyWith(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      habits: freezed == habits
          ? _value.habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<Habit>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardHabitImplCopyWith<$Res>
    implements $DashboardHabitCopyWith<$Res> {
  factory _$$DashboardHabitImplCopyWith(_$DashboardHabitImpl value,
          $Res Function(_$DashboardHabitImpl) then) =
      __$$DashboardHabitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'category') String? category,
      @JsonKey(name: 'habits') List<Habit>? habits});
}

/// @nodoc
class __$$DashboardHabitImplCopyWithImpl<$Res>
    extends _$DashboardHabitCopyWithImpl<$Res, _$DashboardHabitImpl>
    implements _$$DashboardHabitImplCopyWith<$Res> {
  __$$DashboardHabitImplCopyWithImpl(
      _$DashboardHabitImpl _value, $Res Function(_$DashboardHabitImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardHabit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? habits = freezed,
  }) {
    return _then(_$DashboardHabitImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      habits: freezed == habits
          ? _value._habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<Habit>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardHabitImpl implements _DashboardHabit {
  const _$DashboardHabitImpl(
      {@JsonKey(name: 'category') this.category,
      @JsonKey(name: 'habits') final List<Habit>? habits})
      : _habits = habits;

  factory _$DashboardHabitImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardHabitImplFromJson(json);

  @override
  @JsonKey(name: 'category')
  final String? category;
  final List<Habit>? _habits;
  @override
  @JsonKey(name: 'habits')
  List<Habit>? get habits {
    final value = _habits;
    if (value == null) return null;
    if (_habits is EqualUnmodifiableListView) return _habits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DashboardHabit(category: $category, habits: $habits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardHabitImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._habits, _habits));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, category, const DeepCollectionEquality().hash(_habits));

  /// Create a copy of DashboardHabit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardHabitImplCopyWith<_$DashboardHabitImpl> get copyWith =>
      __$$DashboardHabitImplCopyWithImpl<_$DashboardHabitImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardHabitImplToJson(
      this,
    );
  }
}

abstract class _DashboardHabit implements DashboardHabit {
  const factory _DashboardHabit(
          {@JsonKey(name: 'category') final String? category,
          @JsonKey(name: 'habits') final List<Habit>? habits}) =
      _$DashboardHabitImpl;

  factory _DashboardHabit.fromJson(Map<String, dynamic> json) =
      _$DashboardHabitImpl.fromJson;

  @override
  @JsonKey(name: 'category')
  String? get category;
  @override
  @JsonKey(name: 'habits')
  List<Habit>? get habits;

  /// Create a copy of DashboardHabit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardHabitImplCopyWith<_$DashboardHabitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Habit _$HabitFromJson(Map<String, dynamic> json) {
  return _Habit.fromJson(json);
}

/// @nodoc
mixin _$Habit {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo')
  String? get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;

  /// Serializes this Habit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitCopyWith<Habit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitCopyWith<$Res> {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) then) =
      _$HabitCopyWithImpl<$Res, Habit>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'logo') String? logo,
      @JsonKey(name: 'status') int? status});
}

/// @nodoc
class _$HabitCopyWithImpl<$Res, $Val extends Habit>
    implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? logo = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitImplCopyWith<$Res> implements $HabitCopyWith<$Res> {
  factory _$$HabitImplCopyWith(
          _$HabitImpl value, $Res Function(_$HabitImpl) then) =
      __$$HabitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'logo') String? logo,
      @JsonKey(name: 'status') int? status});
}

/// @nodoc
class __$$HabitImplCopyWithImpl<$Res>
    extends _$HabitCopyWithImpl<$Res, _$HabitImpl>
    implements _$$HabitImplCopyWith<$Res> {
  __$$HabitImplCopyWithImpl(
      _$HabitImpl _value, $Res Function(_$HabitImpl) _then)
      : super(_value, _then);

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? logo = freezed,
    Object? status = freezed,
  }) {
    return _then(_$HabitImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HabitImpl implements _Habit {
  const _$HabitImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'logo') this.logo,
      @JsonKey(name: 'status') this.status});

  factory _$HabitImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'logo')
  final String? logo;
  @override
  @JsonKey(name: 'status')
  final int? status;

  @override
  String toString() {
    return 'Habit(id: $id, type: $type, logo: $logo, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, logo, status);

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitImplCopyWith<_$HabitImpl> get copyWith =>
      __$$HabitImplCopyWithImpl<_$HabitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitImplToJson(
      this,
    );
  }
}

abstract class _Habit implements Habit {
  const factory _Habit(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'logo') final String? logo,
      @JsonKey(name: 'status') final int? status}) = _$HabitImpl;

  factory _Habit.fromJson(Map<String, dynamic> json) = _$HabitImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'logo')
  String? get logo;
  @override
  @JsonKey(name: 'status')
  int? get status;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitImplCopyWith<_$HabitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
