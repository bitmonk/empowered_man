// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'on_track_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OnTrackModel _$OnTrackModelFromJson(Map<String, dynamic> json) {
  return _OnTrackModel.fromJson(json);
}

/// @nodoc
mixin _$OnTrackModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Data? get data => throw _privateConstructorUsedError;

  /// Serializes this OnTrackModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OnTrackModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnTrackModelCopyWith<OnTrackModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnTrackModelCopyWith<$Res> {
  factory $OnTrackModelCopyWith(
          OnTrackModel value, $Res Function(OnTrackModel) then) =
      _$OnTrackModelCopyWithImpl<$Res, OnTrackModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$OnTrackModelCopyWithImpl<$Res, $Val extends OnTrackModel>
    implements $OnTrackModelCopyWith<$Res> {
  _$OnTrackModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnTrackModel
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

  /// Create a copy of OnTrackModel
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
abstract class _$$OnTrackModelImplCopyWith<$Res>
    implements $OnTrackModelCopyWith<$Res> {
  factory _$$OnTrackModelImplCopyWith(
          _$OnTrackModelImpl value, $Res Function(_$OnTrackModelImpl) then) =
      __$$OnTrackModelImplCopyWithImpl<$Res>;
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
class __$$OnTrackModelImplCopyWithImpl<$Res>
    extends _$OnTrackModelCopyWithImpl<$Res, _$OnTrackModelImpl>
    implements _$$OnTrackModelImplCopyWith<$Res> {
  __$$OnTrackModelImplCopyWithImpl(
      _$OnTrackModelImpl _value, $Res Function(_$OnTrackModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnTrackModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$OnTrackModelImpl(
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
class _$OnTrackModelImpl implements _OnTrackModel {
  const _$OnTrackModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$OnTrackModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnTrackModelImplFromJson(json);

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
    return 'OnTrackModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnTrackModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of OnTrackModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnTrackModelImplCopyWith<_$OnTrackModelImpl> get copyWith =>
      __$$OnTrackModelImplCopyWithImpl<_$OnTrackModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnTrackModelImplToJson(
      this,
    );
  }
}

abstract class _OnTrackModel implements OnTrackModel {
  const factory _OnTrackModel(
      {@JsonKey(name: 'status') final bool? status,
      @JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'data') final Data? data}) = _$OnTrackModelImpl;

  factory _OnTrackModel.fromJson(Map<String, dynamic> json) =
      _$OnTrackModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  Data? get data;

  /// Create a copy of OnTrackModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnTrackModelImplCopyWith<_$OnTrackModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'user_goal')
  UserGoal? get userGoal => throw _privateConstructorUsedError;

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
  $Res call({@JsonKey(name: 'user_goal') UserGoal? userGoal});

  $UserGoalCopyWith<$Res>? get userGoal;
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
    Object? userGoal = freezed,
  }) {
    return _then(_value.copyWith(
      userGoal: freezed == userGoal
          ? _value.userGoal
          : userGoal // ignore: cast_nullable_to_non_nullable
              as UserGoal?,
    ) as $Val);
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserGoalCopyWith<$Res>? get userGoal {
    if (_value.userGoal == null) {
      return null;
    }

    return $UserGoalCopyWith<$Res>(_value.userGoal!, (value) {
      return _then(_value.copyWith(userGoal: value) as $Val);
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
  $Res call({@JsonKey(name: 'user_goal') UserGoal? userGoal});

  @override
  $UserGoalCopyWith<$Res>? get userGoal;
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
    Object? userGoal = freezed,
  }) {
    return _then(_$DataImpl(
      userGoal: freezed == userGoal
          ? _value.userGoal
          : userGoal // ignore: cast_nullable_to_non_nullable
              as UserGoal?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl({@JsonKey(name: 'user_goal') this.userGoal});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: 'user_goal')
  final UserGoal? userGoal;

  @override
  String toString() {
    return 'Data(userGoal: $userGoal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.userGoal, userGoal) ||
                other.userGoal == userGoal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userGoal);

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
  const factory _Data({@JsonKey(name: 'user_goal') final UserGoal? userGoal}) =
      _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: 'user_goal')
  UserGoal? get userGoal;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
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
  dynamic get progress => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_ontrack')
  bool? get isOntrack => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_complete')
  bool? get isComplete => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_won_question')
  dynamic get showWonQuestion => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_track_question')
  dynamic get showTrackQuestion => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'progress') dynamic progress,
      @JsonKey(name: 'is_ontrack') bool? isOntrack,
      @JsonKey(name: 'is_complete') bool? isComplete,
      @JsonKey(name: 'show_won_question') dynamic showWonQuestion,
      @JsonKey(name: 'show_track_question') dynamic showTrackQuestion});
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
              as dynamic,
      isOntrack: freezed == isOntrack
          ? _value.isOntrack
          : isOntrack // ignore: cast_nullable_to_non_nullable
              as bool?,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      showWonQuestion: freezed == showWonQuestion
          ? _value.showWonQuestion
          : showWonQuestion // ignore: cast_nullable_to_non_nullable
              as dynamic,
      showTrackQuestion: freezed == showTrackQuestion
          ? _value.showTrackQuestion
          : showTrackQuestion // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      @JsonKey(name: 'progress') dynamic progress,
      @JsonKey(name: 'is_ontrack') bool? isOntrack,
      @JsonKey(name: 'is_complete') bool? isComplete,
      @JsonKey(name: 'show_won_question') dynamic showWonQuestion,
      @JsonKey(name: 'show_track_question') dynamic showTrackQuestion});
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
              as dynamic,
      isOntrack: freezed == isOntrack
          ? _value.isOntrack
          : isOntrack // ignore: cast_nullable_to_non_nullable
              as bool?,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      showWonQuestion: freezed == showWonQuestion
          ? _value.showWonQuestion
          : showWonQuestion // ignore: cast_nullable_to_non_nullable
              as dynamic,
      showTrackQuestion: freezed == showTrackQuestion
          ? _value.showTrackQuestion
          : showTrackQuestion // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      @JsonKey(name: 'show_track_question') this.showTrackQuestion});

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
  final dynamic progress;
  @override
  @JsonKey(name: 'is_ontrack')
  final bool? isOntrack;
  @override
  @JsonKey(name: 'is_complete')
  final bool? isComplete;
  @override
  @JsonKey(name: 'show_won_question')
  final dynamic showWonQuestion;
  @override
  @JsonKey(name: 'show_track_question')
  final dynamic showTrackQuestion;

  @override
  String toString() {
    return 'UserGoal(id: $id, userId: $userId, goalId: $goalId, goalDetailId: $goalDetailId, progress: $progress, isOntrack: $isOntrack, isComplete: $isComplete, showWonQuestion: $showWonQuestion, showTrackQuestion: $showTrackQuestion)';
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
            const DeepCollectionEquality().equals(other.progress, progress) &&
            (identical(other.isOntrack, isOntrack) ||
                other.isOntrack == isOntrack) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            const DeepCollectionEquality()
                .equals(other.showWonQuestion, showWonQuestion) &&
            const DeepCollectionEquality()
                .equals(other.showTrackQuestion, showTrackQuestion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      goalId,
      goalDetailId,
      const DeepCollectionEquality().hash(progress),
      isOntrack,
      isComplete,
      const DeepCollectionEquality().hash(showWonQuestion),
      const DeepCollectionEquality().hash(showTrackQuestion));

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
      @JsonKey(name: 'progress') final dynamic progress,
      @JsonKey(name: 'is_ontrack') final bool? isOntrack,
      @JsonKey(name: 'is_complete') final bool? isComplete,
      @JsonKey(name: 'show_won_question') final dynamic showWonQuestion,
      @JsonKey(name: 'show_track_question')
      final dynamic showTrackQuestion}) = _$UserGoalImpl;

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
  dynamic get progress;
  @override
  @JsonKey(name: 'is_ontrack')
  bool? get isOntrack;
  @override
  @JsonKey(name: 'is_complete')
  bool? get isComplete;
  @override
  @JsonKey(name: 'show_won_question')
  dynamic get showWonQuestion;
  @override
  @JsonKey(name: 'show_track_question')
  dynamic get showTrackQuestion;

  /// Create a copy of UserGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserGoalImplCopyWith<_$UserGoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
