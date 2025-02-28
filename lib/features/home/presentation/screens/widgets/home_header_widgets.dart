import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/core/routes/app_routes.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:empowered/utlis/app_widget_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeaderWidgets extends StatelessWidget {
  const HomeHeaderWidgets({super.key, this.hideControls = false});
  final bool hideControls;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!hideControls)
          Padding(
            padding: const EdgeInsets.only(
              bottom: 24,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary500,
                  ),
                  child: ClipOval(
                    child: Assets.images.homeProfile.image(
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const HorizontalSpacing(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hi',
                      style: AppTextStyles.textBodyB3,
                    ),
                    const VerticalSpacing(2),
                    Text(
                      'Allen Jhon',
                      style: AppTextStyles.textBodyB3
                          .copyWith(color: AppColors.white),
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Assets.images.homeSearch.svg(width: 40),
                ),
                const HorizontalSpacing(8),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.notificationHistory);
                  },
                  child: Assets.images.notification.svg(width: 40),
                ),
                const HorizontalSpacing(8),
                InkWell(
                  onTap: () {
                    AppWidgetKey.mainScaffold.currentState!.openDrawer();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Assets.images.menu.svg(width: 32),
                  ),
                ),
              ],
            ),
          ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Level 3',
              style: AppTextStyles.textBodyB1,
            ),
            Text(
              'Needs 100 points to level 4',
              style: AppTextStyles.textBodyB3,
            ),
          ],
        ),
        const VerticalSpacing(8),
        LinearProgressIndicator(
          borderRadius: BorderRadius.circular(20),
          minHeight: 8,
          color: AppColors.colorF5CA41,
          value: 0.4,
        ),
        const VerticalSpacing(4),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '200',
              style: AppTextStyles.textBodyB3,
            ),
            Text(
              '5000',
              style: AppTextStyles.textBodyB3,
            ),
          ],
        ),
        const VerticalSpacing(16),
      ],
    );
  }
}
