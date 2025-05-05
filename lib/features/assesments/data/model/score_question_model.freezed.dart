// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScoreQuestionModel _$ScoreQuestionModelFromJson(Map<String, dynamic> json) {
  return _ScoreQuestionModel.fromJson(json);
}

/// @nodoc
mixin _$ScoreQuestionModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  ScoreQuestionData? get data => throw _privateConstructorUsedError;

  /// Serializes this ScoreQuestionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScoreQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScoreQuestionModelCopyWith<ScoreQuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreQuestionModelCopyWith<$Res> {
  factory $ScoreQuestionModelCopyWith(
          ScoreQuestionModel value, $Res Function(ScoreQuestionModel) then) =
      _$ScoreQuestionModelCopyWithImpl<$Res, ScoreQuestionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') ScoreQuestionData? data});

  $ScoreQuestionDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ScoreQuestionModelCopyWithImpl<$Res, $Val extends ScoreQuestionModel>
    implements $ScoreQuestionModelCopyWith<$Res> {
  _$ScoreQuestionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScoreQuestionModel
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
              as ScoreQuestionData?,
    ) as $Val);
  }

  /// Create a copy of ScoreQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScoreQuestionDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ScoreQuestionDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScoreQuestionModelImplCopyWith<$Res>
    implements $ScoreQuestionModelCopyWith<$Res> {
  factory _$$ScoreQuestionModelImplCopyWith(_$ScoreQuestionModelImpl value,
          $Res Function(_$ScoreQuestionModelImpl) then) =
      __$$ScoreQuestionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') ScoreQuestionData? data});

  @override
  $ScoreQuestionDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ScoreQuestionModelImplCopyWithImpl<$Res>
    extends _$ScoreQuestionModelCopyWithImpl<$Res, _$ScoreQuestionModelImpl>
    implements _$$ScoreQuestionModelImplCopyWith<$Res> {
  __$$ScoreQuestionModelImplCopyWithImpl(_$ScoreQuestionModelImpl _value,
      $Res Function(_$ScoreQuestionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoreQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ScoreQuestionModelImpl(
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
              as ScoreQuestionData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoreQuestionModelImpl implements _ScoreQuestionModel {
  const _$ScoreQuestionModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$ScoreQuestionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreQuestionModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'data')
  final ScoreQuestionData? data;

  @override
  String toString() {
    return 'ScoreQuestionModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreQuestionModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of ScoreQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreQuestionModelImplCopyWith<_$ScoreQuestionModelImpl> get copyWith =>
      __$$ScoreQuestionModelImplCopyWithImpl<_$ScoreQuestionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreQuestionModelImplToJson(
      this,
    );
  }
}

abstract class _ScoreQuestionModel implements ScoreQuestionModel {
  const factory _ScoreQuestionModel(
          {@JsonKey(name: 'status') final bool? status,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'data') final ScoreQuestionData? data}) =
      _$ScoreQuestionModelImpl;

  factory _ScoreQuestionModel.fromJson(Map<String, dynamic> json) =
      _$ScoreQuestionModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  ScoreQuestionData? get data;

  /// Create a copy of ScoreQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScoreQuestionModelImplCopyWith<_$ScoreQuestionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScoreQuestionData _$ScoreQuestionDataFromJson(Map<String, dynamic> json) {
  return _ScoreQuestionData.fromJson(json);
}

/// @nodoc
mixin _$ScoreQuestionData {
  @JsonKey(name: 'question_score')
  QuestionScore? get questionScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_obtained_score')
  int? get totalObtainedScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_score')
  int? get totalScore => throw _privateConstructorUsedError;
  List<Question>? get questions => throw _privateConstructorUsedError;

  /// Serializes this ScoreQuestionData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScoreQuestionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScoreQuestionDataCopyWith<ScoreQuestionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreQuestionDataCopyWith<$Res> {
  factory $ScoreQuestionDataCopyWith(
          ScoreQuestionData value, $Res Function(ScoreQuestionData) then) =
      _$ScoreQuestionDataCopyWithImpl<$Res, ScoreQuestionData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'question_score') QuestionScore? questionScore,
      @JsonKey(name: 'total_obtained_score') int? totalObtainedScore,
      @JsonKey(name: 'total_score') int? totalScore,
      List<Question>? questions});

  $QuestionScoreCopyWith<$Res>? get questionScore;
}

/// @nodoc
class _$ScoreQuestionDataCopyWithImpl<$Res, $Val extends ScoreQuestionData>
    implements $ScoreQuestionDataCopyWith<$Res> {
  _$ScoreQuestionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScoreQuestionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionScore = freezed,
    Object? totalObtainedScore = freezed,
    Object? totalScore = freezed,
    Object? questions = freezed,
  }) {
    return _then(_value.copyWith(
      questionScore: freezed == questionScore
          ? _value.questionScore
          : questionScore // ignore: cast_nullable_to_non_nullable
              as QuestionScore?,
      totalObtainedScore: freezed == totalObtainedScore
          ? _value.totalObtainedScore
          : totalObtainedScore // ignore: cast_nullable_to_non_nullable
              as int?,
      totalScore: freezed == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int?,
      questions: freezed == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
    ) as $Val);
  }

  /// Create a copy of ScoreQuestionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestionScoreCopyWith<$Res>? get questionScore {
    if (_value.questionScore == null) {
      return null;
    }

    return $QuestionScoreCopyWith<$Res>(_value.questionScore!, (value) {
      return _then(_value.copyWith(questionScore: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScoreQuestionDataImplCopyWith<$Res>
    implements $ScoreQuestionDataCopyWith<$Res> {
  factory _$$ScoreQuestionDataImplCopyWith(_$ScoreQuestionDataImpl value,
          $Res Function(_$ScoreQuestionDataImpl) then) =
      __$$ScoreQuestionDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'question_score') QuestionScore? questionScore,
      @JsonKey(name: 'total_obtained_score') int? totalObtainedScore,
      @JsonKey(name: 'total_score') int? totalScore,
      List<Question>? questions});

  @override
  $QuestionScoreCopyWith<$Res>? get questionScore;
}

/// @nodoc
class __$$ScoreQuestionDataImplCopyWithImpl<$Res>
    extends _$ScoreQuestionDataCopyWithImpl<$Res, _$ScoreQuestionDataImpl>
    implements _$$ScoreQuestionDataImplCopyWith<$Res> {
  __$$ScoreQuestionDataImplCopyWithImpl(_$ScoreQuestionDataImpl _value,
      $Res Function(_$ScoreQuestionDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoreQuestionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionScore = freezed,
    Object? totalObtainedScore = freezed,
    Object? totalScore = freezed,
    Object? questions = freezed,
  }) {
    return _then(_$ScoreQuestionDataImpl(
      questionScore: freezed == questionScore
          ? _value.questionScore
          : questionScore // ignore: cast_nullable_to_non_nullable
              as QuestionScore?,
      totalObtainedScore: freezed == totalObtainedScore
          ? _value.totalObtainedScore
          : totalObtainedScore // ignore: cast_nullable_to_non_nullable
              as int?,
      totalScore: freezed == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int?,
      questions: freezed == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoreQuestionDataImpl implements _ScoreQuestionData {
  const _$ScoreQuestionDataImpl(
      {@JsonKey(name: 'question_score') this.questionScore,
      @JsonKey(name: 'total_obtained_score') this.totalObtainedScore,
      @JsonKey(name: 'total_score') this.totalScore,
      final List<Question>? questions})
      : _questions = questions;

  factory _$ScoreQuestionDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreQuestionDataImplFromJson(json);

  @override
  @JsonKey(name: 'question_score')
  final QuestionScore? questionScore;
  @override
  @JsonKey(name: 'total_obtained_score')
  final int? totalObtainedScore;
  @override
  @JsonKey(name: 'total_score')
  final int? totalScore;
  final List<Question>? _questions;
  @override
  List<Question>? get questions {
    final value = _questions;
    if (value == null) return null;
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ScoreQuestionData(questionScore: $questionScore, totalObtainedScore: $totalObtainedScore, totalScore: $totalScore, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreQuestionDataImpl &&
            (identical(other.questionScore, questionScore) ||
                other.questionScore == questionScore) &&
            (identical(other.totalObtainedScore, totalObtainedScore) ||
                other.totalObtainedScore == totalObtainedScore) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      questionScore,
      totalObtainedScore,
      totalScore,
      const DeepCollectionEquality().hash(_questions));

  /// Create a copy of ScoreQuestionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreQuestionDataImplCopyWith<_$ScoreQuestionDataImpl> get copyWith =>
      __$$ScoreQuestionDataImplCopyWithImpl<_$ScoreQuestionDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreQuestionDataImplToJson(
      this,
    );
  }
}

abstract class _ScoreQuestionData implements ScoreQuestionData {
  const factory _ScoreQuestionData(
      {@JsonKey(name: 'question_score') final QuestionScore? questionScore,
      @JsonKey(name: 'total_obtained_score') final int? totalObtainedScore,
      @JsonKey(name: 'total_score') final int? totalScore,
      final List<Question>? questions}) = _$ScoreQuestionDataImpl;

  factory _ScoreQuestionData.fromJson(Map<String, dynamic> json) =
      _$ScoreQuestionDataImpl.fromJson;

  @override
  @JsonKey(name: 'question_score')
  QuestionScore? get questionScore;
  @override
  @JsonKey(name: 'total_obtained_score')
  int? get totalObtainedScore;
  @override
  @JsonKey(name: 'total_score')
  int? get totalScore;
  @override
  List<Question>? get questions;

  /// Create a copy of ScoreQuestionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScoreQuestionDataImplCopyWith<_$ScoreQuestionDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuestionScore _$QuestionScoreFromJson(Map<String, dynamic> json) {
  return _QuestionScore.fromJson(json);
}

/// @nodoc
mixin _$QuestionScore {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_assessment_score_id')
  dynamic get userAssessmentScoreId => throw _privateConstructorUsedError;
  @JsonKey(name: 'assessment_question_id')
  dynamic get assessmentQuestionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'score')
  int? get score => throw _privateConstructorUsedError;

  /// Serializes this QuestionScore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestionScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionScoreCopyWith<QuestionScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionScoreCopyWith<$Res> {
  factory $QuestionScoreCopyWith(
          QuestionScore value, $Res Function(QuestionScore) then) =
      _$QuestionScoreCopyWithImpl<$Res, QuestionScore>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_assessment_score_id') dynamic userAssessmentScoreId,
      @JsonKey(name: 'assessment_question_id') dynamic assessmentQuestionId,
      @JsonKey(name: 'score') int? score});
}

/// @nodoc
class _$QuestionScoreCopyWithImpl<$Res, $Val extends QuestionScore>
    implements $QuestionScoreCopyWith<$Res> {
  _$QuestionScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userAssessmentScoreId = freezed,
    Object? assessmentQuestionId = freezed,
    Object? score = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userAssessmentScoreId: freezed == userAssessmentScoreId
          ? _value.userAssessmentScoreId
          : userAssessmentScoreId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      assessmentQuestionId: freezed == assessmentQuestionId
          ? _value.assessmentQuestionId
          : assessmentQuestionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionScoreImplCopyWith<$Res>
    implements $QuestionScoreCopyWith<$Res> {
  factory _$$QuestionScoreImplCopyWith(
          _$QuestionScoreImpl value, $Res Function(_$QuestionScoreImpl) then) =
      __$$QuestionScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_assessment_score_id') dynamic userAssessmentScoreId,
      @JsonKey(name: 'assessment_question_id') dynamic assessmentQuestionId,
      @JsonKey(name: 'score') int? score});
}

/// @nodoc
class __$$QuestionScoreImplCopyWithImpl<$Res>
    extends _$QuestionScoreCopyWithImpl<$Res, _$QuestionScoreImpl>
    implements _$$QuestionScoreImplCopyWith<$Res> {
  __$$QuestionScoreImplCopyWithImpl(
      _$QuestionScoreImpl _value, $Res Function(_$QuestionScoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userAssessmentScoreId = freezed,
    Object? assessmentQuestionId = freezed,
    Object? score = freezed,
  }) {
    return _then(_$QuestionScoreImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userAssessmentScoreId: freezed == userAssessmentScoreId
          ? _value.userAssessmentScoreId
          : userAssessmentScoreId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      assessmentQuestionId: freezed == assessmentQuestionId
          ? _value.assessmentQuestionId
          : assessmentQuestionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionScoreImpl implements _QuestionScore {
  const _$QuestionScoreImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'user_assessment_score_id') this.userAssessmentScoreId,
      @JsonKey(name: 'assessment_question_id') this.assessmentQuestionId,
      @JsonKey(name: 'score') this.score});

  factory _$QuestionScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionScoreImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'user_assessment_score_id')
  final dynamic userAssessmentScoreId;
  @override
  @JsonKey(name: 'assessment_question_id')
  final dynamic assessmentQuestionId;
  @override
  @JsonKey(name: 'score')
  final int? score;

  @override
  String toString() {
    return 'QuestionScore(id: $id, userAssessmentScoreId: $userAssessmentScoreId, assessmentQuestionId: $assessmentQuestionId, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionScoreImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.userAssessmentScoreId, userAssessmentScoreId) &&
            const DeepCollectionEquality()
                .equals(other.assessmentQuestionId, assessmentQuestionId) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(userAssessmentScoreId),
      const DeepCollectionEquality().hash(assessmentQuestionId),
      score);

  /// Create a copy of QuestionScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionScoreImplCopyWith<_$QuestionScoreImpl> get copyWith =>
      __$$QuestionScoreImplCopyWithImpl<_$QuestionScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionScoreImplToJson(
      this,
    );
  }
}

abstract class _QuestionScore implements QuestionScore {
  const factory _QuestionScore(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'user_assessment_score_id')
      final dynamic userAssessmentScoreId,
      @JsonKey(name: 'assessment_question_id')
      final dynamic assessmentQuestionId,
      @JsonKey(name: 'score') final int? score}) = _$QuestionScoreImpl;

  factory _QuestionScore.fromJson(Map<String, dynamic> json) =
      _$QuestionScoreImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'user_assessment_score_id')
  dynamic get userAssessmentScoreId;
  @override
  @JsonKey(name: 'assessment_question_id')
  dynamic get assessmentQuestionId;
  @override
  @JsonKey(name: 'score')
  int? get score;

  /// Create a copy of QuestionScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionScoreImplCopyWith<_$QuestionScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'assessment_id')
  int? get assessmentId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get answered => throw _privateConstructorUsedError;
  Answer? get answer => throw _privateConstructorUsedError;

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'assessment_id') int? assessmentId,
      String? title,
      String? description,
      bool? answered,
      Answer? answer});

  $AnswerCopyWith<$Res>? get answer;
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Question
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

  /// Create a copy of Question
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
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
          _$QuestionImpl value, $Res Function(_$QuestionImpl) then) =
      __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'assessment_id') int? assessmentId,
      String? title,
      String? description,
      bool? answered,
      Answer? answer});

  @override
  $AnswerCopyWith<$Res>? get answer;
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
      _$QuestionImpl _value, $Res Function(_$QuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Question
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
    return _then(_$QuestionImpl(
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
class _$QuestionImpl implements _Question {
  const _$QuestionImpl(
      {this.id,
      @JsonKey(name: 'assessment_id') this.assessmentId,
      this.title,
      this.description,
      this.answered,
      this.answer});

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'assessment_id')
  final int? assessmentId;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool? answered;
  @override
  final Answer? answer;

  @override
  String toString() {
    return 'Question(id: $id, assessmentId: $assessmentId, title: $title, description: $description, answered: $answered, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
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

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionImplToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  const factory _Question(
      {final int? id,
      @JsonKey(name: 'assessment_id') final int? assessmentId,
      final String? title,
      final String? description,
      final bool? answered,
      final Answer? answer}) = _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'assessment_id')
  int? get assessmentId;
  @override
  String? get title;
  @override
  String? get description;
  @override
  bool? get answered;
  @override
  Answer? get answer;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_assessment_score_id')
  int? get userAssessmentScoreId => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;

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
      {int? id,
      @JsonKey(name: 'user_assessment_score_id') int? userAssessmentScoreId,
      int? score});
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
    Object? id = freezed,
    Object? userAssessmentScoreId = freezed,
    Object? score = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userAssessmentScoreId: freezed == userAssessmentScoreId
          ? _value.userAssessmentScoreId
          : userAssessmentScoreId // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {int? id,
      @JsonKey(name: 'user_assessment_score_id') int? userAssessmentScoreId,
      int? score});
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
    Object? id = freezed,
    Object? userAssessmentScoreId = freezed,
    Object? score = freezed,
  }) {
    return _then(_$AnswerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userAssessmentScoreId: freezed == userAssessmentScoreId
          ? _value.userAssessmentScoreId
          : userAssessmentScoreId // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerImpl implements _Answer {
  const _$AnswerImpl(
      {this.id,
      @JsonKey(name: 'user_assessment_score_id') this.userAssessmentScoreId,
      this.score});

  factory _$AnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'user_assessment_score_id')
  final int? userAssessmentScoreId;
  @override
  final int? score;

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
      {final int? id,
      @JsonKey(name: 'user_assessment_score_id')
      final int? userAssessmentScoreId,
      final int? score}) = _$AnswerImpl;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$AnswerImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'user_assessment_score_id')
  int? get userAssessmentScoreId;
  @override
  int? get score;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
