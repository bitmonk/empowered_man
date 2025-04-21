// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<TaskLevel>? get data => throw _privateConstructorUsedError;

  /// Serializes this TaskModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') List<TaskLevel>? data});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskModel
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
              as List<TaskLevel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskModelImplCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$$TaskModelImplCopyWith(
          _$TaskModelImpl value, $Res Function(_$TaskModelImpl) then) =
      __$$TaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') List<TaskLevel>? data});
}

/// @nodoc
class __$$TaskModelImplCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$TaskModelImpl>
    implements _$$TaskModelImplCopyWith<$Res> {
  __$$TaskModelImplCopyWithImpl(
      _$TaskModelImpl _value, $Res Function(_$TaskModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$TaskModelImpl(
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
              as List<TaskLevel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskModelImpl implements _TaskModel {
  const _$TaskModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') final List<TaskLevel>? data})
      : _data = data;

  factory _$TaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  final List<TaskLevel>? _data;
  @override
  @JsonKey(name: 'data')
  List<TaskLevel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TaskModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      __$$TaskModelImplCopyWithImpl<_$TaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskModelImplToJson(
      this,
    );
  }
}

abstract class _TaskModel implements TaskModel {
  const factory _TaskModel(
      {@JsonKey(name: 'status') final bool? status,
      @JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'data') final List<TaskLevel>? data}) = _$TaskModelImpl;

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$TaskModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  List<TaskLevel>? get data;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskLevel _$TaskLevelFromJson(Map<String, dynamic> json) {
  return _TaskLevel.fromJson(json);
}

/// @nodoc
mixin _$TaskLevel {
  @JsonKey(name: 'HIT List')
  TaskCategory? get hitList => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mit List')
  TaskCategory? get mitList => throw _privateConstructorUsedError;
  @JsonKey(name: 'Do List')
  TaskCategory? get doList => throw _privateConstructorUsedError;
  @JsonKey(name: 'Achieved')
  TaskCategory? get achieved => throw _privateConstructorUsedError;
  @JsonKey(name: 'Done')
  TaskCategory? get done => throw _privateConstructorUsedError;

  /// Serializes this TaskLevel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskLevel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskLevelCopyWith<TaskLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskLevelCopyWith<$Res> {
  factory $TaskLevelCopyWith(TaskLevel value, $Res Function(TaskLevel) then) =
      _$TaskLevelCopyWithImpl<$Res, TaskLevel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'HIT List') TaskCategory? hitList,
      @JsonKey(name: 'Mit List') TaskCategory? mitList,
      @JsonKey(name: 'Do List') TaskCategory? doList,
      @JsonKey(name: 'Achieved') TaskCategory? achieved,
      @JsonKey(name: 'Done') TaskCategory? done});

  $TaskCategoryCopyWith<$Res>? get hitList;
  $TaskCategoryCopyWith<$Res>? get mitList;
  $TaskCategoryCopyWith<$Res>? get doList;
  $TaskCategoryCopyWith<$Res>? get achieved;
  $TaskCategoryCopyWith<$Res>? get done;
}

/// @nodoc
class _$TaskLevelCopyWithImpl<$Res, $Val extends TaskLevel>
    implements $TaskLevelCopyWith<$Res> {
  _$TaskLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskLevel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hitList = freezed,
    Object? mitList = freezed,
    Object? doList = freezed,
    Object? achieved = freezed,
    Object? done = freezed,
  }) {
    return _then(_value.copyWith(
      hitList: freezed == hitList
          ? _value.hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as TaskCategory?,
      mitList: freezed == mitList
          ? _value.mitList
          : mitList // ignore: cast_nullable_to_non_nullable
              as TaskCategory?,
      doList: freezed == doList
          ? _value.doList
          : doList // ignore: cast_nullable_to_non_nullable
              as TaskCategory?,
      achieved: freezed == achieved
          ? _value.achieved
          : achieved // ignore: cast_nullable_to_non_nullable
              as TaskCategory?,
      done: freezed == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as TaskCategory?,
    ) as $Val);
  }

  /// Create a copy of TaskLevel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskCategoryCopyWith<$Res>? get hitList {
    if (_value.hitList == null) {
      return null;
    }

    return $TaskCategoryCopyWith<$Res>(_value.hitList!, (value) {
      return _then(_value.copyWith(hitList: value) as $Val);
    });
  }

  /// Create a copy of TaskLevel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskCategoryCopyWith<$Res>? get mitList {
    if (_value.mitList == null) {
      return null;
    }

    return $TaskCategoryCopyWith<$Res>(_value.mitList!, (value) {
      return _then(_value.copyWith(mitList: value) as $Val);
    });
  }

  /// Create a copy of TaskLevel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskCategoryCopyWith<$Res>? get doList {
    if (_value.doList == null) {
      return null;
    }

    return $TaskCategoryCopyWith<$Res>(_value.doList!, (value) {
      return _then(_value.copyWith(doList: value) as $Val);
    });
  }

  /// Create a copy of TaskLevel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskCategoryCopyWith<$Res>? get achieved {
    if (_value.achieved == null) {
      return null;
    }

    return $TaskCategoryCopyWith<$Res>(_value.achieved!, (value) {
      return _then(_value.copyWith(achieved: value) as $Val);
    });
  }

  /// Create a copy of TaskLevel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskCategoryCopyWith<$Res>? get done {
    if (_value.done == null) {
      return null;
    }

    return $TaskCategoryCopyWith<$Res>(_value.done!, (value) {
      return _then(_value.copyWith(done: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskLevelImplCopyWith<$Res>
    implements $TaskLevelCopyWith<$Res> {
  factory _$$TaskLevelImplCopyWith(
          _$TaskLevelImpl value, $Res Function(_$TaskLevelImpl) then) =
      __$$TaskLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'HIT List') TaskCategory? hitList,
      @JsonKey(name: 'Mit List') TaskCategory? mitList,
      @JsonKey(name: 'Do List') TaskCategory? doList,
      @JsonKey(name: 'Achieved') TaskCategory? achieved,
      @JsonKey(name: 'Done') TaskCategory? done});

  @override
  $TaskCategoryCopyWith<$Res>? get hitList;
  @override
  $TaskCategoryCopyWith<$Res>? get mitList;
  @override
  $TaskCategoryCopyWith<$Res>? get doList;
  @override
  $TaskCategoryCopyWith<$Res>? get achieved;
  @override
  $TaskCategoryCopyWith<$Res>? get done;
}

/// @nodoc
class __$$TaskLevelImplCopyWithImpl<$Res>
    extends _$TaskLevelCopyWithImpl<$Res, _$TaskLevelImpl>
    implements _$$TaskLevelImplCopyWith<$Res> {
  __$$TaskLevelImplCopyWithImpl(
      _$TaskLevelImpl _value, $Res Function(_$TaskLevelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskLevel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hitList = freezed,
    Object? mitList = freezed,
    Object? doList = freezed,
    Object? achieved = freezed,
    Object? done = freezed,
  }) {
    return _then(_$TaskLevelImpl(
      hitList: freezed == hitList
          ? _value.hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as TaskCategory?,
      mitList: freezed == mitList
          ? _value.mitList
          : mitList // ignore: cast_nullable_to_non_nullable
              as TaskCategory?,
      doList: freezed == doList
          ? _value.doList
          : doList // ignore: cast_nullable_to_non_nullable
              as TaskCategory?,
      achieved: freezed == achieved
          ? _value.achieved
          : achieved // ignore: cast_nullable_to_non_nullable
              as TaskCategory?,
      done: freezed == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as TaskCategory?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskLevelImpl implements _TaskLevel {
  const _$TaskLevelImpl(
      {@JsonKey(name: 'HIT List') this.hitList,
      @JsonKey(name: 'Mit List') this.mitList,
      @JsonKey(name: 'Do List') this.doList,
      @JsonKey(name: 'Achieved') this.achieved,
      @JsonKey(name: 'Done') this.done});

  factory _$TaskLevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskLevelImplFromJson(json);

  @override
  @JsonKey(name: 'HIT List')
  final TaskCategory? hitList;
  @override
  @JsonKey(name: 'Mit List')
  final TaskCategory? mitList;
  @override
  @JsonKey(name: 'Do List')
  final TaskCategory? doList;
  @override
  @JsonKey(name: 'Achieved')
  final TaskCategory? achieved;
  @override
  @JsonKey(name: 'Done')
  final TaskCategory? done;

  @override
  String toString() {
    return 'TaskLevel(hitList: $hitList, mitList: $mitList, doList: $doList, achieved: $achieved, done: $done)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskLevelImpl &&
            (identical(other.hitList, hitList) || other.hitList == hitList) &&
            (identical(other.mitList, mitList) || other.mitList == mitList) &&
            (identical(other.doList, doList) || other.doList == doList) &&
            (identical(other.achieved, achieved) ||
                other.achieved == achieved) &&
            (identical(other.done, done) || other.done == done));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, hitList, mitList, doList, achieved, done);

  /// Create a copy of TaskLevel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskLevelImplCopyWith<_$TaskLevelImpl> get copyWith =>
      __$$TaskLevelImplCopyWithImpl<_$TaskLevelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskLevelImplToJson(
      this,
    );
  }
}

abstract class _TaskLevel implements TaskLevel {
  const factory _TaskLevel(
      {@JsonKey(name: 'HIT List') final TaskCategory? hitList,
      @JsonKey(name: 'Mit List') final TaskCategory? mitList,
      @JsonKey(name: 'Do List') final TaskCategory? doList,
      @JsonKey(name: 'Achieved') final TaskCategory? achieved,
      @JsonKey(name: 'Done') final TaskCategory? done}) = _$TaskLevelImpl;

  factory _TaskLevel.fromJson(Map<String, dynamic> json) =
      _$TaskLevelImpl.fromJson;

  @override
  @JsonKey(name: 'HIT List')
  TaskCategory? get hitList;
  @override
  @JsonKey(name: 'Mit List')
  TaskCategory? get mitList;
  @override
  @JsonKey(name: 'Do List')
  TaskCategory? get doList;
  @override
  @JsonKey(name: 'Achieved')
  TaskCategory? get achieved;
  @override
  @JsonKey(name: 'Done')
  TaskCategory? get done;

  /// Create a copy of TaskLevel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskLevelImplCopyWith<_$TaskLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskCategory _$TaskCategoryFromJson(Map<String, dynamic> json) {
  return _TaskCategory.fromJson(json);
}

/// @nodoc
mixin _$TaskCategory {
  @JsonKey(name: 'tasks')
  List<Task>? get tasks => throw _privateConstructorUsedError;
  @JsonKey(name: '_meta')
  Meta? get meta => throw _privateConstructorUsedError;

  /// Serializes this TaskCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCategoryCopyWith<TaskCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCategoryCopyWith<$Res> {
  factory $TaskCategoryCopyWith(
          TaskCategory value, $Res Function(TaskCategory) then) =
      _$TaskCategoryCopyWithImpl<$Res, TaskCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'tasks') List<Task>? tasks,
      @JsonKey(name: '_meta') Meta? meta});

  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$TaskCategoryCopyWithImpl<$Res, $Val extends TaskCategory>
    implements $TaskCategoryCopyWith<$Res> {
  _$TaskCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ) as $Val);
  }

  /// Create a copy of TaskCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskCategoryImplCopyWith<$Res>
    implements $TaskCategoryCopyWith<$Res> {
  factory _$$TaskCategoryImplCopyWith(
          _$TaskCategoryImpl value, $Res Function(_$TaskCategoryImpl) then) =
      __$$TaskCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'tasks') List<Task>? tasks,
      @JsonKey(name: '_meta') Meta? meta});

  @override
  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$TaskCategoryImplCopyWithImpl<$Res>
    extends _$TaskCategoryCopyWithImpl<$Res, _$TaskCategoryImpl>
    implements _$$TaskCategoryImplCopyWith<$Res> {
  __$$TaskCategoryImplCopyWithImpl(
      _$TaskCategoryImpl _value, $Res Function(_$TaskCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$TaskCategoryImpl(
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskCategoryImpl implements _TaskCategory {
  const _$TaskCategoryImpl(
      {@JsonKey(name: 'tasks') final List<Task>? tasks,
      @JsonKey(name: '_meta') this.meta})
      : _tasks = tasks;

  factory _$TaskCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskCategoryImplFromJson(json);

  final List<Task>? _tasks;
  @override
  @JsonKey(name: 'tasks')
  List<Task>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: '_meta')
  final Meta? meta;

  @override
  String toString() {
    return 'TaskCategory(tasks: $tasks, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskCategoryImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tasks), meta);

  /// Create a copy of TaskCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskCategoryImplCopyWith<_$TaskCategoryImpl> get copyWith =>
      __$$TaskCategoryImplCopyWithImpl<_$TaskCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskCategoryImplToJson(
      this,
    );
  }
}

abstract class _TaskCategory implements TaskCategory {
  const factory _TaskCategory(
      {@JsonKey(name: 'tasks') final List<Task>? tasks,
      @JsonKey(name: '_meta') final Meta? meta}) = _$TaskCategoryImpl;

  factory _TaskCategory.fromJson(Map<String, dynamic> json) =
      _$TaskCategoryImpl.fromJson;

  @override
  @JsonKey(name: 'tasks')
  List<Task>? get tasks;
  @override
  @JsonKey(name: '_meta')
  Meta? get meta;

  /// Create a copy of TaskCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskCategoryImplCopyWith<_$TaskCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  @JsonKey(name: 'count')
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed')
  Completed? get completed => throw _privateConstructorUsedError;

  /// Serializes this Meta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'completed') Completed? completed});

  $CompletedCopyWith<$Res>? get completed;
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? completed = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as Completed?,
    ) as $Val);
  }

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CompletedCopyWith<$Res>? get completed {
    if (_value.completed == null) {
      return null;
    }

    return $CompletedCopyWith<$Res>(_value.completed!, (value) {
      return _then(_value.copyWith(completed: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MetaImplCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
          _$MetaImpl value, $Res Function(_$MetaImpl) then) =
      __$$MetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'completed') Completed? completed});

  @override
  $CompletedCopyWith<$Res>? get completed;
}

/// @nodoc
class __$$MetaImplCopyWithImpl<$Res>
    extends _$MetaCopyWithImpl<$Res, _$MetaImpl>
    implements _$$MetaImplCopyWith<$Res> {
  __$$MetaImplCopyWithImpl(_$MetaImpl _value, $Res Function(_$MetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? completed = freezed,
  }) {
    return _then(_$MetaImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as Completed?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaImpl implements _Meta {
  const _$MetaImpl(
      {@JsonKey(name: 'count') this.count,
      @JsonKey(name: 'completed') this.completed});

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  @JsonKey(name: 'count')
  final int? count;
  @override
  @JsonKey(name: 'completed')
  final Completed? completed;

  @override
  String toString() {
    return 'Meta(count: $count, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, completed);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      __$$MetaImplCopyWithImpl<_$MetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaImplToJson(
      this,
    );
  }
}

abstract class _Meta implements Meta {
  const factory _Meta(
      {@JsonKey(name: 'count') final int? count,
      @JsonKey(name: 'completed') final Completed? completed}) = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  @JsonKey(name: 'count')
  int? get count;
  @override
  @JsonKey(name: 'completed')
  Completed? get completed;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Completed _$CompletedFromJson(Map<String, dynamic> json) {
  return _Completed.fromJson(json);
}

/// @nodoc
mixin _$Completed {
  @JsonKey(name: 'count')
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage')
  int? get percentage => throw _privateConstructorUsedError;

  /// Serializes this Completed to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Completed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompletedCopyWith<Completed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompletedCopyWith<$Res> {
  factory $CompletedCopyWith(Completed value, $Res Function(Completed) then) =
      _$CompletedCopyWithImpl<$Res, Completed>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'percentage') int? percentage});
}

/// @nodoc
class _$CompletedCopyWithImpl<$Res, $Val extends Completed>
    implements $CompletedCopyWith<$Res> {
  _$CompletedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Completed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? percentage = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompletedImplCopyWith<$Res>
    implements $CompletedCopyWith<$Res> {
  factory _$$CompletedImplCopyWith(
          _$CompletedImpl value, $Res Function(_$CompletedImpl) then) =
      __$$CompletedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'percentage') int? percentage});
}

/// @nodoc
class __$$CompletedImplCopyWithImpl<$Res>
    extends _$CompletedCopyWithImpl<$Res, _$CompletedImpl>
    implements _$$CompletedImplCopyWith<$Res> {
  __$$CompletedImplCopyWithImpl(
      _$CompletedImpl _value, $Res Function(_$CompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Completed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? percentage = freezed,
  }) {
    return _then(_$CompletedImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompletedImpl implements _Completed {
  const _$CompletedImpl(
      {@JsonKey(name: 'count') this.count,
      @JsonKey(name: 'percentage') this.percentage});

  factory _$CompletedImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompletedImplFromJson(json);

  @override
  @JsonKey(name: 'count')
  final int? count;
  @override
  @JsonKey(name: 'percentage')
  final int? percentage;

  @override
  String toString() {
    return 'Completed(count: $count, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompletedImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, percentage);

  /// Create a copy of Completed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompletedImplCopyWith<_$CompletedImpl> get copyWith =>
      __$$CompletedImplCopyWithImpl<_$CompletedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompletedImplToJson(
      this,
    );
  }
}

abstract class _Completed implements Completed {
  const factory _Completed(
      {@JsonKey(name: 'count') final int? count,
      @JsonKey(name: 'percentage') final int? percentage}) = _$CompletedImpl;

  factory _Completed.fromJson(Map<String, dynamic> json) =
      _$CompletedImpl.fromJson;

  @override
  @JsonKey(name: 'count')
  int? get count;
  @override
  @JsonKey(name: 'percentage')
  int? get percentage;

  /// Create a copy of Completed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompletedImplCopyWith<_$CompletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
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
  List<Task>? get subTasks => throw _privateConstructorUsedError;

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'completion_status') dynamic completionStatus,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'due_date') DateTime? dueDate,
      @JsonKey(name: 'priority') String? priority,
      @JsonKey(name: 'level') String? level,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'sub_tasks') List<Task>? subTasks});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
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
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as List<Task>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'completion_status') dynamic completionStatus,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'due_date') DateTime? dueDate,
      @JsonKey(name: 'priority') String? priority,
      @JsonKey(name: 'level') String? level,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'sub_tasks') List<Task>? subTasks});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
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
    return _then(_$TaskImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as List<Task>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'completion_status') this.completionStatus,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'due_date') this.dueDate,
      @JsonKey(name: 'priority') this.priority,
      @JsonKey(name: 'level') this.level,
      @JsonKey(name: 'notes') this.notes,
      @JsonKey(name: 'sub_tasks') final List<Task>? subTasks})
      : _subTasks = subTasks;

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'description')
  final String? description;
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
  final List<Task>? _subTasks;
  @override
  @JsonKey(name: 'sub_tasks')
  List<Task>? get subTasks {
    final value = _subTasks;
    if (value == null) return null;
    if (_subTasks is EqualUnmodifiableListView) return _subTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, status: $status, completionStatus: $completionStatus, userId: $userId, dueDate: $dueDate, priority: $priority, level: $level, notes: $notes, subTasks: $subTasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
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
      title,
      description,
      status,
      const DeepCollectionEquality().hash(completionStatus),
      userId,
      dueDate,
      priority,
      level,
      notes,
      const DeepCollectionEquality().hash(_subTasks));

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'status') final String? status,
      @JsonKey(name: 'completion_status') final dynamic completionStatus,
      @JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'due_date') final DateTime? dueDate,
      @JsonKey(name: 'priority') final String? priority,
      @JsonKey(name: 'level') final String? level,
      @JsonKey(name: 'notes') final String? notes,
      @JsonKey(name: 'sub_tasks') final List<Task>? subTasks}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'description')
  String? get description;
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
  List<Task>? get subTasks;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
