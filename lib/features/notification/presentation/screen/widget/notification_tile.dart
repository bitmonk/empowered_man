import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/common/app_divider.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            const VerticalSpacing(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Assets.images.notificationProfile.image(width: 32),
                const HorizontalSpacing(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You have recieved a new notification',
                        style: AppTextStyles.bodyLGMedium
                            .copyWith(color: AppColors.textColor200),
                      ),
                      const VerticalSpacing(4),
                      Text(
                        'Last Wednesday at 9:42 AM',
                        style: AppTextStyles.bodySmRegular
                            .copyWith(color: AppColors.textColor300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const VerticalSpacing(24),
            const AppDivider(),
          ],
        ),
      ),
    );
  }
}
