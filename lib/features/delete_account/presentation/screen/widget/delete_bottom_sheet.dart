import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/common/app_divider.dart';
import 'package:empowered/features/common/app_outlined_button.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';

class DeleteBottomSheet extends StatelessWidget {
  const DeleteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.bgMedium,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 43,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(
                  0xFF4A5D72,
                ),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
            ),
            const VerticalSpacing(14),
            const Text(
              'Delete Account?',
              style: AppTextStyles.titleHeading,
            ),
            const VerticalSpacing(20),
            const AppDivider(),
            const VerticalSpacing(20),
            Text(
              textAlign: TextAlign.center,
              'Lorem ipsum dolor sit amet,\n consectetuer adipiscing elit. Aenean commodo ligula eget dolor massa. Cum sociin natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis.',
              style: AppTextStyles.titleMd.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.textColor200,
              ),
            ),
            const VerticalSpacing(24),
            AppOutlinedButton.orange(
              text: 'Delete',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const VerticalSpacing(16),
            AppOutlinedButton.withOutlined(
              safePadding: true,
              hasShadow: false,
              text: 'Cancel',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const BottomSpacing(),
          ],
        ),
      ),
    );
  }
}
