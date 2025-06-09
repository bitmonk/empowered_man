import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/presentation/screens/widgets/home_header_widgets.dart';
import 'package:empowered/features/power_score_stats/presentation/controllers/power_score_controller.dart';
import 'package:empowered/features/power_score_stats/presentation/widgets/average_score_pie_chart.dart';
import 'package:empowered/features/power_score_stats/presentation/widgets/average_weekly_score.dart';
import 'package:empowered/features/power_score_stats/presentation/widgets/line_power_stats.dart';

import 'package:flutter_svg/flutter_svg.dart';

class PowerScoreStatsScreen extends StatefulWidget {
  const PowerScoreStatsScreen({super.key});

  @override
  State<PowerScoreStatsScreen> createState() => _PowerScoreStatsScreenState();
}

class _PowerScoreStatsScreenState extends State<PowerScoreStatsScreen> {
  final powerController = Get.find<PowerScoreController>();

  // @override
  // void initState() {
  //   super.initState();
  //   powerController.getPowerScoreStats();
  // }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.bgDark,
      appBar: CustomAppBar(
        title: 'Power Score Stats',
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeaderWidgets(
                hideControls: true,
                level:
                    powerController.powerScoreResponse.value.currentLevel ?? '',
                upcomingLevel:
                    powerController.powerScoreResponse.value.upcomingLevel ??
                        '',
                userProgressbarPoints: powerController
                        .powerScoreResponse.value.userProgressbarPoints ??
                    '',
                totalPointsProgressBar: powerController
                        .powerScoreResponse.value.totalPointsProgressbar ??
                    '',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => powerController.changeWeek(-1),
                    child: Assets.images.cirlceArrowBack.svg(),
                  ),
                  const HorizontalSpacing(20),
                  Text(
                    powerController.getDateRange(),
                    style: AppTextStyles.textBodyB3
                        .copyWith(color: AppColors.textColor200),
                  ),
                  const HorizontalSpacing(20),
                  GestureDetector(
                    onTap: () => powerController.changeWeek(1),
                    child: Assets.images.circleArrowForward.svg(),
                  ),
                ],
              ),
              const VerticalSpacing(22),
              _buildAverageScore(),
              const VerticalSpacing(20),
              _buildScoreBreakdown(),
              const VerticalSpacing(20),
              _buildSummaryBreakdown(),
              const VerticalSpacing(20),
              AverageWeeklyScore(
                weeklyStatus:
                    powerController.powerScoreResponse.value.weeklystatus,
              ),
              const VerticalSpacing(20),
              LinePowerStats(
                monthlystatus:
                    powerController.powerScoreResponse.value.monthlystatus,
              ),
              const BottomSpacing(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAverageScore() {
    return ThemedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Average Score',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const VerticalSpacing(8),
          AverageScorePieChart(
            averageTotalPercentage: powerController
                    .powerScoreResponse.value.averageTotalPercentage ??
                '',
            averageTotalGrowthPercentage: powerController
                    .powerScoreResponse.value.averageTotalGrowthPercentage ??
                '',
            averageGrowthHabitsPercentage: powerController
                    .powerScoreResponse.value.averageGrowthHabitsPercentage ??
                '',
            averageGrowthJournalsPercentage: powerController
                    .powerScoreResponse.value.averageGrowthJournalsPercentage ??
                '',
            averageGrowthTasksPercentage: powerController
                    .powerScoreResponse.value.averageGrowthTasksPercentage ??
                '',
            averageGrowthGoalPercentage: powerController
                    .powerScoreResponse.value.averageGrowthGoalPercentage ??
                '',
            averageHabitsPercentage: powerController
                    .powerScoreResponse.value.averageHabitsPercentage ??
                '',
            averageGoalPercentage: powerController
                    .powerScoreResponse.value.averageGoalPercentage ??
                '',
            averageTasksPercentage: powerController
                    .powerScoreResponse.value.averageTasksPercentage ??
                '',
            averageJournalsPercentage: powerController
                    .powerScoreResponse.value.averageJournalsPercentage ??
                '',
          ),
          const VerticalSpacing(8),
          _buildCategoryScores(
            powerController.powerScoreResponse.value.averageTotalPercentage ??
                '',
            powerController
                    .powerScoreResponse.value.averageTotalGrowthPercentage ??
                '',
            powerController
                    .powerScoreResponse.value.averageGrowthHabitsPercentage ??
                '',
            powerController
                    .powerScoreResponse.value.averageGrowthJournalsPercentage ??
                '',
            powerController
                    .powerScoreResponse.value.averageGrowthTasksPercentage ??
                '',
            powerController
                    .powerScoreResponse.value.averageGrowthGoalPercentage ??
                '',
            powerController.powerScoreResponse.value.averageHabitsPercentage ??
                '',
            powerController.powerScoreResponse.value.averageGoalPercentage ??
                '',
            powerController.powerScoreResponse.value.averageTasksPercentage ??
                '',
            powerController
                    .powerScoreResponse.value.averageJournalsPercentage ??
                '',
          ),
          // const BottomSpacing(),
        ],
      ),
    );
  }

  Widget _buildCategoryScores(
    String averageTotalPercentage,
    String averageTotalGrowthPercentage,
    String averageGrowthHabitsPercentage,
    String averageGrowthJournalsPercentage,
    String averageGrowthTasksPercentage,
    String averageGrowthGoalPercentage,
    String averageHabitsPercentage,
    String averageGoalPercentage,
    String averageTasksPercentage,
    String averageJournalsPercentage,
  ) {
    final categories = <Map<String, dynamic>>[
      {
        'name': 'Journal',
        'score': averageJournalsPercentage,
        'color': AppColors.color5CE0A0,
        'increment': averageGrowthJournalsPercentage,
      },
      {
        'name': 'Habit',
        'score': averageHabitsPercentage,
        'color': AppColors.primary300,
        'increment': averageGrowthHabitsPercentage,
      },
      {
        'name': 'Task',
        'score': averageTasksPercentage,
        'color': AppColors.colorF5CA41,
        'increment': averageGrowthTasksPercentage,
      },
      {
        'name': 'Goals',
        'score': averageGoalPercentage,
        'color': AppColors.primary500,
        'increment': averageGrowthGoalPercentage,
      },
    ];

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      shrinkWrap: true, // Important to prevent infinite height issues
      physics:
          const NeverScrollableScrollPhysics(), // Disable GridView's internal scrolling
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two columns
        crossAxisSpacing: 16,
        mainAxisSpacing: 12,
        childAspectRatio: 2.5, // Adjust this value for better layout
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return _categoryScore(
          category['name'],
          category['score'],
          category['color'],
          category['increment'],
        );
      },
    );
  }

  Widget _categoryScore(
    String name,
    String score,
    Color color,
    String increment,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 6,
          backgroundColor: color,
        ),
        const HorizontalSpacing(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyles.textBodyB3,
            ),
            Row(
              children: [
                Text(
                  '%$score',
                  style: AppTextStyles.textCaptionC2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Assets.images.increaseArrow.svg(),
                ),
                Text(
                  increment,
                  style: AppTextStyles.textCaptionC2
                      .copyWith(color: AppColors.color5CE0A0),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildScoreBreakdown() {
    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        _scoreCard(
          'Power Score',
          '${powerController.powerScoreResponse.value.userJournals}/${powerController.powerScoreResponse.value.totalJournals}',
          Assets.images.powerLine.path,
        ),
        _scoreCard(
          'Journal',
          '${powerController.powerScoreResponse.value.userJournals}/${powerController.powerScoreResponse.value.totalJournals}',
          Assets.images.powerJournal.path,
        ),
        _scoreCard(
          'Habits',
          '${powerController.powerScoreResponse.value.userHabits}/${powerController.powerScoreResponse.value.totalHabits}',
          Assets.images.powerLine.path,
        ),
        _scoreCard(
          'Tasks',
          '${powerController.powerScoreResponse.value.userTasks}/${powerController.powerScoreResponse.value.totalTasks}',
          Assets.images.powerTasks.path,
        ),
        _scoreCard(
          'Goals',
          '${powerController.powerScoreResponse.value.userTotalGoals}/${powerController.powerScoreResponse.value.totalGoals}',
          Assets.images.powerLine.path,
        ),
        _scoreCard(
          'Assessment',
          '${powerController.powerScoreResponse.value.userAssessments}/${powerController.powerScoreResponse.value.totalAssessments}',
          Assets.images.powerTasks.path,
        ),
      ],
    );
  }

  Widget _buildSummaryBreakdown() {
    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 20,
      childAspectRatio: 1.2,
      children: [
        _summaryCard(
          'Previous week',
          powerController.powerScoreResponse.value.previousWeekAverage ?? '',
        ),
        _summaryCard(
          '4 weeks averagee',
          powerController.powerScoreResponse.value.fourWeekAverage ?? '',
        ),
        _summaryCard(
          'Year average',
          powerController.powerScoreResponse.value.yearAverage ?? '',
        ),
        _summaryCard(
          'Overall average',
          powerController.powerScoreResponse.value.overallAverage ?? '',
        ),
      ],
    );
  }

  Widget _scoreCard(String title, String score, String icon) {
    return ThemedContainer(
      border: Border.all(color: AppColors.bgBorder),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 11),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 24,
            height: 34,
          ),
          const HorizontalSpacing(12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.textBodyB3.copyWith(fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                score,
                style: AppTextStyles.textBodyB1,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryCard(String title, String score) {
    return ThemedContainer(
      border: Border.all(color: AppColors.bgBorder),
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HorizontalSpacing(12),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.color008CFF,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Text(
                  score,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor50,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                title,
                style: AppTextStyles.textBodyB3
                    .copyWith(color: AppColors.textColor300, fontSize: 13),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
