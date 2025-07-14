// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_level_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DaashboardLevelModel _$DaashboardLevelModelFromJson(Map<String, dynamic> json) {
  return _DaashboardLevelModel.fromJson(json);
}

/// @nodoc
mixin _$DaashboardLevelModel {
  @JsonKey(name: 'user_progressbar_points')
  String? get userProgressbarPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_points_progressbar')
  String? get totalPointsProgressbar => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_level')
  String? get currentLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'upcoming_level')
  String? get upcomingLevel => throw _privateConstructorUsedError;

  /// Serializes this DaashboardLevelModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DaashboardLevelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DaashboardLevelModelCopyWith<DaashboardLevelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DaashboardLevelModelCopyWith<$Res> {
  factory $DaashboardLevelModelCopyWith(DaashboardLevelModel value,
          $Res Function(DaashboardLevelModel) then) =
      _$DaashboardLevelModelCopyWithImpl<$Res, DaashboardLevelModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_progressbar_points') String? userProgressbarPoints,
      @JsonKey(name: 'total_points_progressbar') String? totalPointsProgressbar,
      @JsonKey(name: 'current_level') String? currentLevel,
      @JsonKey(name: 'upcoming_level') String? upcomingLevel});
}

/// @nodoc
class _$DaashboardLevelModelCopyWithImpl<$Res,
        $Val extends DaashboardLevelModel>
    implements $DaashboardLevelModelCopyWith<$Res> {
  _$DaashboardLevelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DaashboardLevelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProgressbarPoints = freezed,
    Object? totalPointsProgressbar = freezed,
    Object? currentLevel = freezed,
    Object? upcomingLevel = freezed,
  }) {
    return _then(_value.copyWith(
      userProgressbarPoints: freezed == userProgressbarPoints
          ? _value.userProgressbarPoints
          : userProgressbarPoints // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPointsProgressbar: freezed == totalPointsProgressbar
          ? _value.totalPointsProgressbar
          : totalPointsProgressbar // ignore: cast_nullable_to_non_nullable
              as String?,
      currentLevel: freezed == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      upcomingLevel: freezed == upcomingLevel
          ? _value.upcomingLevel
          : upcomingLevel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DaashboardLevelModelImplCopyWith<$Res>
    implements $DaashboardLevelModelCopyWith<$Res> {
  factory _$$DaashboardLevelModelImplCopyWith(_$DaashboardLevelModelImpl value,
          $Res Function(_$DaashboardLevelModelImpl) then) =
      __$$DaashboardLevelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_progressbar_points') String? userProgressbarPoints,
      @JsonKey(name: 'total_points_progressbar') String? totalPointsProgressbar,
      @JsonKey(name: 'current_level') String? currentLevel,
      @JsonKey(name: 'upcoming_level') String? upcomingLevel});
}

/// @nodoc
class __$$DaashboardLevelModelImplCopyWithImpl<$Res>
    extends _$DaashboardLevelModelCopyWithImpl<$Res, _$DaashboardLevelModelImpl>
    implements _$$DaashboardLevelModelImplCopyWith<$Res> {
  __$$DaashboardLevelModelImplCopyWithImpl(_$DaashboardLevelModelImpl _value,
      $Res Function(_$DaashboardLevelModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DaashboardLevelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProgressbarPoints = freezed,
    Object? totalPointsProgressbar = freezed,
    Object? currentLevel = freezed,
    Object? upcomingLevel = freezed,
  }) {
    return _then(_$DaashboardLevelModelImpl(
      userProgressbarPoints: freezed == userProgressbarPoints
          ? _value.userProgressbarPoints
          : userProgressbarPoints // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPointsProgressbar: freezed == totalPointsProgressbar
          ? _value.totalPointsProgressbar
          : totalPointsProgressbar // ignore: cast_nullable_to_non_nullable
              as String?,
      currentLevel: freezed == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      upcomingLevel: freezed == upcomingLevel
          ? _value.upcomingLevel
          : upcomingLevel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DaashboardLevelModelImpl implements _DaashboardLevelModel {
  const _$DaashboardLevelModelImpl(
      {@JsonKey(name: 'user_progressbar_points') this.userProgressbarPoints,
      @JsonKey(name: 'total_points_progressbar') this.totalPointsProgressbar,
      @JsonKey(name: 'current_level') this.currentLevel,
      @JsonKey(name: 'upcoming_level') this.upcomingLevel});

  factory _$DaashboardLevelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DaashboardLevelModelImplFromJson(json);

  @override
  @JsonKey(name: 'user_progressbar_points')
  final String? userProgressbarPoints;
  @override
  @JsonKey(name: 'total_points_progressbar')
  final String? totalPointsProgressbar;
  @override
  @JsonKey(name: 'current_level')
  final String? currentLevel;
  @override
  @JsonKey(name: 'upcoming_level')
  final String? upcomingLevel;

  @override
  String toString() {
    return 'DaashboardLevelModel(userProgressbarPoints: $userProgressbarPoints, totalPointsProgressbar: $totalPointsProgressbar, currentLevel: $currentLevel, upcomingLevel: $upcomingLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DaashboardLevelModelImpl &&
            (identical(other.userProgressbarPoints, userProgressbarPoints) ||
                other.userProgressbarPoints == userProgressbarPoints) &&
            (identical(other.totalPointsProgressbar, totalPointsProgressbar) ||
                other.totalPointsProgressbar == totalPointsProgressbar) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.upcomingLevel, upcomingLevel) ||
                other.upcomingLevel == upcomingLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userProgressbarPoints,
      totalPointsProgressbar, currentLevel, upcomingLevel);

  /// Create a copy of DaashboardLevelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DaashboardLevelModelImplCopyWith<_$DaashboardLevelModelImpl>
      get copyWith =>
          __$$DaashboardLevelModelImplCopyWithImpl<_$DaashboardLevelModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DaashboardLevelModelImplToJson(
      this,
    );
  }
}

abstract class _DaashboardLevelModel implements DaashboardLevelModel {
  const factory _DaashboardLevelModel(
          {@JsonKey(name: 'user_progressbar_points')
          final String? userProgressbarPoints,
          @JsonKey(name: 'total_points_progressbar')
          final String? totalPointsProgressbar,
          @JsonKey(name: 'current_level') final String? currentLevel,
          @JsonKey(name: 'upcoming_level') final String? upcomingLevel}) =
      _$DaashboardLevelModelImpl;

  factory _DaashboardLevelModel.fromJson(Map<String, dynamic> json) =
      _$DaashboardLevelModelImpl.fromJson;

  @override
  @JsonKey(name: 'user_progressbar_points')
  String? get userProgressbarPoints;
  @override
  @JsonKey(name: 'total_points_progressbar')
  String? get totalPointsProgressbar;
  @override
  @JsonKey(name: 'current_level')
  String? get currentLevel;
  @override
  @JsonKey(name: 'upcoming_level')
  String? get upcomingLevel;

  /// Create a copy of DaashboardLevelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DaashboardLevelModelImplCopyWith<_$DaashboardLevelModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
