import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:empowered/core/device_info/device_info.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/core/preferences/shared_pref.dart';
import 'package:empowered/features/assesments/presentation/controllers/assessment_history_bindings.dart';
import 'package:empowered/features/courses/presentation/controllers/course_bindings.dart';
import 'package:empowered/features/courses/presentation/screens/courses_screen.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_bindings.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_emotion_name_bindings.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_emotion_name_controller.dart';
import 'package:empowered/features/main/presentation/controllers/main_controller.dart';
import 'package:empowered/features/main/presentation/screens/widgets/drawer_tile.dart';
import 'package:empowered/features/power_score_stats/power_score_stats_screen.dart';
import 'package:empowered/features/profile/presentation/controllers/logout_bindings.dart';
import 'package:empowered/features/profile/presentation/controllers/logout_controller.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:empowered/features/profile/presentation/screens/profile_screen.dart';

class MainDrawer extends GetView<MainController> {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(MediaQuery.of(context).viewPadding.top),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                    child: Assets.images.drawerBack.svg(),
                  ),
                ),
                const HorizontalSpacing(6),
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary500,
                  ),
                  child: ClipOval(
                    child: AppCachedImage(
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      errorWid: const Icon(Icons.person),
                      imgUrl: Get.find<ProfileController>()
                              .userProfile
                              .value
                              .image ??
                          '',
                    ),
                  ),
                ),
                const HorizontalSpacing(16),
                Text(
                  Get.find<ProfileController>().userProfile.value.fullName ??
                      '',
                  style: AppTextStyles.textBodyB3.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            const VerticalSpacing(20),
            Text(
              'Menu',
              style: AppTextStyles.textBodyB1.copyWith(
                color: AppColors.white,
              ),
            ),
            const VerticalSpacing(12),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DrawerTile(
                      onTap: () {
                        Navigator.pop(context);
                        controller.changetab(0);
                      },
                      title: 'Dashboard',
                      image: Assets.images.dashboard.path,
                      isSelected: controller.selectedDrawerItem.value ==
                          DrawerItemEnum.dashboard,
                    ),
                    DrawerTile(
                      onTap: () {
                        Navigator.pop(context);
                        CourseInitializer.destroy();
                        CourseInitializer.initialize();
                        Get.to(() => const CoursesScreen());
                      },
                      title: 'Course',
                      image: Assets.images.courses.path,
                      isSelected: controller.selectedDrawerItem.value ==
                          DrawerItemEnum.course,
                    ),
                    DrawerTile(
                      onTap: () {
                        Navigator.pop(context);
                        controller.changetab(2);
                      },
                      title: 'Chat',
                      image: Assets.images.chat.path,
                      isSelected: controller.selectedDrawerItem.value ==
                          DrawerItemEnum.chat,
                    ),
                    DrawerTile(
                      onTap: () async {
                        Navigator.pop(context);
                        JournalChatInitializer.destroy();
                        JournalChatInitializer.initialize();
                        JournalEmotionNameInitializer.destroy();
                        JournalEmotionNameInitializer.initialize();

                        // Show loading dialog
                        // final loadingDialog =
                        //     AppUtils.showLoadingDialog(context);

                        // try {

                        Get.find<JournalEmotionNameController>()
                            .getJournalEmotionName();

                        AppWidgetKey.mainScaffold.currentState?.openEndDrawer();
                        // } finally {
                        //   // This ensures the dialog is hidden even if an error occurs
                        //   AppUtils.hideLoadingDialog(context);
                        // }
                      },
                      title: 'Journal',
                      image: Assets.images.journalSvg.path,
                      isSelected: controller.selectedDrawerItem.value ==
                          DrawerItemEnum.journal,
                    ),
                    DrawerTile(
                      onTap: () {
                        Navigator.pop(context);
                        controller.changetab(4);
                      },
                      title: 'Habit Tracker',
                      image: Assets.images.habits.path,
                      isSelected: controller.selectedDrawerItem.value ==
                          DrawerItemEnum.habitTracker,
                    ),
                    DrawerTile(
                      onTap: () {
                        Navigator.pop(context);
                        controller.changetab(1);
                      },
                      title: 'Task Management',
                      image: Assets.images.task.path,
                      isSelected: controller.selectedDrawerItem.value ==
                          DrawerItemEnum.taskManagement,
                    ),
                    DrawerTile(
                      onTap: () {
                        Navigator.pop(context);
                        controller.changetab(3);
                      },
                      title: 'Goals and Targets',
                      image: Assets.images.drawerGame.path,
                      isSelected: controller.selectedDrawerItem.value ==
                          DrawerItemEnum.goalsAndTargets,
                    ),
                    DrawerTile(
                      onTap: () {
                        Navigator.pop(context);

                        NavigationHelper.navigateWithFadeTransition(
                          AppWidgetKey.home.currentContext!,
                          const PowerScoreStatsScreen(),
                          index: 0,
                        );
                      },
                      title: 'Power Score Stats',
                      image: Assets.images.statistic.path,
                      isSelected: controller.selectedDrawerItem.value ==
                          DrawerItemEnum.powerScoreStats,
                    ),
                    DrawerTile(
                      onTap: () {
                        AssessmentHistoryInitializer.destroy();
                        AssessmentHistoryInitializer.initialize();
                        Navigator.pop(context);
                        Get.toNamed(AppRoutes.assesmentsScreen);
                      },
                      title: 'Assessment',
                      image: Assets.images.assessment.path,
                      isSelected: controller.selectedDrawerItem.value ==
                          DrawerItemEnum.assessment,
                    ),
                    DrawerTile(
                      onTap: () {
                        LogoutInitializer.destroy();
                        LogoutInitializer.initialize();
                        Navigator.pop(context);
                        Get.to(() => const ProfileScreen());
                      },
                      title: 'Settings',
                      image: Assets.images.setting.path,
                      isSelected: controller.selectedDrawerItem.value ==
                          DrawerItemEnum.settings,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: AppDivider(
                        color: AppColors.bgBorder,
                      ),
                    ),
                    DrawerTile(
                      onTap: () async {
                        final controller = Get.find<LogoutController>();

                        final deviceId = await getUniqueDeviceId();
                        final result = await controller.logout(deviceId);

                        if (result) {
                          await ChatClient.getInstance.logout();
                          await Get.find<AppSharedPref>().removeAll();
                          Get.offAllNamed(AppRoutes.landingScreen);
                        }
                      },
                      title: 'Logout',
                      image: Assets.images.logout.path,
                    ),
                    const BottomSpacing(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
