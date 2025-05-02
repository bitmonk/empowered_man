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

  RxList<String> taskCategoryTitle = <String>[].obs;
  List<String> getTaskCategoryTitle(String level) {
    var level0 = level.toLowerCase();

    // Forward mapping
    final forward = <String, List<String>>{
      'hit list': ['Mit List', 'Do List'],
      'mit list': ['Achieved List'],
      'do list': ['Done List'],
    };

    // Reverse mapping
    final reverse = <String, List<String>>{
      'mit list': ['Hit List'],
      'do list': ['Hit List'],
      'achieved list': ['Mit List'],
      'done list': ['Do List'],
    };

    // Combine both forward and reverse
    var combined = <String>[
      ...(forward[level0] ?? []),
      ...(reverse[level0] ?? []),
    ];

    if (combined.isEmpty) {
      taskCategoryTitle.clear();
    } else {
      taskCategoryTitle.assignAll(combined);
    }
    return taskCategoryTitle;
  }

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

  void closeExpandedTiles() {
    isExpandedHitList.value = false;
    isExpandedMitList.value = false;
    isExpandedDoList.value = false;
    isExpandedAchievedList.value = false;
    isExpandedDoneList.value = false;
  }

  void resetValue() {
    daysList.clear();
    closeExpandedTiles();
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
  // Rx<TheStates> changeTaskLevelState = TheStates.initial.obs;
  // Rx<TheStates> markMainTaskCompletedState = TheStates.initial.obs;
  // Rx<TheStates> mmarkSubTaskCompletedState = TheStates.initial.obs;
  RxSet<int> markingMainTaskIds = <int>{}.obs;
  RxSet<int> markingSubTaskIds = <int>{}.obs;
  RxSet<int> changingTaskIds = <int>{}.obs;

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
      day: DateFormat('EEEE').format(selectedDate.value),
    );
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

  Future<void> addTask({required AddTaskRequestModel body, String? id}) async {
    addTaskState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.addTask(
      body: body,
      cancelToken: _cancelToken,
      id: id,
    );
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
        Get.back();
        getTask();
        AppUtils.showErrorSnackbar(message: r);
      },
    );
  }

  Future<void> changeTaskLevel({
    required String taskId,
    String? level,
    String? completionStatus,
  }) async {
    // changeTaskLevelState.value = TheStates.loading;
    final id = int.tryParse(taskId);
    if (id == null) return;
    changingTaskIds.add(id);
    _cancelToken = CancelToken();
    try {
      final result = await remoteSource.changeTaskLevel(
        taskId: taskId,
        completionStatus: completionStatus,
        level: level,
        cancelToken: _cancelToken,
      );
      result.fold(
        (l) {
          // changeTaskLevelState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) {
          // changeTaskLevelState.value = TheStates.success;
          AppUtils.showErrorSnackbar(message: r);
          getTask();
        },
      );
    } finally {
      changingTaskIds.remove(id);
    }
  }

  Future<void> markMainTaskCompleted({
    required String taskId,
  }) async {
    // markMainTaskCompletedState.value = TheStates.loading;
    final id = int.tryParse(taskId);
    if (id == null) return;
    markingMainTaskIds.add(id);
    _cancelToken = CancelToken();
    try {
      final result = await remoteSource.markMainTaskCompleted(
        taskId: taskId,
        cancelToken: _cancelToken,
      );
      result.fold(
        (l) {
          // markMainTaskCompletedState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) {
          getTask();
          // markMainTaskCompletedState.value = TheStates.success;
        },
      );
    } finally {
      markingMainTaskIds.remove(id);
    }
  }

  Future<bool> markSubTaskCompleted({
    required String taskId,
    required String subTaskId,
  }) async {
    // mmarkSubTaskCompletedState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final id = int.tryParse(subTaskId);
    markingSubTaskIds.add(id!);
    try {
      final result = await remoteSource.markSubTaskCompleted(
        subTaskId: subTaskId,
        taskId: taskId,
        cancelToken: _cancelToken,
      );
      return result.fold(
        (l) {
          // mmarkSubTaskCompletedState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
          return false;
        },
        (r) {
          getTask();
          // mmarkSubTaskCompletedState.value = TheStates.success;
          return true;
        },
      );
    } finally {
      markingSubTaskIds.remove(id);
    }
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
