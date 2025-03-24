import 'package:empowered/core/extension/extensions.dart';

class HomePieChart extends StatelessWidget {
  const HomePieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 170,
        height: 170,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Outer Blue Ring
            _buildProgressCircle(AppColors.color5CE0A0, 0.75, 6, 170),
            // Outer Blue Ring
            _buildProgressCircle(AppColors.colorF5CA41, 0.75, 6, 150),

            // Middle Yellow Ring
            _buildProgressCircle(AppColors.primary200, 0.60, 6, 130),

            // Inner Green Ring
            _buildProgressCircle(AppColors.primary50, 0.35, 6, 110),

            // Centered Score Text
            const Positioned(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '24',
                    style: TextStyle(
                      color: AppColors.textColor50,
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
