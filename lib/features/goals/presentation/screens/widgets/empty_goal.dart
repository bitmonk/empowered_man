import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_controller.dart';

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

  String get goalId {
    // Get the current selected goal from the controller
    final selectedGoal = goalsController.selectedGoal;
    return selectedGoal?.id?.toString() ?? '';
  }

  String get goalDetailId {
    // Get the goal detail ID from the current time period
    final goalDetail =
        goalsController.getGoalDetailForPeriod(widget.timePeriod);
    return goalDetail?.id?.toString() ?? '';
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
              InkWell(
                onTap: () {
                  initJournalWithNavigate(
                    title: widget.title,
                    goalId: goalId,
                    goalDetailId: goalDetailId,
                  );
                },
                child: Assets.images.goalAdd.image(width: 32),
              ),
              const HorizontalSpacing(16),
              Assets.images.goalThreeDot.image(width: 32),
            ],
          ),
          const VerticalSpacing(20),
          Text(
            'You have not completed\nyour ${widget.selectedTent} Targets.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textColor300,
            ),
          ),
          // if (widget.showStart)
          Padding(
            padding: const EdgeInsets.only(
              top: 18,
            ),
            child: AppOutlinedButton(
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
            ),
          ),
          const VerticalSpacing(30),
        ],
      ),
    );
  }
}
