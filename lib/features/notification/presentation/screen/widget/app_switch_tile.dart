import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppSwitchTile extends StatelessWidget {
  const AppSwitchTile({
    required this.title,
    required this.value,
    super.key,
    this.onChanged,
    this.textStyle,
    this.subtitle,
  });

  final void Function(bool)? onChanged;
  final String title;
  final bool value;
  final TextStyle? textStyle;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      contentPadding: EdgeInsets.zero,
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style:
                  AppTextStyles.titleSm.copyWith(color: AppColors.textColor100),
            )
          : null,
      title: Text(
        title,
        style: AppTextStyles.titleSm.copyWith(color: AppColors.textColor100),
      ),
      value: value,
      activeColor: AppColors.primary500,
      onChanged: onChanged,
    );
  }
}
