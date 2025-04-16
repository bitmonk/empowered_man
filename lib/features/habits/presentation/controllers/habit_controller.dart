import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/habits/data/source/habit_remote_source.dart';

class HabitController extends GetxController {
  HabitController({required this.remoteSource});
  final HabitRemoteSource remoteSource;

  Rx<TheStates> getHabitState = TheStates.initial.obs;
  Rx<TheStates> updateHabitState = TheStates.initial.obs;

  CancelToken? _cancelToken;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx<String?> chapterError = Rx<String?>(null);
  Rx<String?> queryText = Rx<String?>(null);

  @override
  void onClose() {
    _cancelToken?.cancel();
    super.onClose();
  }

  Future<bool> getHabit({
    CancelToken? cancelToken,
  }) async {
    getHabitState.value = TheStates.loading;
    _cancelToken = CancelToken();

    final result = await remoteSource.getHabit(
      cancelToken: _cancelToken,
    );

    return result.fold(
      (l) {
        getHabitState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) async {
        Get.back();
        AppUtils.showSnackbar(message: r);
        getHabitState.value = TheStates.success;
        return true;
      },
    );
  }

  Future<bool> updateHabit({
    required String habitId,
    required String status,
    required String habitDate,
    CancelToken? cancelToken,
  }) async {
    updateHabitState.value = TheStates.loading;
    _cancelToken = CancelToken();

    final result = await remoteSource.updateHabit(
        habitId: habitId,
        status: status,
        habitDate: habitDate,
        cancelToken: cancelToken,);

    return result.fold(
      (l) {
        updateHabitState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) async {
        Get.back();
        AppUtils.showSnackbar(message: r);
        updateHabitState.value = TheStates.success;
        return true;
      },
    );
  }

  void cancelRequest({
    bool cancelChapterToken = false,
    bool cancelCourseToken = false,
    bool cancelMakChapterCompleteToken = false,
  }) {
    _cancelToken?.cancel();
  }
}
