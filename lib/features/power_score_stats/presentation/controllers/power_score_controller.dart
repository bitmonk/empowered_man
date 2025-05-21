import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/power_score_stats/data/model/power_stat_model.dart';
import 'package:empowered/features/power_score_stats/data/source/power_score_remote_source.dart';

class PowerScoreController extends GetxController {
  PowerScoreController({required this.remoteSource});
  final PowerScoreRemoteSource remoteSource;

  CancelToken? _cancelToken;
  Rx<TheStates> getPowerScoreStatsState = TheStates.initial.obs;
  Rx<PowerStatModel> powerScoreResponse = const PowerStatModel().obs;
  Rx<String?> scoreError = Rx<String?>(null);
  Future<void> getPowerScoreStats({
    required String? fromDate,
    required String? toDate,
    CancelToken? cancelToken,
  }) async {
    getPowerScoreStatsState.value = TheStates.loading;
    _cancelToken = CancelToken();
    scoreError.value = null;
    final result = await remoteSource.getPowerScore(
      fromDate: fromDate,
      toDate: toDate,
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
}
