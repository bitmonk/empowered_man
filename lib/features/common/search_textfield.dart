import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/common/app_text_field_wthout_label.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({
    required this.title,
    super.key,
    this.fillColor = AppColors.neutral50,
    this.isSmallIcon = false,
  });
  final String title;
  final Color fillColor;
  final bool isSmallIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      child: AppTextFormFieldWithoutLabel(
        borderRadius: BorderRadius.circular(8),
        borderWidth: 0,
        hintText: title,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: isSmallIcon
              ? Assets.images.searchSmall.svg()
              : Assets.images.search.svg(),
        ),
        fillColor: fillColor,
      ),
    );
  }
}
