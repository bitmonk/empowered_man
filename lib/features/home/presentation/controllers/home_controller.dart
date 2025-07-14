import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/data/model/daily_mit_list_model.dart';
import 'package:empowered/features/home/data/model/dashboard_habit_model.dart';
import 'package:empowered/features/home/data/model/dashboard_level_model.dart';
import 'package:empowered/features/home/data/model/dashboard_power_streak_model.dart';
import 'package:empowered/features/home/data/model/my_monthly_model.dart';
import 'package:empowered/features/home/data/source/home_remote_source.dart';

class HomeController extends GetxController {
  HomeController({required this.remoteSource});

  final HomeRemoteSource remoteSource;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dailyMITlists();
    dashboardLevel();
    dashboardHabit();
  }

  // Reactive state for selected tab index
  RxInt selectedTabIndex = 0.obs;

  // Tab contents
  final List<Widget> tabContents = [
    const Center(child: Text('Daily UI', style: TextStyle(fontSize: 18))),
    const Center(child: Text('Weekly UI', style: TextStyle(fontSize: 18))),
    const Center(child: Text('Monthly UI', style: TextStyle(fontSize: 18))),
  ];

  // Method to update the selected tab
  void updateSelectedTab(int index) {
    selectedTabIndex.value = index;
  }

  Rx<TheStates> getMonthlyState = TheStates.initial.obs;
  RxList<MyMonthlyTarget> myMonthlyData = RxList<MyMonthlyTarget>();
  RxnString myMonthlyError = RxnString();
  Future<void> getMyMonthy() async {
    getMonthlyState.value = TheStates.loading;
    final result = await remoteSource.getMyMonthy();
    result.fold(
      (l) {
        myMonthlyError.value = l.message;
        getMonthlyState.value = TheStates.error;
      },
      (r) {
        myMonthlyData.assignAll(r.data?.myMonthlyTargets ?? []);
        getMonthlyState.value = TheStates.success;
      },
    );
  }

  Rx<TheStates> dailyMitListState = TheStates.initial.obs;
  RxList<DailyMIT> dailyMitListData = RxList<DailyMIT>();
  RxnString dailyMitListError = RxnString();
  Future<void> dailyMITlists() async {
    dailyMitListState.value = TheStates.loading;
    final result = await remoteSource.dailyMITlists();
    result.fold(
      (l) {
        dailyMitListError.value = l.message;
        dailyMitListState.value = TheStates.error;
      },
      (r) {
        dailyMitListData.assignAll(r);
        dailyMitListState.value = TheStates.success;
      },
    );
  }

  Rx<TheStates> mitTaskNoteState = TheStates.initial.obs;
  RxnString mitTaskNoteData = RxnString();
  RxnString mitTaskNoteError = RxnString();
  Future<void> mitTaskNote({required String id}) async {
    mitTaskNoteState.value = TheStates.loading;
    final result = await remoteSource.mitTaskNote(id);
    result.fold(
      (l) {
        mitTaskNoteError.value = l.message;
        mitTaskNoteState.value = TheStates.error;
      },
      (r) {
        mitTaskNoteData.value = r;
        mitTaskNoteState.value = TheStates.success;
      },
    );
  }

  Rx<TheStates> dashboardLevelState = TheStates.initial.obs;
  Rx<DaashboardLevelModel> dashboardLevelData =
      const DaashboardLevelModel().obs;
  RxnString dashboardLevelError = RxnString();
  Future<void> dashboardLevel() async {
    dashboardLevelState.value = TheStates.loading;
    final result = await remoteSource.getdashboardLevel();
    result.fold(
      (l) {
        dashboardLevelError.value = l.message;
        dashboardLevelState.value = TheStates.error;
      },
      (r) {
        dashboardLevelData.value = r;
        dashboardLevelState.value = TheStates.success;
      },
    );
  }

  Rx<TheStates> dashboardHabitlState = TheStates.initial.obs;
  RxList<DashboardHabit> dashboardHabitlData = <DashboardHabit>[].obs;
  RxnString dashboardHabitlError = RxnString();
  Future<void> dashboardHabit() async {
    dashboardHabitlState.value = TheStates.loading;
    final result = await remoteSource.dashboardHabit();
    result.fold(
      (l) {
        dashboardHabitlError.value = l.message;
        dashboardHabitlState.value = TheStates.error;
      },
      (r) {
        dashboardHabitlData.assignAll(r.data ?? []);
        dashboardHabitlState.value = TheStates.success;
      },
    );
  }

  Rx<TheStates> updateDashboardHabitState = TheStates.initial.obs;
  RxnString updateDashboardHabitData = RxnString();
  RxnString updateDashboardHabitError = RxnString();
  Future<void> updateDashboardHabit({required String id}) async {
    updateDashboardHabitState.value = TheStates.loading;
    final result = await remoteSource.updateDashboardHabit(id);
    result.fold(
      (l) {
        updateDashboardHabitError.value = l.message;
        updateDashboardHabitState.value = TheStates.error;
      },
      (r) {
        updateDashboardHabitData.value = r;
        dashboardHabit();
        updateDashboardHabitState.value = TheStates.success;
      },
    );
  }

  Rx<TheStates> dashboardPowerStreakState = TheStates.initial.obs;
  Rx<DashboardPowerStreakData> dashboardPowerStreakData =
      const DashboardPowerStreakData().obs;
  RxnString dashboardPowerStreakError = RxnString();
  Future<void> getDashboardPowerStreak() async {
    dashboardPowerStreakState.value = TheStates.loading;
    final result = await remoteSource.getDashboardPowerStreak();
    result.fold(
      (l) {
        dashboardPowerStreakError.value = l.message;
        dashboardPowerStreakState.value = TheStates.error;
      },
      (r) {
        dashboardPowerStreakData.value = r.data ?? const DashboardPowerStreakData();
        dashboardPowerStreakState.value = TheStates.success;
      },
    );
  }
}
