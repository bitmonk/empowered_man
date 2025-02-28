import 'package:empowered/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider(
      {this.indent = 1,
      this.endent = 1,
      super.key,
      this.color = AppColors.dividerGrey,});
  final Color color;
  final double indent;
  final double endent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      endIndent: endent,
      indent: indent,
      color: color,
      height: 1,
    );
  }
}

class GreyDivider extends StatelessWidget {
  const GreyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.bgBorderVLight,
      height: 1,
    );
  }
}
