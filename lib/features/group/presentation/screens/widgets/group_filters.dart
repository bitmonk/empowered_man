import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupFilters extends StatelessWidget {
  const GroupFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class GroupFilterButton extends StatelessWidget {
  const GroupFilterButton({
    required this.title,
    required this.isSelected,
    super.key,
    this.onTap,
  });
  final String title;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.r,
        width: 135.r,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryDark : AppColors.baseWhite,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          title,
          style: AppTextStyles.bodySmRegular.copyWith(
            fontSize: 13.sp,
            color: isSelected ? AppColors.baseWhite : AppColors.neutral600,
          ),
        ),
      ),
    );
  }
}
