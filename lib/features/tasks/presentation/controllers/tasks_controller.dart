import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tasks/data/model/add_task_request_model.dart';
import 'package:empowered/features/tasks/data/model/task_model.dart';
import 'package:empowered/features/tasks/data/source/tasks_remote_source.dart';
import 'package:intl/intl.dart';

class TasksController extends GetxController {
  TasksController({required this.remoteSource});
  final TasksRemoteSource remoteSource;
  RxList<DaysFilterModel> daysList = <DaysFilterModel>[].obs;
  late Rx<DateTime> fromDate;
  late Rx<DateTime> toDate;

  RxList<String> taskCategoryTitle =
      ['Hit List', 'Mit List', 'Do List', 'Achieved List', 'Done List'].obs;

  RxList<String> levelList = <String>[].obs;
  RxList<String> completionStatusList = <String>[].obs;
  RxList<String> prioritiesList = <String>[].obs;

  RxBool isExpandedHitList = false.obs;
  RxBool isExpandedMitList = false.obs;
  RxBool isExpandedDoList = false.obs;
  RxBool isExpandedAchievedList = false.obs;
  RxBool isExpandedDoneList = false.obs;

  Rx<DateTime> selectedDate = DateTime.now().obs;
  late TextEditingController searchTextController;

  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    fromDate = _getMonday(DateTime.now()).obs;
    toDate = fromDate.value.add(const Duration(days: 6)).obs;
    _generateWeek();
    getTaskEnums();
    scrollController = ScrollController();
    searchTextController = TextEditingController();
  }

  void resetValue() {
    daysList.clear();
    fromDate = _getMonday(DateTime.now()).obs;
    toDate = fromDate.value.add(const Duration(days: 6)).obs;
    _generateWeek();
    selectedDate.value = DateTime.now();
    getTask();
  }

  @override
  void onClose() {
    scrollController.dispose();
    searchTextController = TextEditingController();
    _cancelToken?.cancel();
  }

  CancelToken? _cancelToken;
  Rx<TheStates> getTaskEnumState = TheStates.initial.obs;
  Rx<TheStates> addTaskState = TheStates.initial.obs;
  Rx<TheStates> getTaskState = TheStates.initial.obs;
  Rx<TheStates> delTaskState = TheStates.initial.obs;
  Rx<TheStates> changeTaskLevelState = TheStates.initial.obs;
  Rx<TheStates> markMainTaskCompletedState = TheStates.initial.obs;
  Rx<TheStates> mmarkSubTaskCompletedState = TheStates.initial.obs;

  Future<void> getTaskEnums() async {
    getTaskEnumState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.getTaskEnums(
      cancelToken: _cancelToken,
    );
    result.fold(
      (l) {
        getTaskEnumState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) {
        levelList.assignAll(r.data?.levels ?? []);
        completionStatusList.assignAll(r.data?.completionStatus ?? []);
        prioritiesList.assignAll(r.data?.priorities ?? []);
        getTaskEnumState.value = TheStates.success;
      },
    );
  }

  Rx<TaskCategory?> hitData = Rx<TaskCategory?>(null);
  Rx<TaskCategory?> mitData = Rx<TaskCategory?>(null);
  Rx<TaskCategory?> achievedData = Rx<TaskCategory?>(null);
  Rx<TaskCategory?> doData = Rx<TaskCategory?>(null);
  Rx<TaskCategory?> doneData = Rx<TaskCategory?>(null);

  Future<void> getTask({
    String? day,
  }) async {
    getTaskState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.getTask(
        cancelToken: _cancelToken,
        day: DateFormat('EEEE').format(selectedDate.value),);
    result.fold(
      (l) {
        getTaskState.value = TheStates.error;
        getTaskError.value = l.message;
      },
      (r) {
        hitData.value = r.data?[0].hitList;
        mitData.value = r.data?[0].mitList;
        achievedData.value = r.data?[0].achieved;
        doData.value = r.data?[0].doList;
        doneData.value = r.data?[0].done;

        getTaskState.value = TheStates.success;
      },
    );
  }

  Rx<String?> getTaskError = Rx<String?>(null);

  Future<void> addTask({required AddTaskRequestModel body}) async {
    addTaskState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result =
        await remoteSource.addTask(body: body, cancelToken: _cancelToken);
    result.fold(
      (l) {
        addTaskState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) {
        Get.back();
        AppUtils.showSnackbar(message: r);
        getTask();
        addTaskState.value = TheStates.success;
      },
    );
  }

  Future<void> deleteTask({
    required String taskId,
  }) async {
    delTaskState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.deleteTask(
      taskId: taskId,
      cancelToken: _cancelToken,
    );
    result.fold(
      (l) {
        delTaskState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) {
        delTaskState.value = TheStates.success;
      },
    );
  }

  Future<void> changeTaskLevel({
    required String taskId,
  }) async {
    changeTaskLevelState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.changeTaskLevel(
      taskId: taskId,
      cancelToken: _cancelToken,
    );
    result.fold(
      (l) {
        changeTaskLevelState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) {
        changeTaskLevelState.value = TheStates.success;
      },
    );
  }

  Future<void> markMainTaskCompleted({
    required String taskId,
  }) async {
    markMainTaskCompletedState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.markMainTaskCompleted(
      taskId: taskId,
      cancelToken: _cancelToken,
    );
    result.fold(
      (l) {
        markMainTaskCompletedState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) {
        markMainTaskCompletedState.value = TheStates.success;
      },
    );
  }

  Future<bool> markSubTaskCompleted({
    required String taskId,
    required String subTaskId,
  }) async {
    mmarkSubTaskCompletedState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.markSubTaskCompleted(
      subTaskId: subTaskId,
      taskId: taskId,
      cancelToken: _cancelToken,
    );
    return result.fold(
      (l) {
        mmarkSubTaskCompletedState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        mmarkSubTaskCompletedState.value = TheStates.success;
        return true;
      },
    );
  }

  void cancelRequest() {
    _cancelToken?.cancel();
    addTaskState.value = TheStates.initial;
  }

  void _generateWeek() {
    daysList.clear();

    var current = fromDate.value;
    while (!current.isAfter(toDate.value)) {
      final dayLetter = DateFormat('E').format(current)[0]; // e.g. 'M', 'T'
      final formattedDate = current; // full date
      daysList.add(DaysFilterModel(title: dayLetter, date: formattedDate));
      current = current.add(const Duration(days: 1));
    }
  }

  /// Get Monday of the week for a given date
  DateTime _getMonday(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  /// Change week by offset (positive for next, negative for previous)
  void changeWeek(int weekOffset) {
    fromDate.value = fromDate.value.add(Duration(days: 7 * weekOffset));
    toDate.value = fromDate.value.add(const Duration(days: 6));
    selectedDate.value = fromDate.value;
    _generateWeek();
    getTask();
  }

  /// Get formatted date range string
  String getDateRange() {
    toDate.value = fromDate.value.add(const Duration(days: 6));
    return "${DateFormat("dd.MM").format(fromDate.value)} - ${DateFormat("dd.MM").format(toDate.value)}";
  }
}

class DaysFilterModel {
  DaysFilterModel({required this.title, required this.date});

  final String title;
  final DateTime date;
}
