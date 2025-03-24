import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/gen/assets.gen.dart';

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
          Positioned(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '46%',
                  style: TextStyle(
                    color: AppColors.textColor50,
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
                const VerticalSpacing(4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Assets.images.increaseArrow.svg(width: 8),
                    const HorizontalSpacing(4),
                    const Text(
                      '12.5%',
                      style: TextStyle(color: AppColors.color5CE0A0),
                    ),
                  ],
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
