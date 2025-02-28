import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/common/themed_container.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeJournalWidget extends StatelessWidget {
  const HomeJournalWidget({
    required this.image,
    required this.title,
    required this.decription,
    super.key,
  });
  final String image;
  final String title;
  final String decription;

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      width: double.infinity,
      border: title == 'PM Journal'
          ? null
          : Border.all(
              color: AppColors.color008CFF,
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.textBodyB1,
          ),
          const VerticalSpacing(12),
          Row(
            children: [
              Image.asset(
                image,
                width: 26,
              ),
              const HorizontalSpacing(12),
              Expanded(
                child: Text(
                  decription,
                  style: AppTextStyles.textBodyB2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
