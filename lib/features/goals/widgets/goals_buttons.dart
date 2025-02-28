import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/core/routes/app_routes.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoalsButtons extends StatelessWidget {
  const GoalsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primary500,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text(
                'Body Tent',
                style: AppTextStyles.textBodyB3,
              ),
            ),
          ),
          const HorizontalSpacing(20),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.goalsOverview);
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: AppColors.primary500,
                  ),
                ),
                child: Text(
                  'Goals Overview',
                  style: AppTextStyles.textBodyB3.copyWith(
                    color: AppColors.primary500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
