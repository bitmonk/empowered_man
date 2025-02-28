import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AppMapWidget extends StatelessWidget {
  const AppMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 244,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.neutral50,
        ),
      ),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(20),
        child: Assets.images.map.image(
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
