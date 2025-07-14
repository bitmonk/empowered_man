import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/presentation/controllers/home_controller.dart';
import 'package:empowered/features/home/presentation/screens/widgets/home_pie_chart.dart';
import 'package:empowered/features/home/presentation/screens/widgets/power_score_chip_text.dart';
import 'package:empowered/features/home/presentation/screens/widgets/power_score_circle.dart';

class WeeklyWidget extends StatefulWidget {
  const WeeklyWidget({super.key});

  @override
  State<WeeklyWidget> createState() => _WeeklyWidgetState();
}

class _WeeklyWidgetState extends State<WeeklyWidget> {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.dashboardPowerStreakState.value.showWidget(
          loading: () => const Center(child: LoadingWidget()),
          error: () => Center(
            child: CustomErrorWidget(
              error: controller.dashboardPowerStreakError.value,
              onPressed: () {
                controller.getDashboardPowerStreak();
              },
            ),
          ),
          success: () {
            final weekData =
                controller.dashboardPowerStreakData.value.weeklyDetails;
            final totalData =
                controller.dashboardPowerStreakData.value.totalScores;
            final powerStreaks =
                controller.dashboardPowerStreakData.value.powerStreaks;
            return RefreshIndicator(
              onRefresh: () async {
                controller.getDashboardPowerStreak();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ThemedContainer(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Power Scores',
                            style: AppTextStyles.textBodyB1
                                .copyWith(color: AppColors.white),
                          ),
                          const VerticalSpacing(12),
                          HomePieChart(
                            centerText: weekData?['average']?.toString() ?? '0',
                            habit: weekData?['habits']?.toDouble() ?? 0,
                            journal: weekData?['journals']?.toDouble() ?? 0,
                            tasks: weekData?['tasks']?.toDouble() ?? 0,
                            goals: weekData?['goals']?.toDouble() ?? 0,
                          ),
                          const VerticalSpacing(16),
                          Padding(
                            padding: const EdgeInsets.symmetric(),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    PowerScoreChipText(
                                      color: AppColors.color5CE0A0,
                                      title:
                                          'Journal (${weekData?['journals'] ?? 0})',
                                    ),
                                    PowerScoreChipText(
                                      color: AppColors.colorF5CA41,
                                      title:
                                          'Tasks (${weekData?['tasks'] ?? 0})',
                                    ),
                                  ],
                                ),
                                const VerticalSpacing(16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    PowerScoreChipText(
                                      color: AppColors.primary200,
                                      title:
                                          'Habit (${weekData?['habits'] ?? 0})',
                                    ),
                                    PowerScoreChipText(
                                      color: AppColors.primary50,
                                      title:
                                          'Goals (${weekData?['goals'] ?? 0})',
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
                            style: AppTextStyles.textBodyB1
                                .copyWith(color: AppColors.white),
                          ),
                          const VerticalSpacing(16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              PowerScoreCircle(
                                title: 'Journal',
                                subtitle: '(Daily)',
                                value: powerStreaks?['journal'] ?? 0,
                                progress: (powerStreaks?['journal'] ?? 0) / 10,
                              ),
                              PowerScoreCircle(
                                title: 'Tasks',
                                subtitle: '(Daily)',
                                value: powerStreaks?['tasks'] ?? 0,
                                progress: (powerStreaks?['tasks'] ?? 0) / 10,
                              ),
                              PowerScoreCircle(
                                title: 'Habits',
                                subtitle: '(Daily)',
                                value: powerStreaks?['habits'] ?? 0,
                                progress: (powerStreaks?['habits'] ?? 0) / 10,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16), // Spacing between rows

                          // Second Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              PowerScoreCircle(
                                title: 'Reflection',
                                subtitle: '(Daily)',
                                value: powerStreaks?['reflection'] ?? 0,
                                progress:
                                    (powerStreaks?['reflection'] ?? 0) / 10,
                              ),
                              PowerScoreCircle(
                                title: 'War Maps',
                                subtitle: '(Weekly)',
                                value: powerStreaks?['war_maps'] ?? 0,
                                progress: (powerStreaks?['war_maps'] ?? 0) / 10,
                              ),
                              const SizedBox(
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
                            style: AppTextStyles.textBodyB1
                                .copyWith(color: AppColors.white),
                          ),
                          const VerticalSpacing(16),
                          // First Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              PowerScoreCircle(
                                value: totalData?['journals'] ?? 0,
                                progress: (totalData?['journals'] ?? 0) / 10,
                                title: 'Journal',
                              ),
                              PowerScoreCircle(
                                value: totalData?['reflection'] ?? 0,
                                progress: (totalData?['reflection'] ?? 0) / 10,
                                title: 'Reflection',
                              ),
                              PowerScoreCircle(
                                value: totalData?['habits'] ?? 0,
                                progress: (totalData?['habits'] ?? 0) / 10,
                                title: 'Habits',
                              ),
                            ],
                          ),
                          const SizedBox(height: 16), // Spacing between rows

                          // Second Row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              PowerScoreCircle(
                                value: totalData?['tasks'] ?? 0,
                                progress: (totalData?['tasks'] ?? 0) / 10,
                                title: 'Tasks',
                              ),
                              PowerScoreCircle(
                                value: totalData?['weekly_war_maps'] ?? 0,
                                progress:
                                    (totalData?['weekly_war_maps'] ?? 0) / 10,
                                title: 'Weekly\nWar Maps',
                              ),
                              PowerScoreCircle(
                                value: totalData?['monthly_missions'] ?? 0,
                                progress:
                                    (totalData?['monthly_missions'] ?? 0) / 10,
                                title: 'Monthly\nMissions',
                              ),
                            ],
                          ),
                          const SizedBox(height: 16), // Spacing between rows

                          // Third Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              PowerScoreCircle(
                                value: totalData?['quartely_battles'] ?? 0,
                                progress:
                                    (totalData?['quartely_battles'] ?? 0) / 10,
                                title: 'Quarterly\nBattles',
                              ),
                              PowerScoreCircle(
                                value: totalData?['war_maps'] ?? 0,
                                progress: (totalData?['war_maps'] ?? 0) / 10,
                                title: 'Yearly\nGames',
                              ),
                              const SizedBox(width: 80), // Empty space for balance
                            ],
                          ),
                        ],
                      ),
                    ),
                    const BottomSpacing(),
                  ],
                ),
              ),
            );
          },
        ),);
  }
}
