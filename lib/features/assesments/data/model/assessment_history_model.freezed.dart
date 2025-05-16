// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessment_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssessmentHistoryModel _$AssessmentHistoryModelFromJson(
    Map<String, dynamic> json) {
  return _AssessmentHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$AssessmentHistoryModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  AssessmentHistoryData? get data => throw _privateConstructorUsedError;

  /// Serializes this AssessmentHistoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssessmentHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentHistoryModelCopyWith<AssessmentHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentHistoryModelCopyWith<$Res> {
  factory $AssessmentHistoryModelCopyWith(AssessmentHistoryModel value,
          $Res Function(AssessmentHistoryModel) then) =
      _$AssessmentHistoryModelCopyWithImpl<$Res, AssessmentHistoryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') AssessmentHistoryData? data});

  $AssessmentHistoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$AssessmentHistoryModelCopyWithImpl<$Res,
        $Val extends AssessmentHistoryModel>
    implements $AssessmentHistoryModelCopyWith<$Res> {
  _$AssessmentHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssessmentHistoryModel
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
              as AssessmentHistoryData?,
    ) as $Val);
  }

  /// Create a copy of AssessmentHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssessmentHistoryDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $AssessmentHistoryDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AssessmentHistoryModelImplCopyWith<$Res>
    implements $AssessmentHistoryModelCopyWith<$Res> {
  factory _$$AssessmentHistoryModelImplCopyWith(
          _$AssessmentHistoryModelImpl value,
          $Res Function(_$AssessmentHistoryModelImpl) then) =
      __$$AssessmentHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') AssessmentHistoryData? data});

  @override
  $AssessmentHistoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$AssessmentHistoryModelImplCopyWithImpl<$Res>
    extends _$AssessmentHistoryModelCopyWithImpl<$Res,
        _$AssessmentHistoryModelImpl>
    implements _$$AssessmentHistoryModelImplCopyWith<$Res> {
  __$$AssessmentHistoryModelImplCopyWithImpl(
      _$AssessmentHistoryModelImpl _value,
      $Res Function(_$AssessmentHistoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssessmentHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$AssessmentHistoryModelImpl(
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
              as AssessmentHistoryData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentHistoryModelImpl implements _AssessmentHistoryModel {
  const _$AssessmentHistoryModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$AssessmentHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentHistoryModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'data')
  final AssessmentHistoryData? data;

  @override
  String toString() {
    return 'AssessmentHistoryModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentHistoryModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of AssessmentHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentHistoryModelImplCopyWith<_$AssessmentHistoryModelImpl>
      get copyWith => __$$AssessmentHistoryModelImplCopyWithImpl<
          _$AssessmentHistoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentHistoryModelImplToJson(
      this,
    );
  }
}

abstract class _AssessmentHistoryModel implements AssessmentHistoryModel {
  const factory _AssessmentHistoryModel(
          {@JsonKey(name: 'status') final bool? status,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'data') final AssessmentHistoryData? data}) =
      _$AssessmentHistoryModelImpl;

  factory _AssessmentHistoryModel.fromJson(Map<String, dynamic> json) =
      _$AssessmentHistoryModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  AssessmentHistoryData? get data;

  /// Create a copy of AssessmentHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssessmentHistoryModelImplCopyWith<_$AssessmentHistoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AssessmentHistoryData _$AssessmentHistoryDataFromJson(
    Map<String, dynamic> json) {
  return _AssessmentHistoryData.fromJson(json);
}

/// @nodoc
mixin _$AssessmentHistoryData {
  @JsonKey(name: 'user_assessments')
  List<UserAssessment>? get userAssessments =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'meta')
  AssessmentMeta? get meta => throw _privateConstructorUsedError;

  /// Serializes this AssessmentHistoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssessmentHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentHistoryDataCopyWith<AssessmentHistoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentHistoryDataCopyWith<$Res> {
  factory $AssessmentHistoryDataCopyWith(AssessmentHistoryData value,
          $Res Function(AssessmentHistoryData) then) =
      _$AssessmentHistoryDataCopyWithImpl<$Res, AssessmentHistoryData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_assessments') List<UserAssessment>? userAssessments,
      @JsonKey(name: 'meta') AssessmentMeta? meta});

  $AssessmentMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$AssessmentHistoryDataCopyWithImpl<$Res,
        $Val extends AssessmentHistoryData>
    implements $AssessmentHistoryDataCopyWith<$Res> {
  _$AssessmentHistoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssessmentHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAssessments = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      userAssessments: freezed == userAssessments
          ? _value.userAssessments
          : userAssessments // ignore: cast_nullable_to_non_nullable
              as List<UserAssessment>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as AssessmentMeta?,
    ) as $Val);
  }

  /// Create a copy of AssessmentHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssessmentMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $AssessmentMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AssessmentHistoryDataImplCopyWith<$Res>
    implements $AssessmentHistoryDataCopyWith<$Res> {
  factory _$$AssessmentHistoryDataImplCopyWith(
          _$AssessmentHistoryDataImpl value,
          $Res Function(_$AssessmentHistoryDataImpl) then) =
      __$$AssessmentHistoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_assessments') List<UserAssessment>? userAssessments,
      @JsonKey(name: 'meta') AssessmentMeta? meta});

  @override
  $AssessmentMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$AssessmentHistoryDataImplCopyWithImpl<$Res>
    extends _$AssessmentHistoryDataCopyWithImpl<$Res,
        _$AssessmentHistoryDataImpl>
    implements _$$AssessmentHistoryDataImplCopyWith<$Res> {
  __$$AssessmentHistoryDataImplCopyWithImpl(_$AssessmentHistoryDataImpl _value,
      $Res Function(_$AssessmentHistoryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssessmentHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAssessments = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$AssessmentHistoryDataImpl(
      userAssessments: freezed == userAssessments
          ? _value._userAssessments
          : userAssessments // ignore: cast_nullable_to_non_nullable
              as List<UserAssessment>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as AssessmentMeta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentHistoryDataImpl implements _AssessmentHistoryData {
  const _$AssessmentHistoryDataImpl(
      {@JsonKey(name: 'user_assessments')
      final List<UserAssessment>? userAssessments,
      @JsonKey(name: 'meta') this.meta})
      : _userAssessments = userAssessments;

  factory _$AssessmentHistoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentHistoryDataImplFromJson(json);

  final List<UserAssessment>? _userAssessments;
  @override
  @JsonKey(name: 'user_assessments')
  List<UserAssessment>? get userAssessments {
    final value = _userAssessments;
    if (value == null) return null;
    if (_userAssessments is EqualUnmodifiableListView) return _userAssessments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'meta')
  final AssessmentMeta? meta;

  @override
  String toString() {
    return 'AssessmentHistoryData(userAssessments: $userAssessments, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentHistoryDataImpl &&
            const DeepCollectionEquality()
                .equals(other._userAssessments, _userAssessments) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_userAssessments), meta);

  /// Create a copy of AssessmentHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentHistoryDataImplCopyWith<_$AssessmentHistoryDataImpl>
      get copyWith => __$$AssessmentHistoryDataImplCopyWithImpl<
          _$AssessmentHistoryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentHistoryDataImplToJson(
      this,
    );
  }
}

abstract class _AssessmentHistoryData implements AssessmentHistoryData {
  const factory _AssessmentHistoryData(
          {@JsonKey(name: 'user_assessments')
          final List<UserAssessment>? userAssessments,
          @JsonKey(name: 'meta') final AssessmentMeta? meta}) =
      _$AssessmentHistoryDataImpl;

  factory _AssessmentHistoryData.fromJson(Map<String, dynamic> json) =
      _$AssessmentHistoryDataImpl.fromJson;

  @override
  @JsonKey(name: 'user_assessments')
  List<UserAssessment>? get userAssessments;
  @override
  @JsonKey(name: 'meta')
  AssessmentMeta? get meta;

  /// Create a copy of AssessmentHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssessmentHistoryDataImplCopyWith<_$AssessmentHistoryDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserAssessment _$UserAssessmentFromJson(Map<String, dynamic> json) {
  return _UserAssessment.fromJson(json);
}

/// @nodoc
mixin _$UserAssessment {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'assessment_id')
  int? get assessmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'assessment_name')
  String? get assessmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'assessment_date')
  String? get assessmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_completed')
  bool? get isCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_score')
  int? get totalScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_obtained_score')
  int? get totalObtainedScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this UserAssessment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAssessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAssessmentCopyWith<UserAssessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAssessmentCopyWith<$Res> {
  factory $UserAssessmentCopyWith(
          UserAssessment value, $Res Function(UserAssessment) then) =
      _$UserAssessmentCopyWithImpl<$Res, UserAssessment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'assessment_id') int? assessmentId,
      @JsonKey(name: 'assessment_name') String? assessmentName,
      @JsonKey(name: 'assessment_date') String? assessmentDate,
      @JsonKey(name: 'is_completed') bool? isCompleted,
      @JsonKey(name: 'total_score') int? totalScore,
      @JsonKey(name: 'total_obtained_score') int? totalObtainedScore,
      @JsonKey(name: 'image') String? image});
}

/// @nodoc
class _$UserAssessmentCopyWithImpl<$Res, $Val extends UserAssessment>
    implements $UserAssessmentCopyWith<$Res> {
  _$UserAssessmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAssessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? assessmentId = freezed,
    Object? assessmentName = freezed,
    Object? assessmentDate = freezed,
    Object? isCompleted = freezed,
    Object? totalScore = freezed,
    Object? totalObtainedScore = freezed,
    Object? image = freezed,
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
      assessmentName: freezed == assessmentName
          ? _value.assessmentName
          : assessmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      assessmentDate: freezed == assessmentDate
          ? _value.assessmentDate
          : assessmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalScore: freezed == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int?,
      totalObtainedScore: freezed == totalObtainedScore
          ? _value.totalObtainedScore
          : totalObtainedScore // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAssessmentImplCopyWith<$Res>
    implements $UserAssessmentCopyWith<$Res> {
  factory _$$UserAssessmentImplCopyWith(_$UserAssessmentImpl value,
          $Res Function(_$UserAssessmentImpl) then) =
      __$$UserAssessmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'assessment_id') int? assessmentId,
      @JsonKey(name: 'assessment_name') String? assessmentName,
      @JsonKey(name: 'assessment_date') String? assessmentDate,
      @JsonKey(name: 'is_completed') bool? isCompleted,
      @JsonKey(name: 'total_score') int? totalScore,
      @JsonKey(name: 'total_obtained_score') int? totalObtainedScore,
      @JsonKey(name: 'image') String? image});
}

/// @nodoc
class __$$UserAssessmentImplCopyWithImpl<$Res>
    extends _$UserAssessmentCopyWithImpl<$Res, _$UserAssessmentImpl>
    implements _$$UserAssessmentImplCopyWith<$Res> {
  __$$UserAssessmentImplCopyWithImpl(
      _$UserAssessmentImpl _value, $Res Function(_$UserAssessmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAssessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? assessmentId = freezed,
    Object? assessmentName = freezed,
    Object? assessmentDate = freezed,
    Object? isCompleted = freezed,
    Object? totalScore = freezed,
    Object? totalObtainedScore = freezed,
    Object? image = freezed,
  }) {
    return _then(_$UserAssessmentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      assessmentId: freezed == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      assessmentName: freezed == assessmentName
          ? _value.assessmentName
          : assessmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      assessmentDate: freezed == assessmentDate
          ? _value.assessmentDate
          : assessmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalScore: freezed == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int?,
      totalObtainedScore: freezed == totalObtainedScore
          ? _value.totalObtainedScore
          : totalObtainedScore // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAssessmentImpl implements _UserAssessment {
  const _$UserAssessmentImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'assessment_id') this.assessmentId,
      @JsonKey(name: 'assessment_name') this.assessmentName,
      @JsonKey(name: 'assessment_date') this.assessmentDate,
      @JsonKey(name: 'is_completed') this.isCompleted,
      @JsonKey(name: 'total_score') this.totalScore,
      @JsonKey(name: 'total_obtained_score') this.totalObtainedScore,
      @JsonKey(name: 'image') this.image});

  factory _$UserAssessmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAssessmentImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'assessment_id')
  final int? assessmentId;
  @override
  @JsonKey(name: 'assessment_name')
  final String? assessmentName;
  @override
  @JsonKey(name: 'assessment_date')
  final String? assessmentDate;
  @override
  @JsonKey(name: 'is_completed')
  final bool? isCompleted;
  @override
  @JsonKey(name: 'total_score')
  final int? totalScore;
  @override
  @JsonKey(name: 'total_obtained_score')
  final int? totalObtainedScore;
  @override
  @JsonKey(name: 'image')
  final String? image;

  @override
  String toString() {
    return 'UserAssessment(id: $id, assessmentId: $assessmentId, assessmentName: $assessmentName, assessmentDate: $assessmentDate, isCompleted: $isCompleted, totalScore: $totalScore, totalObtainedScore: $totalObtainedScore, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAssessmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.assessmentId, assessmentId) ||
                other.assessmentId == assessmentId) &&
            (identical(other.assessmentName, assessmentName) ||
                other.assessmentName == assessmentName) &&
            (identical(other.assessmentDate, assessmentDate) ||
                other.assessmentDate == assessmentDate) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore) &&
            (identical(other.totalObtainedScore, totalObtainedScore) ||
                other.totalObtainedScore == totalObtainedScore) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, assessmentId, assessmentName,
      assessmentDate, isCompleted, totalScore, totalObtainedScore, image);

  /// Create a copy of UserAssessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAssessmentImplCopyWith<_$UserAssessmentImpl> get copyWith =>
      __$$UserAssessmentImplCopyWithImpl<_$UserAssessmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAssessmentImplToJson(
      this,
    );
  }
}

abstract class _UserAssessment implements UserAssessment {
  const factory _UserAssessment(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'assessment_id') final int? assessmentId,
      @JsonKey(name: 'assessment_name') final String? assessmentName,
      @JsonKey(name: 'assessment_date') final String? assessmentDate,
      @JsonKey(name: 'is_completed') final bool? isCompleted,
      @JsonKey(name: 'total_score') final int? totalScore,
      @JsonKey(name: 'total_obtained_score') final int? totalObtainedScore,
      @JsonKey(name: 'image') final String? image}) = _$UserAssessmentImpl;

  factory _UserAssessment.fromJson(Map<String, dynamic> json) =
      _$UserAssessmentImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'assessment_id')
  int? get assessmentId;
  @override
  @JsonKey(name: 'assessment_name')
  String? get assessmentName;
  @override
  @JsonKey(name: 'assessment_date')
  String? get assessmentDate;
  @override
  @JsonKey(name: 'is_completed')
  bool? get isCompleted;
  @override
  @JsonKey(name: 'total_score')
  int? get totalScore;
  @override
  @JsonKey(name: 'total_obtained_score')
  int? get totalObtainedScore;
  @override
  @JsonKey(name: 'image')
  String? get image;

  /// Create a copy of UserAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAssessmentImplCopyWith<_$UserAssessmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssessmentMeta _$AssessmentMetaFromJson(Map<String, dynamic> json) {
  return _AssessmentMeta.fromJson(json);
}

/// @nodoc
mixin _$AssessmentMeta {
  @JsonKey(name: 'current_page')
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int? get lastPage => throw _privateConstructorUsedError;

  /// Serializes this AssessmentMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssessmentMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentMetaCopyWith<AssessmentMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentMetaCopyWith<$Res> {
  factory $AssessmentMetaCopyWith(
          AssessmentMeta value, $Res Function(AssessmentMeta) then) =
      _$AssessmentMetaCopyWithImpl<$Res, AssessmentMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int? currentPage,
      @JsonKey(name: 'total') int? total,
      @JsonKey(name: 'per_page') int? perPage,
      @JsonKey(name: 'last_page') int? lastPage});
}

/// @nodoc
class _$AssessmentMetaCopyWithImpl<$Res, $Val extends AssessmentMeta>
    implements $AssessmentMetaCopyWith<$Res> {
  _$AssessmentMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssessmentMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? total = freezed,
    Object? perPage = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssessmentMetaImplCopyWith<$Res>
    implements $AssessmentMetaCopyWith<$Res> {
  factory _$$AssessmentMetaImplCopyWith(_$AssessmentMetaImpl value,
          $Res Function(_$AssessmentMetaImpl) then) =
      __$$AssessmentMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int? currentPage,
      @JsonKey(name: 'total') int? total,
      @JsonKey(name: 'per_page') int? perPage,
      @JsonKey(name: 'last_page') int? lastPage});
}

/// @nodoc
class __$$AssessmentMetaImplCopyWithImpl<$Res>
    extends _$AssessmentMetaCopyWithImpl<$Res, _$AssessmentMetaImpl>
    implements _$$AssessmentMetaImplCopyWith<$Res> {
  __$$AssessmentMetaImplCopyWithImpl(
      _$AssessmentMetaImpl _value, $Res Function(_$AssessmentMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssessmentMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? total = freezed,
    Object? perPage = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(_$AssessmentMetaImpl(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentMetaImpl implements _AssessmentMeta {
  const _$AssessmentMetaImpl(
      {@JsonKey(name: 'current_page') this.currentPage,
      @JsonKey(name: 'total') this.total,
      @JsonKey(name: 'per_page') this.perPage,
      @JsonKey(name: 'last_page') this.lastPage});

  factory _$AssessmentMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentMetaImplFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @override
  @JsonKey(name: 'total')
  final int? total;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;
  @override
  @JsonKey(name: 'last_page')
  final int? lastPage;

  @override
  String toString() {
    return 'AssessmentMeta(currentPage: $currentPage, total: $total, perPage: $perPage, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentMetaImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, total, perPage, lastPage);

  /// Create a copy of AssessmentMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentMetaImplCopyWith<_$AssessmentMetaImpl> get copyWith =>
      __$$AssessmentMetaImplCopyWithImpl<_$AssessmentMetaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentMetaImplToJson(
      this,
    );
  }
}

abstract class _AssessmentMeta implements AssessmentMeta {
  const factory _AssessmentMeta(
      {@JsonKey(name: 'current_page') final int? currentPage,
      @JsonKey(name: 'total') final int? total,
      @JsonKey(name: 'per_page') final int? perPage,
      @JsonKey(name: 'last_page') final int? lastPage}) = _$AssessmentMetaImpl;

  factory _AssessmentMeta.fromJson(Map<String, dynamic> json) =
      _$AssessmentMetaImpl.fromJson;

  @override
  @JsonKey(name: 'current_page')
  int? get currentPage;
  @override
  @JsonKey(name: 'total')
  int? get total;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  @JsonKey(name: 'last_page')
  int? get lastPage;

  /// Create a copy of AssessmentMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssessmentMetaImplCopyWith<_$AssessmentMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
