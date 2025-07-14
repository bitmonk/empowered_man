import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/core/extension/string_extension.dart';
import 'package:empowered/core/preferences/preferences.dart';
import 'package:empowered/core/preferences/shared_pref.dart';
import 'package:empowered/features/main/data/source/main_remote_source.dart';
import 'package:flutter/services.dart';

enum DrawerItemEnum {
  dashboard,
  course,
  chat,
  journal,
  habitTracker,
  taskManagement,
  goalsAndTargets,
  powerScoreStats,
  assessment,
  settings,
  tribe,
}

class MainController extends GetxController {
  MainController({required this.remoteSource});
  final MainRemoteSource remoteSource;
  RxBool isUserLoggedIn = false.obs;
  Rx<TheStates> theStates = TheStates.initial.obs;
  late TabController tabController;
  RxInt bottomNavIndex = 0.obs;
  Rx<DrawerItemEnum> selectedDrawerItem = DrawerItemEnum.dashboard.obs;

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  void changeIndex(int index) {
    HapticFeedback.lightImpact();
    bottomNavIndex.value = index;
    if (index == 0) {
      selectedDrawerItem.value = DrawerItemEnum.dashboard;
    } else if (index == 1) {
      selectedDrawerItem.value = DrawerItemEnum.taskManagement;
    } else if (index == 2) {
      selectedDrawerItem.value = DrawerItemEnum.chat;
    } else if (index == 3) {
      selectedDrawerItem.value = DrawerItemEnum.goalsAndTargets;
    } else {
      selectedDrawerItem.value = DrawerItemEnum.habitTracker;
    }
  }

  void changetab(int index) {
    changeIndex(index);
    AppWidgetKey.bottomBarController.jumpToTab(index);
  }

  void selectDrawerItem(DrawerItemEnum drawerItemEnum) {
    selectedDrawerItem.value = drawerItemEnum;
  }

  void changeLoginStatus(bool status) {
    isUserLoggedIn.value = status;
  }

  Future<void> initialize() async {
    final token =
        await Get.find<AppSharedPref>().getString(PreferenceKeys.accessToken);
    if (token?.isNullOrEmpty() ?? true) {
      isUserLoggedIn.value = false;
    } else {
      // getUser();
      isUserLoggedIn.value = true;
    }
  }

  Future<void> getUser() async {
    theStates.value = TheStates.loading;
    final result = await remoteSource.getUser();
    result.fold(
      (l) {
        theStates.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) {
        theStates.value = TheStates.success;
      },
    );
  }

  Future<bool> deleteUser() async {
    final result = await remoteSource.deleteUser();
    return result.fold(
      (l) {
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        return true;
      },
    );
  }
}
