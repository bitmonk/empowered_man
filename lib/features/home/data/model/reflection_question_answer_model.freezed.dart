// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reflection_question_answer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReflectionQuestionAnswerModel _$ReflectionQuestionAnswerModelFromJson(
    Map<String, dynamic> json) {
  return _ReflectionQuestionAnswerModel.fromJson(json);
}

/// @nodoc
mixin _$ReflectionQuestionAnswerModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Data? get data => throw _privateConstructorUsedError;

  /// Serializes this ReflectionQuestionAnswerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReflectionQuestionAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReflectionQuestionAnswerModelCopyWith<ReflectionQuestionAnswerModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReflectionQuestionAnswerModelCopyWith<$Res> {
  factory $ReflectionQuestionAnswerModelCopyWith(
          ReflectionQuestionAnswerModel value,
          $Res Function(ReflectionQuestionAnswerModel) then) =
      _$ReflectionQuestionAnswerModelCopyWithImpl<$Res,
          ReflectionQuestionAnswerModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ReflectionQuestionAnswerModelCopyWithImpl<$Res,
        $Val extends ReflectionQuestionAnswerModel>
    implements $ReflectionQuestionAnswerModelCopyWith<$Res> {
  _$ReflectionQuestionAnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReflectionQuestionAnswerModel
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

  /// Create a copy of ReflectionQuestionAnswerModel
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
abstract class _$$ReflectionQuestionAnswerModelImplCopyWith<$Res>
    implements $ReflectionQuestionAnswerModelCopyWith<$Res> {
  factory _$$ReflectionQuestionAnswerModelImplCopyWith(
          _$ReflectionQuestionAnswerModelImpl value,
          $Res Function(_$ReflectionQuestionAnswerModelImpl) then) =
      __$$ReflectionQuestionAnswerModelImplCopyWithImpl<$Res>;
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
class __$$ReflectionQuestionAnswerModelImplCopyWithImpl<$Res>
    extends _$ReflectionQuestionAnswerModelCopyWithImpl<$Res,
        _$ReflectionQuestionAnswerModelImpl>
    implements _$$ReflectionQuestionAnswerModelImplCopyWith<$Res> {
  __$$ReflectionQuestionAnswerModelImplCopyWithImpl(
      _$ReflectionQuestionAnswerModelImpl _value,
      $Res Function(_$ReflectionQuestionAnswerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReflectionQuestionAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ReflectionQuestionAnswerModelImpl(
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
class _$ReflectionQuestionAnswerModelImpl
    implements _ReflectionQuestionAnswerModel {
  const _$ReflectionQuestionAnswerModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$ReflectionQuestionAnswerModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReflectionQuestionAnswerModelImplFromJson(json);

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
    return 'ReflectionQuestionAnswerModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReflectionQuestionAnswerModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of ReflectionQuestionAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReflectionQuestionAnswerModelImplCopyWith<
          _$ReflectionQuestionAnswerModelImpl>
      get copyWith => __$$ReflectionQuestionAnswerModelImplCopyWithImpl<
          _$ReflectionQuestionAnswerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReflectionQuestionAnswerModelImplToJson(
      this,
    );
  }
}

abstract class _ReflectionQuestionAnswerModel
    implements ReflectionQuestionAnswerModel {
  const factory _ReflectionQuestionAnswerModel(
          {@JsonKey(name: 'status') final bool? status,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'data') final Data? data}) =
      _$ReflectionQuestionAnswerModelImpl;

  factory _ReflectionQuestionAnswerModel.fromJson(Map<String, dynamic> json) =
      _$ReflectionQuestionAnswerModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  Data? get data;

  /// Create a copy of ReflectionQuestionAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReflectionQuestionAnswerModelImplCopyWith<
          _$ReflectionQuestionAnswerModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'reflection')
  Reflection? get reflection => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_completed')
  bool? get isCompleted => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'reflection') Reflection? reflection,
      @JsonKey(name: 'is_completed') bool? isCompleted});

  $ReflectionCopyWith<$Res>? get reflection;
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
    Object? reflection = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      reflection: freezed == reflection
          ? _value.reflection
          : reflection // ignore: cast_nullable_to_non_nullable
              as Reflection?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReflectionCopyWith<$Res>? get reflection {
    if (_value.reflection == null) {
      return null;
    }

    return $ReflectionCopyWith<$Res>(_value.reflection!, (value) {
      return _then(_value.copyWith(reflection: value) as $Val);
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
      {@JsonKey(name: 'reflection') Reflection? reflection,
      @JsonKey(name: 'is_completed') bool? isCompleted});

  @override
  $ReflectionCopyWith<$Res>? get reflection;
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
    Object? reflection = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_$DataImpl(
      reflection: freezed == reflection
          ? _value.reflection
          : reflection // ignore: cast_nullable_to_non_nullable
              as Reflection?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: 'reflection') this.reflection,
      @JsonKey(name: 'is_completed') this.isCompleted});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: 'reflection')
  final Reflection? reflection;
  @override
  @JsonKey(name: 'is_completed')
  final bool? isCompleted;

  @override
  String toString() {
    return 'Data(reflection: $reflection, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.reflection, reflection) ||
                other.reflection == reflection) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reflection, isCompleted);

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
      {@JsonKey(name: 'reflection') final Reflection? reflection,
      @JsonKey(name: 'is_completed') final bool? isCompleted}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: 'reflection')
  Reflection? get reflection;
  @override
  @JsonKey(name: 'is_completed')
  bool? get isCompleted;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Reflection _$ReflectionFromJson(Map<String, dynamic> json) {
  return _Reflection.fromJson(json);
}

/// @nodoc
mixin _$Reflection {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'emotion_name')
  String? get emotionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'reflection_type')
  String? get reflectionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'main_questions')
  List<MainQuestion>? get mainQuestions => throw _privateConstructorUsedError;

  /// Serializes this Reflection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reflection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReflectionCopyWith<Reflection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReflectionCopyWith<$Res> {
  factory $ReflectionCopyWith(
          Reflection value, $Res Function(Reflection) then) =
      _$ReflectionCopyWithImpl<$Res, Reflection>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'emotion_name') String? emotionName,
      @JsonKey(name: 'reflection_type') String? reflectionType,
      @JsonKey(name: 'main_questions') List<MainQuestion>? mainQuestions});
}

/// @nodoc
class _$ReflectionCopyWithImpl<$Res, $Val extends Reflection>
    implements $ReflectionCopyWith<$Res> {
  _$ReflectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reflection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? emotionName = freezed,
    Object? reflectionType = freezed,
    Object? mainQuestions = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      emotionName: freezed == emotionName
          ? _value.emotionName
          : emotionName // ignore: cast_nullable_to_non_nullable
              as String?,
      reflectionType: freezed == reflectionType
          ? _value.reflectionType
          : reflectionType // ignore: cast_nullable_to_non_nullable
              as String?,
      mainQuestions: freezed == mainQuestions
          ? _value.mainQuestions
          : mainQuestions // ignore: cast_nullable_to_non_nullable
              as List<MainQuestion>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReflectionImplCopyWith<$Res>
    implements $ReflectionCopyWith<$Res> {
  factory _$$ReflectionImplCopyWith(
          _$ReflectionImpl value, $Res Function(_$ReflectionImpl) then) =
      __$$ReflectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'emotion_name') String? emotionName,
      @JsonKey(name: 'reflection_type') String? reflectionType,
      @JsonKey(name: 'main_questions') List<MainQuestion>? mainQuestions});
}

/// @nodoc
class __$$ReflectionImplCopyWithImpl<$Res>
    extends _$ReflectionCopyWithImpl<$Res, _$ReflectionImpl>
    implements _$$ReflectionImplCopyWith<$Res> {
  __$$ReflectionImplCopyWithImpl(
      _$ReflectionImpl _value, $Res Function(_$ReflectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reflection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? emotionName = freezed,
    Object? reflectionType = freezed,
    Object? mainQuestions = freezed,
  }) {
    return _then(_$ReflectionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      emotionName: freezed == emotionName
          ? _value.emotionName
          : emotionName // ignore: cast_nullable_to_non_nullable
              as String?,
      reflectionType: freezed == reflectionType
          ? _value.reflectionType
          : reflectionType // ignore: cast_nullable_to_non_nullable
              as String?,
      mainQuestions: freezed == mainQuestions
          ? _value._mainQuestions
          : mainQuestions // ignore: cast_nullable_to_non_nullable
              as List<MainQuestion>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReflectionImpl implements _Reflection {
  const _$ReflectionImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'emotion_name') this.emotionName,
      @JsonKey(name: 'reflection_type') this.reflectionType,
      @JsonKey(name: 'main_questions') final List<MainQuestion>? mainQuestions})
      : _mainQuestions = mainQuestions;

  factory _$ReflectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReflectionImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'emotion_name')
  final String? emotionName;
  @override
  @JsonKey(name: 'reflection_type')
  final String? reflectionType;
  final List<MainQuestion>? _mainQuestions;
  @override
  @JsonKey(name: 'main_questions')
  List<MainQuestion>? get mainQuestions {
    final value = _mainQuestions;
    if (value == null) return null;
    if (_mainQuestions is EqualUnmodifiableListView) return _mainQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Reflection(id: $id, emotionName: $emotionName, reflectionType: $reflectionType, mainQuestions: $mainQuestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReflectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emotionName, emotionName) ||
                other.emotionName == emotionName) &&
            (identical(other.reflectionType, reflectionType) ||
                other.reflectionType == reflectionType) &&
            const DeepCollectionEquality()
                .equals(other._mainQuestions, _mainQuestions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, emotionName, reflectionType,
      const DeepCollectionEquality().hash(_mainQuestions));

  /// Create a copy of Reflection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReflectionImplCopyWith<_$ReflectionImpl> get copyWith =>
      __$$ReflectionImplCopyWithImpl<_$ReflectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReflectionImplToJson(
      this,
    );
  }
}

abstract class _Reflection implements Reflection {
  const factory _Reflection(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'emotion_name') final String? emotionName,
      @JsonKey(name: 'reflection_type') final String? reflectionType,
      @JsonKey(name: 'main_questions')
      final List<MainQuestion>? mainQuestions}) = _$ReflectionImpl;

  factory _Reflection.fromJson(Map<String, dynamic> json) =
      _$ReflectionImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'emotion_name')
  String? get emotionName;
  @override
  @JsonKey(name: 'reflection_type')
  String? get reflectionType;
  @override
  @JsonKey(name: 'main_questions')
  List<MainQuestion>? get mainQuestions;

  /// Create a copy of Reflection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReflectionImplCopyWith<_$ReflectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MainQuestion _$MainQuestionFromJson(Map<String, dynamic> json) {
  return _MainQuestion.fromJson(json);
}

/// @nodoc
mixin _$MainQuestion {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'question')
  String? get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'keywords')
  String? get keywords => throw _privateConstructorUsedError;
  @JsonKey(name: 'answered')
  bool? get answered => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer')
  Answer? get answer => throw _privateConstructorUsedError;
  @JsonKey(name: 'follow_up_questions')
  List<FollowUpQuestion>? get followUpQuestions =>
      throw _privateConstructorUsedError;

  /// Serializes this MainQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MainQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainQuestionCopyWith<MainQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainQuestionCopyWith<$Res> {
  factory $MainQuestionCopyWith(
          MainQuestion value, $Res Function(MainQuestion) then) =
      _$MainQuestionCopyWithImpl<$Res, MainQuestion>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'question') String? question,
      @JsonKey(name: 'keywords') String? keywords,
      @JsonKey(name: 'answered') bool? answered,
      @JsonKey(name: 'answer') Answer? answer,
      @JsonKey(name: 'follow_up_questions')
      List<FollowUpQuestion>? followUpQuestions});

  $AnswerCopyWith<$Res>? get answer;
}

/// @nodoc
class _$MainQuestionCopyWithImpl<$Res, $Val extends MainQuestion>
    implements $MainQuestionCopyWith<$Res> {
  _$MainQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? keywords = freezed,
    Object? answered = freezed,
    Object? answer = freezed,
    Object? followUpQuestions = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      answered: freezed == answered
          ? _value.answered
          : answered // ignore: cast_nullable_to_non_nullable
              as bool?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Answer?,
      followUpQuestions: freezed == followUpQuestions
          ? _value.followUpQuestions
          : followUpQuestions // ignore: cast_nullable_to_non_nullable
              as List<FollowUpQuestion>?,
    ) as $Val);
  }

  /// Create a copy of MainQuestion
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
abstract class _$$MainQuestionImplCopyWith<$Res>
    implements $MainQuestionCopyWith<$Res> {
  factory _$$MainQuestionImplCopyWith(
          _$MainQuestionImpl value, $Res Function(_$MainQuestionImpl) then) =
      __$$MainQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'question') String? question,
      @JsonKey(name: 'keywords') String? keywords,
      @JsonKey(name: 'answered') bool? answered,
      @JsonKey(name: 'answer') Answer? answer,
      @JsonKey(name: 'follow_up_questions')
      List<FollowUpQuestion>? followUpQuestions});

  @override
  $AnswerCopyWith<$Res>? get answer;
}

/// @nodoc
class __$$MainQuestionImplCopyWithImpl<$Res>
    extends _$MainQuestionCopyWithImpl<$Res, _$MainQuestionImpl>
    implements _$$MainQuestionImplCopyWith<$Res> {
  __$$MainQuestionImplCopyWithImpl(
      _$MainQuestionImpl _value, $Res Function(_$MainQuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? keywords = freezed,
    Object? answered = freezed,
    Object? answer = freezed,
    Object? followUpQuestions = freezed,
  }) {
    return _then(_$MainQuestionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      answered: freezed == answered
          ? _value.answered
          : answered // ignore: cast_nullable_to_non_nullable
              as bool?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Answer?,
      followUpQuestions: freezed == followUpQuestions
          ? _value._followUpQuestions
          : followUpQuestions // ignore: cast_nullable_to_non_nullable
              as List<FollowUpQuestion>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainQuestionImpl implements _MainQuestion {
  const _$MainQuestionImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'question') this.question,
      @JsonKey(name: 'keywords') this.keywords,
      @JsonKey(name: 'answered') this.answered,
      @JsonKey(name: 'answer') this.answer,
      @JsonKey(name: 'follow_up_questions')
      final List<FollowUpQuestion>? followUpQuestions})
      : _followUpQuestions = followUpQuestions;

  factory _$MainQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainQuestionImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'question')
  final String? question;
  @override
  @JsonKey(name: 'keywords')
  final String? keywords;
  @override
  @JsonKey(name: 'answered')
  final bool? answered;
  @override
  @JsonKey(name: 'answer')
  final Answer? answer;
  final List<FollowUpQuestion>? _followUpQuestions;
  @override
  @JsonKey(name: 'follow_up_questions')
  List<FollowUpQuestion>? get followUpQuestions {
    final value = _followUpQuestions;
    if (value == null) return null;
    if (_followUpQuestions is EqualUnmodifiableListView)
      return _followUpQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MainQuestion(id: $id, question: $question, keywords: $keywords, answered: $answered, answer: $answer, followUpQuestions: $followUpQuestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords) &&
            (identical(other.answered, answered) ||
                other.answered == answered) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            const DeepCollectionEquality()
                .equals(other._followUpQuestions, _followUpQuestions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, question, keywords, answered,
      answer, const DeepCollectionEquality().hash(_followUpQuestions));

  /// Create a copy of MainQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainQuestionImplCopyWith<_$MainQuestionImpl> get copyWith =>
      __$$MainQuestionImplCopyWithImpl<_$MainQuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainQuestionImplToJson(
      this,
    );
  }
}

abstract class _MainQuestion implements MainQuestion {
  const factory _MainQuestion(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'question') final String? question,
      @JsonKey(name: 'keywords') final String? keywords,
      @JsonKey(name: 'answered') final bool? answered,
      @JsonKey(name: 'answer') final Answer? answer,
      @JsonKey(name: 'follow_up_questions')
      final List<FollowUpQuestion>? followUpQuestions}) = _$MainQuestionImpl;

  factory _MainQuestion.fromJson(Map<String, dynamic> json) =
      _$MainQuestionImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'question')
  String? get question;
  @override
  @JsonKey(name: 'keywords')
  String? get keywords;
  @override
  @JsonKey(name: 'answered')
  bool? get answered;
  @override
  @JsonKey(name: 'answer')
  Answer? get answer;
  @override
  @JsonKey(name: 'follow_up_questions')
  List<FollowUpQuestion>? get followUpQuestions;

  /// Create a copy of MainQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainQuestionImplCopyWith<_$MainQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'media')
  dynamic get media => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'main_question_id')
  int? get mainQuestionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'follow_up_question_id')
  dynamic get followUpQuestionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_journal_id')
  dynamic get userJournalId => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'media') dynamic media,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'main_question_id') int? mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') dynamic followUpQuestionId,
      @JsonKey(name: 'user_journal_id') dynamic userJournalId});
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
    Object? text = freezed,
    Object? media = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? mainQuestionId = freezed,
    Object? followUpQuestionId = freezed,
    Object? userJournalId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mainQuestionId: freezed == mainQuestionId
          ? _value.mainQuestionId
          : mainQuestionId // ignore: cast_nullable_to_non_nullable
              as int?,
      followUpQuestionId: freezed == followUpQuestionId
          ? _value.followUpQuestionId
          : followUpQuestionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userJournalId: freezed == userJournalId
          ? _value.userJournalId
          : userJournalId // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'media') dynamic media,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'main_question_id') int? mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') dynamic followUpQuestionId,
      @JsonKey(name: 'user_journal_id') dynamic userJournalId});
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
    Object? text = freezed,
    Object? media = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? mainQuestionId = freezed,
    Object? followUpQuestionId = freezed,
    Object? userJournalId = freezed,
  }) {
    return _then(_$AnswerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mainQuestionId: freezed == mainQuestionId
          ? _value.mainQuestionId
          : mainQuestionId // ignore: cast_nullable_to_non_nullable
              as int?,
      followUpQuestionId: freezed == followUpQuestionId
          ? _value.followUpQuestionId
          : followUpQuestionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userJournalId: freezed == userJournalId
          ? _value.userJournalId
          : userJournalId // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerImpl implements _Answer {
  const _$AnswerImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'media') this.media,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'main_question_id') this.mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') this.followUpQuestionId,
      @JsonKey(name: 'user_journal_id') this.userJournalId});

  factory _$AnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'text')
  final String? text;
  @override
  @JsonKey(name: 'media')
  final dynamic media;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'main_question_id')
  final int? mainQuestionId;
  @override
  @JsonKey(name: 'follow_up_question_id')
  final dynamic followUpQuestionId;
  @override
  @JsonKey(name: 'user_journal_id')
  final dynamic userJournalId;

  @override
  String toString() {
    return 'Answer(id: $id, text: $text, media: $media, createdAt: $createdAt, updatedAt: $updatedAt, mainQuestionId: $mainQuestionId, followUpQuestionId: $followUpQuestionId, userJournalId: $userJournalId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other.media, media) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.mainQuestionId, mainQuestionId) ||
                other.mainQuestionId == mainQuestionId) &&
            const DeepCollectionEquality()
                .equals(other.followUpQuestionId, followUpQuestionId) &&
            const DeepCollectionEquality()
                .equals(other.userJournalId, userJournalId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      text,
      const DeepCollectionEquality().hash(media),
      createdAt,
      updatedAt,
      mainQuestionId,
      const DeepCollectionEquality().hash(followUpQuestionId),
      const DeepCollectionEquality().hash(userJournalId));

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
      @JsonKey(name: 'text') final String? text,
      @JsonKey(name: 'media') final dynamic media,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      @JsonKey(name: 'main_question_id') final int? mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') final dynamic followUpQuestionId,
      @JsonKey(name: 'user_journal_id')
      final dynamic userJournalId}) = _$AnswerImpl;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$AnswerImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'media')
  dynamic get media;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'main_question_id')
  int? get mainQuestionId;
  @override
  @JsonKey(name: 'follow_up_question_id')
  dynamic get followUpQuestionId;
  @override
  @JsonKey(name: 'user_journal_id')
  dynamic get userJournalId;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowUpQuestion _$FollowUpQuestionFromJson(Map<String, dynamic> json) {
  return _FollowUpQuestion.fromJson(json);
}

/// @nodoc
mixin _$FollowUpQuestion {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'question')
  String? get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'keywords')
  String? get keywords => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_type')
  String? get questionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'options')
  String? get options => throw _privateConstructorUsedError;
  @JsonKey(name: 'answered')
  bool? get answered => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer')
  Answer? get answer => throw _privateConstructorUsedError;

  /// Serializes this FollowUpQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowUpQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowUpQuestionCopyWith<FollowUpQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowUpQuestionCopyWith<$Res> {
  factory $FollowUpQuestionCopyWith(
          FollowUpQuestion value, $Res Function(FollowUpQuestion) then) =
      _$FollowUpQuestionCopyWithImpl<$Res, FollowUpQuestion>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'question') String? question,
      @JsonKey(name: 'keywords') String? keywords,
      @JsonKey(name: 'question_type') String? questionType,
      @JsonKey(name: 'options') String? options,
      @JsonKey(name: 'answered') bool? answered,
      @JsonKey(name: 'answer') Answer? answer});

  $AnswerCopyWith<$Res>? get answer;
}

/// @nodoc
class _$FollowUpQuestionCopyWithImpl<$Res, $Val extends FollowUpQuestion>
    implements $FollowUpQuestionCopyWith<$Res> {
  _$FollowUpQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowUpQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? keywords = freezed,
    Object? questionType = freezed,
    Object? options = freezed,
    Object? answered = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of FollowUpQuestion
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
abstract class _$$FollowUpQuestionImplCopyWith<$Res>
    implements $FollowUpQuestionCopyWith<$Res> {
  factory _$$FollowUpQuestionImplCopyWith(_$FollowUpQuestionImpl value,
          $Res Function(_$FollowUpQuestionImpl) then) =
      __$$FollowUpQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'question') String? question,
      @JsonKey(name: 'keywords') String? keywords,
      @JsonKey(name: 'question_type') String? questionType,
      @JsonKey(name: 'options') String? options,
      @JsonKey(name: 'answered') bool? answered,
      @JsonKey(name: 'answer') Answer? answer});

  @override
  $AnswerCopyWith<$Res>? get answer;
}

/// @nodoc
class __$$FollowUpQuestionImplCopyWithImpl<$Res>
    extends _$FollowUpQuestionCopyWithImpl<$Res, _$FollowUpQuestionImpl>
    implements _$$FollowUpQuestionImplCopyWith<$Res> {
  __$$FollowUpQuestionImplCopyWithImpl(_$FollowUpQuestionImpl _value,
      $Res Function(_$FollowUpQuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of FollowUpQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? keywords = freezed,
    Object? questionType = freezed,
    Object? options = freezed,
    Object? answered = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$FollowUpQuestionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
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
class _$FollowUpQuestionImpl implements _FollowUpQuestion {
  const _$FollowUpQuestionImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'question') this.question,
      @JsonKey(name: 'keywords') this.keywords,
      @JsonKey(name: 'question_type') this.questionType,
      @JsonKey(name: 'options') this.options,
      @JsonKey(name: 'answered') this.answered,
      @JsonKey(name: 'answer') this.answer});

  factory _$FollowUpQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowUpQuestionImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'question')
  final String? question;
  @override
  @JsonKey(name: 'keywords')
  final String? keywords;
  @override
  @JsonKey(name: 'question_type')
  final String? questionType;
  @override
  @JsonKey(name: 'options')
  final String? options;
  @override
  @JsonKey(name: 'answered')
  final bool? answered;
  @override
  @JsonKey(name: 'answer')
  final Answer? answer;

  @override
  String toString() {
    return 'FollowUpQuestion(id: $id, question: $question, keywords: $keywords, questionType: $questionType, options: $options, answered: $answered, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowUpQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.options, options) || other.options == options) &&
            (identical(other.answered, answered) ||
                other.answered == answered) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, question, keywords,
      questionType, options, answered, answer);

  /// Create a copy of FollowUpQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowUpQuestionImplCopyWith<_$FollowUpQuestionImpl> get copyWith =>
      __$$FollowUpQuestionImplCopyWithImpl<_$FollowUpQuestionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowUpQuestionImplToJson(
      this,
    );
  }
}

abstract class _FollowUpQuestion implements FollowUpQuestion {
  const factory _FollowUpQuestion(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'question') final String? question,
      @JsonKey(name: 'keywords') final String? keywords,
      @JsonKey(name: 'question_type') final String? questionType,
      @JsonKey(name: 'options') final String? options,
      @JsonKey(name: 'answered') final bool? answered,
      @JsonKey(name: 'answer') final Answer? answer}) = _$FollowUpQuestionImpl;

  factory _FollowUpQuestion.fromJson(Map<String, dynamic> json) =
      _$FollowUpQuestionImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'question')
  String? get question;
  @override
  @JsonKey(name: 'keywords')
  String? get keywords;
  @override
  @JsonKey(name: 'question_type')
  String? get questionType;
  @override
  @JsonKey(name: 'options')
  String? get options;
  @override
  @JsonKey(name: 'answered')
  bool? get answered;
  @override
  @JsonKey(name: 'answer')
  Answer? get answer;

  /// Create a copy of FollowUpQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowUpQuestionImplCopyWith<_$FollowUpQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
