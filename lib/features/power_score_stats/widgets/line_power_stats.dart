import 'package:empowered/core/extension/extensions.dart';
import 'package:fl_chart/fl_chart.dart';

class LinePowerStats extends StatelessWidget {
  const LinePowerStats({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Score by Weekday',
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
          _buildLineChart(),
        ],
      ),
    );
  }

  Widget _buildLineChart() {
    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          minY: 0, // Ensures the Y-axis starts from 0

          backgroundColor: Colors.transparent,
          gridData: FlGridData(
            drawVerticalLine: false,
            drawHorizontalLine: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.white.withOpacity(0.1),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1, // Ensures values appear at 0, 1, 2, 3, 4
                getTitlesWidget: (value, meta) {
                  if (value < 0 || value > 4) {
                    return Container(); // Hide unwanted labels
                  }
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      value.toInt().toString(),
                      style: AppTextStyles.textCaptionC2
                          .copyWith(color: Colors.white.withOpacity(0.5)),
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                  return Text(
                    days[value.toInt()],
                    style: AppTextStyles.textCaptionC2
                        .copyWith(color: Colors.white.withOpacity(0.5)),
                  );
                },
              ),
            ),
            rightTitles: const AxisTitles(),
            topTitles: const AxisTitles(),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: _getLines(),
        ),
      ),
    );
  }

  List<LineChartBarData> _getLines() {
    final weeklyData = <List<double>>[
      [3.0, 2.5, 2.0, 2.8, 2.2, 2.7, 3.5], // Journal
      [2.0, 2.2, 2.8, 3.0, 3.2, 3.8, 4.0], // Habit
      [0.9, 1.8, 0.6, 2.5, 3.0, 2.2, 1.7], // Task
      [3.5, 3.0, 3.2, 3.8, 3.5, 4.2, 4], // Goals
    ];

    final colors = <Color>[
      AppColors.color5CE0A0, // Journal (Green)
      AppColors.primary300, // Habit (Light Blue)
      AppColors.colorF5CA41, // Task (Yellow)
      AppColors.primary500, // Goals (Dark Blue)
    ];

    return List.generate(weeklyData.length, (index) {
      return LineChartBarData(
        spots: List.generate(weeklyData[index].length, (i) {
          return FlSpot(i.toDouble(), weeklyData[index][i]);
        }),
        isCurved: true,
        color: colors[index],
        barWidth: 3,
        isStrokeCapRound: true,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [
              colors[index].withOpacity(0.3),
              Colors.transparent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        dotData: const FlDotData(show: false),
      );
    });
  }
}
