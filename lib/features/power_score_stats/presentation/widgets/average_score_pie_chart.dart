import 'package:empowered/core/extension/extensions.dart';

class AverageScorePieChart extends StatelessWidget {
  const AverageScorePieChart({
    required this.averageTotalPercentage,
    required this.averageTotalGrowthPercentage,
    required this.averageGrowthHabitsPercentage,
    required this.averageGrowthJournalsPercentage,
    required this.averageGrowthTasksPercentage,
    required this.averageGrowthGoalPercentage,
    required this.averageHabitsPercentage,
    required this.averageGoalPercentage,
    required this.averageTasksPercentage,
    required this.averageJournalsPercentage,
    super.key,
  });
  final String averageTotalPercentage;
  final String averageTotalGrowthPercentage;
  final String averageGrowthHabitsPercentage;
  final String averageGrowthJournalsPercentage;
  final String averageGrowthTasksPercentage;
  final String averageGrowthGoalPercentage;
  final String averageHabitsPercentage;
  final String averageGoalPercentage;
  final String averageTasksPercentage;
  final String averageJournalsPercentage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer Blue Ring
          _buildProgressCircle(AppColors.primary500,
              double.tryParse(averageGrowthJournalsPercentage) ?? 0.0, 6, 180,),
          // Outer Blue Ring
          _buildProgressCircle(AppColors.colorF5CA41,
              double.tryParse(averageGrowthHabitsPercentage) ?? 0.0, 6, 160,),

          // Middle Yellow Ring
          _buildProgressCircle(AppColors.primary200,
              double.tryParse(averageGrowthTasksPercentage) ?? 0.0, 6, 140,),

          // Inner Green Ring
          _buildProgressCircle(AppColors.color5CE0A0,
              double.tryParse(averageGrowthGoalPercentage) ?? 0.0, 6, 120,),

          // Centered Score Text
          Positioned(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  averageTotalPercentage,
                  style: const TextStyle(
                    color: AppColors.textColor50,
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
                const VerticalSpacing(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Assets.images.increaseArrow.svg(),
                    ),
                    Text(
                      averageTotalGrowthPercentage,
                      style: const TextStyle(
                        color: AppColors.color5CE0A0,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                // AveragePercentage(
                //   w1Value: 50,
                //   w4Value: 75,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCircle(
    Color color,
    double progress,
    double thickness,
    double size,
  ) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeCap: StrokeCap.round,
        value: (progress.clamp(0, 100)) / 100,
        strokeWidth: thickness,
        backgroundColor: const Color(0xff1C2934),
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
