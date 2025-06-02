import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/data/model/goals_model.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_controller.dart';
import 'package:empowered/features/goals/presentation/screens/goals_chat_screen.dart';

class GoalsButtons extends StatelessWidget {
  const GoalsButtons({
    required this.selectedIndex,
    required this.goal,
    super.key,
  });

  final int selectedIndex;
  final List<Goal> goal;

  @override
  Widget build(BuildContext context) {
    if (goal.isEmpty || selectedIndex < 0 || selectedIndex >= goal.length) {
      return const SizedBox.shrink();
    }

    final selectedGoal = goal[selectedIndex];
    final selectedGoalTitle = selectedGoal.title ?? 'Goal';
    final tentTypeIndex = selectedGoal.details?.length ?? 0;

    if (tentTypeIndex == 0) {
      return const SizedBox.shrink();
    }

    final goalId = selectedGoal.details?[tentTypeIndex - 1].goalId ?? '';
    final goalDetailId = selectedGoal.details?[tentTypeIndex - 1].id ?? '';
    final isCompleted =
        selectedGoal.details?[tentTypeIndex - 1].isCompleted ?? false;
    final isCurrentWeek = Get.find<GoalsController>().isCurrentWeek;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                // if (!isCompleted) {
                // Get.to(
                //   GoalsChatScreen(
                //     title: selectedGoalTitle,
                //     goalDetailId: goalDetailId.toString(),
                //     goalId: goalId.toString(),
                //   ),
                // );
                // } else {
                //   AppUtils.showSnackbar(
                //     message:
                //         'Goal Completed, You have already completed this goal.',
                //   );
                // }
                if (isCurrentWeek) {
                  Get.to(
                    GoalsChatScreen(
                      title: selectedGoalTitle,
                      goalDetailId: goalDetailId.toString(),
                      goalId: goalId.toString(),
                    ),
                  );
                } else {
                  AppUtils.showErrorSnackbar(
                    message:
                        'You can only set/view tent from current week, not from other weeks.',
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary500,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isCompleted) ...[
                      const Icon(
                        Icons.check_circle,
                        color: AppColors.color2AD674,
                        size: 16,
                      ),
                      const HorizontalSpacing(4),
                    ],
                    Text(
                      '$selectedGoalTitle Tent',
                      style: AppTextStyles.textBodyB3,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const HorizontalSpacing(20),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.goalsOverview);
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: AppColors.primary500,
                  ),
                ),
                child: Text(
                  'Goals Overview',
                  style: AppTextStyles.textBodyB3.copyWith(
                    color: AppColors.primary500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
