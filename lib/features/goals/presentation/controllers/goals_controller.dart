import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/data/model/goals_answer_response_model.dart';
import 'package:empowered/features/goals/data/model/goals_model.dart';
import 'package:empowered/features/goals/data/model/goals_updated_answer_model.dart';
import 'package:empowered/features/goals/data/source/goals_remote_source.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_chat_bindings.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_chat_controller.dart';
import 'package:empowered/features/goals/presentation/screens/goals_chat_screen.dart';
import 'package:intl/intl.dart';

class GoalsController extends GetxController {
  GoalsController({required this.remoteSource});
  final GoalsRemoteSource remoteSource;

  Rx<TheStates> getGoalsState = TheStates.initial.obs;
  CancelToken? _cancelToken;
  Rx<TheStates> achieveTargetState = TheStates.initial.obs;
  Rx<TheStates> markOnTrackState = TheStates.initial.obs;
  Rx<TheStates> completeGoalState = TheStates.initial.obs;
  Rx<GoalsUpdatedAnswerModel?> markOnTrackModel =
      Rx<GoalsUpdatedAnswerModel?>(null);
  Rx<GoalsUpdatedAnswerModel?> completeGoalModel =
      Rx<GoalsUpdatedAnswerModel?>(null);

  Rx<GoalsUpdatedAnswerModel?> achieveTargetModel =
      Rx<GoalsUpdatedAnswerModel?>(null);
  Rx<String?> getGoalsError = Rx<String?>(null);
  Rx<String?> markOnTrackError = Rx<String?>(null);
  Rx<String?> achieveTargetError = Rx<String?>(null);
  Rx<String?> completeGoalError = Rx<String?>(null);
  late Rx<DateTime> fromDate;
  late Rx<DateTime> toDate;

  Rx<GoalsModel?> goalsModel = Rx<GoalsModel?>(null);
  RxInt selectedGoalIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fromDate = _getMonday(DateTime.now()).obs;
    toDate = fromDate.value.add(const Duration(days: 6)).obs;
    getGoals();
  }

  void resetValue() {
    fromDate.value = _getMonday(DateTime.now());
    toDate = fromDate.value.add(const Duration(days: 6)).obs;
    // selectedGoalIndex.value = 0;
    getGoals();
  }

  DateTime _getMonday(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  @override
  void onClose() {
    _cancelToken?.cancel();
    super.onClose();
  }

  bool get isCurrentWeek {
    final currentMonday = _getMonday(DateTime.now());
    final selectedMonday = _getMonday(fromDate.value);

    final currentDateOnly =
        DateTime(currentMonday.year, currentMonday.month, currentMonday.day);
    final selectedDateOnly =
        DateTime(selectedMonday.year, selectedMonday.month, selectedMonday.day);

    final isSameWeek = currentDateOnly.isAtSameMomentAs(selectedDateOnly);

    return isSameWeek;
  }

  Future<void> getGoals() async {
    getGoalsState.value = TheStates.loading;
    getGoalsError.value = null;

    _cancelToken = CancelToken();

    final result = await remoteSource.getGoals(
      fromDate: DateFormat('yyyy-MM-dd').format(fromDate.value),
      toDate: DateFormat('yyyy-MM-dd').format(toDate.value),
      cancelToken: _cancelToken,
    );

    result.fold(
      (l) {
        getGoalsState.value = TheStates.error;
        getGoalsError.value = l.message;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) async {
        goalsModel.value = r;
        getGoalsState.value = TheStates.success;
      },
    );
  }

  Future<void> achieveTarget({required String goalAnswerId}) async {
    achieveTargetState.value = TheStates.loading;
    achieveTargetError.value = null;

    _cancelToken = CancelToken();

    final result = await remoteSource.achieveTarget(
      id: goalAnswerId,
      cancelToken: _cancelToken,
    );

    result.fold(
      (l) {
        achieveTargetState.value = TheStates.error;
        achieveTargetError.value = l.message;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) async {
        achieveTargetModel.value = r;
        achieveTargetState.value = TheStates.success;
        await getGoals();
      },
    );
  }

  Future<void> markOnTrack({
    required String id,
    required bool onTrack,
  }) async {
    markOnTrackState.value = TheStates.loading;
    markOnTrackError.value = null;

    _cancelToken = CancelToken();

    final result = await remoteSource.markOnTrack(
      id: id,
      onTrack: onTrack,
      cancelToken: _cancelToken,
    );

    result.fold(
      (l) {
        markOnTrackState.value = TheStates.error;
        markOnTrackError.value = l.message;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) async {
        markOnTrackModel.value = r;
        markOnTrackState.value = TheStates.success;
        await getGoals();
      },
    );
  }

  Future<void> completeGoal({
    required String id,
    required bool complateGoal,
  }) async {
    completeGoalState.value = TheStates.loading;
    completeGoalError.value = null;

    _cancelToken = CancelToken();

    final result = await remoteSource.completeGoal(
      id: id,
      complateGoal: complateGoal,
      cancelToken: _cancelToken,
    );

    result.fold(
      (l) {
        completeGoalState.value = TheStates.error;
        completeGoalError.value = l.message;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) async {
        completeGoalModel.value = r;
        completeGoalState.value = TheStates.success;
        await getGoals();
      },
    );
  }

  Future<void> toggleGoalAnswerAchievement({
    required String goalAnswerId,
    required bool currentStatus,
  }) async {
    await achieveTarget(
      goalAnswerId: goalAnswerId,
    );
  }

  void toggleGoalSelection(
    int index,
    List<GoalsAnswerResponseModel> goalAnswers,
  ) {
    if (index >= 0 && index < goalAnswers.length) {
      final goalAnswer = goalAnswers[index];
      if (goalAnswer.data!.id != null) {
        toggleGoalAnswerAchievement(
          goalAnswerId: goalAnswer.data!.id.toString(),
          currentStatus: goalAnswer.data!.achieved ?? false,
        );
      }
    }
  }

  Future<void> toggleGoalAnswerFromUserGoals({
    required int goalIndex,
    required String timePeriod,
    required int goalAnswerIndex,
  }) async {
    final goals = availableGoals;
    if (goalIndex < 0 || goalIndex >= goals.length) return;

    final goal = goals[goalIndex];
    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) return;

    // Get all goal answers from all user goals
    var allGoalAnswers = <GoalAnswer>[];
    for (final detail in targetDetails) {
      if (detail.userGoals != null) {
        for (final userGoal in detail.userGoals!) {
          if (userGoal.goalAnswers != null) {
            allGoalAnswers.addAll(userGoal.goalAnswers!);
          }
        }
      }
    }

    if (goalAnswerIndex < 0 || goalAnswerIndex >= allGoalAnswers.length) return;

    final goalAnswer = allGoalAnswers[goalAnswerIndex];
    if (goalAnswer.id != null) {
      await achieveTarget(goalAnswerId: goalAnswer.id.toString());
    }
  }

  Future<void> updateTrackingStatus({
    required int goalIndex,
    required String timePeriod,
    required bool isOnTrack,
  }) async {
    final goals = availableGoals;
    if (goalIndex < 0 || goalIndex >= goals.length) return;

    final goal = goals[goalIndex];
    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) return;

    for (final detail in targetDetails) {
      if (detail.userGoals != null && detail.userGoals!.isNotEmpty) {
        final userGoal = detail.userGoals!.first;
        if (userGoal.id != null) {
          await achieveTarget(goalAnswerId: userGoal.id.toString());
          break;
        }
      }
    }
  }

  List<GoalAnswer> getGoalAnswersForIndex(int goalIndex, String timePeriod) {
    final goals = availableGoals;
    if (goalIndex < 0 || goalIndex >= goals.length) return [];

    final goal = goals[goalIndex];
    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) return [];

    var allGoalAnswers = <GoalAnswer>[];
    for (final detail in targetDetails) {
      if (detail.userGoals != null) {
        for (final userGoal in detail.userGoals!) {
          if (userGoal.goalAnswers != null) {
            allGoalAnswers.addAll(userGoal.goalAnswers!);
          }
        }
      }
    }

    return allGoalAnswers;
  }

  bool? getCurrentTrackingState(int goalIndex, String timePeriod) {
    final goals = availableGoals;
    if (goalIndex < 0 || goalIndex >= goals.length) return null;

    final goal = goals[goalIndex];
    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) return null;

    for (final detail in targetDetails) {
      if (detail.userGoals != null && detail.userGoals!.isNotEmpty) {
        final userGoal = detail.userGoals!.first;
        if (userGoal.isOntrack != null) {
          if (userGoal.isOntrack is bool) {
            return userGoal.isOntrack as bool;
          } else if (userGoal.isOntrack is int) {
            return (userGoal.isOntrack as int) == 1;
          }
        }
      }
    }

    return null;
  }

  bool shouldShowWonQuestionForIndex(int goalIndex, String timePeriod) {
    final goals = availableGoals;
    if (goalIndex < 0 || goalIndex >= goals.length) return false;

    final goal = goals[goalIndex];
    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) return false;

    for (final detail in targetDetails) {
      if (detail.userGoals != null) {
        for (final userGoal in detail.userGoals!) {
          if (userGoal.showWonQuestion == true) {
            return true;
          }
        }
      }
    }

    return false;
  }

  bool shouldShowTrackQuestionForIndex(int goalIndex, String timePeriod) {
    final goals = availableGoals;
    if (goalIndex < 0 || goalIndex >= goals.length) return false;

    final goal = goals[goalIndex];
    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) return false;

    for (final detail in targetDetails) {
      if (detail.userGoals != null) {
        for (final userGoal in detail.userGoals!) {
          if (userGoal.showTrackQuestion == true ||
              (userGoal.goalAnswers != null &&
                  userGoal.goalAnswers!.isNotEmpty)) {
            return true;
          }
        }
      }
    }

    return false;
  }

  bool shouldShowActionButtons(int goalIndex, String timePeriod) {
    final goals = availableGoals;
    if (goalIndex < 0 || goalIndex >= goals.length) return false;

    final goal = goals[goalIndex];
    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) return false;

    for (final detail in targetDetails) {
      if (detail.userGoals != null) {
        for (final userGoal in detail.userGoals!) {
          if (userGoal.isOntrack == null && userGoal.isComplete == null) {
            return true;
          }
        }
      }
    }

    return false;
  }

  bool? isWon(int goalIndex, String timePeriod) {
    final goals = availableGoals;
    if (goalIndex < 0 || goalIndex >= goals.length) return null;

    final goal = goals[goalIndex];
    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) return null;

    for (final detail in targetDetails) {
      if (detail.userGoals != null) {
        for (final userGoal in detail.userGoals!) {
          if (userGoal.isOntrack == null && userGoal.isComplete == true) {
            return true;
          } else if (userGoal.isOntrack == null &&
              userGoal.isComplete == false) {
            return false;
          } else {
            return null;
          }
        }
      }
    }

    return null;
  }

  bool? isOnTrack(int goalIndex, String timePeriod) {
    final goals = availableGoals;
    if (goalIndex < 0 || goalIndex >= goals.length) return null;

    final goal = goals[goalIndex];
    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) return null;

    for (final detail in targetDetails) {
      if (detail.userGoals != null) {
        for (final userGoal in detail.userGoals!) {
          if (userGoal.isComplete == null && userGoal.isOntrack == true) {
            return true;
          } else if (userGoal.isComplete == null &&
              userGoal.isOntrack == false) {
            return false;
          } else {
            return null;
          }
        }
      }
    }

    return null;
  }

  bool shouldShowWonQuestionButton(int goalIndex, String timePeriod) {
    return shouldShowActionButtons(goalIndex, timePeriod);
  }

  bool shouldShowTrackQuestionButton(int goalIndex, String timePeriod) {
    return shouldShowActionButtons(goalIndex, timePeriod);
  }

  bool? getIsWon(int goalIndex, String timePeriod) {
    return isWon(goalIndex, timePeriod);
  }

  bool? getIsOnTrack(int goalIndex, String timePeriod) {
    return isOnTrack(goalIndex, timePeriod);
  }

  void changeWeek(int weekOffset) {
    fromDate.value = fromDate.value.add(Duration(days: 7 * weekOffset));
    toDate.value = fromDate.value.add(const Duration(days: 6));
    getGoalsError.value = null;
    getGoals();
  }

  String getDateRange() {
    // toDate.value = fromDate.value.add(const Duration(days: 6));
    return "${DateFormat("dd.MM").format(fromDate.value)} - ${DateFormat("dd.MM").format(toDate.value)}";
  }

  void updateSelectedGoalIndex(int index) {
    selectedGoalIndex.value = index;
  }

  List<Goal> get availableGoals {
    return goalsModel.value?.data?.goals ?? [];
  }

  // Get the currently selected goal
  Goal? get selectedGoal {
    final goals = availableGoals;
    if (goals.isEmpty || selectedGoalIndex.value >= goals.length) {
      return null;
    }
    return goals[selectedGoalIndex.value];
  }

  // Get selected goal title
  String get selectedGoalTitle {
    return selectedGoal?.title ?? 'Goal';
  }

  // Get selected goal ID for navigation
  String get selectedGoalId {
    final goal = selectedGoal;
    if (goal?.id != null) {
      return goal!.id.toString();
    }
    return '';
  }

  // Get goal detail ID for a specific time period for navigation
  String getGoalDetailIdForPeriod(String timePeriod) {
    final goalDetail = getGoalDetailForPeriod(timePeriod);
    if (goalDetail?.id != null) {
      return goalDetail!.id.toString();
    }
    return '';
  }

  // Navigation helper method to get both IDs for a time period
  NavigationIds getNavigationIds(String timePeriod) {
    return NavigationIds(
      goalId: selectedGoalId,
      goalDetailId: getGoalDetailIdForPeriod(timePeriod),
    );
  }

  // Method to handle navigation to goal chat screen
  void navigateToGoalChat({
    required String title,
    required String timePeriod,
  }) {
    if (!isCurrentWeek) {
      AppUtils.showErrorSnackbar(
        message:
            'You can only set targets for the current week, not for other weeks.',
      );
      return;
    }
    final navIds = getNavigationIds(timePeriod);

    if (navIds.goalId.isEmpty) {
      AppUtils.showErrorSnackbar(message: 'No goal selected');
      return;
    }

    // Initialize journal and navigate
    initJournalWithNavigate(
      title: title,
      goalId: navIds.goalId,
      goalDetailId: navIds.goalDetailId,
    );
  }

  // Check if a goal has progress for a specific time period
  bool hasGoalProgress(String timePeriod) {
    final goal = selectedGoal;
    if (goal == null) return false;

    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) {
      return false;
    }

    // Check if any target detail has user goals (meaning it has been started/has progress)
    return targetDetails.any(
      (detail) => detail.userGoals != null && detail.userGoals!.isNotEmpty,
    );
  }

  bool shouldShowStartButton(String timePeriod) {
    final goal = selectedGoal;
    if (goal == null) return true;

    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) {
      return true;
    }

    // Show start button if no user goals exist (not started yet)
    return targetDetails.every(
      (detail) => detail.userGoals == null || detail.userGoals!.isEmpty,
    );
  }

  // Check if goal is completed for a specific time period
  bool isGoalCompleted(String timePeriod) {
    final goal = selectedGoal;
    if (goal == null) return false;

    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) {
      return false;
    }

    // Check if the detail itself is marked as completed
    return targetDetails.any((detail) => detail.isCompleted == true);
  }

  // Get goal progress percentage for a specific time period (for the selected goal)
  String getGoalProgress(String timePeriod) {
    final goal = selectedGoal;
    if (goal == null) return '0%';

    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) {
      return '0%';
    }

    // Get progress from user goals
    for (final detail in targetDetails) {
      if (detail.userGoals != null && detail.userGoals!.isNotEmpty) {
        final userGoal = detail.userGoals!.first;
        return userGoal.progress ?? '0%';
      }
    }

    return '0%';
  }

  // Get user goals for a specific time period (for the selected goal)
  List<UserGoal> getUserGoalsForPeriod(String timePeriod) {
    final goal = selectedGoal;
    if (goal == null) return [];

    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) {
      return [];
    }

    var userGoals = <UserGoal>[];
    for (final detail in targetDetails) {
      if (detail.userGoals != null) {
        userGoals.addAll(detail.userGoals!);
      }
    }

    return userGoals;
  }

  // Get goal detail for a specific time period (for the selected goal)
  Detail? getGoalDetailForPeriod(String timePeriod) {
    final goal = selectedGoal;
    if (goal == null) return null;

    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) {
      return null;
    }

    return targetDetails.first;
  }

  // Check if user has answered questions for tracking (for the selected goal)
  bool hasTrackingQuestions(String timePeriod) {
    final userGoals = getUserGoalsForPeriod(timePeriod);
    return userGoals.any(
      (userGoal) =>
          userGoal.showTrackQuestion == true ||
          (userGoal.goalAnswers != null && userGoal.goalAnswers!.isNotEmpty),
    );
  }

  // Check if user should see won question (for the selected goal)
  bool shouldShowWonQuestion(String timePeriod) {
    final userGoals = getUserGoalsForPeriod(timePeriod);
    return userGoals.any((userGoal) => userGoal.showWonQuestion == true);
  }

  // Get all time periods that have data (for the selected goal)
  List<String> getAvailableTimePeriods() {
    final goal = selectedGoal;
    if (goal == null) return [];

    final periods = <String>[];
    final details =
        goal.details?.where((detail) => detail.type == 'target') ?? [];

    for (final detail in details) {
      if (detail.timePeriod != null && !periods.contains(detail.timePeriod)) {
        periods.add(detail.timePeriod!);
      }
    }

    return periods;
  }

  String getGoalProgressForIndex(int goalIndex, String timePeriod) {
    final goals = availableGoals;
    if (goalIndex < 0 || goalIndex >= goals.length) return '0%';

    final goal = goals[goalIndex];
    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) {
      return '0%';
    }

    for (final detail in targetDetails) {
      if (detail.userGoals != null && detail.userGoals!.isNotEmpty) {
        final userGoal = detail.userGoals!.first;
        return userGoal.progress ?? '0%';
      }
    }

    return '0%';
  }

  // NEW: Check if a specific goal index has progress for a time period
  bool hasGoalProgressForIndex(int goalIndex, String timePeriod) {
    final goals = availableGoals;
    if (goalIndex < 0 || goalIndex >= goals.length) return false;

    final goal = goals[goalIndex];
    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) {
      return false;
    }

    // Check if any target detail has user goals
    return targetDetails.any(
      (detail) => detail.userGoals != null && detail.userGoals!.isNotEmpty,
    );
  }

  // NEW: Check if should show start button for a specific goal index
  bool shouldShowStartButtonForIndex(int goalIndex, String timePeriod) {
    final goals = availableGoals;
    if (goalIndex < 0 || goalIndex >= goals.length) return true;

    final goal = goals[goalIndex];
    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) {
      return true;
    }

    return targetDetails.every(
      (detail) => detail.userGoals == null || detail.userGoals!.isEmpty,
    );
  }

  bool isGoalCompletedForIndex(int goalIndex, String timePeriod) {
    final goals = availableGoals;
    if (goalIndex < 0 || goalIndex >= goals.length) return false;

    final goal = goals[goalIndex];
    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) {
      return false;
    }

    return targetDetails.any((detail) => detail.isCompleted == true);
  }
}

class NavigationIds {
  NavigationIds({
    required this.goalId,
    required this.goalDetailId,
  });
  final String goalId;
  final String goalDetailId;
}

Future<void> initJournalWithNavigate({
  required String title,
  required String goalId,
  required String goalDetailId,
}) async {
  final goalsController = Get.find<GoalsController>();

  // Validate that user can only set targets for current week
  if (!goalsController.isCurrentWeek) {
    AppUtils.showErrorSnackbar(
      message:
          'You can only set targets for the current week, not for other weeks.',
    );
    return;
  }
  GoalsChatInitializer.initialize();
  final goalsChatController = Get.find<GoalsChatController>();
  goalsChatController.title.value = '$title Tent';
  goalsChatController.goalId.value = goalId;
  goalsChatController.goalDetailId.value = goalDetailId;
  await goalsChatController.getGoalsChat();
  if (goalsChatController.getGoalsChatState.value == TheStates.error) {
    AppUtils.showErrorSnackbar(
      message: 'User target already set for this period.',
    );
    return;
  } else {
    Get.to(
      () => GoalsChatScreen(
        goalId: goalId,
        goalDetailId: goalDetailId,
        title: goalsChatController.title.value,
      ),
    );
  }
}
