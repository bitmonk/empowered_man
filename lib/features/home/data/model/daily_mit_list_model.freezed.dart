// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_mit_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyMitListModel _$DailyMitListModelFromJson(Map<String, dynamic> json) {
  return _DailyMitListModel.fromJson(json);
}

/// @nodoc
mixin _$DailyMitListModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<List<DailyMIT>>? get data => throw _privateConstructorUsedError;

  /// Serializes this DailyMitListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyMitListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyMitListModelCopyWith<DailyMitListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyMitListModelCopyWith<$Res> {
  factory $DailyMitListModelCopyWith(
          DailyMitListModel value, $Res Function(DailyMitListModel) then) =
      _$DailyMitListModelCopyWithImpl<$Res, DailyMitListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') List<List<DailyMIT>>? data});
}

/// @nodoc
class _$DailyMitListModelCopyWithImpl<$Res, $Val extends DailyMitListModel>
    implements $DailyMitListModelCopyWith<$Res> {
  _$DailyMitListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyMitListModel
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
              as List<List<DailyMIT>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyMitListModelImplCopyWith<$Res>
    implements $DailyMitListModelCopyWith<$Res> {
  factory _$$DailyMitListModelImplCopyWith(_$DailyMitListModelImpl value,
          $Res Function(_$DailyMitListModelImpl) then) =
      __$$DailyMitListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') List<List<DailyMIT>>? data});
}

/// @nodoc
class __$$DailyMitListModelImplCopyWithImpl<$Res>
    extends _$DailyMitListModelCopyWithImpl<$Res, _$DailyMitListModelImpl>
    implements _$$DailyMitListModelImplCopyWith<$Res> {
  __$$DailyMitListModelImplCopyWithImpl(_$DailyMitListModelImpl _value,
      $Res Function(_$DailyMitListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyMitListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$DailyMitListModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<List<DailyMIT>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyMitListModelImpl implements _DailyMitListModel {
  const _$DailyMitListModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') final List<List<DailyMIT>>? data})
      : _data = data;

  factory _$DailyMitListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyMitListModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  final List<List<DailyMIT>>? _data;
  @override
  @JsonKey(name: 'data')
  List<List<DailyMIT>>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DailyMitListModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyMitListModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of DailyMitListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyMitListModelImplCopyWith<_$DailyMitListModelImpl> get copyWith =>
      __$$DailyMitListModelImplCopyWithImpl<_$DailyMitListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyMitListModelImplToJson(
      this,
    );
  }
}

abstract class _DailyMitListModel implements DailyMitListModel {
  const factory _DailyMitListModel(
          {@JsonKey(name: 'status') final bool? status,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'data') final List<List<DailyMIT>>? data}) =
      _$DailyMitListModelImpl;

  factory _DailyMitListModel.fromJson(Map<String, dynamic> json) =
      _$DailyMitListModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  List<List<DailyMIT>>? get data;

  /// Create a copy of DailyMitListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyMitListModelImplCopyWith<_$DailyMitListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyMIT _$DailyMITFromJson(Map<String, dynamic> json) {
  return _DailyMIT.fromJson(json);
}

/// @nodoc
mixin _$DailyMIT {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_type')
  dynamic get sourceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  dynamic get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'completion_status')
  dynamic get completionStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date')
  DateTime? get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'priority')
  String? get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'level')
  String? get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'notes')
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_tasks')
  List<DailyMIT>? get subTasks => throw _privateConstructorUsedError;

  /// Serializes this DailyMIT to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyMIT
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyMITCopyWith<DailyMIT> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyMITCopyWith<$Res> {
  factory $DailyMITCopyWith(DailyMIT value, $Res Function(DailyMIT) then) =
      _$DailyMITCopyWithImpl<$Res, DailyMIT>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'source_type') dynamic sourceType,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') dynamic description,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'completion_status') dynamic completionStatus,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'due_date') DateTime? dueDate,
      @JsonKey(name: 'priority') String? priority,
      @JsonKey(name: 'level') String? level,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'sub_tasks') List<DailyMIT>? subTasks});
}

/// @nodoc
class _$DailyMITCopyWithImpl<$Res, $Val extends DailyMIT>
    implements $DailyMITCopyWith<$Res> {
  _$DailyMITCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyMIT
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sourceType = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? completionStatus = freezed,
    Object? userId = freezed,
    Object? dueDate = freezed,
    Object? priority = freezed,
    Object? level = freezed,
    Object? notes = freezed,
    Object? subTasks = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sourceType: freezed == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      completionStatus: freezed == completionStatus
          ? _value.completionStatus
          : completionStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      subTasks: freezed == subTasks
          ? _value.subTasks
          : subTasks // ignore: cast_nullable_to_non_nullable
              as List<DailyMIT>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyMITImplCopyWith<$Res>
    implements $DailyMITCopyWith<$Res> {
  factory _$$DailyMITImplCopyWith(
          _$DailyMITImpl value, $Res Function(_$DailyMITImpl) then) =
      __$$DailyMITImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'source_type') dynamic sourceType,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') dynamic description,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'completion_status') dynamic completionStatus,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'due_date') DateTime? dueDate,
      @JsonKey(name: 'priority') String? priority,
      @JsonKey(name: 'level') String? level,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'sub_tasks') List<DailyMIT>? subTasks});
}

/// @nodoc
class __$$DailyMITImplCopyWithImpl<$Res>
    extends _$DailyMITCopyWithImpl<$Res, _$DailyMITImpl>
    implements _$$DailyMITImplCopyWith<$Res> {
  __$$DailyMITImplCopyWithImpl(
      _$DailyMITImpl _value, $Res Function(_$DailyMITImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyMIT
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sourceType = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? completionStatus = freezed,
    Object? userId = freezed,
    Object? dueDate = freezed,
    Object? priority = freezed,
    Object? level = freezed,
    Object? notes = freezed,
    Object? subTasks = freezed,
  }) {
    return _then(_$DailyMITImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sourceType: freezed == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      completionStatus: freezed == completionStatus
          ? _value.completionStatus
          : completionStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      subTasks: freezed == subTasks
          ? _value._subTasks
          : subTasks // ignore: cast_nullable_to_non_nullable
              as List<DailyMIT>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyMITImpl implements _DailyMIT {
  const _$DailyMITImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'source_type') this.sourceType,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'completion_status') this.completionStatus,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'due_date') this.dueDate,
      @JsonKey(name: 'priority') this.priority,
      @JsonKey(name: 'level') this.level,
      @JsonKey(name: 'notes') this.notes,
      @JsonKey(name: 'sub_tasks') final List<DailyMIT>? subTasks})
      : _subTasks = subTasks;

  factory _$DailyMITImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyMITImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'source_type')
  final dynamic sourceType;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'description')
  final dynamic description;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'completion_status')
  final dynamic completionStatus;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'due_date')
  final DateTime? dueDate;
  @override
  @JsonKey(name: 'priority')
  final String? priority;
  @override
  @JsonKey(name: 'level')
  final String? level;
  @override
  @JsonKey(name: 'notes')
  final String? notes;
  final List<DailyMIT>? _subTasks;
  @override
  @JsonKey(name: 'sub_tasks')
  List<DailyMIT>? get subTasks {
    final value = _subTasks;
    if (value == null) return null;
    if (_subTasks is EqualUnmodifiableListView) return _subTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DailyMIT(id: $id, sourceType: $sourceType, title: $title, description: $description, status: $status, completionStatus: $completionStatus, userId: $userId, dueDate: $dueDate, priority: $priority, level: $level, notes: $notes, subTasks: $subTasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyMITImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.sourceType, sourceType) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.completionStatus, completionStatus) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._subTasks, _subTasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(sourceType),
      title,
      const DeepCollectionEquality().hash(description),
      status,
      const DeepCollectionEquality().hash(completionStatus),
      userId,
      dueDate,
      priority,
      level,
      notes,
      const DeepCollectionEquality().hash(_subTasks));

  /// Create a copy of DailyMIT
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyMITImplCopyWith<_$DailyMITImpl> get copyWith =>
      __$$DailyMITImplCopyWithImpl<_$DailyMITImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyMITImplToJson(
      this,
    );
  }
}

abstract class _DailyMIT implements DailyMIT {
  const factory _DailyMIT(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'source_type') final dynamic sourceType,
          @JsonKey(name: 'title') final String? title,
          @JsonKey(name: 'description') final dynamic description,
          @JsonKey(name: 'status') final String? status,
          @JsonKey(name: 'completion_status') final dynamic completionStatus,
          @JsonKey(name: 'user_id') final int? userId,
          @JsonKey(name: 'due_date') final DateTime? dueDate,
          @JsonKey(name: 'priority') final String? priority,
          @JsonKey(name: 'level') final String? level,
          @JsonKey(name: 'notes') final String? notes,
          @JsonKey(name: 'sub_tasks') final List<DailyMIT>? subTasks}) =
      _$DailyMITImpl;

  factory _DailyMIT.fromJson(Map<String, dynamic> json) =
      _$DailyMITImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'source_type')
  dynamic get sourceType;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'description')
  dynamic get description;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'completion_status')
  dynamic get completionStatus;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'due_date')
  DateTime? get dueDate;
  @override
  @JsonKey(name: 'priority')
  String? get priority;
  @override
  @JsonKey(name: 'level')
  String? get level;
  @override
  @JsonKey(name: 'notes')
  String? get notes;
  @override
  @JsonKey(name: 'sub_tasks')
  List<DailyMIT>? get subTasks;

  /// Create a copy of DailyMIT
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyMITImplCopyWith<_$DailyMITImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
