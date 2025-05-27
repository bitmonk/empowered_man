import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/power_score_stats/data/model/power_stat_model.dart';
import 'package:fl_chart/fl_chart.dart';

class AverageWeeklyScore extends StatelessWidget {
  const AverageWeeklyScore({required this.weeklyStatus, super.key});
  final Weeklystatus? weeklyStatus;

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
          const VerticalSpacing(16),
          _buildBarChart(),
        ],
      ),
    );
  }

  Widget _buildBarChart() {
    return SizedBox(
      height: 308,
      child: Stack(
        children: [
          BarChart(
            BarChartData(
              backgroundColor: Colors.transparent,
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
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
                touchTooltipData: BarTouchTooltipData(
                  tooltipRoundedRadius: 8,
                  tooltipPadding: const EdgeInsets.all(8),
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    final labels = ['Journal', 'Habit', 'Task', 'Goals'];
                    final value = rod.toY - rod.fromY;
                    return BarTooltipItem(
                      '${labels[rodIndex]}: ${value.toStringAsFixed(1)}',
                      TextStyle(
                        color: rod.color,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          // Overlay for displaying values inside bars
          _buildValueOverlay(),
        ],
      ),
    );
  }

  Widget _buildValueOverlay() {
    return CustomPaint(
      size: const Size(double.infinity, 308),
      painter: BarValuePainter(_getWeeklyData()),
    );
  }

  List<List<double>> _getWeeklyData() {
    // Helper to safely parse a dynamic value into a double
    double parseValue(dynamic val) {
      if (val == null) return 0;
      if (val is num) return val.toDouble();
      return double.tryParse(val.toString()) ?? 0.0;
    }

    final days = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];

    return days.map((day) {
      return [
        parseValue(weeklyStatus?.journal?.toJson()[day]),
        parseValue(weeklyStatus?.habits?.toJson()[day]),
        parseValue(weeklyStatus?.tasks?.toJson()[day]),
        parseValue(weeklyStatus?.goals?.toJson()[day]),
      ];
    }).toList();
  }

  List<BarChartGroupData> _getBarGroups() {
    final weeklyData = _getWeeklyData();

    final colors = <Color>[
      AppColors.color5CE0A0, // Journal (Green)
      AppColors.primary300, // Habit (Blue)
      AppColors.colorF5CA41, // Task (Yellow)
      AppColors.primary500, // Goals (Dark Blue)
    ];

    return List.generate(weeklyData.length, (index) {
      var yOffset = 0.0;
      return BarChartGroupData(
        x: index,
        groupVertically: true,
        barsSpace: 0,
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

class BarValuePainter extends CustomPainter {

  BarValuePainter(this.weeklyData);
  final List<List<double>> weeklyData;

  @override
void paint(Canvas canvas, Size size) {
  final paint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  // Calculate chart dimensions (excluding bottom title space)
  final chartHeight = size.height - 40; // Reserve space for day labels
  final chartWidth = size.width;
  const barWidth = 30.0;
  final numberOfBars = weeklyData.length;
  final spaceBetweenBars = (chartWidth - (numberOfBars * barWidth)) / (numberOfBars + 1);

  // Find the maximum total value for scaling
  double maxTotal = 0;
  for (final day in weeklyData) {
    var total = day.fold<double>(0, (sum, value) => sum + value);
    if (total > maxTotal) maxTotal = total;
  }

  for (var dayIndex = 0; dayIndex < weeklyData.length; dayIndex++) {
    final dayData = weeklyData[dayIndex];
    final barX = spaceBetweenBars + (dayIndex * (barWidth + spaceBetweenBars));
    
    double yOffset = 0;
    var totalHeight = dayData.fold<double>(0, (sum, value) => sum + value);
    
    for (var valueIndex = 0; valueIndex < dayData.length; valueIndex++) {
      final value = dayData[valueIndex];
      
      // Skip if value is 0 or very small
      if (value < 0.01) {
        continue;
      }
      
      // Calculate the height of this segment in pixels
      final segmentHeight = (value / maxTotal) * chartHeight;
      final segmentY = chartHeight - ((yOffset + value) / maxTotal) * chartHeight;
      
      // Only draw text if the segment is tall enough
      if (segmentHeight > 20) {
        final textSpan = TextSpan(
          text: value.toStringAsFixed(1),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        );
        
        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
        );
        
        textPainter.layout();
        
        // Center the text horizontally and vertically within the segment
        final textX = barX + (barWidth - textPainter.width) / 2;
        final textY = segmentY + (segmentHeight - textPainter.height) / 2;
        
        // Draw a small background rectangle for better text visibility
        final backgroundRect = RRect.fromRectAndRadius(
          Rect.fromLTWH(
            textX - 2,
            textY - 1,
            textPainter.width + 4,
            textPainter.height + 2,
          ),
          const Radius.circular(2),
        );
        
        canvas.drawRRect(
          backgroundRect,
          Paint()
            ..color = Colors.black.withOpacity(0.3)
            ..style = PaintingStyle.fill,
        );
        
        textPainter.paint(canvas, Offset(textX, textY));
      }
      
      yOffset += value;
    }
  }
}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}