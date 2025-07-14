import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_level_model.freezed.dart';
part 'dashboard_level_model.g.dart';

@freezed
class DaashboardLevelModel with _$DaashboardLevelModel {
  const factory DaashboardLevelModel({
    @JsonKey(name: 'user_progressbar_points') String? userProgressbarPoints,
    @JsonKey(name: 'total_points_progressbar') String? totalPointsProgressbar,
    @JsonKey(name: 'current_level') String? currentLevel,
    @JsonKey(name: 'upcoming_level') String? upcomingLevel,
  }) = _DaashboardLevelModel;

  factory DaashboardLevelModel.fromJson(Map<String, dynamic> json) =>
      _$DaashboardLevelModelFromJson(json);
}
