import 'package:empowered/common/app_selected_button.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/data/model/goals_model.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_controller.dart';
import 'package:empowered/features/goals/presentation/screens/reflection_screen.dart';
import 'package:empowered/features/goals/presentation/screens/widgets/empty_goal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  bool _isTrackButtonLoading = false;
  bool _isWonButtonLoading = false;
  Set<int> _loadingTargetIndices = <int>{};

  @override
  void initState() {
    super.initState();
    goalsController = Get.find<GoalsController>();
  }

  Future<void> selectTrack(bool onTrack) async {
    final userGoal = _getCurrentUserGoal();
    if (userGoal?.id == null) return;

    final goalAnswerId = userGoal!.id.toString();

    // Set local loading state
    setState(() {
      if (shouldShowWonQuestion) {
        _isWonButtonLoading = true;
      } else {
        _isTrackButtonLoading = true;
      }
    });

    try {
      if (shouldShowWonQuestion) {
        // For won/lost scenario
        await goalsController.completeGoal(goalAnswerId: goalAnswerId);

        // Show success message based on the action
        if (onTrack) {
          AppUtils.showSnackbar(
            message: 'Congratulations! Goal marked as won successfully.',
          );
        } else {
          AppUtils.showSnackbar(
            message: 'Goal marked as lost. Better luck next time!',
          );
        }
      } else {
        // For on track/off track scenario
        await goalsController.markOnTrack(goalAnswerId: goalAnswerId);

        // Show success message based on the action
        if (onTrack) {
          AppUtils.showSnackbar(
            message: 'User goal marked as on track successfully.',
          );
        } else {
          AppUtils.showSnackbar(
            message: 'Goal marked as off track. Keep pushing forward!',
          );
        }
      }
    } catch (e) {
      // Handle any errors that might occur
      AppUtils.showErrorSnackbar(
        message: 'Failed to update goal status. Please try again.',
      );
    } finally {
      // Clear local loading state
      if (mounted) {
        setState(() {
          _isTrackButtonLoading = false;
          _isWonButtonLoading = false;
        });
      }
    }
  }

  Future<void> toggleGoalSelection(int goalAnswerIndex) async {
    // Set local loading state for specific index
    setState(() {
      _loadingTargetIndices.add(goalAnswerIndex);
    });

    try {
      await goalsController.toggleGoalAnswerFromUserGoals(
        goalIndex: widget.selectedGoalIndex,
        timePeriod: widget.timePeriod,
        goalAnswerIndex: goalAnswerIndex,
      );
    } finally {
      // Clear local loading state for specific index
      if (mounted) {
        setState(() {
          _loadingTargetIndices.remove(goalAnswerIndex);
        });
      }
    }
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

  bool get shouldShowActionButtons {
    return goalsController.shouldShowActionButtons(
      widget.selectedGoalIndex,
      widget.timePeriod,
    );
  }

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

  bool get _hasGoalAnswers {
    final goalAnswers = goalsController.getGoalAnswersForIndex(
      widget.selectedGoalIndex,
      widget.timePeriod,
    );
    return goalAnswers.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    // Only check for goal answers once - no Obx needed here
    if (!_hasGoalAnswers) {
      return EmptyGoal(
        title: widget.title,
        selectedTent: widget.selectedTent,
        timePeriod: widget.timePeriod,
        showStart: true,
      );
    }

    final showButtons = shouldShowActionButtons &&
        (shouldShowTrackQuestion || shouldShowWonQuestion);

    return ThemedContainer(
      margin: const EdgeInsets.symmetric(vertical: 12),
      border: Border.all(
        color: AppColors.primary600,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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

              if (userGoalId == null) {
                AppUtils.showErrorSnackbar(
                  message: 'No user goal found for reflection',
                );
                return;
              }

              print(
                'Navigating to reflection with userGoalId: $userGoalId',
              );

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

          // Progress section - wrap only this section in Obx for progress updates
          Obx(() => Row(
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
              )),

          VerticalSpacing(showButtons ? 8 : 4),

          // Goals list section - wrap only this in Obx for target updates
          Obx(() => Column(
                mainAxisSize: MainAxisSize.min,
                children: _buildUserGoalsList(),
              )),

          if (showButtons) const VerticalSpacing(16),

          // Action buttons - no Obx needed, using local state
          if (showButtons)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  // Positive Button (On Track / Won)
                  Expanded(
                    child: _buildActionButton(
                      onTap: () => selectTrack(true),
                      isLoading: shouldShowWonQuestion
                          ? _isWonButtonLoading
                          : _isTrackButtonLoading,
                      icon: Icons.check,
                      text: shouldShowWonQuestion ? 'Won' : 'On Track',
                      backgroundColor: shouldShowWonQuestion
                          ? AppColors.primary500
                          : AppColors.bgBorder,
                    ),
                  ),
                  const HorizontalSpacing(16),
                  // Negative Button (Off Track / Lost)
                  Expanded(
                    child: _buildActionButton(
                      onTap: () => selectTrack(false),
                      isLoading: false, // Only positive button shows loading
                      icon: Icons.close,
                      text: shouldShowWonQuestion ? 'Lost' : 'Off Track',
                      backgroundColor: AppColors.bgBorder,
                    ),
                  ),
                ],
              ),
            ),

          // Error messages - wrap in Obx only for error updates
          Obx(() => Column(
                children: [
                  if (goalsController.markOnTrackError.value != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        goalsController.markOnTrackError.value!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  if (goalsController.completeGoalError.value != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        goalsController.completeGoalError.value!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required VoidCallback onTap,
    required bool isLoading,
    required IconData icon,
    required String text,
    required Color backgroundColor,
  }) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                ),
              )
            else
              Icon(
                icon,
                color: AppColors.white,
              ),
            const HorizontalSpacing(8),
            Text(
              text,
              style: AppTextStyles.textBodyB1.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildUserGoalsList() {
    final goalAnswers = goalsController.getGoalAnswersForIndex(
      widget.selectedGoalIndex,
      widget.timePeriod,
    );

    return goalAnswers.asMap().entries.map((entry) {
      final index = entry.key;
      final goalAnswer = entry.value;
      final isLoading = _loadingTargetIndices.contains(index);

      return Padding(
        padding:
            EdgeInsets.only(bottom: index < goalAnswers.length - 1 ? 8 : 0),
        child: Align(
          child: GestureDetector(
            onTap: isLoading ? null : () => toggleGoalSelection(index),
            child: Stack(
              children: [
                AppSelectedButton(
                  selectedItem: goalAnswer.achieved ?? false,
                  title: goalAnswer.text ??
                      '${widget.selectedTent} Target ${index + 1}',
                  textAlign: TextAlign.start,
                ),
                if (isLoading)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}
