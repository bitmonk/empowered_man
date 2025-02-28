import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:flutter/material.dart';

class PowerScoreChipText extends StatelessWidget {
  const PowerScoreChipText(
      {required this.color, required this.title, super.key,});
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: color,
          ),
          height: 20,
          width: 20,
        ),
        const HorizontalSpacing(12),
        Text(
          title,
          style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
