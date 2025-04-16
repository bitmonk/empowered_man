import 'package:empowered/core/extension/extensions.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, this.status});
  final String? status;
  @override
  Widget build(BuildContext context) {
    Color badgeColor;
    String statusText;

    switch (status) {
      case 'completed':
        badgeColor = AppColors.color2AD674;
        statusText = 'Completed';
      case 'in_progress':
        badgeColor = AppColors.colorF2994A;
        statusText = 'In Progress';
      default:
        badgeColor = AppColors.colorF64E51;
        statusText = 'Not Started';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: badgeColor,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        statusText,
        style: TextStyle(
          color: badgeColor,
        ),
      ),
    );
  }
}
