import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/power_score_stats/data/model/power_stat_model.dart';
import 'package:empowered/features/power_score_stats/data/source/power_score_remote_source.dart';
import 'package:intl/intl.dart';

class PowerScoreController extends GetxController {
  PowerScoreController({required this.remoteSource});
  final PowerScoreRemoteSource remoteSource;

  CancelToken? _cancelToken;
  Rx<TheStates> getPowerScoreStatsState = TheStates.initial.obs;
  Rx<PowerStatModel> powerScoreResponse = const PowerStatModel().obs;
  Rx<String?> scoreError = Rx<String?>(null);
  late Rx<DateTime> fromDate;
  late Rx<DateTime> toDate;
  @override
  void onInit() {
    super.onInit();
    fromDate = _getMonday(DateTime.now()).obs;
    toDate = fromDate.value.add(const Duration(days: 6)).obs;
    getPowerScoreStats();
  }

  void resetValue() {
    fromDate = _getMonday(DateTime.now()).obs;
    toDate = fromDate.value.add(const Duration(days: 6)).obs;

    getPowerScoreStats();
  }

  @override
  void onClose() {
    _cancelToken?.cancel();
    super.onClose();
  }

  Future<void> getPowerScoreStats({
    CancelToken? cancelToken,
  }) async {
    getPowerScoreStatsState.value = TheStates.loading;
    _cancelToken = CancelToken();
    scoreError.value = null;
    final result = await remoteSource.getPowerScore(
      fromDate: DateFormat('yyyy-MM-dd').format(fromDate.value),
      toDate: DateFormat('yyyy-MM-dd').format(toDate.value),
      cancelToken: _cancelToken,
    );

    result.fold(
      (l) {
        getPowerScoreStatsState.value = TheStates.error;
        scoreError.value = l.message;
      },
      (r) async {
        powerScoreResponse.value = r;
        getPowerScoreStatsState.value = TheStates.success;
      },
    );
  }

  DateTime _getMonday(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  void changeWeek(int weekOffset) {
    fromDate.value = fromDate.value.add(Duration(days: 7 * weekOffset));
    toDate.value = fromDate.value.add(const Duration(days: 6));

    getPowerScoreStats();
  }

  String getDateRange() {
    toDate.value = fromDate.value.add(const Duration(days: 6));
    return "${DateFormat("dd.MM").format(fromDate.value)} - ${DateFormat("dd.MM").format(toDate.value)}";
  }
}
