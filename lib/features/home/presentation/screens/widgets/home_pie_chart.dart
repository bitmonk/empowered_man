import 'package:empowered/core/extension/extensions.dart';

class HomePieChart extends StatelessWidget {
  const HomePieChart(
      {required this.centerText, required this.habit, required this.journal, required this.tasks, required this.goals, super.key,});
  final String centerText;
  final double habit;
  final double journal;
  final double tasks;
  final double goals;

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
            _buildProgressCircle(AppColors.color5CE0A0, journal / 50, 6, 170),
            // Outer Blue Ring
            _buildProgressCircle(AppColors.colorF5CA41, tasks / 50, 6, 150),

            // Middle Yellow Ring
            _buildProgressCircle(AppColors.primary200, habit / 50, 6, 130),

            // Inner Green Ring
            _buildProgressCircle(AppColors.primary50, goals / 50, 6, 110),

            // Centered Score Text
            Positioned(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    centerText,
                    style: const TextStyle(
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
