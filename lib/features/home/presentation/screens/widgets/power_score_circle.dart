import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/presentation/screens/widgets/app_circular_indicator.dart';

class PowerScoreCircle extends StatelessWidget {
  const PowerScoreCircle({
    required this.title,
    required this.value,
    required this.progress,
    super.key,
    this.subtitle,
  });
  final String title;
  final String? subtitle;
  final int value;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCircularProgressIndicator(
          progress: progress,
          count: value,
          strokeWidth: 4,
        ),
        const VerticalSpacing(8),
        Text(
          title,
          style: AppTextStyles.textBodyB1,
          textAlign: TextAlign.center,
        ),
        if (subtitle != null)
          Text(
            subtitle!,
            style: AppTextStyles.textBodyB3,
          ),
      ],
    );
  }
}
