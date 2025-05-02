// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_assessment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAssessmentModel _$UserAssessmentModelFromJson(Map<String, dynamic> json) {
  return _UserAssessmentModel.fromJson(json);
}

/// @nodoc
mixin _$UserAssessmentModel {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  UserAssessmentData? get data => throw _privateConstructorUsedError;

  /// Serializes this UserAssessmentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAssessmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAssessmentModelCopyWith<UserAssessmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAssessmentModelCopyWith<$Res> {
  factory $UserAssessmentModelCopyWith(
          UserAssessmentModel value, $Res Function(UserAssessmentModel) then) =
      _$UserAssessmentModelCopyWithImpl<$Res, UserAssessmentModel>;
  @useResult
  $Res call(
      {bool? status,
      String? message,
      @JsonKey(name: 'data') UserAssessmentData? data});

  $UserAssessmentDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$UserAssessmentModelCopyWithImpl<$Res, $Val extends UserAssessmentModel>
    implements $UserAssessmentModelCopyWith<$Res> {
  _$UserAssessmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAssessmentModel
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
              as UserAssessmentData?,
    ) as $Val);
  }

  /// Create a copy of UserAssessmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserAssessmentDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UserAssessmentDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserAssessmentModelImplCopyWith<$Res>
    implements $UserAssessmentModelCopyWith<$Res> {
  factory _$$UserAssessmentModelImplCopyWith(_$UserAssessmentModelImpl value,
          $Res Function(_$UserAssessmentModelImpl) then) =
      __$$UserAssessmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status,
      String? message,
      @JsonKey(name: 'data') UserAssessmentData? data});

  @override
  $UserAssessmentDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$UserAssessmentModelImplCopyWithImpl<$Res>
    extends _$UserAssessmentModelCopyWithImpl<$Res, _$UserAssessmentModelImpl>
    implements _$$UserAssessmentModelImplCopyWith<$Res> {
  __$$UserAssessmentModelImplCopyWithImpl(_$UserAssessmentModelImpl _value,
      $Res Function(_$UserAssessmentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAssessmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$UserAssessmentModelImpl(
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
              as UserAssessmentData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAssessmentModelImpl implements _UserAssessmentModel {
  const _$UserAssessmentModelImpl(
      {this.status, this.message, @JsonKey(name: 'data') this.data});

  factory _$UserAssessmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAssessmentModelImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  @JsonKey(name: 'data')
  final UserAssessmentData? data;

  @override
  String toString() {
    return 'UserAssessmentModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAssessmentModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of UserAssessmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAssessmentModelImplCopyWith<_$UserAssessmentModelImpl> get copyWith =>
      __$$UserAssessmentModelImplCopyWithImpl<_$UserAssessmentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAssessmentModelImplToJson(
      this,
    );
  }
}

abstract class _UserAssessmentModel implements UserAssessmentModel {
  const factory _UserAssessmentModel(
          {final bool? status,
          final String? message,
          @JsonKey(name: 'data') final UserAssessmentData? data}) =
      _$UserAssessmentModelImpl;

  factory _UserAssessmentModel.fromJson(Map<String, dynamic> json) =
      _$UserAssessmentModelImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  @JsonKey(name: 'data')
  UserAssessmentData? get data;

  /// Create a copy of UserAssessmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAssessmentModelImplCopyWith<_$UserAssessmentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserAssessmentData _$UserAssessmentDataFromJson(Map<String, dynamic> json) {
  return _UserAssessmentData.fromJson(json);
}

/// @nodoc
mixin _$UserAssessmentData {
  @JsonKey(name: 'user_assessment')
  UserAssessmentDetail? get userAssessment =>
      throw _privateConstructorUsedError;

  /// Serializes this UserAssessmentData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAssessmentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAssessmentDataCopyWith<UserAssessmentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAssessmentDataCopyWith<$Res> {
  factory $UserAssessmentDataCopyWith(
          UserAssessmentData value, $Res Function(UserAssessmentData) then) =
      _$UserAssessmentDataCopyWithImpl<$Res, UserAssessmentData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_assessment') UserAssessmentDetail? userAssessment});

  $UserAssessmentDetailCopyWith<$Res>? get userAssessment;
}

/// @nodoc
class _$UserAssessmentDataCopyWithImpl<$Res, $Val extends UserAssessmentData>
    implements $UserAssessmentDataCopyWith<$Res> {
  _$UserAssessmentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAssessmentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAssessment = freezed,
  }) {
    return _then(_value.copyWith(
      userAssessment: freezed == userAssessment
          ? _value.userAssessment
          : userAssessment // ignore: cast_nullable_to_non_nullable
              as UserAssessmentDetail?,
    ) as $Val);
  }

  /// Create a copy of UserAssessmentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserAssessmentDetailCopyWith<$Res>? get userAssessment {
    if (_value.userAssessment == null) {
      return null;
    }

    return $UserAssessmentDetailCopyWith<$Res>(_value.userAssessment!, (value) {
      return _then(_value.copyWith(userAssessment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserAssessmentDataImplCopyWith<$Res>
    implements $UserAssessmentDataCopyWith<$Res> {
  factory _$$UserAssessmentDataImplCopyWith(_$UserAssessmentDataImpl value,
          $Res Function(_$UserAssessmentDataImpl) then) =
      __$$UserAssessmentDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_assessment') UserAssessmentDetail? userAssessment});

  @override
  $UserAssessmentDetailCopyWith<$Res>? get userAssessment;
}

/// @nodoc
class __$$UserAssessmentDataImplCopyWithImpl<$Res>
    extends _$UserAssessmentDataCopyWithImpl<$Res, _$UserAssessmentDataImpl>
    implements _$$UserAssessmentDataImplCopyWith<$Res> {
  __$$UserAssessmentDataImplCopyWithImpl(_$UserAssessmentDataImpl _value,
      $Res Function(_$UserAssessmentDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAssessmentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAssessment = freezed,
  }) {
    return _then(_$UserAssessmentDataImpl(
      userAssessment: freezed == userAssessment
          ? _value.userAssessment
          : userAssessment // ignore: cast_nullable_to_non_nullable
              as UserAssessmentDetail?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAssessmentDataImpl implements _UserAssessmentData {
  const _$UserAssessmentDataImpl(
      {@JsonKey(name: 'user_assessment') this.userAssessment});

  factory _$UserAssessmentDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAssessmentDataImplFromJson(json);

  @override
  @JsonKey(name: 'user_assessment')
  final UserAssessmentDetail? userAssessment;

  @override
  String toString() {
    return 'UserAssessmentData(userAssessment: $userAssessment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAssessmentDataImpl &&
            (identical(other.userAssessment, userAssessment) ||
                other.userAssessment == userAssessment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userAssessment);

  /// Create a copy of UserAssessmentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAssessmentDataImplCopyWith<_$UserAssessmentDataImpl> get copyWith =>
      __$$UserAssessmentDataImplCopyWithImpl<_$UserAssessmentDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAssessmentDataImplToJson(
      this,
    );
  }
}

abstract class _UserAssessmentData implements UserAssessmentData {
  const factory _UserAssessmentData(
      {@JsonKey(name: 'user_assessment')
      final UserAssessmentDetail? userAssessment}) = _$UserAssessmentDataImpl;

  factory _UserAssessmentData.fromJson(Map<String, dynamic> json) =
      _$UserAssessmentDataImpl.fromJson;

  @override
  @JsonKey(name: 'user_assessment')
  UserAssessmentDetail? get userAssessment;

  /// Create a copy of UserAssessmentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAssessmentDataImplCopyWith<_$UserAssessmentDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserAssessmentDetail _$UserAssessmentDetailFromJson(Map<String, dynamic> json) {
  return _UserAssessmentDetail.fromJson(json);
}

/// @nodoc
mixin _$UserAssessmentDetail {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'assessment_id')
  int? get assessmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'assessment_date')
  String? get assessmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_obtained_score')
  int? get totalObtainedScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_score')
  int? get totalScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_completed')
  bool? get isCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'assessment')
  Assessment? get assessment => throw _privateConstructorUsedError;
  @JsonKey(name: 'questions')
  List<AssessmentQuestion>? get questions => throw _privateConstructorUsedError;

  /// Serializes this UserAssessmentDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAssessmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAssessmentDetailCopyWith<UserAssessmentDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAssessmentDetailCopyWith<$Res> {
  factory $UserAssessmentDetailCopyWith(UserAssessmentDetail value,
          $Res Function(UserAssessmentDetail) then) =
      _$UserAssessmentDetailCopyWithImpl<$Res, UserAssessmentDetail>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'assessment_id') int? assessmentId,
      @JsonKey(name: 'assessment_date') String? assessmentDate,
      @JsonKey(name: 'total_obtained_score') int? totalObtainedScore,
      @JsonKey(name: 'total_score') int? totalScore,
      @JsonKey(name: 'is_completed') bool? isCompleted,
      @JsonKey(name: 'assessment') Assessment? assessment,
      @JsonKey(name: 'questions') List<AssessmentQuestion>? questions});

  $AssessmentCopyWith<$Res>? get assessment;
}

/// @nodoc
class _$UserAssessmentDetailCopyWithImpl<$Res,
        $Val extends UserAssessmentDetail>
    implements $UserAssessmentDetailCopyWith<$Res> {
  _$UserAssessmentDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAssessmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? assessmentId = freezed,
    Object? assessmentDate = freezed,
    Object? totalObtainedScore = freezed,
    Object? totalScore = freezed,
    Object? isCompleted = freezed,
    Object? assessment = freezed,
    Object? questions = freezed,
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
      assessmentId: freezed == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      assessmentDate: freezed == assessmentDate
          ? _value.assessmentDate
          : assessmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalObtainedScore: freezed == totalObtainedScore
          ? _value.totalObtainedScore
          : totalObtainedScore // ignore: cast_nullable_to_non_nullable
              as int?,
      totalScore: freezed == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      assessment: freezed == assessment
          ? _value.assessment
          : assessment // ignore: cast_nullable_to_non_nullable
              as Assessment?,
      questions: freezed == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<AssessmentQuestion>?,
    ) as $Val);
  }

  /// Create a copy of UserAssessmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssessmentCopyWith<$Res>? get assessment {
    if (_value.assessment == null) {
      return null;
    }

    return $AssessmentCopyWith<$Res>(_value.assessment!, (value) {
      return _then(_value.copyWith(assessment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserAssessmentDetailImplCopyWith<$Res>
    implements $UserAssessmentDetailCopyWith<$Res> {
  factory _$$UserAssessmentDetailImplCopyWith(_$UserAssessmentDetailImpl value,
          $Res Function(_$UserAssessmentDetailImpl) then) =
      __$$UserAssessmentDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'assessment_id') int? assessmentId,
      @JsonKey(name: 'assessment_date') String? assessmentDate,
      @JsonKey(name: 'total_obtained_score') int? totalObtainedScore,
      @JsonKey(name: 'total_score') int? totalScore,
      @JsonKey(name: 'is_completed') bool? isCompleted,
      @JsonKey(name: 'assessment') Assessment? assessment,
      @JsonKey(name: 'questions') List<AssessmentQuestion>? questions});

  @override
  $AssessmentCopyWith<$Res>? get assessment;
}

/// @nodoc
class __$$UserAssessmentDetailImplCopyWithImpl<$Res>
    extends _$UserAssessmentDetailCopyWithImpl<$Res, _$UserAssessmentDetailImpl>
    implements _$$UserAssessmentDetailImplCopyWith<$Res> {
  __$$UserAssessmentDetailImplCopyWithImpl(_$UserAssessmentDetailImpl _value,
      $Res Function(_$UserAssessmentDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAssessmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? assessmentId = freezed,
    Object? assessmentDate = freezed,
    Object? totalObtainedScore = freezed,
    Object? totalScore = freezed,
    Object? isCompleted = freezed,
    Object? assessment = freezed,
    Object? questions = freezed,
  }) {
    return _then(_$UserAssessmentDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      assessmentId: freezed == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      assessmentDate: freezed == assessmentDate
          ? _value.assessmentDate
          : assessmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalObtainedScore: freezed == totalObtainedScore
          ? _value.totalObtainedScore
          : totalObtainedScore // ignore: cast_nullable_to_non_nullable
              as int?,
      totalScore: freezed == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      assessment: freezed == assessment
          ? _value.assessment
          : assessment // ignore: cast_nullable_to_non_nullable
              as Assessment?,
      questions: freezed == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<AssessmentQuestion>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAssessmentDetailImpl implements _UserAssessmentDetail {
  const _$UserAssessmentDetailImpl(
      {this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'assessment_id') this.assessmentId,
      @JsonKey(name: 'assessment_date') this.assessmentDate,
      @JsonKey(name: 'total_obtained_score') this.totalObtainedScore,
      @JsonKey(name: 'total_score') this.totalScore,
      @JsonKey(name: 'is_completed') this.isCompleted,
      @JsonKey(name: 'assessment') this.assessment,
      @JsonKey(name: 'questions') final List<AssessmentQuestion>? questions})
      : _questions = questions;

  factory _$UserAssessmentDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAssessmentDetailImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'assessment_id')
  final int? assessmentId;
  @override
  @JsonKey(name: 'assessment_date')
  final String? assessmentDate;
  @override
  @JsonKey(name: 'total_obtained_score')
  final int? totalObtainedScore;
  @override
  @JsonKey(name: 'total_score')
  final int? totalScore;
  @override
  @JsonKey(name: 'is_completed')
  final bool? isCompleted;
  @override
  @JsonKey(name: 'assessment')
  final Assessment? assessment;
  final List<AssessmentQuestion>? _questions;
  @override
  @JsonKey(name: 'questions')
  List<AssessmentQuestion>? get questions {
    final value = _questions;
    if (value == null) return null;
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserAssessmentDetail(id: $id, userId: $userId, assessmentId: $assessmentId, assessmentDate: $assessmentDate, totalObtainedScore: $totalObtainedScore, totalScore: $totalScore, isCompleted: $isCompleted, assessment: $assessment, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAssessmentDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.assessmentId, assessmentId) ||
                other.assessmentId == assessmentId) &&
            (identical(other.assessmentDate, assessmentDate) ||
                other.assessmentDate == assessmentDate) &&
            (identical(other.totalObtainedScore, totalObtainedScore) ||
                other.totalObtainedScore == totalObtainedScore) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.assessment, assessment) ||
                other.assessment == assessment) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      assessmentId,
      assessmentDate,
      totalObtainedScore,
      totalScore,
      isCompleted,
      assessment,
      const DeepCollectionEquality().hash(_questions));

  /// Create a copy of UserAssessmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAssessmentDetailImplCopyWith<_$UserAssessmentDetailImpl>
      get copyWith =>
          __$$UserAssessmentDetailImplCopyWithImpl<_$UserAssessmentDetailImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAssessmentDetailImplToJson(
      this,
    );
  }
}

abstract class _UserAssessmentDetail implements UserAssessmentDetail {
  const factory _UserAssessmentDetail(
      {final int? id,
      @JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'assessment_id') final int? assessmentId,
      @JsonKey(name: 'assessment_date') final String? assessmentDate,
      @JsonKey(name: 'total_obtained_score') final int? totalObtainedScore,
      @JsonKey(name: 'total_score') final int? totalScore,
      @JsonKey(name: 'is_completed') final bool? isCompleted,
      @JsonKey(name: 'assessment') final Assessment? assessment,
      @JsonKey(name: 'questions')
      final List<AssessmentQuestion>? questions}) = _$UserAssessmentDetailImpl;

  factory _UserAssessmentDetail.fromJson(Map<String, dynamic> json) =
      _$UserAssessmentDetailImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'assessment_id')
  int? get assessmentId;
  @override
  @JsonKey(name: 'assessment_date')
  String? get assessmentDate;
  @override
  @JsonKey(name: 'total_obtained_score')
  int? get totalObtainedScore;
  @override
  @JsonKey(name: 'total_score')
  int? get totalScore;
  @override
  @JsonKey(name: 'is_completed')
  bool? get isCompleted;
  @override
  @JsonKey(name: 'assessment')
  Assessment? get assessment;
  @override
  @JsonKey(name: 'questions')
  List<AssessmentQuestion>? get questions;

  /// Create a copy of UserAssessmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAssessmentDetailImplCopyWith<_$UserAssessmentDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Assessment _$AssessmentFromJson(Map<String, dynamic> json) {
  return _Assessment.fromJson(json);
}

/// @nodoc
mixin _$Assessment {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'assessment_type')
  String? get assessmentType => throw _privateConstructorUsedError;

  /// Serializes this Assessment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Assessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentCopyWith<Assessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentCopyWith<$Res> {
  factory $AssessmentCopyWith(
          Assessment value, $Res Function(Assessment) then) =
      _$AssessmentCopyWithImpl<$Res, Assessment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'assessment_type') String? assessmentType});
}

/// @nodoc
class _$AssessmentCopyWithImpl<$Res, $Val extends Assessment>
    implements $AssessmentCopyWith<$Res> {
  _$AssessmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Assessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? assessmentType = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      assessmentType: freezed == assessmentType
          ? _value.assessmentType
          : assessmentType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssessmentImplCopyWith<$Res>
    implements $AssessmentCopyWith<$Res> {
  factory _$$AssessmentImplCopyWith(
          _$AssessmentImpl value, $Res Function(_$AssessmentImpl) then) =
      __$$AssessmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'assessment_type') String? assessmentType});
}

/// @nodoc
class __$$AssessmentImplCopyWithImpl<$Res>
    extends _$AssessmentCopyWithImpl<$Res, _$AssessmentImpl>
    implements _$$AssessmentImplCopyWith<$Res> {
  __$$AssessmentImplCopyWithImpl(
      _$AssessmentImpl _value, $Res Function(_$AssessmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Assessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? assessmentType = freezed,
  }) {
    return _then(_$AssessmentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      assessmentType: freezed == assessmentType
          ? _value.assessmentType
          : assessmentType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentImpl implements _Assessment {
  const _$AssessmentImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'assessment_type') this.assessmentType});

  factory _$AssessmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'image')
  final String? image;
  @override
  @JsonKey(name: 'assessment_type')
  final String? assessmentType;

  @override
  String toString() {
    return 'Assessment(id: $id, name: $name, image: $image, assessmentType: $assessmentType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.assessmentType, assessmentType) ||
                other.assessmentType == assessmentType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image, assessmentType);

  /// Create a copy of Assessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentImplCopyWith<_$AssessmentImpl> get copyWith =>
      __$$AssessmentImplCopyWithImpl<_$AssessmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentImplToJson(
      this,
    );
  }
}

abstract class _Assessment implements Assessment {
  const factory _Assessment(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'image') final String? image,
          @JsonKey(name: 'assessment_type') final String? assessmentType}) =
      _$AssessmentImpl;

  factory _Assessment.fromJson(Map<String, dynamic> json) =
      _$AssessmentImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(name: 'assessment_type')
  String? get assessmentType;

  /// Create a copy of Assessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssessmentImplCopyWith<_$AssessmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssessmentQuestion _$AssessmentQuestionFromJson(Map<String, dynamic> json) {
  return _AssessmentQuestion.fromJson(json);
}

/// @nodoc
mixin _$AssessmentQuestion {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'assessment_id')
  int? get assessmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'answered')
  bool? get answered => throw _privateConstructorUsedError;
  Answer? get answer => throw _privateConstructorUsedError;

  /// Serializes this AssessmentQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssessmentQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentQuestionCopyWith<AssessmentQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentQuestionCopyWith<$Res> {
  factory $AssessmentQuestionCopyWith(
          AssessmentQuestion value, $Res Function(AssessmentQuestion) then) =
      _$AssessmentQuestionCopyWithImpl<$Res, AssessmentQuestion>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'assessment_id') int? assessmentId,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'answered') bool? answered,
      Answer? answer});

  $AnswerCopyWith<$Res>? get answer;
}

/// @nodoc
class _$AssessmentQuestionCopyWithImpl<$Res, $Val extends AssessmentQuestion>
    implements $AssessmentQuestionCopyWith<$Res> {
  _$AssessmentQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssessmentQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? assessmentId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? answered = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      assessmentId: freezed == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      answered: freezed == answered
          ? _value.answered
          : answered // ignore: cast_nullable_to_non_nullable
              as bool?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Answer?,
    ) as $Val);
  }

  /// Create a copy of AssessmentQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnswerCopyWith<$Res>? get answer {
    if (_value.answer == null) {
      return null;
    }

    return $AnswerCopyWith<$Res>(_value.answer!, (value) {
      return _then(_value.copyWith(answer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AssessmentQuestionImplCopyWith<$Res>
    implements $AssessmentQuestionCopyWith<$Res> {
  factory _$$AssessmentQuestionImplCopyWith(_$AssessmentQuestionImpl value,
          $Res Function(_$AssessmentQuestionImpl) then) =
      __$$AssessmentQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'assessment_id') int? assessmentId,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'answered') bool? answered,
      Answer? answer});

  @override
  $AnswerCopyWith<$Res>? get answer;
}

/// @nodoc
class __$$AssessmentQuestionImplCopyWithImpl<$Res>
    extends _$AssessmentQuestionCopyWithImpl<$Res, _$AssessmentQuestionImpl>
    implements _$$AssessmentQuestionImplCopyWith<$Res> {
  __$$AssessmentQuestionImplCopyWithImpl(_$AssessmentQuestionImpl _value,
      $Res Function(_$AssessmentQuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssessmentQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? assessmentId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? answered = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$AssessmentQuestionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      assessmentId: freezed == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      answered: freezed == answered
          ? _value.answered
          : answered // ignore: cast_nullable_to_non_nullable
              as bool?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Answer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentQuestionImpl implements _AssessmentQuestion {
  const _$AssessmentQuestionImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'assessment_id') this.assessmentId,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'answered') this.answered,
      this.answer});

  factory _$AssessmentQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentQuestionImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'assessment_id')
  final int? assessmentId;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'answered')
  final bool? answered;
  @override
  final Answer? answer;

  @override
  String toString() {
    return 'AssessmentQuestion(id: $id, assessmentId: $assessmentId, title: $title, description: $description, answered: $answered, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.assessmentId, assessmentId) ||
                other.assessmentId == assessmentId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.answered, answered) ||
                other.answered == answered) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, assessmentId, title, description, answered, answer);

  /// Create a copy of AssessmentQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentQuestionImplCopyWith<_$AssessmentQuestionImpl> get copyWith =>
      __$$AssessmentQuestionImplCopyWithImpl<_$AssessmentQuestionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentQuestionImplToJson(
      this,
    );
  }
}

abstract class _AssessmentQuestion implements AssessmentQuestion {
  const factory _AssessmentQuestion(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'assessment_id') final int? assessmentId,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'answered') final bool? answered,
      final Answer? answer}) = _$AssessmentQuestionImpl;

  factory _AssessmentQuestion.fromJson(Map<String, dynamic> json) =
      _$AssessmentQuestionImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'assessment_id')
  int? get assessmentId;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'answered')
  bool? get answered;
  @override
  Answer? get answer;

  /// Create a copy of AssessmentQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssessmentQuestionImplCopyWith<_$AssessmentQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_assessment_score_id')
  int get userAssessmentScoreId => throw _privateConstructorUsedError;
  @JsonKey(name: 'score')
  int get score => throw _privateConstructorUsedError;

  /// Serializes this Answer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res, Answer>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user_assessment_score_id') int userAssessmentScoreId,
      @JsonKey(name: 'score') int score});
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res, $Val extends Answer>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userAssessmentScoreId = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userAssessmentScoreId: null == userAssessmentScoreId
          ? _value.userAssessmentScoreId
          : userAssessmentScoreId // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerImplCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$AnswerImplCopyWith(
          _$AnswerImpl value, $Res Function(_$AnswerImpl) then) =
      __$$AnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user_assessment_score_id') int userAssessmentScoreId,
      @JsonKey(name: 'score') int score});
}

/// @nodoc
class __$$AnswerImplCopyWithImpl<$Res>
    extends _$AnswerCopyWithImpl<$Res, _$AnswerImpl>
    implements _$$AnswerImplCopyWith<$Res> {
  __$$AnswerImplCopyWithImpl(
      _$AnswerImpl _value, $Res Function(_$AnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userAssessmentScoreId = null,
    Object? score = null,
  }) {
    return _then(_$AnswerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userAssessmentScoreId: null == userAssessmentScoreId
          ? _value.userAssessmentScoreId
          : userAssessmentScoreId // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerImpl implements _Answer {
  const _$AnswerImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'user_assessment_score_id')
      required this.userAssessmentScoreId,
      @JsonKey(name: 'score') required this.score});

  factory _$AnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'user_assessment_score_id')
  final int userAssessmentScoreId;
  @override
  @JsonKey(name: 'score')
  final int score;

  @override
  String toString() {
    return 'Answer(id: $id, userAssessmentScoreId: $userAssessmentScoreId, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userAssessmentScoreId, userAssessmentScoreId) ||
                other.userAssessmentScoreId == userAssessmentScoreId) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userAssessmentScoreId, score);

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      __$$AnswerImplCopyWithImpl<_$AnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerImplToJson(
      this,
    );
  }
}

abstract class _Answer implements Answer {
  const factory _Answer(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'user_assessment_score_id')
      required final int userAssessmentScoreId,
      @JsonKey(name: 'score') required final int score}) = _$AnswerImpl;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$AnswerImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'user_assessment_score_id')
  int get userAssessmentScoreId;
  @override
  @JsonKey(name: 'score')
  int get score;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
