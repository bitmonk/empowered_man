import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_chat_bindings.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_controller.dart';
import 'package:empowered/features/goals/presentation/controllers/reflection_bindings.dart';
import 'package:empowered/features/goals/presentation/screens/widgets/empty_goal.dart';
import 'package:empowered/features/goals/presentation/screens/widgets/goal_type_scroll.dart';
import 'package:empowered/features/goals/presentation/screens/widgets/goals_buttons.dart';
import 'package:empowered/features/goals/presentation/screens/widgets/goals_header.dart';
import 'package:empowered/features/goals/presentation/screens/widgets/progress_goal_widget.dart';

enum GoalDurationEnum {
  weekly,
  monthly,
  quarterly,
  yearly,
}

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final controller = Get.find<GoalsController>();

  @override
  void initState() {
    super.initState();
    GoalsChatInitializer.destroy();
    GoalsChatInitializer.initialize();
    ReflectionInitializer.destroy();
    ReflectionInitializer.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GoalsHeader(),
              const VerticalSpacing(26),
              GoalTypeScroll(
                goal: controller.availableGoals,
                selectedIndex: controller.selectedGoalIndex.value,
                onSelected: (index) {
                  controller.updateSelectedGoalIndex(index);
                },
              ),

              const VerticalSpacing(16),

              // Date range navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => controller.changeWeek(-1),
                    child: Assets.images.cirlceArrowBack.svg(),
                  ),
                  const HorizontalSpacing(20),
                  Obx(
                    () => Text(
                      controller.getDateRange(),
                      style: AppTextStyles.textBodyB3
                          .copyWith(color: AppColors.textColor200),
                    ),
                  ),
                  const HorizontalSpacing(20),
                  GestureDetector(
                    onTap: () => controller.changeWeek(1),
                    child: Assets.images.circleArrowForward.svg(),
                  ),
                ],
              ),

              const VerticalSpacing(24),
              const GoalsButtons(),

              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    controller.resetValue();
                  },
                  child: Obx(
                    () {
                      // Show loading state
                      if (controller.getGoalsState.value == TheStates.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      // Show error state
                      if (controller.getGoalsState.value == TheStates.error) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.getGoalsError.value ??
                                    'An error occurred',
                                style: AppTextStyles.textBodyB3.copyWith(
                                  color: AppColors.appRed,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const VerticalSpacing(16),
                              ElevatedButton(
                                onPressed: () => controller.getGoals(),
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        );
                      }

                      // Show goals list based on selected goal index
                      final selectedGoalIndex =
                          controller.selectedGoalIndex.value;

                      return SingleChildScrollView(
                        padding: const EdgeInsets.only(top: 12),
                        child: Column(
                          children: [
                            ...List.generate(GoalDurationEnum.values.length,
                                (index) {
                              final timePeriod =
                                  GoalDurationEnum.values[index].name;

                              // Use the selected goal index methods to check progress
                              final hasProgress =
                                  controller.hasGoalProgressForIndex(
                                selectedGoalIndex,
                                timePeriod,
                              );
                              final showStartButton =
                                  controller.shouldShowStartButtonForIndex(
                                selectedGoalIndex,
                                timePeriod,
                              );
                              final isCompleted =
                                  controller.isGoalCompletedForIndex(
                                selectedGoalIndex,
                                timePeriod,
                              );

                              if (hasProgress || isCompleted) {
                                return ProgressGoalWidget(
                                  selectedTent: controller.selectedGoalTitle,
                                  title: '${timePeriod.capitalizeFirst!} Tasks',
                                  timePeriod: timePeriod,
                                  selectedGoalIndex: selectedGoalIndex,
                                );
                              } else {
                                return EmptyGoal(
                                  title: timePeriod.capitalizeFirst ?? '',
                                  showStart: showStartButton,
                                  selectedTent: controller.selectedGoalTitle,
                                  timePeriod: timePeriod,
                                );
                              }
                            }),
                            const BottomSpacing(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
