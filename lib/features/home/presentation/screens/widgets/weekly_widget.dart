import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/common/themed_container.dart';
import 'package:empowered/features/home/presentation/screens/widgets/home_pie_chart.dart';
import 'package:empowered/features/home/presentation/screens/widgets/power_score_chip_text.dart';
import 'package:empowered/features/home/presentation/screens/widgets/power_score_circle.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';

class WeeklyWidget extends StatelessWidget {
  const WeeklyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ThemedContainer(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Power Scores',
                  style:
                      AppTextStyles.textBodyB1.copyWith(color: AppColors.white),
                ),
                const VerticalSpacing(12),
                const HomePieChart(),
                const VerticalSpacing(16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 54),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PowerScoreChipText(
                            color: AppColors.primary50,
                            title: 'Journal',
                          ),
                          PowerScoreChipText(
                            color: AppColors.colorF5CA41,
                            title: 'Tasks',
                          ),
                        ],
                      ),
                      VerticalSpacing(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PowerScoreChipText(
                            color: AppColors.primary300,
                            title: 'Habit',
                          ),
                          PowerScoreChipText(
                            color: AppColors.color5CE0A0,
                            title: 'Score',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpacing(20),
          ThemedContainer(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Power Streaks',
                  style:
                      AppTextStyles.textBodyB1.copyWith(color: AppColors.white),
                ),
                const VerticalSpacing(16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PowerScoreCircle(
                      title: 'Journal',
                      subtitle: '(Daily)',
                      value: 1,
                      progress: 0.5,
                    ),
                    PowerScoreCircle(
                      title: 'Tasks',
                      subtitle: '(Daily)',
                      value: 1,
                      progress: 0.5,
                    ),
                    PowerScoreCircle(
                      title: 'Habits',
                      subtitle: '(Daily)',
                      value: 1,
                      progress: 0.5,
                    ),
                  ],
                ),
                const SizedBox(height: 16), // Spacing between rows

                // Second Row
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PowerScoreCircle(
                      title: 'Reflection',
                      subtitle: '(Daily)',
                      value: 1,
                      progress: 0.5,
                    ),
                    PowerScoreCircle(
                      title: 'War Maps',
                      subtitle: '(Weekly)',
                      value: 1,
                      progress: 0.5,
                    ),
                    SizedBox(
                      width: 80,
                    ), // Empty space to balance the second row
                  ],
                ),
              ],
            ),
          ),
          const VerticalSpacing(20),
          ThemedContainer(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Scores',
                  style:
                      AppTextStyles.textBodyB1.copyWith(color: AppColors.white),
                ),
                const VerticalSpacing(16),
                // First Row
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PowerScoreCircle(
                      value: 1,
                      progress: 0.5,
                      title: 'Journal',
                    ),
                    PowerScoreCircle(
                      value: 1,
                      progress: 0.5,
                      title: 'Reflection',
                    ),
                    PowerScoreCircle(
                      value: 1,
                      progress: 0.5,
                      title: 'Habits',
                    ),
                  ],
                ),
                const SizedBox(height: 16), // Spacing between rows

                // Second Row
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PowerScoreCircle(
                      value: 1,
                      progress: 0.5,
                      title: 'Tasks',
                    ),
                    PowerScoreCircle(
                      value: 1,
                      progress: 0.5,
                      title: 'Weekly\nWar Maps',
                    ),
                    PowerScoreCircle(
                      value: 1,
                      progress: 0.5,
                      title: 'Monthly\nMissions',
                    ),
                  ],
                ),
                const SizedBox(height: 16), // Spacing between rows

                // Third Row
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PowerScoreCircle(
                      value: 1,
                      progress: 0.5,
                      title: 'Quarterly\nBattles',
                    ),
                    PowerScoreCircle(
                      value: 1,
                      progress: 0.5,
                      title: 'Yearly\nGames',
                    ),
                    SizedBox(width: 80), // Empty space for balance
                  ],
                ),
              ],
            ),
          ),
          const BottomSpacing(),
        ],
      ),
    );
  }
}
