import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    required this.image,
    required this.title,
    super.key,
    this.color = AppColors.textColor300,
    this.onTap,
    this.isSelected = false,
    this.textColor = AppColors.textColor300,
  });
  final String title;
  final Color color;
  final Color? textColor;
  final String image;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset(
              width: 16,
              image,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.primary500 : color,
                BlendMode.srcIn,
              ),
            ),
            const HorizontalSpacing(8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? AppColors.primary500 : textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
