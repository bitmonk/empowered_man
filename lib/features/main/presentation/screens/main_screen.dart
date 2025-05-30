import 'dart:io';

import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/core/push_notification/firebase_notification_service.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_bindings.dart';
import 'package:empowered/features/chat/presentation/screens/chat_screen.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_bindings.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_overview_bindings.dart';
import 'package:empowered/features/goals/presentation/screens/goals_screen.dart';
import 'package:empowered/features/habits/presentation/controllers/habit_bindings.dart';
import 'package:empowered/features/habits/presentation/habit_screen.dart';
import 'package:empowered/features/home/presentation/controllers/home_bindings.dart';
import 'package:empowered/features/home/presentation/controllers/reflection_journal_chat_bindings.dart';
import 'package:empowered/features/home/presentation/screens/home_screen.dart';
import 'package:empowered/features/journal_chat/presentation/screens/journal_drawer.dart';
import 'package:empowered/features/main/presentation/controllers/main_controller.dart';
import 'package:empowered/features/main/presentation/screens/widgets/main_drawer.dart';
import 'package:empowered/features/profile/presentation/controllers/logout_bindings.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_bindings.dart';
import 'package:empowered/features/push_notification/presentation/controller/push_notification_bindings.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_bindings.dart';
import 'package:empowered/features/tasks/presentation/screens/tasks_screen.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  final controller = Get.find<MainController>();

  List<String> icons = [
    '',
    '',
    '',
    '',
  ];
  List<String> title = ['Dashboard', 'Tasks', 'Chat', 'Goals', 'Habits'];
  @override
  void initState() {
    super.initState();

    FirebaseNotificationService().requestPermission();
    FirebaseNotificationService().init();
    ProfileInitializer.initialize();
    HomeInitializer.initialize();
    ChatInitializer.initialize();
    TasksInitializer.initialize();
    HabitInitializer.initialize();
    NotificationInitializer.initialize();
    LogoutInitializer.initialize();
    GoalsInitializer.initialize();
    ReflectionJournalChatInitializer.initialize();
    GoalsOverviewInitializer.initialize();
    PushNotificationInitializer.initialize();
  }

  @override
  void dispose() {
    HomeInitializer.destroy();
    ChatInitializer.destroy();
    TasksInitializer.destroy();
    HabitInitializer.destroy();
    LogoutInitializer.destroy();
    GoalsInitializer.destroy();
    ProfileInitializer.destroy();
    ReflectionJournalChatInitializer.destroy();
    GoalsOverviewInitializer.destroy();
    PushNotificationInitializer.destroy();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return WillPopScope(
      onWillPop: () async {
        final scaffoldState = AppWidgetKey.mainScaffold.currentState;
        if (scaffoldState?.isDrawerOpen ?? false) {
          Navigator.of(context).pop();
          return false;
        }

        final currentIndex = AppWidgetKey.bottomBarController.index;
        if (currentIndex > 0) {
          AppWidgetKey.bottomBarController.jumpToPreviousTab();
          return false;
        }

        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else if (Platform.isIOS) {
          exit(0); // Force exit on iOS (not recommended by Apple)
        }

        return false;
      },
      child: Scaffold(
        key: AppWidgetKey.journalScaffold,
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.92,
          backgroundColor: AppColors.bgMedium,
          child: const JournalDrawer(),
        ),
        body: Scaffold(
          key: AppWidgetKey.mainScaffold,
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.colorWhite,
          drawer: Drawer(
            width: MediaQuery.of(context).size.width * 0.92,
            backgroundColor: AppColors.bgMedium,
            child: const MainDrawer(),
          ),
          // endDrawer: const JournalDrawer(),
          endDrawerEnableOpenDragGesture: false,
          body: SafeArea(
            top: false,
            bottom: false,
            child: PersistentTabView(
              backgroundColor: AppColors.bgDark,
              screenTransitionAnimation: const ScreenTransitionAnimation.none(),
              controller: AppWidgetKey.bottomBarController,
              navBarHeight: 68,
              onTabChanged: (value) {
                controller.changeIndex(value);
              },
              tabs: [
                PersistentTabConfig(
                  screen: const HomeScreen(),
                  item: ItemConfig(
                    title: title[0],
                    textStyle: AppTextStyles.captionMedium,
                    inactiveForegroundColor: AppColors.bgBorder,
                    icon: Assets.images.dashboard
                        .svg(
                          width: 24,
                          colorFilter: const ColorFilter.mode(
                            AppColors.primary500,
                            BlendMode.srcIn,
                          ),
                        )
                        .paddingOnly(top: 6),
                    inactiveIcon: Assets.images.dashboard
                        .svg(width: 24)
                        .paddingOnly(top: 6),
                    activeForegroundColor: AppColors.primary500,
                  ),
                ),
                PersistentTabConfig(
                  screen: const TasksScreen(),
                  item: ItemConfig(
                    title: title[1],
                    textStyle: AppTextStyles.captionMedium,
                    inactiveForegroundColor: AppColors.bgBorder,
                    icon: Assets.images.tasks
                        .svg(
                          width: 26,
                          colorFilter: const ColorFilter.mode(
                            AppColors.primary500,
                            BlendMode.srcIn,
                          ),
                        )
                        .paddingOnly(top: 6),
                    inactiveIcon:
                        Assets.images.tasks.svg(width: 26).paddingOnly(top: 6),
                    activeForegroundColor: AppColors.primary500,
                  ),
                ),
                PersistentTabConfig(
                  screen: const ChatScreen(),
                  item: ItemConfig(
                    title: 'Chat',
                    textStyle: AppTextStyles.captionMedium,
                    inactiveForegroundColor: AppColors.bgBorder,
                    inactiveIcon: _buildChatIcon(),
                    activeForegroundColor: AppColors.bgBorder,
                    icon: _buildChatIcon(),
                  ),
                ),
                PersistentTabConfig(
                  screen: const GoalsScreen(),
                  item: ItemConfig(
                    title: title[3],
                    inactiveForegroundColor: AppColors.bgBorder,
                    textStyle: AppTextStyles.captionMedium,
                    icon: Assets.images.games
                        .svg(
                          width: 26,
                          colorFilter: const ColorFilter.mode(
                            AppColors.primary500,
                            BlendMode.srcIn,
                          ),
                        )
                        .paddingOnly(top: 6),
                    inactiveIcon:
                        Assets.images.games.svg(width: 26).paddingOnly(top: 6),
                    activeForegroundColor: AppColors.primary500,
                  ),
                ),
                PersistentTabConfig(
                  screen: const HabitScreen(),
                  item: ItemConfig(
                    title: title[4],
                    textStyle: AppTextStyles.captionMedium,
                    inactiveForegroundColor: AppColors.bgBorder,
                    icon: Assets.images.habits
                        .svg(
                          width: 26,
                          colorFilter: const ColorFilter.mode(
                            AppColors.primary500,
                            BlendMode.srcIn,
                          ),
                        )
                        .paddingOnly(top: 6),
                    inactiveIcon:
                        Assets.images.habits.svg(width: 26).paddingOnly(top: 6),
                    activeForegroundColor: AppColors.primary500,
                  ),
                ),
              ],
              navBarBuilder: (navBarConfig) => Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 174, // Adjust to center it horizontally
                    right: 174, // Adjust to center it horizontally
                    bottom: -65,
                    child: Container(
                      height: 154, // Adjust height for oval shape
                      width: 100, // Adjust width for oval shape
                      decoration: BoxDecoration(
                        color: AppColors.bgBorder,
                        borderRadius:
                            BorderRadius.circular(100), // Makes it oval
                      ),
                    ),
                  ),
                  Style13BottomNavBar(
                    navBarDecoration: const NavBarDecoration(
                      color: AppColors
                          .bgBorder, // Make it blend with the curved shape
                    ),
                    navBarConfig: navBarConfig.copyWith(
                      onItemSelected: (index) {
                        AppWidgetKey.bottomBarController.jumpToTab(index);
                        return true;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChatIcon() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary500,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary500.withOpacity(0.4), // Glow color
            blurRadius: 10, // How much blur effect
            spreadRadius: 2,
            // ignore: prefer_const_constructors
            offset: Offset(0, 5), // Spread of glow
          ),
        ],
      ),
      child: Container(
        // margin: const EdgeInsets.all(20), // Adjust padding as needed
        child: Assets.images.chat.svg(width: 28),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ChatIconClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var width = size.width;
    var height = size.height;

    path.moveTo(0, height); // Start at bottom-left

    // Create an outward semi-circle curve
    path.quadraticBezierTo(
      width * 0.5,
      -height * 0.5, // Control point (higher up for outward effect)
      width, height, // End at bottom-right
    );

    path.lineTo(width, height); // Close the path
    path.lineTo(0, height); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
