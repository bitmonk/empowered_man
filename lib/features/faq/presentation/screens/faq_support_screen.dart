import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/common/app_scaffold.dart';
import 'package:empowered/features/common/custom_app_bar.dart';
import 'package:empowered/features/faq/presentation/controllers/faq_support_controller.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaqScreen extends GetView<FaqController> {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        title: 'FAQ',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Obx(
            () => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.faqDataDetailList.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, color: AppColors.bgBorder),
              itemBuilder: (context, index) {
                final item = controller.faqDataDetailList[index];

                return Obx(() {
                  final isExpanded = controller.expandedIndex.value == index;

                  return Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor:
                          Colors.transparent, // Remove default divider
                      splashColor: Colors.transparent, // Remove ripple effect
                    ),
                    child: ExpansionTile(
                      onExpansionChanged: (expanded) {
                        if (expanded) {
                          controller.expandedIndex.value = index;
                        } else {
                          controller.expandedIndex.value = -1;
                        }
                      },
                      title: Text(
                        item.title,
                        style: AppTextStyles.textBodyB1.copyWith(
                          color: isExpanded
                              ? AppColors.primary500 // Blue when expanded
                              : AppColors.textColor100, // Default color
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Icon(
                        isExpanded ? Icons.close : Icons.add,
                        color: AppColors.textColor50,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Text(
                            item.description,
                            style: AppTextStyles.textBodyB3
                                .copyWith(color: AppColors.textColor100),
                          ),
                        ),
                      ],
                    ),
                  );
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
