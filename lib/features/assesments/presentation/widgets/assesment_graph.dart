import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/data/model/get_assessment_model.dart';
import 'package:fl_chart/fl_chart.dart';

class AssessmentGraph extends StatelessWidget {
  final List<ScoreHistory> scoreHistory;
  const AssessmentGraph({super.key, required this.scoreHistory});

  List<FlSpot> _generateSpots() {
    // Create a map of week number to value from scoreHistory
    final Map<int, double> weekMap = {};
    for (var entry in scoreHistory) {
      final data = entry.toJson();
      final weekStr = data.keys.first;
      final weekNum = int.tryParse(weekStr.replaceAll('W', '')) ?? 0;
      final value = double.tryParse(data[weekStr].toString()) ?? 0;
      weekMap[weekNum] = value;
    }

    // Generate FlSpots for weeks 1 to 4, filling missing ones with 0
    return List.generate(4, (i) {
      final week = i + 1;
      final value = weekMap[week] ?? 0;
      return FlSpot(week.toDouble(), value);
    });
  }

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
                minY: -1, maxY: 110,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 50,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.white.withOpacity(0.1),
                    strokeWidth: 1,
                  ),
                ),
                // gridData: const FlGridData(show: false),
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
                            return _buildTitle('W1');
                          case 2:
                            return _buildTitle('W2');
                          case 3:
                            return _buildTitle('W3');
                          case 4:
                            return _buildTitle('W4');
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
                    spots: _generateSpots(),
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
