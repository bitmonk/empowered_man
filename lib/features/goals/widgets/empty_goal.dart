import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/core/routes/app_routes.dart';
import 'package:empowered/features/common/app_outlined_button.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/common/themed_container.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyGoal extends StatelessWidget {
  const EmptyGoal({required this.title, this.showStart = false, super.key});
  final String title;
  final bool showStart;

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      margin: const EdgeInsets.symmetric(vertical: 12),
      border: Border.all(
        color: AppColors.primary600,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: AppTextStyles.textHeadingH3,
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.reflectionScreen);
                  },
                  child: Assets.images.goalAdd.image(width: 32),),
              const HorizontalSpacing(16),
              Assets.images.goalThreeDot.image(width: 32),
            ],
          ),
          const VerticalSpacing(20),
          const Text(
            'You have not completed\nyour Body Targets.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textColor300,
            ),
          ),
          if (showStart)
            Padding(
              padding: const EdgeInsets.only(top: 18, left: 60, right: 60),
              child: AppOutlinedButton(
                height: 40,
                text: 'Start Body Reflection',
                textStyle: AppTextStyles.textBodyB3,
                onPressed: () {
                  Get.toNamed(AppRoutes.reflectionScreen);
                },
              ),
            ),
          const VerticalSpacing(30),
        ],
      ),
    );
  }
}
