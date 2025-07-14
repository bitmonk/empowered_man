// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'module_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ModuleModel _$ModuleModelFromJson(Map<String, dynamic> json) {
  return _ModuleModel.fromJson(json);
}

/// @nodoc
mixin _$ModuleModel {
  @JsonKey(name: 'success')
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  ModuleData? get moduledata => throw _privateConstructorUsedError;

  /// Serializes this ModuleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ModuleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModuleModelCopyWith<ModuleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModuleModelCopyWith<$Res> {
  factory $ModuleModelCopyWith(
          ModuleModel value, $Res Function(ModuleModel) then) =
      _$ModuleModelCopyWithImpl<$Res, ModuleModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool? success,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') ModuleData? moduledata});

  $ModuleDataCopyWith<$Res>? get moduledata;
}

/// @nodoc
class _$ModuleModelCopyWithImpl<$Res, $Val extends ModuleModel>
    implements $ModuleModelCopyWith<$Res> {
  _$ModuleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModuleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? moduledata = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      moduledata: freezed == moduledata
          ? _value.moduledata
          : moduledata // ignore: cast_nullable_to_non_nullable
              as ModuleData?,
    ) as $Val);
  }

  /// Create a copy of ModuleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ModuleDataCopyWith<$Res>? get moduledata {
    if (_value.moduledata == null) {
      return null;
    }

    return $ModuleDataCopyWith<$Res>(_value.moduledata!, (value) {
      return _then(_value.copyWith(moduledata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ModuleModelImplCopyWith<$Res>
    implements $ModuleModelCopyWith<$Res> {
  factory _$$ModuleModelImplCopyWith(
          _$ModuleModelImpl value, $Res Function(_$ModuleModelImpl) then) =
      __$$ModuleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool? success,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') ModuleData? moduledata});

  @override
  $ModuleDataCopyWith<$Res>? get moduledata;
}

/// @nodoc
class __$$ModuleModelImplCopyWithImpl<$Res>
    extends _$ModuleModelCopyWithImpl<$Res, _$ModuleModelImpl>
    implements _$$ModuleModelImplCopyWith<$Res> {
  __$$ModuleModelImplCopyWithImpl(
      _$ModuleModelImpl _value, $Res Function(_$ModuleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ModuleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? moduledata = freezed,
  }) {
    return _then(_$ModuleModelImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      moduledata: freezed == moduledata
          ? _value.moduledata
          : moduledata // ignore: cast_nullable_to_non_nullable
              as ModuleData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModuleModelImpl implements _ModuleModel {
  const _$ModuleModelImpl(
      {@JsonKey(name: 'success') this.success,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.moduledata});

  factory _$ModuleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModuleModelImplFromJson(json);

  @override
  @JsonKey(name: 'success')
  final bool? success;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'data')
  final ModuleData? moduledata;

  @override
  String toString() {
    return 'ModuleModel(success: $success, message: $message, moduledata: $moduledata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModuleModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.moduledata, moduledata) ||
                other.moduledata == moduledata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, moduledata);

  /// Create a copy of ModuleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModuleModelImplCopyWith<_$ModuleModelImpl> get copyWith =>
      __$$ModuleModelImplCopyWithImpl<_$ModuleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModuleModelImplToJson(
      this,
    );
  }
}

abstract class _ModuleModel implements ModuleModel {
  const factory _ModuleModel(
      {@JsonKey(name: 'success') final bool? success,
      @JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'data') final ModuleData? moduledata}) = _$ModuleModelImpl;

  factory _ModuleModel.fromJson(Map<String, dynamic> json) =
      _$ModuleModelImpl.fromJson;

  @override
  @JsonKey(name: 'success')
  bool? get success;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  ModuleData? get moduledata;

  /// Create a copy of ModuleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModuleModelImplCopyWith<_$ModuleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ModuleData _$ModuleDataFromJson(Map<String, dynamic> json) {
  return _ModuleData.fromJson(json);
}

/// @nodoc
mixin _$ModuleData {
  @JsonKey(name: 'course')
  Course? get course => throw _privateConstructorUsedError;
  @JsonKey(name: 'modules')
  List<Module>? get modules => throw _privateConstructorUsedError;

  /// Serializes this ModuleData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ModuleData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModuleDataCopyWith<ModuleData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModuleDataCopyWith<$Res> {
  factory $ModuleDataCopyWith(
          ModuleData value, $Res Function(ModuleData) then) =
      _$ModuleDataCopyWithImpl<$Res, ModuleData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'course') Course? course,
      @JsonKey(name: 'modules') List<Module>? modules});

  $CourseCopyWith<$Res>? get course;
}

/// @nodoc
class _$ModuleDataCopyWithImpl<$Res, $Val extends ModuleData>
    implements $ModuleDataCopyWith<$Res> {
  _$ModuleDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModuleData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? course = freezed,
    Object? modules = freezed,
  }) {
    return _then(_value.copyWith(
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
      modules: freezed == modules
          ? _value.modules
          : modules // ignore: cast_nullable_to_non_nullable
              as List<Module>?,
    ) as $Val);
  }

  /// Create a copy of ModuleData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res>? get course {
    if (_value.course == null) {
      return null;
    }

    return $CourseCopyWith<$Res>(_value.course!, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ModuleDataImplCopyWith<$Res>
    implements $ModuleDataCopyWith<$Res> {
  factory _$$ModuleDataImplCopyWith(
          _$ModuleDataImpl value, $Res Function(_$ModuleDataImpl) then) =
      __$$ModuleDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'course') Course? course,
      @JsonKey(name: 'modules') List<Module>? modules});

  @override
  $CourseCopyWith<$Res>? get course;
}

/// @nodoc
class __$$ModuleDataImplCopyWithImpl<$Res>
    extends _$ModuleDataCopyWithImpl<$Res, _$ModuleDataImpl>
    implements _$$ModuleDataImplCopyWith<$Res> {
  __$$ModuleDataImplCopyWithImpl(
      _$ModuleDataImpl _value, $Res Function(_$ModuleDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ModuleData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? course = freezed,
    Object? modules = freezed,
  }) {
    return _then(_$ModuleDataImpl(
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
      modules: freezed == modules
          ? _value._modules
          : modules // ignore: cast_nullable_to_non_nullable
              as List<Module>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModuleDataImpl implements _ModuleData {
  const _$ModuleDataImpl(
      {@JsonKey(name: 'course') this.course,
      @JsonKey(name: 'modules') final List<Module>? modules})
      : _modules = modules;

  factory _$ModuleDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModuleDataImplFromJson(json);

  @override
  @JsonKey(name: 'course')
  final Course? course;
  final List<Module>? _modules;
  @override
  @JsonKey(name: 'modules')
  List<Module>? get modules {
    final value = _modules;
    if (value == null) return null;
    if (_modules is EqualUnmodifiableListView) return _modules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ModuleData(course: $course, modules: $modules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModuleDataImpl &&
            (identical(other.course, course) || other.course == course) &&
            const DeepCollectionEquality().equals(other._modules, _modules));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, course, const DeepCollectionEquality().hash(_modules));

  /// Create a copy of ModuleData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModuleDataImplCopyWith<_$ModuleDataImpl> get copyWith =>
      __$$ModuleDataImplCopyWithImpl<_$ModuleDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModuleDataImplToJson(
      this,
    );
  }
}

abstract class _ModuleData implements ModuleData {
  const factory _ModuleData(
          {@JsonKey(name: 'course') final Course? course,
          @JsonKey(name: 'modules') final List<Module>? modules}) =
      _$ModuleDataImpl;

  factory _ModuleData.fromJson(Map<String, dynamic> json) =
      _$ModuleDataImpl.fromJson;

  @override
  @JsonKey(name: 'course')
  Course? get course;
  @override
  @JsonKey(name: 'modules')
  List<Module>? get modules;

  /// Create a copy of ModuleData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModuleDataImplCopyWith<_$ModuleDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Module _$ModuleFromJson(Map<String, dynamic> json) {
  return _Module.fromJson(json);
}

/// @nodoc
mixin _$Module {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_id')
  int? get courseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail')
  String? get thumbnail => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'completion_percentage')
  int? get completionPercentage => throw _privateConstructorUsedError;

  /// Serializes this Module to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Module
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModuleCopyWith<Module> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModuleCopyWith<$Res> {
  factory $ModuleCopyWith(Module value, $Res Function(Module) then) =
      _$ModuleCopyWithImpl<$Res, Module>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'course_id') int? courseId,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'thumbnail') String? thumbnail,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'completion_percentage') int? completionPercentage});
}

/// @nodoc
class _$ModuleCopyWithImpl<$Res, $Val extends Module>
    implements $ModuleCopyWith<$Res> {
  _$ModuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Module
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? courseId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? thumbnail = freezed,
    Object? status = freezed,
    Object? completionPercentage = freezed,
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
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      completionPercentage: freezed == completionPercentage
          ? _value.completionPercentage
          : completionPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModuleImplCopyWith<$Res> implements $ModuleCopyWith<$Res> {
  factory _$$ModuleImplCopyWith(
          _$ModuleImpl value, $Res Function(_$ModuleImpl) then) =
      __$$ModuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'course_id') int? courseId,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'thumbnail') String? thumbnail,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'completion_percentage') int? completionPercentage});
}

/// @nodoc
class __$$ModuleImplCopyWithImpl<$Res>
    extends _$ModuleCopyWithImpl<$Res, _$ModuleImpl>
    implements _$$ModuleImplCopyWith<$Res> {
  __$$ModuleImplCopyWithImpl(
      _$ModuleImpl _value, $Res Function(_$ModuleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Module
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? courseId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? thumbnail = freezed,
    Object? status = freezed,
    Object? completionPercentage = freezed,
  }) {
    return _then(_$ModuleImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      completionPercentage: freezed == completionPercentage
          ? _value.completionPercentage
          : completionPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModuleImpl implements _Module {
  const _$ModuleImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'course_id') this.courseId,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'thumbnail') this.thumbnail,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'completion_percentage') this.completionPercentage});

  factory _$ModuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModuleImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'course_id')
  final int? courseId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'thumbnail')
  final String? thumbnail;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'completion_percentage')
  final int? completionPercentage;

  @override
  String toString() {
    return 'Module(id: $id, title: $title, courseId: $courseId, createdAt: $createdAt, updatedAt: $updatedAt, thumbnail: $thumbnail, status: $status, completionPercentage: $completionPercentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModuleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.completionPercentage, completionPercentage) ||
                other.completionPercentage == completionPercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, courseId, createdAt,
      updatedAt, thumbnail, status, completionPercentage);

  /// Create a copy of Module
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModuleImplCopyWith<_$ModuleImpl> get copyWith =>
      __$$ModuleImplCopyWithImpl<_$ModuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModuleImplToJson(
      this,
    );
  }
}

abstract class _Module implements Module {
  const factory _Module(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'course_id') final int? courseId,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      @JsonKey(name: 'thumbnail') final String? thumbnail,
      @JsonKey(name: 'status') final String? status,
      @JsonKey(name: 'completion_percentage')
      final int? completionPercentage}) = _$ModuleImpl;

  factory _Module.fromJson(Map<String, dynamic> json) = _$ModuleImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'course_id')
  int? get courseId;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'thumbnail')
  String? get thumbnail;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'completion_percentage')
  int? get completionPercentage;

  /// Create a copy of Module
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModuleImplCopyWith<_$ModuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
