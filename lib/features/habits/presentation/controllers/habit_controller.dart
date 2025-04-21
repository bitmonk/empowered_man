import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/habits/data/model/habit_model.dart';
import 'package:empowered/features/habits/data/source/habit_remote_source.dart';
import 'package:intl/intl.dart';

class HabitController extends GetxController {
  HabitController({required this.remoteSource});
  final HabitRemoteSource remoteSource;

  Rx<TheStates> getHabitState = TheStates.initial.obs;
  Rx<TheStates> updateHabitState = TheStates.initial.obs;

  CancelToken? _cancelToken;

  Rx<String?> getHabitError = Rx<String?>(null);

  late Rx<DateTime> fromDate;
  late Rx<DateTime> toDate;

  RxMap<String, List<(String, SubDomain)>> weeklyHabits =
      <String, List<(String, SubDomain)>>{}.obs;

  RxInt totalHabits = 0.obs;
  RxInt totalCompletedHabits = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fromDate = _getMonday(DateTime.now()).obs;
    toDate = fromDate.value.add(const Duration(days: 6)).obs;
    getHabit();
  }

  void resetValue() {
    fromDate = _getMonday(DateTime.now()).obs;
    toDate = fromDate.value.add(const Duration(days: 6)).obs;

    getHabit();
  }

  @override
  void onClose() {
    _cancelToken?.cancel();
    super.onClose();
  }

  Future<void> getHabit() async {
    getHabitState.value = TheStates.loading;
    getHabitError.value = null;
    totalHabits.value = 0;
    totalCompletedHabits.value = 0;
    _cancelToken = CancelToken();

    final result = await remoteSource.getHabit(
      fromDate: DateFormat('yyyy-MM-dd').format(fromDate.value),
      toDate: DateFormat('yyyy-MM-dd').format(toDate.value),
      cancelToken: _cancelToken,
    );

    result.fold(
      (l) {
        getHabitState.value = TheStates.error;
        getHabitError.value = l.message;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) async {
        weeklyHabits.value = convertDomainToWeeklyHabits(r.domain ?? {});
        habitCounter();
        getHabitState.value = TheStates.success;
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
      cancelToken: cancelToken,
    );

    return result.fold(
      (l) {
        updateHabitState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) async {
        updateHabitState.value = TheStates.success;
        getHabit();
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

  /// Get Monday of the week for a given date
  DateTime _getMonday(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  /// Change week by offset (positive for next, negative for previous)
  void changeWeek(int weekOffset) {
    fromDate.value = fromDate.value.add(Duration(days: 7 * weekOffset));
    toDate.value = fromDate.value.add(const Duration(days: 6));
    getHabitError.value = null;
    totalHabits.value = 0;
    totalCompletedHabits.value = 0;
    getHabit();
  }

  /// Get formatted date range string
  String getDateRange() {
    toDate.value = fromDate.value.add(const Duration(days: 6));
    return "${DateFormat("dd.MM").format(fromDate.value)} - ${DateFormat("dd.MM").format(toDate.value)}";
  }

  Map<String, List<(String, SubDomain)>> convertDomainToWeeklyHabits(
    Map<String, Map<String, SubDomain>> domain,
  ) {
    return domain.map((outerKey, innerMap) {
      final list = innerMap.entries.map((e) => (e.key, e.value)).toList();

      return MapEntry(outerKey, list);
    });
  }

  void habitCounter() {
    for (final k in weeklyHabits.values) {
      totalHabits.value += k.length;
      for (final k2 in k) {
        totalCompletedHabits.value +=
            k2.$2.trackedData?.where((e2) => e2.status == 1).toList().length ??
                0;
      }
    }
  }
}
