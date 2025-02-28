import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';

class WeeklyChip extends StatelessWidget {
  const WeeklyChip({required this.label, required this.color, super.key});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 6,
          backgroundColor: color,
        ),
        const HorizontalSpacing(6),
        Text(
          label,
          style: AppTextStyles.textBodyB3,
        ),
      ],
    );
  }
}
