// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HabitModel _$HabitModelFromJson(Map<String, dynamic> json) {
  return _HabitModel.fromJson(json);
}

/// @nodoc
mixin _$HabitModel {
  @JsonKey(name: 'success')
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Map<String, Map<String, SubDomain>>? get domain =>
      throw _privateConstructorUsedError;

  /// Serializes this HabitModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitModelCopyWith<HabitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitModelCopyWith<$Res> {
  factory $HabitModelCopyWith(
          HabitModel value, $Res Function(HabitModel) then) =
      _$HabitModelCopyWithImpl<$Res, HabitModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool? success,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Map<String, Map<String, SubDomain>>? domain});
}

/// @nodoc
class _$HabitModelCopyWithImpl<$Res, $Val extends HabitModel>
    implements $HabitModelCopyWith<$Res> {
  _$HabitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? domain = freezed,
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
      domain: freezed == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, SubDomain>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitModelImplCopyWith<$Res>
    implements $HabitModelCopyWith<$Res> {
  factory _$$HabitModelImplCopyWith(
          _$HabitModelImpl value, $Res Function(_$HabitModelImpl) then) =
      __$$HabitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool? success,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Map<String, Map<String, SubDomain>>? domain});
}

/// @nodoc
class __$$HabitModelImplCopyWithImpl<$Res>
    extends _$HabitModelCopyWithImpl<$Res, _$HabitModelImpl>
    implements _$$HabitModelImplCopyWith<$Res> {
  __$$HabitModelImplCopyWithImpl(
      _$HabitModelImpl _value, $Res Function(_$HabitModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? domain = freezed,
  }) {
    return _then(_$HabitModelImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      domain: freezed == domain
          ? _value._domain
          : domain // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, SubDomain>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HabitModelImpl implements _HabitModel {
  const _$HabitModelImpl(
      {@JsonKey(name: 'success') this.success,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') final Map<String, Map<String, SubDomain>>? domain})
      : _domain = domain;

  factory _$HabitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitModelImplFromJson(json);

  @override
  @JsonKey(name: 'success')
  final bool? success;
  @override
  @JsonKey(name: 'message')
  final String? message;
  final Map<String, Map<String, SubDomain>>? _domain;
  @override
  @JsonKey(name: 'data')
  Map<String, Map<String, SubDomain>>? get domain {
    final value = _domain;
    if (value == null) return null;
    if (_domain is EqualUnmodifiableMapView) return _domain;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'HabitModel(success: $success, message: $message, domain: $domain)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._domain, _domain));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_domain));

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitModelImplCopyWith<_$HabitModelImpl> get copyWith =>
      __$$HabitModelImplCopyWithImpl<_$HabitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitModelImplToJson(
      this,
    );
  }
}

abstract class _HabitModel implements HabitModel {
  const factory _HabitModel(
      {@JsonKey(name: 'success') final bool? success,
      @JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'data')
      final Map<String, Map<String, SubDomain>>? domain}) = _$HabitModelImpl;

  factory _HabitModel.fromJson(Map<String, dynamic> json) =
      _$HabitModelImpl.fromJson;

  @override
  @JsonKey(name: 'success')
  bool? get success;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  Map<String, Map<String, SubDomain>>? get domain;

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitModelImplCopyWith<_$HabitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubDomain _$SubDomainFromJson(Map<String, dynamic> json) {
  return _SubDomain.fromJson(json);
}

/// @nodoc
mixin _$SubDomain {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_name')
  String? get typeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'tracked_data')
  List<WeekData>? get trackedData => throw _privateConstructorUsedError;

  /// Serializes this SubDomain to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubDomain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubDomainCopyWith<SubDomain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubDomainCopyWith<$Res> {
  factory $SubDomainCopyWith(SubDomain value, $Res Function(SubDomain) then) =
      _$SubDomainCopyWithImpl<$Res, SubDomain>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'type_name') String? typeName,
      @JsonKey(name: 'tracked_data') List<WeekData>? trackedData});
}

/// @nodoc
class _$SubDomainCopyWithImpl<$Res, $Val extends SubDomain>
    implements $SubDomainCopyWith<$Res> {
  _$SubDomainCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubDomain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? typeName = freezed,
    Object? trackedData = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      trackedData: freezed == trackedData
          ? _value.trackedData
          : trackedData // ignore: cast_nullable_to_non_nullable
              as List<WeekData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubDomainImplCopyWith<$Res>
    implements $SubDomainCopyWith<$Res> {
  factory _$$SubDomainImplCopyWith(
          _$SubDomainImpl value, $Res Function(_$SubDomainImpl) then) =
      __$$SubDomainImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'type_name') String? typeName,
      @JsonKey(name: 'tracked_data') List<WeekData>? trackedData});
}

/// @nodoc
class __$$SubDomainImplCopyWithImpl<$Res>
    extends _$SubDomainCopyWithImpl<$Res, _$SubDomainImpl>
    implements _$$SubDomainImplCopyWith<$Res> {
  __$$SubDomainImplCopyWithImpl(
      _$SubDomainImpl _value, $Res Function(_$SubDomainImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubDomain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? typeName = freezed,
    Object? trackedData = freezed,
  }) {
    return _then(_$SubDomainImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      trackedData: freezed == trackedData
          ? _value._trackedData
          : trackedData // ignore: cast_nullable_to_non_nullable
              as List<WeekData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubDomainImpl implements _SubDomain {
  const _$SubDomainImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'type_name') this.typeName,
      @JsonKey(name: 'tracked_data') final List<WeekData>? trackedData})
      : _trackedData = trackedData;

  factory _$SubDomainImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubDomainImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'type_name')
  final String? typeName;
  final List<WeekData>? _trackedData;
  @override
  @JsonKey(name: 'tracked_data')
  List<WeekData>? get trackedData {
    final value = _trackedData;
    if (value == null) return null;
    if (_trackedData is EqualUnmodifiableListView) return _trackedData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SubDomain(id: $id, typeName: $typeName, trackedData: $trackedData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubDomainImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName) &&
            const DeepCollectionEquality()
                .equals(other._trackedData, _trackedData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, typeName,
      const DeepCollectionEquality().hash(_trackedData));

  /// Create a copy of SubDomain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubDomainImplCopyWith<_$SubDomainImpl> get copyWith =>
      __$$SubDomainImplCopyWithImpl<_$SubDomainImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubDomainImplToJson(
      this,
    );
  }
}

abstract class _SubDomain implements SubDomain {
  const factory _SubDomain(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'type_name') final String? typeName,
          @JsonKey(name: 'tracked_data') final List<WeekData>? trackedData}) =
      _$SubDomainImpl;

  factory _SubDomain.fromJson(Map<String, dynamic> json) =
      _$SubDomainImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'type_name')
  String? get typeName;
  @override
  @JsonKey(name: 'tracked_data')
  List<WeekData>? get trackedData;

  /// Create a copy of SubDomain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubDomainImplCopyWith<_$SubDomainImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeekData _$WeekDataFromJson(Map<String, dynamic> json) {
  return _WeekData.fromJson(json);
}

/// @nodoc
mixin _$WeekData {
  @JsonKey(name: 'id')
  dynamic get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'habits_id')
  int? get habitsId => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'habit_date')
  String? get habitDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  dynamic get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  dynamic get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this WeekData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeekData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeekDataCopyWith<WeekData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekDataCopyWith<$Res> {
  factory $WeekDataCopyWith(WeekData value, $Res Function(WeekData) then) =
      _$WeekDataCopyWithImpl<$Res, WeekData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') dynamic id,
      @JsonKey(name: 'habits_id') int? habitsId,
      @JsonKey(name: 'status') int? status,
      @JsonKey(name: 'habit_date') String? habitDate,
      @JsonKey(name: 'created_at') dynamic createdAt,
      @JsonKey(name: 'updated_at') dynamic updatedAt});
}

/// @nodoc
class _$WeekDataCopyWithImpl<$Res, $Val extends WeekData>
    implements $WeekDataCopyWith<$Res> {
  _$WeekDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeekData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? habitsId = freezed,
    Object? status = freezed,
    Object? habitDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      habitsId: freezed == habitsId
          ? _value.habitsId
          : habitsId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      habitDate: freezed == habitDate
          ? _value.habitDate
          : habitDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeekDataImplCopyWith<$Res>
    implements $WeekDataCopyWith<$Res> {
  factory _$$WeekDataImplCopyWith(
          _$WeekDataImpl value, $Res Function(_$WeekDataImpl) then) =
      __$$WeekDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') dynamic id,
      @JsonKey(name: 'habits_id') int? habitsId,
      @JsonKey(name: 'status') int? status,
      @JsonKey(name: 'habit_date') String? habitDate,
      @JsonKey(name: 'created_at') dynamic createdAt,
      @JsonKey(name: 'updated_at') dynamic updatedAt});
}

/// @nodoc
class __$$WeekDataImplCopyWithImpl<$Res>
    extends _$WeekDataCopyWithImpl<$Res, _$WeekDataImpl>
    implements _$$WeekDataImplCopyWith<$Res> {
  __$$WeekDataImplCopyWithImpl(
      _$WeekDataImpl _value, $Res Function(_$WeekDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeekData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? habitsId = freezed,
    Object? status = freezed,
    Object? habitDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$WeekDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      habitsId: freezed == habitsId
          ? _value.habitsId
          : habitsId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      habitDate: freezed == habitDate
          ? _value.habitDate
          : habitDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeekDataImpl implements _WeekData {
  const _$WeekDataImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'habits_id') this.habitsId,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'habit_date') this.habitDate,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$WeekDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeekDataImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final dynamic id;
  @override
  @JsonKey(name: 'habits_id')
  final int? habitsId;
  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'habit_date')
  final String? habitDate;
  @override
  @JsonKey(name: 'created_at')
  final dynamic createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final dynamic updatedAt;

  @override
  String toString() {
    return 'WeekData(id: $id, habitsId: $habitsId, status: $status, habitDate: $habitDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekDataImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            (identical(other.habitsId, habitsId) ||
                other.habitsId == habitsId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.habitDate, habitDate) ||
                other.habitDate == habitDate) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      habitsId,
      status,
      habitDate,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  /// Create a copy of WeekData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekDataImplCopyWith<_$WeekDataImpl> get copyWith =>
      __$$WeekDataImplCopyWithImpl<_$WeekDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeekDataImplToJson(
      this,
    );
  }
}

abstract class _WeekData implements WeekData {
  const factory _WeekData(
      {@JsonKey(name: 'id') final dynamic id,
      @JsonKey(name: 'habits_id') final int? habitsId,
      @JsonKey(name: 'status') final int? status,
      @JsonKey(name: 'habit_date') final String? habitDate,
      @JsonKey(name: 'created_at') final dynamic createdAt,
      @JsonKey(name: 'updated_at') final dynamic updatedAt}) = _$WeekDataImpl;

  factory _WeekData.fromJson(Map<String, dynamic> json) =
      _$WeekDataImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  dynamic get id;
  @override
  @JsonKey(name: 'habits_id')
  int? get habitsId;
  @override
  @JsonKey(name: 'status')
  int? get status;
  @override
  @JsonKey(name: 'habit_date')
  String? get habitDate;
  @override
  @JsonKey(name: 'created_at')
  dynamic get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  dynamic get updatedAt;

  /// Create a copy of WeekData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeekDataImplCopyWith<_$WeekDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
