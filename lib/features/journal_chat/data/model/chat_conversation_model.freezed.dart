// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_conversation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatConversationModel _$ChatConversationModelFromJson(
    Map<String, dynamic> json) {
  return _ChatConversationModel.fromJson(json);
}

/// @nodoc
mixin _$ChatConversationModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  JournalData? get data => throw _privateConstructorUsedError;

  /// Serializes this ChatConversationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatConversationModelCopyWith<ChatConversationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatConversationModelCopyWith<$Res> {
  factory $ChatConversationModelCopyWith(ChatConversationModel value,
          $Res Function(ChatConversationModel) then) =
      _$ChatConversationModelCopyWithImpl<$Res, ChatConversationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') JournalData? data});

  $JournalDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ChatConversationModelCopyWithImpl<$Res,
        $Val extends ChatConversationModel>
    implements $ChatConversationModelCopyWith<$Res> {
  _$ChatConversationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatConversationModel
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
              as JournalData?,
    ) as $Val);
  }

  /// Create a copy of ChatConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JournalDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $JournalDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatConversationModelImplCopyWith<$Res>
    implements $ChatConversationModelCopyWith<$Res> {
  factory _$$ChatConversationModelImplCopyWith(
          _$ChatConversationModelImpl value,
          $Res Function(_$ChatConversationModelImpl) then) =
      __$$ChatConversationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') JournalData? data});

  @override
  $JournalDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ChatConversationModelImplCopyWithImpl<$Res>
    extends _$ChatConversationModelCopyWithImpl<$Res,
        _$ChatConversationModelImpl>
    implements _$$ChatConversationModelImplCopyWith<$Res> {
  __$$ChatConversationModelImplCopyWithImpl(_$ChatConversationModelImpl _value,
      $Res Function(_$ChatConversationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ChatConversationModelImpl(
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
              as JournalData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatConversationModelImpl implements _ChatConversationModel {
  const _$ChatConversationModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$ChatConversationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatConversationModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'data')
  final JournalData? data;

  @override
  String toString() {
    return 'ChatConversationModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatConversationModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of ChatConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatConversationModelImplCopyWith<_$ChatConversationModelImpl>
      get copyWith => __$$ChatConversationModelImplCopyWithImpl<
          _$ChatConversationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatConversationModelImplToJson(
      this,
    );
  }
}

abstract class _ChatConversationModel implements ChatConversationModel {
  const factory _ChatConversationModel(
          {@JsonKey(name: 'status') final bool? status,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'data') final JournalData? data}) =
      _$ChatConversationModelImpl;

  factory _ChatConversationModel.fromJson(Map<String, dynamic> json) =
      _$ChatConversationModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  JournalData? get data;

  /// Create a copy of ChatConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatConversationModelImplCopyWith<_$ChatConversationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

JournalData _$JournalDataFromJson(Map<String, dynamic> json) {
  return _JournalData.fromJson(json);
}

/// @nodoc
mixin _$JournalData {
  @JsonKey(name: 'journal')
  Journal? get journal => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_completed')
  bool? get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this JournalData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalDataCopyWith<JournalData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalDataCopyWith<$Res> {
  factory $JournalDataCopyWith(
          JournalData value, $Res Function(JournalData) then) =
      _$JournalDataCopyWithImpl<$Res, JournalData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'journal') Journal? journal,
      @JsonKey(name: 'is_completed') bool? isCompleted});

  $JournalCopyWith<$Res>? get journal;
}

/// @nodoc
class _$JournalDataCopyWithImpl<$Res, $Val extends JournalData>
    implements $JournalDataCopyWith<$Res> {
  _$JournalDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? journal = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      journal: freezed == journal
          ? _value.journal
          : journal // ignore: cast_nullable_to_non_nullable
              as Journal?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of JournalData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JournalCopyWith<$Res>? get journal {
    if (_value.journal == null) {
      return null;
    }

    return $JournalCopyWith<$Res>(_value.journal!, (value) {
      return _then(_value.copyWith(journal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JournalDataImplCopyWith<$Res>
    implements $JournalDataCopyWith<$Res> {
  factory _$$JournalDataImplCopyWith(
          _$JournalDataImpl value, $Res Function(_$JournalDataImpl) then) =
      __$$JournalDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'journal') Journal? journal,
      @JsonKey(name: 'is_completed') bool? isCompleted});

  @override
  $JournalCopyWith<$Res>? get journal;
}

/// @nodoc
class __$$JournalDataImplCopyWithImpl<$Res>
    extends _$JournalDataCopyWithImpl<$Res, _$JournalDataImpl>
    implements _$$JournalDataImplCopyWith<$Res> {
  __$$JournalDataImplCopyWithImpl(
      _$JournalDataImpl _value, $Res Function(_$JournalDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? journal = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_$JournalDataImpl(
      journal: freezed == journal
          ? _value.journal
          : journal // ignore: cast_nullable_to_non_nullable
              as Journal?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalDataImpl implements _JournalData {
  const _$JournalDataImpl(
      {@JsonKey(name: 'journal') this.journal,
      @JsonKey(name: 'is_completed') this.isCompleted});

  factory _$JournalDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalDataImplFromJson(json);

  @override
  @JsonKey(name: 'journal')
  final Journal? journal;
  @override
  @JsonKey(name: 'is_completed')
  final bool? isCompleted;

  @override
  String toString() {
    return 'JournalData(journal: $journal, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalDataImpl &&
            (identical(other.journal, journal) || other.journal == journal) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, journal, isCompleted);

  /// Create a copy of JournalData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalDataImplCopyWith<_$JournalDataImpl> get copyWith =>
      __$$JournalDataImplCopyWithImpl<_$JournalDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalDataImplToJson(
      this,
    );
  }
}

abstract class _JournalData implements JournalData {
  const factory _JournalData(
          {@JsonKey(name: 'journal') final Journal? journal,
          @JsonKey(name: 'is_completed') final bool? isCompleted}) =
      _$JournalDataImpl;

  factory _JournalData.fromJson(Map<String, dynamic> json) =
      _$JournalDataImpl.fromJson;

  @override
  @JsonKey(name: 'journal')
  Journal? get journal;
  @override
  @JsonKey(name: 'is_completed')
  bool? get isCompleted;

  /// Create a copy of JournalData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalDataImplCopyWith<_$JournalDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Journal _$JournalFromJson(Map<String, dynamic> json) {
  return _Journal.fromJson(json);
}

/// @nodoc
mixin _$Journal {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'emotion_name')
  String? get emotionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'main_questions')
  List<MainQuestion>? get mainQuestions => throw _privateConstructorUsedError;
  @JsonKey(name: 'follow_up_questions')
  List<FollowUpQuestion>? get followUpQuestions =>
      throw _privateConstructorUsedError;

  /// Serializes this Journal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Journal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalCopyWith<Journal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalCopyWith<$Res> {
  factory $JournalCopyWith(Journal value, $Res Function(Journal) then) =
      _$JournalCopyWithImpl<$Res, Journal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'emotion_name') String? emotionName,
      @JsonKey(name: 'main_questions') List<MainQuestion>? mainQuestions,
      @JsonKey(name: 'follow_up_questions')
      List<FollowUpQuestion>? followUpQuestions});
}

/// @nodoc
class _$JournalCopyWithImpl<$Res, $Val extends Journal>
    implements $JournalCopyWith<$Res> {
  _$JournalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Journal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? emotionName = freezed,
    Object? mainQuestions = freezed,
    Object? followUpQuestions = freezed,
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
      mainQuestions: freezed == mainQuestions
          ? _value.mainQuestions
          : mainQuestions // ignore: cast_nullable_to_non_nullable
              as List<MainQuestion>?,
      followUpQuestions: freezed == followUpQuestions
          ? _value.followUpQuestions
          : followUpQuestions // ignore: cast_nullable_to_non_nullable
              as List<FollowUpQuestion>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JournalImplCopyWith<$Res> implements $JournalCopyWith<$Res> {
  factory _$$JournalImplCopyWith(
          _$JournalImpl value, $Res Function(_$JournalImpl) then) =
      __$$JournalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'emotion_name') String? emotionName,
      @JsonKey(name: 'main_questions') List<MainQuestion>? mainQuestions,
      @JsonKey(name: 'follow_up_questions')
      List<FollowUpQuestion>? followUpQuestions});
}

/// @nodoc
class __$$JournalImplCopyWithImpl<$Res>
    extends _$JournalCopyWithImpl<$Res, _$JournalImpl>
    implements _$$JournalImplCopyWith<$Res> {
  __$$JournalImplCopyWithImpl(
      _$JournalImpl _value, $Res Function(_$JournalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Journal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? emotionName = freezed,
    Object? mainQuestions = freezed,
    Object? followUpQuestions = freezed,
  }) {
    return _then(_$JournalImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      emotionName: freezed == emotionName
          ? _value.emotionName
          : emotionName // ignore: cast_nullable_to_non_nullable
              as String?,
      mainQuestions: freezed == mainQuestions
          ? _value._mainQuestions
          : mainQuestions // ignore: cast_nullable_to_non_nullable
              as List<MainQuestion>?,
      followUpQuestions: freezed == followUpQuestions
          ? _value._followUpQuestions
          : followUpQuestions // ignore: cast_nullable_to_non_nullable
              as List<FollowUpQuestion>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalImpl implements _Journal {
  const _$JournalImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'emotion_name') this.emotionName,
      @JsonKey(name: 'main_questions') final List<MainQuestion>? mainQuestions,
      @JsonKey(name: 'follow_up_questions')
      final List<FollowUpQuestion>? followUpQuestions})
      : _mainQuestions = mainQuestions,
        _followUpQuestions = followUpQuestions;

  factory _$JournalImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'emotion_name')
  final String? emotionName;
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
    return 'Journal(id: $id, emotionName: $emotionName, mainQuestions: $mainQuestions, followUpQuestions: $followUpQuestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emotionName, emotionName) ||
                other.emotionName == emotionName) &&
            const DeepCollectionEquality()
                .equals(other._mainQuestions, _mainQuestions) &&
            const DeepCollectionEquality()
                .equals(other._followUpQuestions, _followUpQuestions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      emotionName,
      const DeepCollectionEquality().hash(_mainQuestions),
      const DeepCollectionEquality().hash(_followUpQuestions));

  /// Create a copy of Journal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalImplCopyWith<_$JournalImpl> get copyWith =>
      __$$JournalImplCopyWithImpl<_$JournalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalImplToJson(
      this,
    );
  }
}

abstract class _Journal implements Journal {
  const factory _Journal(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'emotion_name') final String? emotionName,
      @JsonKey(name: 'main_questions') final List<MainQuestion>? mainQuestions,
      @JsonKey(name: 'follow_up_questions')
      final List<FollowUpQuestion>? followUpQuestions}) = _$JournalImpl;

  factory _Journal.fromJson(Map<String, dynamic> json) = _$JournalImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'emotion_name')
  String? get emotionName;
  @override
  @JsonKey(name: 'main_questions')
  List<MainQuestion>? get mainQuestions;
  @override
  @JsonKey(name: 'follow_up_questions')
  List<FollowUpQuestion>? get followUpQuestions;

  /// Create a copy of Journal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalImplCopyWith<_$JournalImpl> get copyWith =>
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
      @JsonKey(name: 'answer') Answer? answer});

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
      @JsonKey(name: 'answer') Answer? answer});

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
      @JsonKey(name: 'answer') this.answer});

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

  @override
  String toString() {
    return 'MainQuestion(id: $id, question: $question, keywords: $keywords, answered: $answered, answer: $answer)';
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
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, question, keywords, answered, answer);

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
      @JsonKey(name: 'answer') final Answer? answer}) = _$MainQuestionImpl;

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

  /// Create a copy of MainQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainQuestionImplCopyWith<_$MainQuestionImpl> get copyWith =>
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
  dynamic get options => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'options') dynamic options,
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
              as dynamic,
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
      @JsonKey(name: 'options') dynamic options,
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
              as dynamic,
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
  final dynamic options;
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
            const DeepCollectionEquality().equals(other.options, options) &&
            (identical(other.answered, answered) ||
                other.answered == answered) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      question,
      keywords,
      questionType,
      const DeepCollectionEquality().hash(options),
      answered,
      answer);

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
      @JsonKey(name: 'options') final dynamic options,
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
  dynamic get options;
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
  Media? get media => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'main_question_id')
  int? get mainQuestionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'follow_up_question_id')
  int? get followUpQuestionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_journal_id')
  int? get userJournalId => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'media') Media? media,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'main_question_id') int? mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') int? followUpQuestionId,
      @JsonKey(name: 'user_journal_id') int? userJournalId});

  $MediaCopyWith<$Res>? get media;
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
              as Media?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      mainQuestionId: freezed == mainQuestionId
          ? _value.mainQuestionId
          : mainQuestionId // ignore: cast_nullable_to_non_nullable
              as int?,
      followUpQuestionId: freezed == followUpQuestionId
          ? _value.followUpQuestionId
          : followUpQuestionId // ignore: cast_nullable_to_non_nullable
              as int?,
      userJournalId: freezed == userJournalId
          ? _value.userJournalId
          : userJournalId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MediaCopyWith<$Res>? get media {
    if (_value.media == null) {
      return null;
    }

    return $MediaCopyWith<$Res>(_value.media!, (value) {
      return _then(_value.copyWith(media: value) as $Val);
    });
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
      @JsonKey(name: 'media') Media? media,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'main_question_id') int? mainQuestionId,
      @JsonKey(name: 'follow_up_question_id') int? followUpQuestionId,
      @JsonKey(name: 'user_journal_id') int? userJournalId});

  @override
  $MediaCopyWith<$Res>? get media;
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
              as Media?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      mainQuestionId: freezed == mainQuestionId
          ? _value.mainQuestionId
          : mainQuestionId // ignore: cast_nullable_to_non_nullable
              as int?,
      followUpQuestionId: freezed == followUpQuestionId
          ? _value.followUpQuestionId
          : followUpQuestionId // ignore: cast_nullable_to_non_nullable
              as int?,
      userJournalId: freezed == userJournalId
          ? _value.userJournalId
          : userJournalId // ignore: cast_nullable_to_non_nullable
              as int?,
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
  final Media? media;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'main_question_id')
  final int? mainQuestionId;
  @override
  @JsonKey(name: 'follow_up_question_id')
  final int? followUpQuestionId;
  @override
  @JsonKey(name: 'user_journal_id')
  final int? userJournalId;

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
            (identical(other.media, media) || other.media == media) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.mainQuestionId, mainQuestionId) ||
                other.mainQuestionId == mainQuestionId) &&
            (identical(other.followUpQuestionId, followUpQuestionId) ||
                other.followUpQuestionId == followUpQuestionId) &&
            (identical(other.userJournalId, userJournalId) ||
                other.userJournalId == userJournalId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, media, createdAt,
      updatedAt, mainQuestionId, followUpQuestionId, userJournalId);

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
          @JsonKey(name: 'media') final Media? media,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'updated_at') final String? updatedAt,
          @JsonKey(name: 'main_question_id') final int? mainQuestionId,
          @JsonKey(name: 'follow_up_question_id') final int? followUpQuestionId,
          @JsonKey(name: 'user_journal_id') final int? userJournalId}) =
      _$AnswerImpl;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$AnswerImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'media')
  Media? get media;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'main_question_id')
  int? get mainQuestionId;
  @override
  @JsonKey(name: 'follow_up_question_id')
  int? get followUpQuestionId;
  @override
  @JsonKey(name: 'user_journal_id')
  int? get userJournalId;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Media _$MediaFromJson(Map<String, dynamic> json) {
  return _Media.fromJson(json);
}

/// @nodoc
mixin _$Media {
  List<String>? get images => throw _privateConstructorUsedError;
  List<String>? get videos => throw _privateConstructorUsedError;

  /// Serializes this Media to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaCopyWith<Media> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCopyWith<$Res> {
  factory $MediaCopyWith(Media value, $Res Function(Media) then) =
      _$MediaCopyWithImpl<$Res, Media>;
  @useResult
  $Res call({List<String>? images, List<String>? videos});
}

/// @nodoc
class _$MediaCopyWithImpl<$Res, $Val extends Media>
    implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = freezed,
    Object? videos = freezed,
  }) {
    return _then(_value.copyWith(
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaImplCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$$MediaImplCopyWith(
          _$MediaImpl value, $Res Function(_$MediaImpl) then) =
      __$$MediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String>? images, List<String>? videos});
}

/// @nodoc
class __$$MediaImplCopyWithImpl<$Res>
    extends _$MediaCopyWithImpl<$Res, _$MediaImpl>
    implements _$$MediaImplCopyWith<$Res> {
  __$$MediaImplCopyWithImpl(
      _$MediaImpl _value, $Res Function(_$MediaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = freezed,
    Object? videos = freezed,
  }) {
    return _then(_$MediaImpl(
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      videos: freezed == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaImpl implements _Media {
  const _$MediaImpl(
      {required final List<String>? images,
      required final List<String>? videos})
      : _images = images,
        _videos = videos;

  factory _$MediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaImplFromJson(json);

  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _videos;
  @override
  List<String>? get videos {
    final value = _videos;
    if (value == null) return null;
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Media(images: $images, videos: $videos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaImpl &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._videos, _videos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_videos));

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaImplCopyWith<_$MediaImpl> get copyWith =>
      __$$MediaImplCopyWithImpl<_$MediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaImplToJson(
      this,
    );
  }
}

abstract class _Media implements Media {
  const factory _Media(
      {required final List<String>? images,
      required final List<String>? videos}) = _$MediaImpl;

  factory _Media.fromJson(Map<String, dynamic> json) = _$MediaImpl.fromJson;

  @override
  List<String>? get images;
  @override
  List<String>? get videos;

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaImplCopyWith<_$MediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
