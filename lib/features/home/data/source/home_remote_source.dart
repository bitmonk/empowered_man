import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/features/home/data/model/daily_mit_list_model.dart';
import 'package:empowered/features/home/data/model/dashboard_habit_model.dart';
import 'package:empowered/features/home/data/model/dashboard_level_model.dart';
import 'package:empowered/features/home/data/model/dashboard_power_streak_model.dart';
import 'package:empowered/features/home/data/model/my_monthly_model.dart';
import 'package:intl/intl.dart';

class HomeRemoteSource {
  const HomeRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, MyMonthlyModel>> getMyMonthy() async {
    try {
      var res = await _client.get(
        AppEndpoints.myMonthly,
      );

      return right(
        MyMonthlyModel.fromJson(res),
      );
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, List<DailyMIT>>> dailyMITlists() async {
    try {
      var date = DateFormat('yyyy-MM-dd').format(DateTime.now());
      var res = await _client.get(
        AppEndpoints.getDailyMitList(date),
      );
      final model = DailyMitListModel.fromJson(res);
      return right(
        model.data?.first ?? [],
      );
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, String?>> mitTaskNote(String id) async {
    try {
      var res = await _client.get(
        AppEndpoints.mitTaskkNote(id),
      );

      return right(res['data']['note']);
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, DaashboardLevelModel>> getdashboardLevel() async {
    try {
      var res = await _client.get(
        AppEndpoints.getDashboardLevel,
      );

      return right(DaashboardLevelModel.fromJson(res['data']));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, DashboardHabitModel>> dashboardHabit() async {
    try {
      var date = DateFormat('yyyy-MM-dd').format(DateTime.now());
      var res = await _client.get(
        AppEndpoints.getDashboardHabit(date),
      );

      return right(DashboardHabitModel.fromJson(res));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, String>> updateDashboardHabit(String id) async {
    try {
      var res = await _client
          .post(AppEndpoints.updateDashboardHabit, body: {'habits_id': id});

      return right(res['message']);
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, DashboardPowerStreakModel>>
      getDashboardPowerStreak() async {
    try {
      var res = await _client.get(
        AppEndpoints.dashboardPowerStreak,
      );

      return right(DashboardPowerStreakModel.fromJson(res));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
