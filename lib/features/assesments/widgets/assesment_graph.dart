import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AssessmentGraph extends StatelessWidget {
  const AssessmentGraph({super.key});

  @override
  Widget build(BuildContext context) {
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
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value == 0 || value == 50 || value == 100) {
                          return _buildTitle(value.toInt().toString());
                        }
                        return const SizedBox.shrink();
                      },
                      interval: 50, // Adjusts the step size for labels
                      reservedSize: 30, // Space for Y-axis values
                    ),
                  ),
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 1:
                            return _buildTitle('Q1');
                          case 2:
                            return _buildTitle('Q2');
                          case 3:
                            return _buildTitle('Q3');
                          case 4:
                            return _buildTitle('Q4');
                          default:
                            return const SizedBox.shrink();
                        }
                      },
                      interval: 1,
                      reservedSize: 24,
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(1, 40),
                      const FlSpot(2, 60),
                      const FlSpot(3, 100),
                      const FlSpot(3.5, 70),
                      const FlSpot(4, 90),
                    ],
                    isCurved: true,
                    color: Colors.blueAccent,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(),
                    dotData: const FlDotData(show: false),
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
