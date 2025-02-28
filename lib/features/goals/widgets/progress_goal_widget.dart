import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/core/routes/app_routes.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/common/themed_container.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProgressGoalWidget extends StatefulWidget {
  const ProgressGoalWidget({required this.title, super.key});
  final String title;

  @override
  _ProgressGoalWidgetState createState() => _ProgressGoalWidgetState();
}

class _ProgressGoalWidgetState extends State<ProgressGoalWidget> {
  bool isOnTrackSelected = true; // Default for On Track / Off Track
  List<bool> selectedGoals = List.generate(
    4,
    (index) => index.isEven,
  ); // Track selected goals

  void selectTrack(bool onTrack) {
    setState(() {
      isOnTrackSelected = onTrack;
    });
  }

  void toggleGoalSelection(int index) {
    setState(() {
      selectedGoals[index] = !selectedGoals[index]; // Toggle selected state
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
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
                  Get.toNamed(AppRoutes.reflectionScreen);
                },
                child: Assets.images.goalAdd.image(width: 32),
              ),
              const HorizontalSpacing(16),
              Assets.images.goalThreeDot.image(width: 32),
            ],
          ),
          const VerticalSpacing(4),
          Text(
            'View full reflection',
            style: AppTextStyles.textBodyB2.copyWith(
              color: AppColors.primary400,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary400,
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
                  value: 0.5,
                ),
              ),
              const HorizontalSpacing(8),
              const Text(
                '50%',
                style: AppTextStyles.textBodyB3,
              ),
            ],
          ),
          const VerticalSpacing(8),

          // **Dynamic Goals List**
          ...List.generate(
            selectedGoals.length,
            (index) => GestureDetector(
              onTap: () => toggleGoalSelection(index), // Toggle on tap
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (selectedGoals[index])
                      Assets.images.goalsSelected.image(width: 28)
                    else
                      Assets.images.goalsUnselected.image(width: 28),
                    const HorizontalSpacing(14),
                    const Text(
                      'Squat 140kg 5 5',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textColor200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const VerticalSpacing(30),

          // On Track / Off Track
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                // On Track Button
                Expanded(
                  child: GestureDetector(
                    onTap: () => selectTrack(true),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: isOnTrackSelected
                            ? AppColors.primary500
                            : AppColors.bgBorder,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check,
                            color: isOnTrackSelected
                                ? Colors.white
                                : AppColors.textColor100,
                          ),
                          const HorizontalSpacing(8),
                          Text(
                            widget.title == 'Weekly' ? 'Won' : 'On Track',
                            style: AppTextStyles.textBodyB1.copyWith(
                              color: isOnTrackSelected
                                  ? Colors.white
                                  : AppColors.textColor100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const HorizontalSpacing(16),
                // Off Track Button
                Expanded(
                  child: GestureDetector(
                    onTap: () => selectTrack(false),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: !isOnTrackSelected
                            ? AppColors.primary500
                            : AppColors.bgBorder,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.close,
                            color: !isOnTrackSelected
                                ? Colors.white
                                : AppColors.textColor100,
                          ),
                          const HorizontalSpacing(8),
                          Text(
                            widget.title == 'Weekly' ? 'Lost' : 'Off Track',
                            style: AppTextStyles.textBodyB1.copyWith(
                              color: !isOnTrackSelected
                                  ? Colors.white
                                  : AppColors.textColor100,
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
        ],
      ),
    );
  }
}
