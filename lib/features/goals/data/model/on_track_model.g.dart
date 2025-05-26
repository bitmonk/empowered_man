// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_track_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnTrackModelImpl _$$OnTrackModelImplFromJson(Map<String, dynamic> json) =>
    _$OnTrackModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OnTrackModelImplToJson(_$OnTrackModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      userGoal: json['user_goal'] == null
          ? null
          : UserGoal.fromJson(json['user_goal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'user_goal': instance.userGoal,
    };

_$UserGoalImpl _$$UserGoalImplFromJson(Map<String, dynamic> json) =>
    _$UserGoalImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      goalId: (json['goal_id'] as num?)?.toInt(),
      goalDetailId: (json['goal_detail_id'] as num?)?.toInt(),
      progress: json['progress'],
      isOntrack: json['is_ontrack'] as bool?,
      isComplete: json['is_complete'] as bool?,
      showWonQuestion: json['show_won_question'],
      showTrackQuestion: json['show_track_question'],
    );

Map<String, dynamic> _$$UserGoalImplToJson(_$UserGoalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'goal_id': instance.goalId,
      'goal_detail_id': instance.goalDetailId,
      'progress': instance.progress,
      'is_ontrack': instance.isOntrack,
      'is_complete': instance.isComplete,
      'show_won_question': instance.showWonQuestion,
      'show_track_question': instance.showTrackQuestion,
    };
