import 'package:empowered/common/app_selected_button.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/data/model/goals_model.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_controller.dart';
import 'package:empowered/features/goals/presentation/controllers/reflection_controller.dart';
import 'package:empowered/features/goals/presentation/screens/reflection_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:empowered/features/goals/data/model/reflection_model.dart';

class ProgressGoalWidget extends StatefulWidget {
  const ProgressGoalWidget({
    required this.title,
    required this.selectedTent,
    required this.timePeriod,
    required this.selectedGoalIndex,
    super.key,
  });
  final String title;
  final String selectedTent;
  final String timePeriod;
  final int selectedGoalIndex;

  @override
  _ProgressGoalWidgetState createState() => _ProgressGoalWidgetState();
}

class _ProgressGoalWidgetState extends State<ProgressGoalWidget> {
  late GoalsController goalsController;
  final reflectionController = Get.find<ReflectionController>();
  @override
  void initState() {
    super.initState();
    goalsController = Get.find<GoalsController>();
  }

  void selectTrack(bool onTrack) async {
    final userGoal = _getCurrentUserGoal();
    if (userGoal?.id == null) return;

    final goalAnswerId = userGoal!.id.toString();

    if (shouldShowWonQuestion) {
      await goalsController.completeGoal(goalAnswerId: goalAnswerId);
    } else {
      await goalsController.markOnTrack(goalAnswerId: goalAnswerId);
    }

    setState(() {});
  }

  void toggleGoalSelection(int goalAnswerIndex) async {
    await goalsController.toggleGoalAnswerFromUserGoals(
      goalIndex: widget.selectedGoalIndex,
      timePeriod: widget.timePeriod,
      goalAnswerIndex: goalAnswerIndex,
    );
    setState(() {});
  }

  Goal? get selectedGoal {
    final availableGoals = goalsController.availableGoals;
    if (widget.selectedGoalIndex < 0 ||
        widget.selectedGoalIndex >= availableGoals.length) {
      return null;
    }
    return availableGoals[widget.selectedGoalIndex];
  }

  Detail? get goalDetailForPeriod {
    final goal = selectedGoal;
    if (goal == null) return null;

    final targetDetails = goal.details
        ?.where(
          (detail) =>
              detail.type == 'target' && detail.timePeriod == widget.timePeriod,
        )
        .toList();

    if (targetDetails == null || targetDetails.isEmpty) {
      return null;
    }

    return targetDetails.first;
  }

  List<UserGoal> get userGoalsForPeriod {
    final goalDetail = goalDetailForPeriod;
    if (goalDetail?.userGoals == null) return [];
    return goalDetail!.userGoals!;
  }

  UserGoal? _getCurrentUserGoal() {
    final userGoals = userGoalsForPeriod;
    return userGoals.isNotEmpty ? userGoals.first : null;
  }

  bool get shouldShowWonQuestion {
    return goalsController.shouldShowWonQuestionForIndex(
      widget.selectedGoalIndex,
      widget.timePeriod,
    );
  }

  bool get shouldShowTrackQuestion {
    return goalsController.shouldShowTrackQuestionForIndex(
      widget.selectedGoalIndex,
      widget.timePeriod,
    );
  }

  // Get current tracking state from controller
  bool? get currentTrackingState {
    return goalsController.getCurrentTrackingState(
      widget.selectedGoalIndex,
      widget.timePeriod,
    );
  }

  String get goalId {
    final goal = selectedGoal;
    return goal?.id?.toString() ?? '';
  }

  String get goalDetailId {
    final goalDetail = goalDetailForPeriod;
    return goalDetail?.id?.toString() ?? '';
  }

  double _getProgressValue() {
    final progressString = goalsController.getGoalProgressForIndex(
      widget.selectedGoalIndex,
      widget.timePeriod,
    );
    final progressValue =
        double.tryParse(progressString.replaceAll('%', '')) ?? 0.0;
    return progressValue / 100.0;
  }

  String _getProgressString() {
    return goalsController.getGoalProgressForIndex(
      widget.selectedGoalIndex,
      widget.timePeriod,
    );
  }

  // Check if any operation is currently loading
  bool get _isLoading {
    return goalsController.achieveTargetState.value == TheStates.loading ||
        goalsController.markOnTrackState.value == TheStates.loading ||
        goalsController.completeGoalState.value == TheStates.loading;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => ThemedContainer(
          margin: const EdgeInsets.symmetric(vertical: 12),
          border: Border.all(
            color: AppColors.primary600,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title & Actions
              Row(
                children: [
                  Text(widget.title, style: AppTextStyles.textHeadingH3),
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
              const VerticalSpacing(4),

              InkWell(
                onTap: () async {
                  final currentUserGoal = _getCurrentUserGoal();
                  final userGoalId = currentUserGoal?.id;

                  // Check if we have a valid userGoalId before navigating
                  if (userGoalId == null) {
                    AppUtils.showErrorSnackbar(
                        message: 'No user goal found for reflection');
                    return;
                  }

                  print(
                      'Navigating to reflection with userGoalId: $userGoalId');

                  // Clear previous reflection data to ensure fresh load
                  reflectionController.reflections.value = ReflectionModel();
                  reflectionController.getReflectionState.value =
                      TheStates.initial;

                  // Set the userGoalId in controller
                  reflectionController.userGoalId!.value =
                      userGoalId.toString();

                  // Navigate to reflection screen
                  await Get.to(
                    () => ReflectionScreen(
                      userGoalId: userGoalId.toString(),
                      goalDetailId: goalDetailId,
                      goalId: goalId,
                    ),
                  );
                },
                child: Text(
                  'View full reflection',
                  style: AppTextStyles.textBodyB2.copyWith(
                    color: AppColors.primary400,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary400,
                  ),
                ),
              ),
              const VerticalSpacing(16),
              Row(
                children: [
                  const Text(
                    'Targets',
                    style: TextStyle(
                      fontSize: 28,
                      color: AppColors.textColor50,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 120.w,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(20),
                      minHeight: 8,
                      color: AppColors.colorF5CA41,
                      value: _getProgressValue(),
                    ),
                  ),
                  const HorizontalSpacing(8),
                  Text(
                    _getProgressString(),
                    style: AppTextStyles.textBodyB3,
                  ),
                ],
              ),
              // Goals list section
              const VerticalSpacing(8),
              SizedBox(
                height: 200,
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: _buildUserGoalsList(),
                ),
              ),
              const VerticalSpacing(30),

              if (shouldShowTrackQuestion || shouldShowWonQuestion)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    children: [
                      // Positive Button (On Track / Won)
                      Expanded(
                        child: GestureDetector(
                          onTap: _isLoading ? null : () => selectTrack(true),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              color: _getButtonColor(true),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (_isLoading &&
                                    _shouldShowLoadingForButton(true))
                                  const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  )
                                else
                                  Icon(
                                    Icons.check,
                                    color: _getButtonTextColor(true),
                                  ),
                                const HorizontalSpacing(8),
                                Text(
                                  shouldShowWonQuestion ? 'Won' : 'On Track',
                                  style: AppTextStyles.textBodyB1.copyWith(
                                    color: _getButtonTextColor(true),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const HorizontalSpacing(16),
                      // Negative Button (Off Track / Lost)
                      Expanded(
                        child: GestureDetector(
                          onTap: _isLoading ? null : () => selectTrack(false),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              color: _getButtonColor(false),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (_isLoading &&
                                    _shouldShowLoadingForButton(false))
                                  const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  )
                                else
                                  Icon(
                                    Icons.close,
                                    color: _getButtonTextColor(false),
                                  ),
                                const HorizontalSpacing(8),
                                Text(
                                  shouldShowWonQuestion ? 'Lost' : 'Off Track',
                                  style: AppTextStyles.textBodyB1.copyWith(
                                    color: _getButtonTextColor(false),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              if (goalsController.markOnTrackError.value != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    goalsController.markOnTrackError.value!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              if (goalsController.completeGoalError.value != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    goalsController.completeGoalError.value!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ));
  }

  List<Widget> _buildUserGoalsList() {
    final goalAnswers = goalsController.getGoalAnswersForIndex(
      widget.selectedGoalIndex,
      widget.timePeriod,
    );

    if (goalAnswers.isEmpty) {
      return [
        Align(
          child: AppSelectedButton(
            selectedItem: false,
            title:
                'No targets set for ${widget.selectedTent} ${widget.timePeriod}',
          ),
        ),
      ];
    }

    // Build list from goal answers
    return goalAnswers.asMap().entries.map((entry) {
      final index = entry.key;
      final goalAnswer = entry.value;

      return Align(
        child: GestureDetector(
          onTap: () => toggleGoalSelection(index),
          child: AppSelectedButton(
            selectedItem: goalAnswer.achieved ?? false,
            title:
                goalAnswer.text ?? '${widget.selectedTent} Target ${index + 1}',
          ),
        ),
      );
    }).toList();
  }

  bool _shouldShowLoadingForButton(bool isPositive) {
    final currentState = currentTrackingState;

    return currentState == null || currentState == isPositive;
  }

  // Get button color based on current state from controller
  Color _getButtonColor(bool isPositive) {
    final currentState = currentTrackingState;

    if (currentState == null) {
      // No state set yet, show default unselected
      return AppColors.bgBorder;
    } else {
      // Use state from controller
      return (isPositive == currentState)
          ? AppColors.primary500
          : AppColors.bgBorder;
    }
  }

  Color _getButtonTextColor(bool isPositive) {
    final currentState = currentTrackingState;

    if (currentState == null) {
      return AppColors.textColor100;
    } else {
      return (isPositive == currentState)
          ? Colors.white
          : AppColors.textColor100;
    }
  }
}
