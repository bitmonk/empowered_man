// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_power_streak_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardPowerStreakModel _$DashboardPowerStreakModelFromJson(
    Map<String, dynamic> json) {
  return _DashboardPowerStreakModel.fromJson(json);
}

/// @nodoc
mixin _$DashboardPowerStreakModel {
  @JsonKey(name: 'success')
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  DashboardPowerStreakData? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this DashboardPowerStreakModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardPowerStreakModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardPowerStreakModelCopyWith<DashboardPowerStreakModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardPowerStreakModelCopyWith<$Res> {
  factory $DashboardPowerStreakModelCopyWith(DashboardPowerStreakModel value,
          $Res Function(DashboardPowerStreakModel) then) =
      _$DashboardPowerStreakModelCopyWithImpl<$Res, DashboardPowerStreakModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool? success,
      @JsonKey(name: 'data') DashboardPowerStreakData? data,
      @JsonKey(name: 'message') String? message});

  $DashboardPowerStreakDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$DashboardPowerStreakModelCopyWithImpl<$Res,
        $Val extends DashboardPowerStreakModel>
    implements $DashboardPowerStreakModelCopyWith<$Res> {
  _$DashboardPowerStreakModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardPowerStreakModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DashboardPowerStreakData?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of DashboardPowerStreakModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardPowerStreakDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DashboardPowerStreakDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardPowerStreakModelImplCopyWith<$Res>
    implements $DashboardPowerStreakModelCopyWith<$Res> {
  factory _$$DashboardPowerStreakModelImplCopyWith(
          _$DashboardPowerStreakModelImpl value,
          $Res Function(_$DashboardPowerStreakModelImpl) then) =
      __$$DashboardPowerStreakModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool? success,
      @JsonKey(name: 'data') DashboardPowerStreakData? data,
      @JsonKey(name: 'message') String? message});

  @override
  $DashboardPowerStreakDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$DashboardPowerStreakModelImplCopyWithImpl<$Res>
    extends _$DashboardPowerStreakModelCopyWithImpl<$Res,
        _$DashboardPowerStreakModelImpl>
    implements _$$DashboardPowerStreakModelImplCopyWith<$Res> {
  __$$DashboardPowerStreakModelImplCopyWithImpl(
      _$DashboardPowerStreakModelImpl _value,
      $Res Function(_$DashboardPowerStreakModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardPowerStreakModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$DashboardPowerStreakModelImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DashboardPowerStreakData?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardPowerStreakModelImpl implements _DashboardPowerStreakModel {
  const _$DashboardPowerStreakModelImpl(
      {@JsonKey(name: 'success') this.success,
      @JsonKey(name: 'data') this.data,
      @JsonKey(name: 'message') this.message});

  factory _$DashboardPowerStreakModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardPowerStreakModelImplFromJson(json);

  @override
  @JsonKey(name: 'success')
  final bool? success;
  @override
  @JsonKey(name: 'data')
  final DashboardPowerStreakData? data;
  @override
  @JsonKey(name: 'message')
  final String? message;

  @override
  String toString() {
    return 'DashboardPowerStreakModel(success: $success, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardPowerStreakModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, message);

  /// Create a copy of DashboardPowerStreakModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardPowerStreakModelImplCopyWith<_$DashboardPowerStreakModelImpl>
      get copyWith => __$$DashboardPowerStreakModelImplCopyWithImpl<
          _$DashboardPowerStreakModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardPowerStreakModelImplToJson(
      this,
    );
  }
}

abstract class _DashboardPowerStreakModel implements DashboardPowerStreakModel {
  const factory _DashboardPowerStreakModel(
          {@JsonKey(name: 'success') final bool? success,
          @JsonKey(name: 'data') final DashboardPowerStreakData? data,
          @JsonKey(name: 'message') final String? message}) =
      _$DashboardPowerStreakModelImpl;

  factory _DashboardPowerStreakModel.fromJson(Map<String, dynamic> json) =
      _$DashboardPowerStreakModelImpl.fromJson;

  @override
  @JsonKey(name: 'success')
  bool? get success;
  @override
  @JsonKey(name: 'data')
  DashboardPowerStreakData? get data;
  @override
  @JsonKey(name: 'message')
  String? get message;

  /// Create a copy of DashboardPowerStreakModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardPowerStreakModelImplCopyWith<_$DashboardPowerStreakModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DashboardPowerStreakData _$DashboardPowerStreakDataFromJson(
    Map<String, dynamic> json) {
  return _DashboardPowerStreakData.fromJson(json);
}

/// @nodoc
mixin _$DashboardPowerStreakData {
  @JsonKey(name: 'weeklyDetails')
  Map<String, int>? get weeklyDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'powerStreaks')
  Map<String, int>? get powerStreaks => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalScores')
  Map<String, int>? get totalScores => throw _privateConstructorUsedError;

  /// Serializes this DashboardPowerStreakData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardPowerStreakData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardPowerStreakDataCopyWith<DashboardPowerStreakData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardPowerStreakDataCopyWith<$Res> {
  factory $DashboardPowerStreakDataCopyWith(DashboardPowerStreakData value,
          $Res Function(DashboardPowerStreakData) then) =
      _$DashboardPowerStreakDataCopyWithImpl<$Res, DashboardPowerStreakData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'weeklyDetails') Map<String, int>? weeklyDetails,
      @JsonKey(name: 'powerStreaks') Map<String, int>? powerStreaks,
      @JsonKey(name: 'totalScores') Map<String, int>? totalScores});
}

/// @nodoc
class _$DashboardPowerStreakDataCopyWithImpl<$Res,
        $Val extends DashboardPowerStreakData>
    implements $DashboardPowerStreakDataCopyWith<$Res> {
  _$DashboardPowerStreakDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardPowerStreakData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weeklyDetails = freezed,
    Object? powerStreaks = freezed,
    Object? totalScores = freezed,
  }) {
    return _then(_value.copyWith(
      weeklyDetails: freezed == weeklyDetails
          ? _value.weeklyDetails
          : weeklyDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      powerStreaks: freezed == powerStreaks
          ? _value.powerStreaks
          : powerStreaks // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      totalScores: freezed == totalScores
          ? _value.totalScores
          : totalScores // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardPowerStreakDataImplCopyWith<$Res>
    implements $DashboardPowerStreakDataCopyWith<$Res> {
  factory _$$DashboardPowerStreakDataImplCopyWith(
          _$DashboardPowerStreakDataImpl value,
          $Res Function(_$DashboardPowerStreakDataImpl) then) =
      __$$DashboardPowerStreakDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'weeklyDetails') Map<String, int>? weeklyDetails,
      @JsonKey(name: 'powerStreaks') Map<String, int>? powerStreaks,
      @JsonKey(name: 'totalScores') Map<String, int>? totalScores});
}

/// @nodoc
class __$$DashboardPowerStreakDataImplCopyWithImpl<$Res>
    extends _$DashboardPowerStreakDataCopyWithImpl<$Res,
        _$DashboardPowerStreakDataImpl>
    implements _$$DashboardPowerStreakDataImplCopyWith<$Res> {
  __$$DashboardPowerStreakDataImplCopyWithImpl(
      _$DashboardPowerStreakDataImpl _value,
      $Res Function(_$DashboardPowerStreakDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardPowerStreakData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weeklyDetails = freezed,
    Object? powerStreaks = freezed,
    Object? totalScores = freezed,
  }) {
    return _then(_$DashboardPowerStreakDataImpl(
      weeklyDetails: freezed == weeklyDetails
          ? _value._weeklyDetails
          : weeklyDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      powerStreaks: freezed == powerStreaks
          ? _value._powerStreaks
          : powerStreaks // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      totalScores: freezed == totalScores
          ? _value._totalScores
          : totalScores // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardPowerStreakDataImpl implements _DashboardPowerStreakData {
  const _$DashboardPowerStreakDataImpl(
      {@JsonKey(name: 'weeklyDetails') final Map<String, int>? weeklyDetails,
      @JsonKey(name: 'powerStreaks') final Map<String, int>? powerStreaks,
      @JsonKey(name: 'totalScores') final Map<String, int>? totalScores})
      : _weeklyDetails = weeklyDetails,
        _powerStreaks = powerStreaks,
        _totalScores = totalScores;

  factory _$DashboardPowerStreakDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardPowerStreakDataImplFromJson(json);

  final Map<String, int>? _weeklyDetails;
  @override
  @JsonKey(name: 'weeklyDetails')
  Map<String, int>? get weeklyDetails {
    final value = _weeklyDetails;
    if (value == null) return null;
    if (_weeklyDetails is EqualUnmodifiableMapView) return _weeklyDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, int>? _powerStreaks;
  @override
  @JsonKey(name: 'powerStreaks')
  Map<String, int>? get powerStreaks {
    final value = _powerStreaks;
    if (value == null) return null;
    if (_powerStreaks is EqualUnmodifiableMapView) return _powerStreaks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, int>? _totalScores;
  @override
  @JsonKey(name: 'totalScores')
  Map<String, int>? get totalScores {
    final value = _totalScores;
    if (value == null) return null;
    if (_totalScores is EqualUnmodifiableMapView) return _totalScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DashboardPowerStreakData(weeklyDetails: $weeklyDetails, powerStreaks: $powerStreaks, totalScores: $totalScores)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardPowerStreakDataImpl &&
            const DeepCollectionEquality()
                .equals(other._weeklyDetails, _weeklyDetails) &&
            const DeepCollectionEquality()
                .equals(other._powerStreaks, _powerStreaks) &&
            const DeepCollectionEquality()
                .equals(other._totalScores, _totalScores));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_weeklyDetails),
      const DeepCollectionEquality().hash(_powerStreaks),
      const DeepCollectionEquality().hash(_totalScores));

  /// Create a copy of DashboardPowerStreakData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardPowerStreakDataImplCopyWith<_$DashboardPowerStreakDataImpl>
      get copyWith => __$$DashboardPowerStreakDataImplCopyWithImpl<
          _$DashboardPowerStreakDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardPowerStreakDataImplToJson(
      this,
    );
  }
}

abstract class _DashboardPowerStreakData implements DashboardPowerStreakData {
  const factory _DashboardPowerStreakData(
      {@JsonKey(name: 'weeklyDetails') final Map<String, int>? weeklyDetails,
      @JsonKey(name: 'powerStreaks') final Map<String, int>? powerStreaks,
      @JsonKey(name: 'totalScores')
      final Map<String, int>? totalScores}) = _$DashboardPowerStreakDataImpl;

  factory _DashboardPowerStreakData.fromJson(Map<String, dynamic> json) =
      _$DashboardPowerStreakDataImpl.fromJson;

  @override
  @JsonKey(name: 'weeklyDetails')
  Map<String, int>? get weeklyDetails;
  @override
  @JsonKey(name: 'powerStreaks')
  Map<String, int>? get powerStreaks;
  @override
  @JsonKey(name: 'totalScores')
  Map<String, int>? get totalScores;

  /// Create a copy of DashboardPowerStreakData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardPowerStreakDataImplCopyWith<_$DashboardPowerStreakDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
