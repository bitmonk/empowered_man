import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_controller.dart';
import 'package:get/get.dart';

class EmptyGoal extends StatefulWidget {
  const EmptyGoal({
    required this.title,
    required this.selectedTent,
    required this.timePeriod,
    this.showStart = false,
    super.key,
  });

  final String title;
  final bool showStart;
  final String selectedTent;
  final String timePeriod;

  @override
  State<EmptyGoal> createState() => _EmptyGoalState();
}

class _EmptyGoalState extends State<EmptyGoal> {
  late GoalsController goalsController;

  @override
  void initState() {
    super.initState();
    goalsController = Get.find<GoalsController>();
  }

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      margin: const EdgeInsets.symmetric(vertical: 12),
      border: Border.all(
        color: AppColors.primary600,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: AppTextStyles.textHeadingH3,
              ),
              const Spacer(),
              // Wrap the InkWell in Obx to make it reactive
              Obx(() {
                final goalId = goalsController.selectedGoal?.id?.toString() ?? '';
                final goalDetailId = goalsController.getGoalDetailForPeriod(widget.timePeriod)?.id?.toString() ?? '';
                
                return InkWell(
                  onTap: () {
                    initJournalWithNavigate(
                      title: widget.title,
                      goalId: goalId,
                      goalDetailId: goalDetailId,
                    );
                  },
                  child: Assets.images.goalAdd.image(width: 32),
                );
              }),
              const HorizontalSpacing(16),
              Assets.images.goalThreeDot.image(width: 32),
            ],
          ),
          const VerticalSpacing(20),
          Text(
            'You have not completed\nyour ${widget.selectedTent} Targets.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textColor300,
            ),
          ),
          // Wrap the button in Obx as well
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Obx(() {
              final goalId = goalsController.selectedGoal?.id?.toString() ?? '';
              final goalDetailId = goalsController.getGoalDetailForPeriod(widget.timePeriod)?.id?.toString() ?? '';
              
              return AppOutlinedButton(
                height: 40,
                width: 250,
                text: 'Start ${widget.selectedTent} Reflection',
                borderRadius: 12,
                textStyle: AppTextStyles.textBodyB3,
                onPressed: () {
                  initJournalWithNavigate(
                    title: widget.title,
                    goalId: goalId,
                    goalDetailId: goalDetailId,
                  );
                },
              );
            }),
          ),
          const VerticalSpacing(30),
        ],
      ),
    );
  }
}