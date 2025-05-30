// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PushNotificationModel _$PushNotificationModelFromJson(
    Map<String, dynamic> json) {
  return _PushNotificationModel.fromJson(json);
}

/// @nodoc
mixin _$PushNotificationModel {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  PushNotificationModelData? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta')
  Meta? get meta => throw _privateConstructorUsedError;

  /// Serializes this PushNotificationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PushNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PushNotificationModelCopyWith<PushNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushNotificationModelCopyWith<$Res> {
  factory $PushNotificationModelCopyWith(PushNotificationModel value,
          $Res Function(PushNotificationModel) then) =
      _$PushNotificationModelCopyWithImpl<$Res, PushNotificationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') PushNotificationModelData? data,
      @JsonKey(name: 'meta') Meta? meta});

  $PushNotificationModelDataCopyWith<$Res>? get data;
  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$PushNotificationModelCopyWithImpl<$Res,
        $Val extends PushNotificationModel>
    implements $PushNotificationModelCopyWith<$Res> {
  _$PushNotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PushNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? meta = freezed,
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
              as PushNotificationModelData?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ) as $Val);
  }

  /// Create a copy of PushNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PushNotificationModelDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $PushNotificationModelDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  /// Create a copy of PushNotificationModel
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
abstract class _$$PushNotificationModelImplCopyWith<$Res>
    implements $PushNotificationModelCopyWith<$Res> {
  factory _$$PushNotificationModelImplCopyWith(
          _$PushNotificationModelImpl value,
          $Res Function(_$PushNotificationModelImpl) then) =
      __$$PushNotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') PushNotificationModelData? data,
      @JsonKey(name: 'meta') Meta? meta});

  @override
  $PushNotificationModelDataCopyWith<$Res>? get data;
  @override
  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$PushNotificationModelImplCopyWithImpl<$Res>
    extends _$PushNotificationModelCopyWithImpl<$Res,
        _$PushNotificationModelImpl>
    implements _$$PushNotificationModelImplCopyWith<$Res> {
  __$$PushNotificationModelImplCopyWithImpl(_$PushNotificationModelImpl _value,
      $Res Function(_$PushNotificationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PushNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$PushNotificationModelImpl(
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
              as PushNotificationModelData?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushNotificationModelImpl implements _PushNotificationModel {
  const _$PushNotificationModelImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') this.data,
      @JsonKey(name: 'meta') this.meta});

  factory _$PushNotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushNotificationModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'data')
  final PushNotificationModelData? data;
  @override
  @JsonKey(name: 'meta')
  final Meta? meta;

  @override
  String toString() {
    return 'PushNotificationModel(status: $status, message: $message, data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data, meta);

  /// Create a copy of PushNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationModelImplCopyWith<_$PushNotificationModelImpl>
      get copyWith => __$$PushNotificationModelImplCopyWithImpl<
          _$PushNotificationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushNotificationModelImplToJson(
      this,
    );
  }
}

abstract class _PushNotificationModel implements PushNotificationModel {
  const factory _PushNotificationModel(
      {@JsonKey(name: 'status') final bool? status,
      @JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'data') final PushNotificationModelData? data,
      @JsonKey(name: 'meta') final Meta? meta}) = _$PushNotificationModelImpl;

  factory _PushNotificationModel.fromJson(Map<String, dynamic> json) =
      _$PushNotificationModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  PushNotificationModelData? get data;
  @override
  @JsonKey(name: 'meta')
  Meta? get meta;

  /// Create a copy of PushNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PushNotificationModelImplCopyWith<_$PushNotificationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PushNotificationModelData _$PushNotificationModelDataFromJson(
    Map<String, dynamic> json) {
  return _PushNotificationModelData.fromJson(json);
}

/// @nodoc
mixin _$PushNotificationModelData {
  @JsonKey(name: 'notifications')
  List<PushNotification>? get notifications =>
      throw _privateConstructorUsedError;

  /// Serializes this PushNotificationModelData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PushNotificationModelData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PushNotificationModelDataCopyWith<PushNotificationModelData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushNotificationModelDataCopyWith<$Res> {
  factory $PushNotificationModelDataCopyWith(PushNotificationModelData value,
          $Res Function(PushNotificationModelData) then) =
      _$PushNotificationModelDataCopyWithImpl<$Res, PushNotificationModelData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'notifications') List<PushNotification>? notifications});
}

/// @nodoc
class _$PushNotificationModelDataCopyWithImpl<$Res,
        $Val extends PushNotificationModelData>
    implements $PushNotificationModelDataCopyWith<$Res> {
  _$PushNotificationModelDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PushNotificationModelData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = freezed,
  }) {
    return _then(_value.copyWith(
      notifications: freezed == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<PushNotification>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PushNotificationModelDataImplCopyWith<$Res>
    implements $PushNotificationModelDataCopyWith<$Res> {
  factory _$$PushNotificationModelDataImplCopyWith(
          _$PushNotificationModelDataImpl value,
          $Res Function(_$PushNotificationModelDataImpl) then) =
      __$$PushNotificationModelDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'notifications') List<PushNotification>? notifications});
}

/// @nodoc
class __$$PushNotificationModelDataImplCopyWithImpl<$Res>
    extends _$PushNotificationModelDataCopyWithImpl<$Res,
        _$PushNotificationModelDataImpl>
    implements _$$PushNotificationModelDataImplCopyWith<$Res> {
  __$$PushNotificationModelDataImplCopyWithImpl(
      _$PushNotificationModelDataImpl _value,
      $Res Function(_$PushNotificationModelDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PushNotificationModelData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = freezed,
  }) {
    return _then(_$PushNotificationModelDataImpl(
      notifications: freezed == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<PushNotification>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushNotificationModelDataImpl implements _PushNotificationModelData {
  const _$PushNotificationModelDataImpl(
      {@JsonKey(name: 'notifications')
      final List<PushNotification>? notifications})
      : _notifications = notifications;

  factory _$PushNotificationModelDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushNotificationModelDataImplFromJson(json);

  final List<PushNotification>? _notifications;
  @override
  @JsonKey(name: 'notifications')
  List<PushNotification>? get notifications {
    final value = _notifications;
    if (value == null) return null;
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PushNotificationModelData(notifications: $notifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationModelDataImpl &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notifications));

  /// Create a copy of PushNotificationModelData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationModelDataImplCopyWith<_$PushNotificationModelDataImpl>
      get copyWith => __$$PushNotificationModelDataImplCopyWithImpl<
          _$PushNotificationModelDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushNotificationModelDataImplToJson(
      this,
    );
  }
}

abstract class _PushNotificationModelData implements PushNotificationModelData {
  const factory _PushNotificationModelData(
          {@JsonKey(name: 'notifications')
          final List<PushNotification>? notifications}) =
      _$PushNotificationModelDataImpl;

  factory _PushNotificationModelData.fromJson(Map<String, dynamic> json) =
      _$PushNotificationModelDataImpl.fromJson;

  @override
  @JsonKey(name: 'notifications')
  List<PushNotification>? get notifications;

  /// Create a copy of PushNotificationModelData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PushNotificationModelDataImplCopyWith<_$PushNotificationModelDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PushNotification _$PushNotificationFromJson(Map<String, dynamic> json) {
  return _PushNotification.fromJson(json);
}

/// @nodoc
mixin _$PushNotification {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'notifiable_type')
  String? get notifiableType => throw _privateConstructorUsedError;
  @JsonKey(name: 'notifiable_id')
  int? get notifiableId => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  PushNotificationData? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'read_at')
  dynamic get readAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  dynamic get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PushNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PushNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PushNotificationCopyWith<PushNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushNotificationCopyWith<$Res> {
  factory $PushNotificationCopyWith(
          PushNotification value, $Res Function(PushNotification) then) =
      _$PushNotificationCopyWithImpl<$Res, PushNotification>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'notifiable_type') String? notifiableType,
      @JsonKey(name: 'notifiable_id') int? notifiableId,
      @JsonKey(name: 'data') PushNotificationData? data,
      @JsonKey(name: 'read_at') dynamic readAt,
      @JsonKey(name: 'url') dynamic url,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $PushNotificationDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$PushNotificationCopyWithImpl<$Res, $Val extends PushNotification>
    implements $PushNotificationCopyWith<$Res> {
  _$PushNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PushNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? notifiableType = freezed,
    Object? notifiableId = freezed,
    Object? data = freezed,
    Object? readAt = freezed,
    Object? url = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      notifiableType: freezed == notifiableType
          ? _value.notifiableType
          : notifiableType // ignore: cast_nullable_to_non_nullable
              as String?,
      notifiableId: freezed == notifiableId
          ? _value.notifiableId
          : notifiableId // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PushNotificationData?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of PushNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PushNotificationDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $PushNotificationDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PushNotificationImplCopyWith<$Res>
    implements $PushNotificationCopyWith<$Res> {
  factory _$$PushNotificationImplCopyWith(_$PushNotificationImpl value,
          $Res Function(_$PushNotificationImpl) then) =
      __$$PushNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'notifiable_type') String? notifiableType,
      @JsonKey(name: 'notifiable_id') int? notifiableId,
      @JsonKey(name: 'data') PushNotificationData? data,
      @JsonKey(name: 'read_at') dynamic readAt,
      @JsonKey(name: 'url') dynamic url,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $PushNotificationDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$PushNotificationImplCopyWithImpl<$Res>
    extends _$PushNotificationCopyWithImpl<$Res, _$PushNotificationImpl>
    implements _$$PushNotificationImplCopyWith<$Res> {
  __$$PushNotificationImplCopyWithImpl(_$PushNotificationImpl _value,
      $Res Function(_$PushNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PushNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? notifiableType = freezed,
    Object? notifiableId = freezed,
    Object? data = freezed,
    Object? readAt = freezed,
    Object? url = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PushNotificationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      notifiableType: freezed == notifiableType
          ? _value.notifiableType
          : notifiableType // ignore: cast_nullable_to_non_nullable
              as String?,
      notifiableId: freezed == notifiableId
          ? _value.notifiableId
          : notifiableId // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PushNotificationData?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushNotificationImpl implements _PushNotification {
  const _$PushNotificationImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'notifiable_type') this.notifiableType,
      @JsonKey(name: 'notifiable_id') this.notifiableId,
      @JsonKey(name: 'data') this.data,
      @JsonKey(name: 'read_at') this.readAt,
      @JsonKey(name: 'url') this.url,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$PushNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushNotificationImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'notifiable_type')
  final String? notifiableType;
  @override
  @JsonKey(name: 'notifiable_id')
  final int? notifiableId;
  @override
  @JsonKey(name: 'data')
  final PushNotificationData? data;
  @override
  @JsonKey(name: 'read_at')
  final dynamic readAt;
  @override
  @JsonKey(name: 'url')
  final dynamic url;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PushNotification(id: $id, type: $type, notifiableType: $notifiableType, notifiableId: $notifiableId, data: $data, readAt: $readAt, url: $url, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.notifiableType, notifiableType) ||
                other.notifiableType == notifiableType) &&
            (identical(other.notifiableId, notifiableId) ||
                other.notifiableId == notifiableId) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(other.readAt, readAt) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      notifiableType,
      notifiableId,
      data,
      const DeepCollectionEquality().hash(readAt),
      const DeepCollectionEquality().hash(url),
      createdAt,
      updatedAt);

  /// Create a copy of PushNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationImplCopyWith<_$PushNotificationImpl> get copyWith =>
      __$$PushNotificationImplCopyWithImpl<_$PushNotificationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushNotificationImplToJson(
      this,
    );
  }
}

abstract class _PushNotification implements PushNotification {
  const factory _PushNotification(
          {@JsonKey(name: 'id') final String? id,
          @JsonKey(name: 'type') final String? type,
          @JsonKey(name: 'notifiable_type') final String? notifiableType,
          @JsonKey(name: 'notifiable_id') final int? notifiableId,
          @JsonKey(name: 'data') final PushNotificationData? data,
          @JsonKey(name: 'read_at') final dynamic readAt,
          @JsonKey(name: 'url') final dynamic url,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$PushNotificationImpl;

  factory _PushNotification.fromJson(Map<String, dynamic> json) =
      _$PushNotificationImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'notifiable_type')
  String? get notifiableType;
  @override
  @JsonKey(name: 'notifiable_id')
  int? get notifiableId;
  @override
  @JsonKey(name: 'data')
  PushNotificationData? get data;
  @override
  @JsonKey(name: 'read_at')
  dynamic get readAt;
  @override
  @JsonKey(name: 'url')
  dynamic get url;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of PushNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PushNotificationImplCopyWith<_$PushNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PushNotificationData _$PushNotificationDataFromJson(Map<String, dynamic> json) {
  return _PushNotificationData.fromJson(json);
}

/// @nodoc
mixin _$PushNotificationData {
  @JsonKey(name: 'body')
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<dynamic>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;

  /// Serializes this PushNotificationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PushNotificationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PushNotificationDataCopyWith<PushNotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushNotificationDataCopyWith<$Res> {
  factory $PushNotificationDataCopyWith(PushNotificationData value,
          $Res Function(PushNotificationData) then) =
      _$PushNotificationDataCopyWithImpl<$Res, PushNotificationData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'body') String? body,
      @JsonKey(name: 'data') List<dynamic>? data,
      @JsonKey(name: 'title') String? title});
}

/// @nodoc
class _$PushNotificationDataCopyWithImpl<$Res,
        $Val extends PushNotificationData>
    implements $PushNotificationDataCopyWith<$Res> {
  _$PushNotificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PushNotificationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
    Object? data = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PushNotificationDataImplCopyWith<$Res>
    implements $PushNotificationDataCopyWith<$Res> {
  factory _$$PushNotificationDataImplCopyWith(_$PushNotificationDataImpl value,
          $Res Function(_$PushNotificationDataImpl) then) =
      __$$PushNotificationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'body') String? body,
      @JsonKey(name: 'data') List<dynamic>? data,
      @JsonKey(name: 'title') String? title});
}

/// @nodoc
class __$$PushNotificationDataImplCopyWithImpl<$Res>
    extends _$PushNotificationDataCopyWithImpl<$Res, _$PushNotificationDataImpl>
    implements _$$PushNotificationDataImplCopyWith<$Res> {
  __$$PushNotificationDataImplCopyWithImpl(_$PushNotificationDataImpl _value,
      $Res Function(_$PushNotificationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PushNotificationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
    Object? data = freezed,
    Object? title = freezed,
  }) {
    return _then(_$PushNotificationDataImpl(
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushNotificationDataImpl implements _PushNotificationData {
  const _$PushNotificationDataImpl(
      {@JsonKey(name: 'body') this.body,
      @JsonKey(name: 'data') final List<dynamic>? data,
      @JsonKey(name: 'title') this.title})
      : _data = data;

  factory _$PushNotificationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushNotificationDataImplFromJson(json);

  @override
  @JsonKey(name: 'body')
  final String? body;
  final List<dynamic>? _data;
  @override
  @JsonKey(name: 'data')
  List<dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'title')
  final String? title;

  @override
  String toString() {
    return 'PushNotificationData(body: $body, data: $data, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationDataImpl &&
            (identical(other.body, body) || other.body == body) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, body, const DeepCollectionEquality().hash(_data), title);

  /// Create a copy of PushNotificationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationDataImplCopyWith<_$PushNotificationDataImpl>
      get copyWith =>
          __$$PushNotificationDataImplCopyWithImpl<_$PushNotificationDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushNotificationDataImplToJson(
      this,
    );
  }
}

abstract class _PushNotificationData implements PushNotificationData {
  const factory _PushNotificationData(
          {@JsonKey(name: 'body') final String? body,
          @JsonKey(name: 'data') final List<dynamic>? data,
          @JsonKey(name: 'title') final String? title}) =
      _$PushNotificationDataImpl;

  factory _PushNotificationData.fromJson(Map<String, dynamic> json) =
      _$PushNotificationDataImpl.fromJson;

  @override
  @JsonKey(name: 'body')
  String? get body;
  @override
  @JsonKey(name: 'data')
  List<dynamic>? get data;
  @override
  @JsonKey(name: 'title')
  String? get title;

  /// Create a copy of PushNotificationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PushNotificationDataImplCopyWith<_$PushNotificationDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  @JsonKey(name: 'current_page')
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int? get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int? get total => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'current_page') int? currentPage,
      @JsonKey(name: 'last_page') int? lastPage,
      @JsonKey(name: 'per_page') int? perPage,
      @JsonKey(name: 'total') int? total});
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
    Object? currentPage = freezed,
    Object? lastPage = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
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
      {@JsonKey(name: 'current_page') int? currentPage,
      @JsonKey(name: 'last_page') int? lastPage,
      @JsonKey(name: 'per_page') int? perPage,
      @JsonKey(name: 'total') int? total});
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
    Object? currentPage = freezed,
    Object? lastPage = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
  }) {
    return _then(_$MetaImpl(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaImpl implements _Meta {
  const _$MetaImpl(
      {@JsonKey(name: 'current_page') this.currentPage,
      @JsonKey(name: 'last_page') this.lastPage,
      @JsonKey(name: 'per_page') this.perPage,
      @JsonKey(name: 'total') this.total});

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @override
  @JsonKey(name: 'last_page')
  final int? lastPage;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;
  @override
  @JsonKey(name: 'total')
  final int? total;

  @override
  String toString() {
    return 'Meta(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, lastPage, perPage, total);

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
      {@JsonKey(name: 'current_page') final int? currentPage,
      @JsonKey(name: 'last_page') final int? lastPage,
      @JsonKey(name: 'per_page') final int? perPage,
      @JsonKey(name: 'total') final int? total}) = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  @JsonKey(name: 'current_page')
  int? get currentPage;
  @override
  @JsonKey(name: 'last_page')
  int? get lastPage;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  @JsonKey(name: 'total')
  int? get total;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
