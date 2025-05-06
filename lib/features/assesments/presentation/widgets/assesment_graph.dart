import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/data/model/get_assessment_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AssessmentGraph extends StatelessWidget {
  const AssessmentGraph(
      {required this.scoreHistory, required this.totalScore, super.key});
  final List<ScoreHistory> scoreHistory;
  final String totalScore;

  List<FlSpot> _generateSpots() {
    print("ScoreHistory data: $scoreHistory");

    final weekValues = [0.0, 0.0, 0.0, 0.0];

    for (var entry in scoreHistory) {
      if (entry.w1 != null) {
        weekValues[0] = entry.w1!.toDouble();
        print("Found W1 value: ${entry.w1}");
      }
      if (entry.w2 != null) {
        weekValues[1] = entry.w2!.toDouble();
        print("Found W2 value: ${entry.w2}");
      }
      if (entry.w3 != null) {
        weekValues[2] = entry.w3!.toDouble();
        print("Found W3 value: ${entry.w3}");
      }
      if (entry.w4 != null) {
        weekValues[3] = entry.w4!.toDouble();
        print("Found W4 value: ${entry.w4}");
      }
    }

    final spots = List.generate(4, (i) {
      final week = i + 1;
      final value = weekValues[i];

      print("Creating spot: week=$week, value=$value");

      return FlSpot(week.toDouble(), value);
    });

    print("Generated spots: $spots");

    return spots;
  }

  @override
  Widget build(BuildContext context) {
    final maxScore = double.parse(totalScore);
    final yInterval = maxScore / 3;
    final spots = _generateSpots();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 35),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Results History',
                style: AppTextStyles.textSmallS2,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Assets.images.increaseArrow.svg(),
              ),
              const Text(
                '+12.5%',
                style: TextStyle(
                  color: AppColors.color5CE0A0,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const VerticalSpacing(20),
          SizedBox(
            height: 150,
            child: LineChart(
              LineChartData(
                minX: 1,
                maxX: 4,
                minY: 0,
                maxY: maxScore,
                gridData: FlGridData(
                  drawVerticalLine: false,
                  drawHorizontalLine: true,
                  horizontalInterval: yInterval,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.white.withOpacity(0.1),
                    strokeWidth: 1,
                  ),
                  getDrawingVerticalLine: (value) => FlLine(
                    color: Colors.white.withOpacity(0.1),
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value == 0 ||
                            (value.toInt() == yInterval.toInt()) ||
                            (value.toInt() == (2 * yInterval).toInt()) ||
                            (value.toInt() == maxScore.toInt())) {
                          return _buildTitle(value.toInt().toString());
                        }
                        return const SizedBox.shrink();
                      },
                      interval: yInterval,
                      reservedSize: 30,
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value >= 1 &&
                            value <= 4 &&
                            value.toInt() == value) {
                          return _buildTitle('W${value.toInt()}');
                        }
                        return const SizedBox.shrink();
                      },
                      interval: 1,
                      reservedSize: 24,
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: Colors.blueAccent,
                    isStrokeCapRound: true,
                    barWidth: 3,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.blueAccent.withOpacity(0.2),
                    ),
                    dotData: FlDotData(
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 5,
                          color: Colors.blueAccent,
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 12),
    );
  }
}
