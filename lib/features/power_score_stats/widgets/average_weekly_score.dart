import 'package:empowered/core/extension/extensions.dart';
import 'package:fl_chart/fl_chart.dart';

class AverageWeeklyScore extends StatelessWidget {
  const AverageWeeklyScore({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Score by Weekday',
            style: AppTextStyles.textHeadingH3,
          ),
          const VerticalSpacing(16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeeklyChip(label: 'Journal', color: AppColors.color5CE0A0),
                WeeklyChip(label: 'Habit', color: AppColors.primary300),
                WeeklyChip(label: 'Task', color: AppColors.colorF5CA41),
                WeeklyChip(label: 'Goals', color: AppColors.primary500),
              ],
            ),
          ),
          const VerticalSpacing(16),
          const AppDivider(
            color: AppColors.bgBorderVLight,
          ),
          _buildBarChart(),
        ],
      ),
    );
  }

  Widget _buildBarChart() {
    return SizedBox(
      height: 308, // Adjusted height for correct proportion
      child: BarChart(
        BarChartData(
          backgroundColor: Colors.transparent,
          gridData: const FlGridData(show: false), // Hide grid lines
          borderData: FlBorderData(
            show: false, // Hide borders
          ),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      days[value.toInt()],
                      style: AppTextStyles.textCaptionC2,
                    ),
                  );
                },
              ),
            ),
            rightTitles: const AxisTitles(),
            topTitles: const AxisTitles(),
          ),
          barGroups: _getBarGroups(),
          barTouchData: BarTouchData(
            enabled: true,
            allowTouchBarBackDraw: true,
            handleBuiltInTouches: true,
          ), // Disable interaction
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    final weeklyData = <List<double>>[
      [0.8, 0.6, 0.4, 0.2], // Monday
      [0.0, 0.6, 0.4, 0.2], // Tuesday
      [0.0, 0.0, 0.4, 0.2], // Wednesday
      [0.0, 0.0, 0.4, 0.2], // Thursday
      [0.0, 0.0, 0.4, 0.2], // Friday
      [0.0, 0.0, 0.4, 0.2], // Saturday
      [0.0, 0.0, 0.4, 0.2], // Sunday
    ];

    final colors = <Color>[
      AppColors.color5CE0A0, // Journal (Green)
      AppColors.colorF5CA41, // Task (Yellow)
      AppColors.primary300, // Habit (Light Blue)
      AppColors.primary500, // Goals (Dark Blue)
    ];

    return List.generate(weeklyData.length, (index) {
      var yOffset = 0.0;
      return BarChartGroupData(
        x: index, // Keep bars aligned correctly
        groupVertically: true, //

        barsSpace: 0, // Ensures no gaps between stacked bars
        barRods: List.generate(weeklyData[index].length, (i) {
          var height = weeklyData[index][i];
          var previousOffset = yOffset;
          yOffset += height;

          return BarChartRodData(
            fromY: previousOffset,
            toY: yOffset,
            color: colors[i],
            width: 30,
            borderSide: const BorderSide(color: AppColors.color132534),
            borderRadius: BorderRadius.zero,
          );
        }),
      );
    });
  }
}
