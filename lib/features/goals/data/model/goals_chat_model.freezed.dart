// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goals_chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GoalsChatModel _$GoalsChatModelFromJson(Map<String, dynamic> json) {
  return _GoalsChatModel.fromJson(json);
}

/// @nodoc
mixin _$GoalsChatModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Data? get data => throw _privateConstructorUsedError;

  /// Serializes this GoalsChatModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoalsChatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalsChatModelCopyWith<GoalsChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalsChatModelCopyWith<$Res> {
  factory $GoalsChatModelCopyWith(
          GoalsChatModel value, $Res Function(GoalsChatModel) then) =
      _$GoalsChatModelCopyWithImpl<$Res, GoalsChatModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GoalsChatModelCopyWithImpl<$Res, $Val extends GoalsChatModel>
    implements $GoalsChatModelCopyWith<$Res> {
  _$GoalsChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalsChatModel
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

  /// Create a copy of GoalsChatModel
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
abstract class _$$GoalsChatModelImplCopyWith<$Res>
    implements $GoalsChatModelCopyWith<$Res> {
  factory _$$GoalsChatModelImplCopyWith(_$GoalsChatModelImpl value,
          $Res Function(_$GoalsChatModelImpl) then) =
      __$$GoalsChatModelImplCopyWithImpl<$Res>;
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
class __$$GoalsChatModelImplCopyWithImpl<$Res>
    extends _$GoalsChatModelCopyWithImpl<$Res, _$GoalsChatModelImpl>
    implements _$$GoalsChatModelImplCopyWith<$Res> {
  __$$GoalsChatModelImplCopyWithImpl(
      _$GoalsChatModelImpl _value, $Res Function(_$GoalsChatModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoalsChatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GoalsChatModelImpl(
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
class _$GoalsChatModelImpl implements _GoalsChatModel {
  const _$GoalsChatModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$GoalsChatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalsChatModelImplFromJson(json);

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
    return 'GoalsChatModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalsChatModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of GoalsChatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalsChatModelImplCopyWith<_$GoalsChatModelImpl> get copyWith =>
      __$$GoalsChatModelImplCopyWithImpl<_$GoalsChatModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalsChatModelImplToJson(
      this,
    );
  }
}

abstract class _GoalsChatModel implements GoalsChatModel {
  const factory _GoalsChatModel(
      {@JsonKey(name: 'status') final bool? status,
      @JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'data') final Data? data}) = _$GoalsChatModelImpl;

  factory _GoalsChatModel.fromJson(Map<String, dynamic> json) =
      _$GoalsChatModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  Data? get data;

  /// Create a copy of GoalsChatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalsChatModelImplCopyWith<_$GoalsChatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'user_goal')
  UserGoal? get userGoal => throw _privateConstructorUsedError;
  @JsonKey(name: 'questions')
  List<Question>? get questions => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'user_goal') UserGoal? userGoal,
      @JsonKey(name: 'questions') List<Question>? questions});

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
    Object? questions = freezed,
  }) {
    return _then(_value.copyWith(
      userGoal: freezed == userGoal
          ? _value.userGoal
          : userGoal // ignore: cast_nullable_to_non_nullable
              as UserGoal?,
      questions: freezed == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
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
  $Res call(
      {@JsonKey(name: 'user_goal') UserGoal? userGoal,
      @JsonKey(name: 'questions') List<Question>? questions});

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
    Object? questions = freezed,
  }) {
    return _then(_$DataImpl(
      userGoal: freezed == userGoal
          ? _value.userGoal
          : userGoal // ignore: cast_nullable_to_non_nullable
              as UserGoal?,
      questions: freezed == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: 'user_goal') this.userGoal,
      @JsonKey(name: 'questions') final List<Question>? questions})
      : _questions = questions;

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: 'user_goal')
  final UserGoal? userGoal;
  final List<Question>? _questions;
  @override
  @JsonKey(name: 'questions')
  List<Question>? get questions {
    final value = _questions;
    if (value == null) return null;
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Data(userGoal: $userGoal, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.userGoal, userGoal) ||
                other.userGoal == userGoal) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userGoal, const DeepCollectionEquality().hash(_questions));

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
          {@JsonKey(name: 'user_goal') final UserGoal? userGoal,
          @JsonKey(name: 'questions') final List<Question>? questions}) =
      _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: 'user_goal')
  UserGoal? get userGoal;
  @override
  @JsonKey(name: 'questions')
  List<Question>? get questions;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'goal_detail_id')
  int? get goalDetailId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_text')
  String? get questionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'answered')
  bool? get answered => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer')
  List<Answer>? get answer => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'goal_detail_id') int? goalDetailId,
      @JsonKey(name: 'question_text') String? questionText,
      @JsonKey(name: 'answered') bool? answered,
      @JsonKey(name: 'answer') List<Answer>? answer});
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
    Object? goalDetailId = freezed,
    Object? questionText = freezed,
    Object? answered = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      goalDetailId: freezed == goalDetailId
          ? _value.goalDetailId
          : goalDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      answered: freezed == answered
          ? _value.answered
          : answered // ignore: cast_nullable_to_non_nullable
              as bool?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as List<Answer>?,
    ) as $Val);
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
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'goal_detail_id') int? goalDetailId,
      @JsonKey(name: 'question_text') String? questionText,
      @JsonKey(name: 'answered') bool? answered,
      @JsonKey(name: 'answer') List<Answer>? answer});
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
    Object? goalDetailId = freezed,
    Object? questionText = freezed,
    Object? answered = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$QuestionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      goalDetailId: freezed == goalDetailId
          ? _value.goalDetailId
          : goalDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      answered: freezed == answered
          ? _value.answered
          : answered // ignore: cast_nullable_to_non_nullable
              as bool?,
      answer: freezed == answer
          ? _value._answer
          : answer // ignore: cast_nullable_to_non_nullable
              as List<Answer>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionImpl implements _Question {
  const _$QuestionImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'goal_detail_id') this.goalDetailId,
      @JsonKey(name: 'question_text') this.questionText,
      @JsonKey(name: 'answered') this.answered,
      @JsonKey(name: 'answer') final List<Answer>? answer})
      : _answer = answer;

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'goal_detail_id')
  final int? goalDetailId;
  @override
  @JsonKey(name: 'question_text')
  final String? questionText;
  @override
  @JsonKey(name: 'answered')
  final bool? answered;
  final List<Answer>? _answer;
  @override
  @JsonKey(name: 'answer')
  List<Answer>? get answer {
    final value = _answer;
    if (value == null) return null;
    if (_answer is EqualUnmodifiableListView) return _answer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Question(id: $id, goalDetailId: $goalDetailId, questionText: $questionText, answered: $answered, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.goalDetailId, goalDetailId) ||
                other.goalDetailId == goalDetailId) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.answered, answered) ||
                other.answered == answered) &&
            const DeepCollectionEquality().equals(other._answer, _answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, goalDetailId, questionText,
      answered, const DeepCollectionEquality().hash(_answer));

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
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'goal_detail_id') final int? goalDetailId,
      @JsonKey(name: 'question_text') final String? questionText,
      @JsonKey(name: 'answered') final bool? answered,
      @JsonKey(name: 'answer') final List<Answer>? answer}) = _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'goal_detail_id')
  int? get goalDetailId;
  @override
  @JsonKey(name: 'question_text')
  String? get questionText;
  @override
  @JsonKey(name: 'answered')
  bool? get answered;
  @override
  @JsonKey(name: 'answer')
  List<Answer>? get answer;

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
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_id')
  int? get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_goal_id')
  int? get userGoalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'achieved')
  bool? get achieved => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'question_id') int? questionId,
      @JsonKey(name: 'user_goal_id') int? userGoalId,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'achieved') bool? achieved});
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
              as int?,
      userGoalId: freezed == userGoalId
          ? _value.userGoalId
          : userGoalId // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$AnswerImplCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$AnswerImplCopyWith(
          _$AnswerImpl value, $Res Function(_$AnswerImpl) then) =
      __$$AnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'question_id') int? questionId,
      @JsonKey(name: 'user_goal_id') int? userGoalId,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'achieved') bool? achieved});
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
    Object? userId = freezed,
    Object? questionId = freezed,
    Object? userGoalId = freezed,
    Object? text = freezed,
    Object? achieved = freezed,
  }) {
    return _then(_$AnswerImpl(
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
              as int?,
      userGoalId: freezed == userGoalId
          ? _value.userGoalId
          : userGoalId // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$AnswerImpl implements _Answer {
  const _$AnswerImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'question_id') this.questionId,
      @JsonKey(name: 'user_goal_id') this.userGoalId,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'achieved') this.achieved});

  factory _$AnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'question_id')
  final int? questionId;
  @override
  @JsonKey(name: 'user_goal_id')
  final int? userGoalId;
  @override
  @JsonKey(name: 'text')
  final String? text;
  @override
  @JsonKey(name: 'achieved')
  final bool? achieved;

  @override
  String toString() {
    return 'Answer(id: $id, userId: $userId, questionId: $questionId, userGoalId: $userGoalId, text: $text, achieved: $achieved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerImpl &&
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
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'question_id') final int? questionId,
      @JsonKey(name: 'user_goal_id') final int? userGoalId,
      @JsonKey(name: 'text') final String? text,
      @JsonKey(name: 'achieved') final bool? achieved}) = _$AnswerImpl;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$AnswerImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'question_id')
  int? get questionId;
  @override
  @JsonKey(name: 'user_goal_id')
  int? get userGoalId;
  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'achieved')
  bool? get achieved;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
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
  dynamic get isOntrack => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_complete')
  dynamic get isComplete => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_won_question')
  dynamic get showWonQuestion => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_track_question')
  dynamic get showTrackQuestion => throw _privateConstructorUsedError;
  @JsonKey(name: 'goal')
  Goal? get goal => throw _privateConstructorUsedError;
  @JsonKey(name: 'goal_detail')
  GoalDetail? get goalDetail => throw _privateConstructorUsedError;
  @JsonKey(name: 'goal_answers')
  List<dynamic>? get goalAnswers => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'is_ontrack') dynamic isOntrack,
      @JsonKey(name: 'is_complete') dynamic isComplete,
      @JsonKey(name: 'show_won_question') dynamic showWonQuestion,
      @JsonKey(name: 'show_track_question') dynamic showTrackQuestion,
      @JsonKey(name: 'goal') Goal? goal,
      @JsonKey(name: 'goal_detail') GoalDetail? goalDetail,
      @JsonKey(name: 'goal_answers') List<dynamic>? goalAnswers});

  $GoalCopyWith<$Res>? get goal;
  $GoalDetailCopyWith<$Res>? get goalDetail;
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
    Object? goal = freezed,
    Object? goalDetail = freezed,
    Object? goalAnswers = freezed,
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
              as dynamic,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as dynamic,
      showWonQuestion: freezed == showWonQuestion
          ? _value.showWonQuestion
          : showWonQuestion // ignore: cast_nullable_to_non_nullable
              as dynamic,
      showTrackQuestion: freezed == showTrackQuestion
          ? _value.showTrackQuestion
          : showTrackQuestion // ignore: cast_nullable_to_non_nullable
              as dynamic,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as Goal?,
      goalDetail: freezed == goalDetail
          ? _value.goalDetail
          : goalDetail // ignore: cast_nullable_to_non_nullable
              as GoalDetail?,
      goalAnswers: freezed == goalAnswers
          ? _value.goalAnswers
          : goalAnswers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }

  /// Create a copy of UserGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GoalCopyWith<$Res>? get goal {
    if (_value.goal == null) {
      return null;
    }

    return $GoalCopyWith<$Res>(_value.goal!, (value) {
      return _then(_value.copyWith(goal: value) as $Val);
    });
  }

  /// Create a copy of UserGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GoalDetailCopyWith<$Res>? get goalDetail {
    if (_value.goalDetail == null) {
      return null;
    }

    return $GoalDetailCopyWith<$Res>(_value.goalDetail!, (value) {
      return _then(_value.copyWith(goalDetail: value) as $Val);
    });
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
      @JsonKey(name: 'is_ontrack') dynamic isOntrack,
      @JsonKey(name: 'is_complete') dynamic isComplete,
      @JsonKey(name: 'show_won_question') dynamic showWonQuestion,
      @JsonKey(name: 'show_track_question') dynamic showTrackQuestion,
      @JsonKey(name: 'goal') Goal? goal,
      @JsonKey(name: 'goal_detail') GoalDetail? goalDetail,
      @JsonKey(name: 'goal_answers') List<dynamic>? goalAnswers});

  @override
  $GoalCopyWith<$Res>? get goal;
  @override
  $GoalDetailCopyWith<$Res>? get goalDetail;
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
    Object? goal = freezed,
    Object? goalDetail = freezed,
    Object? goalAnswers = freezed,
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
              as dynamic,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as dynamic,
      showWonQuestion: freezed == showWonQuestion
          ? _value.showWonQuestion
          : showWonQuestion // ignore: cast_nullable_to_non_nullable
              as dynamic,
      showTrackQuestion: freezed == showTrackQuestion
          ? _value.showTrackQuestion
          : showTrackQuestion // ignore: cast_nullable_to_non_nullable
              as dynamic,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as Goal?,
      goalDetail: freezed == goalDetail
          ? _value.goalDetail
          : goalDetail // ignore: cast_nullable_to_non_nullable
              as GoalDetail?,
      goalAnswers: freezed == goalAnswers
          ? _value._goalAnswers
          : goalAnswers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
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
      @JsonKey(name: 'show_track_question') this.showTrackQuestion,
      @JsonKey(name: 'goal') this.goal,
      @JsonKey(name: 'goal_detail') this.goalDetail,
      @JsonKey(name: 'goal_answers') final List<dynamic>? goalAnswers})
      : _goalAnswers = goalAnswers;

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
  final dynamic isOntrack;
  @override
  @JsonKey(name: 'is_complete')
  final dynamic isComplete;
  @override
  @JsonKey(name: 'show_won_question')
  final dynamic showWonQuestion;
  @override
  @JsonKey(name: 'show_track_question')
  final dynamic showTrackQuestion;
  @override
  @JsonKey(name: 'goal')
  final Goal? goal;
  @override
  @JsonKey(name: 'goal_detail')
  final GoalDetail? goalDetail;
  final List<dynamic>? _goalAnswers;
  @override
  @JsonKey(name: 'goal_answers')
  List<dynamic>? get goalAnswers {
    final value = _goalAnswers;
    if (value == null) return null;
    if (_goalAnswers is EqualUnmodifiableListView) return _goalAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserGoal(id: $id, userId: $userId, goalId: $goalId, goalDetailId: $goalDetailId, progress: $progress, isOntrack: $isOntrack, isComplete: $isComplete, showWonQuestion: $showWonQuestion, showTrackQuestion: $showTrackQuestion, goal: $goal, goalDetail: $goalDetail, goalAnswers: $goalAnswers)';
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
            const DeepCollectionEquality().equals(other.isOntrack, isOntrack) &&
            const DeepCollectionEquality()
                .equals(other.isComplete, isComplete) &&
            const DeepCollectionEquality()
                .equals(other.showWonQuestion, showWonQuestion) &&
            const DeepCollectionEquality()
                .equals(other.showTrackQuestion, showTrackQuestion) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.goalDetail, goalDetail) ||
                other.goalDetail == goalDetail) &&
            const DeepCollectionEquality()
                .equals(other._goalAnswers, _goalAnswers));
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
      const DeepCollectionEquality().hash(isOntrack),
      const DeepCollectionEquality().hash(isComplete),
      const DeepCollectionEquality().hash(showWonQuestion),
      const DeepCollectionEquality().hash(showTrackQuestion),
      goal,
      goalDetail,
      const DeepCollectionEquality().hash(_goalAnswers));

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
          @JsonKey(name: 'is_ontrack') final dynamic isOntrack,
          @JsonKey(name: 'is_complete') final dynamic isComplete,
          @JsonKey(name: 'show_won_question') final dynamic showWonQuestion,
          @JsonKey(name: 'show_track_question') final dynamic showTrackQuestion,
          @JsonKey(name: 'goal') final Goal? goal,
          @JsonKey(name: 'goal_detail') final GoalDetail? goalDetail,
          @JsonKey(name: 'goal_answers') final List<dynamic>? goalAnswers}) =
      _$UserGoalImpl;

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
  dynamic get isOntrack;
  @override
  @JsonKey(name: 'is_complete')
  dynamic get isComplete;
  @override
  @JsonKey(name: 'show_won_question')
  dynamic get showWonQuestion;
  @override
  @JsonKey(name: 'show_track_question')
  dynamic get showTrackQuestion;
  @override
  @JsonKey(name: 'goal')
  Goal? get goal;
  @override
  @JsonKey(name: 'goal_detail')
  GoalDetail? get goalDetail;
  @override
  @JsonKey(name: 'goal_answers')
  List<dynamic>? get goalAnswers;

  /// Create a copy of UserGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserGoalImplCopyWith<_$UserGoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Goal _$GoalFromJson(Map<String, dynamic> json) {
  return _Goal.fromJson(json);
}

/// @nodoc
mixin _$Goal {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;

  /// Serializes this Goal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalCopyWith<Goal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalCopyWith<$Res> {
  factory $GoalCopyWith(Goal value, $Res Function(Goal) then) =
      _$GoalCopyWithImpl<$Res, Goal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id, @JsonKey(name: 'title') String? title});
}

/// @nodoc
class _$GoalCopyWithImpl<$Res, $Val extends Goal>
    implements $GoalCopyWith<$Res> {
  _$GoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoalImplCopyWith<$Res> implements $GoalCopyWith<$Res> {
  factory _$$GoalImplCopyWith(
          _$GoalImpl value, $Res Function(_$GoalImpl) then) =
      __$$GoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id, @JsonKey(name: 'title') String? title});
}

/// @nodoc
class __$$GoalImplCopyWithImpl<$Res>
    extends _$GoalCopyWithImpl<$Res, _$GoalImpl>
    implements _$$GoalImplCopyWith<$Res> {
  __$$GoalImplCopyWithImpl(_$GoalImpl _value, $Res Function(_$GoalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$GoalImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalImpl implements _Goal {
  const _$GoalImpl(
      {@JsonKey(name: 'id') this.id, @JsonKey(name: 'title') this.title});

  factory _$GoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;

  @override
  String toString() {
    return 'Goal(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalImplCopyWith<_$GoalImpl> get copyWith =>
      __$$GoalImplCopyWithImpl<_$GoalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalImplToJson(
      this,
    );
  }
}

abstract class _Goal implements Goal {
  const factory _Goal(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'title') final String? title}) = _$GoalImpl;

  factory _Goal.fromJson(Map<String, dynamic> json) = _$GoalImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalImplCopyWith<_$GoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GoalDetail _$GoalDetailFromJson(Map<String, dynamic> json) {
  return _GoalDetail.fromJson(json);
}

/// @nodoc
mixin _$GoalDetail {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'goal_id')
  int? get goalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_period')
  String? get timePeriod => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_completed')
  dynamic get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this GoalDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoalDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalDetailCopyWith<GoalDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalDetailCopyWith<$Res> {
  factory $GoalDetailCopyWith(
          GoalDetail value, $Res Function(GoalDetail) then) =
      _$GoalDetailCopyWithImpl<$Res, GoalDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'goal_id') int? goalId,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'time_period') String? timePeriod,
      @JsonKey(name: 'is_completed') dynamic isCompleted});
}

/// @nodoc
class _$GoalDetailCopyWithImpl<$Res, $Val extends GoalDetail>
    implements $GoalDetailCopyWith<$Res> {
  _$GoalDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? goalId = freezed,
    Object? type = freezed,
    Object? timePeriod = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      goalId: freezed == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      timePeriod: freezed == timePeriod
          ? _value.timePeriod
          : timePeriod // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoalDetailImplCopyWith<$Res>
    implements $GoalDetailCopyWith<$Res> {
  factory _$$GoalDetailImplCopyWith(
          _$GoalDetailImpl value, $Res Function(_$GoalDetailImpl) then) =
      __$$GoalDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'goal_id') int? goalId,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'time_period') String? timePeriod,
      @JsonKey(name: 'is_completed') dynamic isCompleted});
}

/// @nodoc
class __$$GoalDetailImplCopyWithImpl<$Res>
    extends _$GoalDetailCopyWithImpl<$Res, _$GoalDetailImpl>
    implements _$$GoalDetailImplCopyWith<$Res> {
  __$$GoalDetailImplCopyWithImpl(
      _$GoalDetailImpl _value, $Res Function(_$GoalDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoalDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? goalId = freezed,
    Object? type = freezed,
    Object? timePeriod = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_$GoalDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      goalId: freezed == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      timePeriod: freezed == timePeriod
          ? _value.timePeriod
          : timePeriod // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalDetailImpl implements _GoalDetail {
  const _$GoalDetailImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'goal_id') this.goalId,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'time_period') this.timePeriod,
      @JsonKey(name: 'is_completed') this.isCompleted});

  factory _$GoalDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalDetailImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'goal_id')
  final int? goalId;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'time_period')
  final String? timePeriod;
  @override
  @JsonKey(name: 'is_completed')
  final dynamic isCompleted;

  @override
  String toString() {
    return 'GoalDetail(id: $id, goalId: $goalId, type: $type, timePeriod: $timePeriod, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.goalId, goalId) || other.goalId == goalId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timePeriod, timePeriod) ||
                other.timePeriod == timePeriod) &&
            const DeepCollectionEquality()
                .equals(other.isCompleted, isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, goalId, type, timePeriod,
      const DeepCollectionEquality().hash(isCompleted));

  /// Create a copy of GoalDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalDetailImplCopyWith<_$GoalDetailImpl> get copyWith =>
      __$$GoalDetailImplCopyWithImpl<_$GoalDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalDetailImplToJson(
      this,
    );
  }
}

abstract class _GoalDetail implements GoalDetail {
  const factory _GoalDetail(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'goal_id') final int? goalId,
          @JsonKey(name: 'type') final String? type,
          @JsonKey(name: 'time_period') final String? timePeriod,
          @JsonKey(name: 'is_completed') final dynamic isCompleted}) =
      _$GoalDetailImpl;

  factory _GoalDetail.fromJson(Map<String, dynamic> json) =
      _$GoalDetailImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'goal_id')
  int? get goalId;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'time_period')
  String? get timePeriod;
  @override
  @JsonKey(name: 'is_completed')
  dynamic get isCompleted;

  /// Create a copy of GoalDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalDetailImplCopyWith<_$GoalDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
