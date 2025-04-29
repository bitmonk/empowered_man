// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_assessment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetAssessmentModel _$GetAssessmentModelFromJson(Map<String, dynamic> json) {
  return _GetAssessmentModel.fromJson(json);
}

/// @nodoc
mixin _$GetAssessmentModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Data? get data => throw _privateConstructorUsedError;

  /// Serializes this GetAssessmentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetAssessmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAssessmentModelCopyWith<GetAssessmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAssessmentModelCopyWith<$Res> {
  factory $GetAssessmentModelCopyWith(
          GetAssessmentModel value, $Res Function(GetAssessmentModel) then) =
      _$GetAssessmentModelCopyWithImpl<$Res, GetAssessmentModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GetAssessmentModelCopyWithImpl<$Res, $Val extends GetAssessmentModel>
    implements $GetAssessmentModelCopyWith<$Res> {
  _$GetAssessmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAssessmentModel
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

  /// Create a copy of GetAssessmentModel
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
abstract class _$$GetAssessmentModelImplCopyWith<$Res>
    implements $GetAssessmentModelCopyWith<$Res> {
  factory _$$GetAssessmentModelImplCopyWith(_$GetAssessmentModelImpl value,
          $Res Function(_$GetAssessmentModelImpl) then) =
      __$$GetAssessmentModelImplCopyWithImpl<$Res>;
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
class __$$GetAssessmentModelImplCopyWithImpl<$Res>
    extends _$GetAssessmentModelCopyWithImpl<$Res, _$GetAssessmentModelImpl>
    implements _$$GetAssessmentModelImplCopyWith<$Res> {
  __$$GetAssessmentModelImplCopyWithImpl(_$GetAssessmentModelImpl _value,
      $Res Function(_$GetAssessmentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAssessmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GetAssessmentModelImpl(
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
class _$GetAssessmentModelImpl implements _GetAssessmentModel {
  const _$GetAssessmentModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$GetAssessmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetAssessmentModelImplFromJson(json);

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
    return 'GetAssessmentModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAssessmentModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of GetAssessmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAssessmentModelImplCopyWith<_$GetAssessmentModelImpl> get copyWith =>
      __$$GetAssessmentModelImplCopyWithImpl<_$GetAssessmentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAssessmentModelImplToJson(
      this,
    );
  }
}

abstract class _GetAssessmentModel implements GetAssessmentModel {
  const factory _GetAssessmentModel(
      {@JsonKey(name: 'status') final bool? status,
      @JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'data') final Data? data}) = _$GetAssessmentModelImpl;

  factory _GetAssessmentModel.fromJson(Map<String, dynamic> json) =
      _$GetAssessmentModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  Data? get data;

  /// Create a copy of GetAssessmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAssessmentModelImplCopyWith<_$GetAssessmentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'assessments')
  Assessments? get assessments => throw _privateConstructorUsedError;

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
  $Res call({@JsonKey(name: 'assessments') Assessments? assessments});

  $AssessmentsCopyWith<$Res>? get assessments;
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
    Object? assessments = freezed,
  }) {
    return _then(_value.copyWith(
      assessments: freezed == assessments
          ? _value.assessments
          : assessments // ignore: cast_nullable_to_non_nullable
              as Assessments?,
    ) as $Val);
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssessmentsCopyWith<$Res>? get assessments {
    if (_value.assessments == null) {
      return null;
    }

    return $AssessmentsCopyWith<$Res>(_value.assessments!, (value) {
      return _then(_value.copyWith(assessments: value) as $Val);
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
  $Res call({@JsonKey(name: 'assessments') Assessments? assessments});

  @override
  $AssessmentsCopyWith<$Res>? get assessments;
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
    Object? assessments = freezed,
  }) {
    return _then(_$DataImpl(
      assessments: freezed == assessments
          ? _value.assessments
          : assessments // ignore: cast_nullable_to_non_nullable
              as Assessments?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl({@JsonKey(name: 'assessments') this.assessments});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: 'assessments')
  final Assessments? assessments;

  @override
  String toString() {
    return 'Data(assessments: $assessments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.assessments, assessments) ||
                other.assessments == assessments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, assessments);

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
          {@JsonKey(name: 'assessments') final Assessments? assessments}) =
      _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: 'assessments')
  Assessments? get assessments;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Assessments _$AssessmentsFromJson(Map<String, dynamic> json) {
  return _Assessments.fromJson(json);
}

/// @nodoc
mixin _$Assessments {
  @JsonKey(name: 'Growth')
  List<Growth>? get growth => throw _privateConstructorUsedError;
  @JsonKey(name: 'Wealth')
  List<Growth>? get wealth => throw _privateConstructorUsedError;

  /// Serializes this Assessments to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Assessments
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentsCopyWith<Assessments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentsCopyWith<$Res> {
  factory $AssessmentsCopyWith(
          Assessments value, $Res Function(Assessments) then) =
      _$AssessmentsCopyWithImpl<$Res, Assessments>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Growth') List<Growth>? growth,
      @JsonKey(name: 'Wealth') List<Growth>? wealth});
}

/// @nodoc
class _$AssessmentsCopyWithImpl<$Res, $Val extends Assessments>
    implements $AssessmentsCopyWith<$Res> {
  _$AssessmentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Assessments
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? growth = freezed,
    Object? wealth = freezed,
  }) {
    return _then(_value.copyWith(
      growth: freezed == growth
          ? _value.growth
          : growth // ignore: cast_nullable_to_non_nullable
              as List<Growth>?,
      wealth: freezed == wealth
          ? _value.wealth
          : wealth // ignore: cast_nullable_to_non_nullable
              as List<Growth>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssessmentsImplCopyWith<$Res>
    implements $AssessmentsCopyWith<$Res> {
  factory _$$AssessmentsImplCopyWith(
          _$AssessmentsImpl value, $Res Function(_$AssessmentsImpl) then) =
      __$$AssessmentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Growth') List<Growth>? growth,
      @JsonKey(name: 'Wealth') List<Growth>? wealth});
}

/// @nodoc
class __$$AssessmentsImplCopyWithImpl<$Res>
    extends _$AssessmentsCopyWithImpl<$Res, _$AssessmentsImpl>
    implements _$$AssessmentsImplCopyWith<$Res> {
  __$$AssessmentsImplCopyWithImpl(
      _$AssessmentsImpl _value, $Res Function(_$AssessmentsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Assessments
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? growth = freezed,
    Object? wealth = freezed,
  }) {
    return _then(_$AssessmentsImpl(
      growth: freezed == growth
          ? _value._growth
          : growth // ignore: cast_nullable_to_non_nullable
              as List<Growth>?,
      wealth: freezed == wealth
          ? _value._wealth
          : wealth // ignore: cast_nullable_to_non_nullable
              as List<Growth>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentsImpl implements _Assessments {
  const _$AssessmentsImpl(
      {@JsonKey(name: 'Growth') final List<Growth>? growth,
      @JsonKey(name: 'Wealth') final List<Growth>? wealth})
      : _growth = growth,
        _wealth = wealth;

  factory _$AssessmentsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentsImplFromJson(json);

  final List<Growth>? _growth;
  @override
  @JsonKey(name: 'Growth')
  List<Growth>? get growth {
    final value = _growth;
    if (value == null) return null;
    if (_growth is EqualUnmodifiableListView) return _growth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Growth>? _wealth;
  @override
  @JsonKey(name: 'Wealth')
  List<Growth>? get wealth {
    final value = _wealth;
    if (value == null) return null;
    if (_wealth is EqualUnmodifiableListView) return _wealth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Assessments(growth: $growth, wealth: $wealth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentsImpl &&
            const DeepCollectionEquality().equals(other._growth, _growth) &&
            const DeepCollectionEquality().equals(other._wealth, _wealth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_growth),
      const DeepCollectionEquality().hash(_wealth));

  /// Create a copy of Assessments
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentsImplCopyWith<_$AssessmentsImpl> get copyWith =>
      __$$AssessmentsImplCopyWithImpl<_$AssessmentsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentsImplToJson(
      this,
    );
  }
}

abstract class _Assessments implements Assessments {
  const factory _Assessments(
      {@JsonKey(name: 'Growth') final List<Growth>? growth,
      @JsonKey(name: 'Wealth') final List<Growth>? wealth}) = _$AssessmentsImpl;

  factory _Assessments.fromJson(Map<String, dynamic> json) =
      _$AssessmentsImpl.fromJson;

  @override
  @JsonKey(name: 'Growth')
  List<Growth>? get growth;
  @override
  @JsonKey(name: 'Wealth')
  List<Growth>? get wealth;

  /// Create a copy of Assessments
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssessmentsImplCopyWith<_$AssessmentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Growth _$GrowthFromJson(Map<String, dynamic> json) {
  return _Growth.fromJson(json);
}

/// @nodoc
mixin _$Growth {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'assessment_type')
  String? get assessmentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_score')
  bool? get hasScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_score')
  dynamic get currentScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_score')
  int? get totalScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'score_history')
  List<ScoreHistory>? get scoreHistory => throw _privateConstructorUsedError;

  /// Serializes this Growth to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Growth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GrowthCopyWith<Growth> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrowthCopyWith<$Res> {
  factory $GrowthCopyWith(Growth value, $Res Function(Growth) then) =
      _$GrowthCopyWithImpl<$Res, Growth>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'assessment_type') String? assessmentType,
      @JsonKey(name: 'has_score') bool? hasScore,
      @JsonKey(name: 'current_score') dynamic currentScore,
      @JsonKey(name: 'total_score') int? totalScore,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'score_history') List<ScoreHistory>? scoreHistory});
}

/// @nodoc
class _$GrowthCopyWithImpl<$Res, $Val extends Growth>
    implements $GrowthCopyWith<$Res> {
  _$GrowthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Growth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? assessmentType = freezed,
    Object? hasScore = freezed,
    Object? currentScore = freezed,
    Object? totalScore = freezed,
    Object? status = freezed,
    Object? scoreHistory = freezed,
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
      hasScore: freezed == hasScore
          ? _value.hasScore
          : hasScore // ignore: cast_nullable_to_non_nullable
              as bool?,
      currentScore: freezed == currentScore
          ? _value.currentScore
          : currentScore // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalScore: freezed == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      scoreHistory: freezed == scoreHistory
          ? _value.scoreHistory
          : scoreHistory // ignore: cast_nullable_to_non_nullable
              as List<ScoreHistory>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GrowthImplCopyWith<$Res> implements $GrowthCopyWith<$Res> {
  factory _$$GrowthImplCopyWith(
          _$GrowthImpl value, $Res Function(_$GrowthImpl) then) =
      __$$GrowthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'assessment_type') String? assessmentType,
      @JsonKey(name: 'has_score') bool? hasScore,
      @JsonKey(name: 'current_score') dynamic currentScore,
      @JsonKey(name: 'total_score') int? totalScore,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'score_history') List<ScoreHistory>? scoreHistory});
}

/// @nodoc
class __$$GrowthImplCopyWithImpl<$Res>
    extends _$GrowthCopyWithImpl<$Res, _$GrowthImpl>
    implements _$$GrowthImplCopyWith<$Res> {
  __$$GrowthImplCopyWithImpl(
      _$GrowthImpl _value, $Res Function(_$GrowthImpl) _then)
      : super(_value, _then);

  /// Create a copy of Growth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? assessmentType = freezed,
    Object? hasScore = freezed,
    Object? currentScore = freezed,
    Object? totalScore = freezed,
    Object? status = freezed,
    Object? scoreHistory = freezed,
  }) {
    return _then(_$GrowthImpl(
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
      hasScore: freezed == hasScore
          ? _value.hasScore
          : hasScore // ignore: cast_nullable_to_non_nullable
              as bool?,
      currentScore: freezed == currentScore
          ? _value.currentScore
          : currentScore // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalScore: freezed == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      scoreHistory: freezed == scoreHistory
          ? _value._scoreHistory
          : scoreHistory // ignore: cast_nullable_to_non_nullable
              as List<ScoreHistory>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GrowthImpl implements _Growth {
  const _$GrowthImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'assessment_type') this.assessmentType,
      @JsonKey(name: 'has_score') this.hasScore,
      @JsonKey(name: 'current_score') this.currentScore,
      @JsonKey(name: 'total_score') this.totalScore,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'score_history') final List<ScoreHistory>? scoreHistory})
      : _scoreHistory = scoreHistory;

  factory _$GrowthImpl.fromJson(Map<String, dynamic> json) =>
      _$$GrowthImplFromJson(json);

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
  @JsonKey(name: 'has_score')
  final bool? hasScore;
  @override
  @JsonKey(name: 'current_score')
  final dynamic currentScore;
  @override
  @JsonKey(name: 'total_score')
  final int? totalScore;
  @override
  @JsonKey(name: 'status')
  final String? status;
  final List<ScoreHistory>? _scoreHistory;
  @override
  @JsonKey(name: 'score_history')
  List<ScoreHistory>? get scoreHistory {
    final value = _scoreHistory;
    if (value == null) return null;
    if (_scoreHistory is EqualUnmodifiableListView) return _scoreHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Growth(id: $id, name: $name, image: $image, assessmentType: $assessmentType, hasScore: $hasScore, currentScore: $currentScore, totalScore: $totalScore, status: $status, scoreHistory: $scoreHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GrowthImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.assessmentType, assessmentType) ||
                other.assessmentType == assessmentType) &&
            (identical(other.hasScore, hasScore) ||
                other.hasScore == hasScore) &&
            const DeepCollectionEquality()
                .equals(other.currentScore, currentScore) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._scoreHistory, _scoreHistory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      image,
      assessmentType,
      hasScore,
      const DeepCollectionEquality().hash(currentScore),
      totalScore,
      status,
      const DeepCollectionEquality().hash(_scoreHistory));

  /// Create a copy of Growth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GrowthImplCopyWith<_$GrowthImpl> get copyWith =>
      __$$GrowthImplCopyWithImpl<_$GrowthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GrowthImplToJson(
      this,
    );
  }
}

abstract class _Growth implements Growth {
  const factory _Growth(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'image') final String? image,
      @JsonKey(name: 'assessment_type') final String? assessmentType,
      @JsonKey(name: 'has_score') final bool? hasScore,
      @JsonKey(name: 'current_score') final dynamic currentScore,
      @JsonKey(name: 'total_score') final int? totalScore,
      @JsonKey(name: 'status') final String? status,
      @JsonKey(name: 'score_history')
      final List<ScoreHistory>? scoreHistory}) = _$GrowthImpl;

  factory _Growth.fromJson(Map<String, dynamic> json) = _$GrowthImpl.fromJson;

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
  @override
  @JsonKey(name: 'has_score')
  bool? get hasScore;
  @override
  @JsonKey(name: 'current_score')
  dynamic get currentScore;
  @override
  @JsonKey(name: 'total_score')
  int? get totalScore;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'score_history')
  List<ScoreHistory>? get scoreHistory;

  /// Create a copy of Growth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GrowthImplCopyWith<_$GrowthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScoreHistory _$ScoreHistoryFromJson(Map<String, dynamic> json) {
  return _ScoreHistory.fromJson(json);
}

/// @nodoc
mixin _$ScoreHistory {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'assessment_date')
  String? get assessmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_score')
  int? get totalScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_completed')
  bool? get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this ScoreHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScoreHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScoreHistoryCopyWith<ScoreHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreHistoryCopyWith<$Res> {
  factory $ScoreHistoryCopyWith(
          ScoreHistory value, $Res Function(ScoreHistory) then) =
      _$ScoreHistoryCopyWithImpl<$Res, ScoreHistory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'assessment_date') String? assessmentDate,
      @JsonKey(name: 'total_score') int? totalScore,
      @JsonKey(name: 'is_completed') bool? isCompleted});
}

/// @nodoc
class _$ScoreHistoryCopyWithImpl<$Res, $Val extends ScoreHistory>
    implements $ScoreHistoryCopyWith<$Res> {
  _$ScoreHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScoreHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? assessmentDate = freezed,
    Object? totalScore = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      assessmentDate: freezed == assessmentDate
          ? _value.assessmentDate
          : assessmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalScore: freezed == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoreHistoryImplCopyWith<$Res>
    implements $ScoreHistoryCopyWith<$Res> {
  factory _$$ScoreHistoryImplCopyWith(
          _$ScoreHistoryImpl value, $Res Function(_$ScoreHistoryImpl) then) =
      __$$ScoreHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'assessment_date') String? assessmentDate,
      @JsonKey(name: 'total_score') int? totalScore,
      @JsonKey(name: 'is_completed') bool? isCompleted});
}

/// @nodoc
class __$$ScoreHistoryImplCopyWithImpl<$Res>
    extends _$ScoreHistoryCopyWithImpl<$Res, _$ScoreHistoryImpl>
    implements _$$ScoreHistoryImplCopyWith<$Res> {
  __$$ScoreHistoryImplCopyWithImpl(
      _$ScoreHistoryImpl _value, $Res Function(_$ScoreHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoreHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? assessmentDate = freezed,
    Object? totalScore = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_$ScoreHistoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      assessmentDate: freezed == assessmentDate
          ? _value.assessmentDate
          : assessmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalScore: freezed == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoreHistoryImpl implements _ScoreHistory {
  const _$ScoreHistoryImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'assessment_date') this.assessmentDate,
      @JsonKey(name: 'total_score') this.totalScore,
      @JsonKey(name: 'is_completed') this.isCompleted});

  factory _$ScoreHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreHistoryImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'assessment_date')
  final String? assessmentDate;
  @override
  @JsonKey(name: 'total_score')
  final int? totalScore;
  @override
  @JsonKey(name: 'is_completed')
  final bool? isCompleted;

  @override
  String toString() {
    return 'ScoreHistory(id: $id, assessmentDate: $assessmentDate, totalScore: $totalScore, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.assessmentDate, assessmentDate) ||
                other.assessmentDate == assessmentDate) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, assessmentDate, totalScore, isCompleted);

  /// Create a copy of ScoreHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreHistoryImplCopyWith<_$ScoreHistoryImpl> get copyWith =>
      __$$ScoreHistoryImplCopyWithImpl<_$ScoreHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreHistoryImplToJson(
      this,
    );
  }
}

abstract class _ScoreHistory implements ScoreHistory {
  const factory _ScoreHistory(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'assessment_date') final String? assessmentDate,
          @JsonKey(name: 'total_score') final int? totalScore,
          @JsonKey(name: 'is_completed') final bool? isCompleted}) =
      _$ScoreHistoryImpl;

  factory _ScoreHistory.fromJson(Map<String, dynamic> json) =
      _$ScoreHistoryImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'assessment_date')
  String? get assessmentDate;
  @override
  @JsonKey(name: 'total_score')
  int? get totalScore;
  @override
  @JsonKey(name: 'is_completed')
  bool? get isCompleted;

  /// Create a copy of ScoreHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScoreHistoryImplCopyWith<_$ScoreHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
