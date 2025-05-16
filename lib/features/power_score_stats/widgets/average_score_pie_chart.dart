import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/presentation/widgets/average_percentage.dart';

class AverageScorePieChart extends StatelessWidget {
  const AverageScorePieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer Blue Ring
          _buildProgressCircle(AppColors.primary500, 0.75, 6, 180),
          // Outer Blue Ring
          _buildProgressCircle(AppColors.colorF5CA41, 0.75, 6, 160),

          // Middle Yellow Ring
          _buildProgressCircle(AppColors.primary200, 0.60, 6, 140),

          // Inner Green Ring
          _buildProgressCircle(AppColors.color5CE0A0, 0.35, 6, 120),

          // Centered Score Text
          const Positioned(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '46%',
                  style: TextStyle(
                    color: AppColors.textColor50,
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
                VerticalSpacing(4),
                AveragePercentage(
                  w1Value: 50,
                  w4Value: 75,
                ),
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
        value: progress,
        strokeWidth: thickness,
        backgroundColor: const Color(0xff1C2934),
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
