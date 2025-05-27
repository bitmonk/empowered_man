import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/power_score_stats/data/model/power_stat_model.dart';
import 'package:fl_chart/fl_chart.dart';

class LinePowerStats extends StatelessWidget {
  const LinePowerStats({required this.monthlystatus, super.key});
  final Monthlystatus? monthlystatus;
  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Score by Month',
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
                reservedSize: 20,
                interval: 1,
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
                interval: 1,
                getTitlesWidget: (value, meta) {
                  const months = [
                    'J',
                    'F',
                    'M',
                    'A',
                    'M',
                    'J',
                    'J',
                    'A',
                    'S',
                    'O',
                    'N',
                    'D',
                  ];
                  return Text(
                    months[value.toInt()],
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

  // List<LineChartBarData> _getLines() {
  //   final monthlyData = <List<double>>[
  //     [3.0, 2.5, 2.0, 2.8, 2.2, 2.7, 3.5, 3.0, 2.8, 2.5, 2.2, 2.9], // Journal
  //     [2.0, 2.2, 2.8, 3.0, 3.2, 3.8, 4.0, 3.5, 3.2, 3.0, 2.8, 3.1], // Habit
  //     [0.9, 1.8, 0.6, 2.5, 3.0, 2.2, 1.7, 1.5, 1.2, 2.0, 1.8, 2.3], // Task
  //     [3.5, 3.0, 3.2, 3.8, 3.5, 4.2, 4.0, 3.7, 3.5, 3.8, 3.6, 4.1], // Goals
  //   ];

  //   final colors = <Color>[
  //     AppColors.color5CE0A0, // Journal (Green)
  //     AppColors.primary300, // Habit (Light Blue)
  //     AppColors.colorF5CA41, // Task (Yellow)
  //     AppColors.primary500, // Goals (Dark Blue)
  //   ];

  //   return List.generate(monthlyData.length, (index) {
  //     return LineChartBarData(
  //       spots: List.generate(monthlyData[index].length, (i) {
  //         return FlSpot(i.toDouble(), monthlyData[index][i]);
  //       }),
  //       isCurved: true,
  //       color: colors[index],
  //       barWidth: 3,
  //       isStrokeCapRound: true,
  //       belowBarData: BarAreaData(
  //         show: true,
  //         gradient: LinearGradient(
  //           colors: [
  //             colors[index].withOpacity(0.3),
  //             Colors.transparent,
  //           ],
  //           begin: Alignment.topCenter,
  //           end: Alignment.bottomCenter,
  //         ),
  //       ),
  //       dotData: const FlDotData(show: false),
  //     );
  //   });
  // }
  List<LineChartBarData> _getLines() {
    if (monthlystatus == null) return [];

    final categories = [
      monthlystatus!.journal,
      monthlystatus!.habits,
      monthlystatus!.tasks,
      monthlystatus!.goals,
    ];

    final colors = <Color>[
      AppColors.color5CE0A0, // Journal (Green)
      AppColors.primary300, // Habit (Blue)
      AppColors.colorF5CA41, // Task (Yellow)
      AppColors.primary500, // Goals (Dark Blue)
    ];

    return List.generate(categories.length, (index) {
      final data = categories[index];
      final values = _extractMonthlyValues(data);

      return LineChartBarData(
        spots: values.asMap().entries.map((entry) {
          return FlSpot(entry.key.toDouble(), entry.value);
        }).toList(),
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

  List<double> _extractMonthlyValues(MonthlystatusGoals? goal) {
    if (goal == null) return List.filled(12, 0);

    final rawValues = [
      goal.jan,
      goal.feb,
      goal.mar,
      goal.apr,
      goal.may,
      goal.jun,
      goal.jul,
      goal.aug,
      goal.sep,
      goal.oct,
      goal.nov,
      goal.dec,
    ];

    return rawValues.map((e) {
      if (e == null) return 0.0;
      if (e is num) return e.toDouble();
      if (e is String) return double.tryParse(e) ?? 0.0;
      return 0.0;
    }).toList();
  }
}
