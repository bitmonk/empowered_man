import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/data/model/goals_overview_model.dart';
import 'package:empowered/features/goals/data/source/goals_overview_source.dart';

class GoalsOverviewController extends GetxController {
  GoalsOverviewController({required this.remoteSource});
  final GoalsOverviewRemoteSource remoteSource;

  Rx<TheStates> getGoalsState = TheStates.initial.obs;
  CancelToken? _cancelToken;
  Rx<String?> getGoalsOverviewError = Rx<String?>(null);
  RxList<String> months = <String>[].obs;

  RxInt currentQuarter = 1.obs;
  RxInt selectedYear = DateTime.now().year.obs;

  Rx<GoalsOverviewModel?> goalOverview = Rx<GoalsOverviewModel?>(null);

  @override
  void onInit() {
    super.onInit();
    selectedYear.value = DateTime.now().year;
    currentQuarter.value = _getCurrentQuarter();
    months.value = _getMonthsForQuarter(currentQuarter.value);
    getGoalsOverview();
  }

  void resetValue() {
    selectedYear.value = DateTime.now().year;
    currentQuarter.value = _getCurrentQuarter();
    months.value = _getMonthsForQuarter(currentQuarter.value);
    getGoalsOverview();
  }

  Map<String, bool> getMonthlyGoalsForSpecificMonth(
      int quarter, int monthIndex) {
    if (goalOverview.value == null) return {};

    final quarterData = switch (quarter) {
      1 => goalOverview.value!.data!.goalOverview!.q1,
      2 => goalOverview.value!.data!.goalOverview!.q2,
      3 => goalOverview.value!.data!.goalOverview!.q3,
      4 => goalOverview.value!.data!.goalOverview!.q4,
      _ => null,
    };

    if (quarterData?.months == null ||
        quarterData!.months!.isEmpty ||
        monthIndex >= quarterData.months!.length) {
      return {};
    }

    return Map<String, bool>.from(quarterData.months![monthIndex]);
  }

// Add this method to get categories for yearly goals
  List<String> getCategoriesForYear() {
    if (goalOverview.value == null) return [];

    final yearlyGoals = goalOverview.value!.data!.goalOverview!.yearlyGoals;

    if (yearlyGoals != null) {
      return yearlyGoals.keys.toList();
    }
    return [];
  }

  int _getCurrentQuarter() {
    final now = DateTime.now();
    return ((now.month - 1) ~/ 3) + 1;
  }

  Future<void> getGoalsOverview() async {
    getGoalsState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.getGoalsOverview(
      year: selectedYear.value.toString(),
    );

    return result.fold(
      (l) {
        getGoalsState.value = TheStates.error;
        getGoalsOverviewError.value = l.message;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) async {
        goalOverview.value = r;
        getGoalsState.value = TheStates.success;
      },
    );
  }

  void changeQuarter(int offset) {
    var newQuarter = currentQuarter.value + offset;
    if (newQuarter >= 1 && newQuarter <= 4) {
      currentQuarter.value = newQuarter;
      months.value = _getMonthsForQuarter(currentQuarter.value);
    }
  }

  void setQuarter(int quarter) {
    if (quarter >= 1 && quarter <= 4) {
      currentQuarter.value = quarter;
      months.value = _getMonthsForQuarter(currentQuarter.value);
    }
  }

  void changeYear(int year) {
    selectedYear.value = year;
    getGoalsOverview();
  }

  List<String> _getMonthsForQuarter(int quarter) {
    switch (quarter) {
      case 1:
        return ['January', 'February', 'March'];
      case 2:
        return ['April', 'May', 'June'];
      case 3:
        return ['July', 'August', 'September'];
      case 4:
        return ['October', 'November', 'December'];
      default:
        return ['October', 'November', 'December'];
    }
  }

  List<String> getCategoriesForQuarter() {
    if (goalOverview.value == null) return [];

    final months = goalOverview.value!.data!.goalOverview!.q1?.quarterlyGoals;

    final allKeys = <String>{};

    if (months != null) {
      allKeys.addAll(months.keys);
    }
    return allKeys.toList();
  }

  List<String> getCategoriesForMonths() {
    if (goalOverview.value == null) return [];

    final months = goalOverview.value!.data!.goalOverview!.q1?.months;

    final allKeys = <String>{};

    if (months != null) {
      for (final month in months) {
        allKeys.addAll(month.keys);
      }
    }
    return allKeys.toList();
  }

  Map<String, bool> getQuarterlyGoalsMap(int quarter) {
    if (goalOverview.value == null) return {};
    final quarterData = switch (quarter) {
      1 => goalOverview.value!.data!.goalOverview!.q1,
      2 => goalOverview.value!.data!.goalOverview!.q2,
      3 => goalOverview.value!.data!.goalOverview!.q3,
      4 => goalOverview.value!.data!.goalOverview!.q4,
      _ => null,
    };
    if (quarterData?.quarterlyGoals == null ||
        quarterData!.quarterlyGoals!.isEmpty) {
      return {};
    }
    final combinedGoals = <String, bool>{}..addAll(quarterData.quarterlyGoals!);

    return combinedGoals;
  }

  Map<String, bool> getMonthlyGoalsMap(int quarter) {
    if (goalOverview.value == null) return {};

    final quarterData = switch (quarter) {
      1 => goalOverview.value!.data!.goalOverview!.q1,
      2 => goalOverview.value!.data!.goalOverview!.q2,
      3 => goalOverview.value!.data!.goalOverview!.q3,
      4 => goalOverview.value!.data!.goalOverview!.q4,
      _ => null,
    };

    if (quarterData?.months == null || quarterData!.months!.isEmpty) return {};

    final combinedGoals = <String, bool>{};

    for (final monthGoals in quarterData.months!) {
      combinedGoals.addAll(monthGoals);
    }

    return combinedGoals;
  }

  void updateQuarterlyGoal(int quarter, String category, bool isSelected) {
    if (goalOverview.value == null) return;

    final quarterField = 'q$quarter';
    final quarterData = goalOverview.value!.data!.goalOverview!
        .toJson()[quarterField] as Map<String, dynamic>;

    final quarterlyGoals = Map<String, bool>.from(
      quarterData['quarterly_goals'].cast<String, bool>(),
    );

    quarterlyGoals[category] = isSelected;

    // Update the model
    final newData = Data(
      goalOverview: GoalOverview(
        q1: quarter == 1
            ? Quarter(
                months: quarterData['months'],
                quarterlyGoals: quarterlyGoals,
              )
            : goalOverview.value!.data!.goalOverview!.q1,
        q2: quarter == 2
            ? Quarter(
                months: quarterData['months'],
                quarterlyGoals: quarterlyGoals,
              )
            : goalOverview.value!.data!.goalOverview!.q2,
        q3: quarter == 3
            ? Quarter(
                months: quarterData['months'],
                quarterlyGoals: quarterlyGoals,
              )
            : goalOverview.value!.data!.goalOverview!.q3,
        q4: quarter == 4
            ? Quarter(
                months: quarterData['months'],
                quarterlyGoals: quarterlyGoals,
              )
            : goalOverview.value!.data!.goalOverview!.q4,
        yearlyGoals: goalOverview.value!.data!.goalOverview!.yearlyGoals,
      ),
    );

    goalOverview.value = GoalsOverviewModel(
      status: goalOverview.value!.status,
      message: goalOverview.value!.message,
      data: newData,
    );
  }
}
