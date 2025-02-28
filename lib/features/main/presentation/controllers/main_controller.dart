import 'package:empowered/core/preferences/preferences.dart';
import 'package:empowered/enum/the_states.dart';
import 'package:empowered/extensions/string_extension.dart';
import 'package:empowered/features/main/data/source/main_remote_source.dart';
import 'package:empowered/utlis/app_utils.dart';
import 'package:empowered/utlis/app_widget_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
        await Get.find<Preferences>().getString(Preference.accessToken);
    if (token?.isNullOrEmpty() ?? true) {
      isUserLoggedIn.value = false;
    } else {
      getUser();
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
