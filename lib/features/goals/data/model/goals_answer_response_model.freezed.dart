// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goals_answer_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GoalsAnswerResponseModel _$GoalsAnswerResponseModelFromJson(
    Map<String, dynamic> json) {
  return _GoalsAnswerResponseModel.fromJson(json);
}

/// @nodoc
mixin _$GoalsAnswerResponseModel {
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Data? get data => throw _privateConstructorUsedError;

  /// Serializes this GoalsAnswerResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoalsAnswerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalsAnswerResponseModelCopyWith<GoalsAnswerResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalsAnswerResponseModelCopyWith<$Res> {
  factory $GoalsAnswerResponseModelCopyWith(GoalsAnswerResponseModel value,
          $Res Function(GoalsAnswerResponseModel) then) =
      _$GoalsAnswerResponseModelCopyWithImpl<$Res, GoalsAnswerResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GoalsAnswerResponseModelCopyWithImpl<$Res,
        $Val extends GoalsAnswerResponseModel>
    implements $GoalsAnswerResponseModelCopyWith<$Res> {
  _$GoalsAnswerResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalsAnswerResponseModel
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
              as String?,
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

  /// Create a copy of GoalsAnswerResponseModel
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
abstract class _$$GoalsAnswerResponseModelImplCopyWith<$Res>
    implements $GoalsAnswerResponseModelCopyWith<$Res> {
  factory _$$GoalsAnswerResponseModelImplCopyWith(
          _$GoalsAnswerResponseModelImpl value,
          $Res Function(_$GoalsAnswerResponseModelImpl) then) =
      __$$GoalsAnswerResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Data? data});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$GoalsAnswerResponseModelImplCopyWithImpl<$Res>
    extends _$GoalsAnswerResponseModelCopyWithImpl<$Res,
        _$GoalsAnswerResponseModelImpl>
    implements _$$GoalsAnswerResponseModelImplCopyWith<$Res> {
  __$$GoalsAnswerResponseModelImplCopyWithImpl(
      _$GoalsAnswerResponseModelImpl _value,
      $Res Function(_$GoalsAnswerResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoalsAnswerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GoalsAnswerResponseModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$GoalsAnswerResponseModelImpl implements _GoalsAnswerResponseModel {
  const _$GoalsAnswerResponseModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$GoalsAnswerResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalsAnswerResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'data')
  final Data? data;

  @override
  String toString() {
    return 'GoalsAnswerResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalsAnswerResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of GoalsAnswerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalsAnswerResponseModelImplCopyWith<_$GoalsAnswerResponseModelImpl>
      get copyWith => __$$GoalsAnswerResponseModelImplCopyWithImpl<
          _$GoalsAnswerResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalsAnswerResponseModelImplToJson(
      this,
    );
  }
}

abstract class _GoalsAnswerResponseModel implements GoalsAnswerResponseModel {
  const factory _GoalsAnswerResponseModel(
          {@JsonKey(name: 'status') final String? status,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'data') final Data? data}) =
      _$GoalsAnswerResponseModelImpl;

  factory _GoalsAnswerResponseModel.fromJson(Map<String, dynamic> json) =
      _$GoalsAnswerResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  Data? get data;

  /// Create a copy of GoalsAnswerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalsAnswerResponseModelImplCopyWith<_$GoalsAnswerResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_id')
  String? get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_goal_id')
  String? get userGoalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'achieved')
  bool? get achieved => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'question_id') String? questionId,
      @JsonKey(name: 'user_goal_id') String? userGoalId,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'achieved') bool? achieved});
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
              as String?,
      userGoalId: freezed == userGoalId
          ? _value.userGoalId
          : userGoalId // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'question_id') String? questionId,
      @JsonKey(name: 'user_goal_id') String? userGoalId,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'achieved') bool? achieved});
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
    Object? id = freezed,
    Object? userId = freezed,
    Object? questionId = freezed,
    Object? userGoalId = freezed,
    Object? text = freezed,
    Object? achieved = freezed,
  }) {
    return _then(_$DataImpl(
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
              as String?,
      userGoalId: freezed == userGoalId
          ? _value.userGoalId
          : userGoalId // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'question_id') this.questionId,
      @JsonKey(name: 'user_goal_id') this.userGoalId,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'achieved') this.achieved});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'question_id')
  final String? questionId;
  @override
  @JsonKey(name: 'user_goal_id')
  final String? userGoalId;
  @override
  @JsonKey(name: 'text')
  final String? text;
  @override
  @JsonKey(name: 'achieved')
  final bool? achieved;

  @override
  String toString() {
    return 'Data(id: $id, userId: $userId, questionId: $questionId, userGoalId: $userGoalId, text: $text, achieved: $achieved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
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
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'question_id') final String? questionId,
      @JsonKey(name: 'user_goal_id') final String? userGoalId,
      @JsonKey(name: 'text') final String? text,
      @JsonKey(name: 'achieved') final bool? achieved}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'question_id')
  String? get questionId;
  @override
  @JsonKey(name: 'user_goal_id')
  String? get userGoalId;
  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'achieved')
  bool? get achieved;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
