import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/core/routes/app_routes.dart';
import 'package:empowered/features/common/app_outlined_button.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JournalDrawer extends StatelessWidget {
  const JournalDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.bgMedium,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpacing(MediaQuery.of(context).viewPadding.top),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                            child: Assets.images.drawerBack.svg(),
                          ),
                        ),
                        const HorizontalSpacing(6),
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
                        Text(
                          'Allen Jhon',
                          style: AppTextStyles.textBodyB3.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpacing(20),

                    // Reframes Section
                    _buildSectionTitle('Reframes'),
                    _buildMenuItem('Rage', context),
                    _buildMenuItem('Anger', context),
                    _buildMenuItem('Fear', context),
                    _buildMenuItem('Sadness', context),
                    _buildMenuItem('Hurt', context),
                    _buildMenuItem('Guilt', context),
                    _buildMenuItem('Happiness', context),
                    _buildMenuItem('Excitement', context),
                    _buildMenuItem('Gratitude', context),
                    _buildMenuItem('Appreciation', context),
                    const Divider(
                      color: Colors.grey,
                      thickness: 0.2,
                      height: 30,
                    ),

                    // Results Section
                    _buildSectionTitle('Results'),
                    _buildMenuItem('Lessons', context),
                    _buildMenuItem('Idea', context),
                    _buildMenuItem('Money', context),
                    _buildMenuItem('Production Mission', context),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: AppOutlinedButton(
                textStyle: AppTextStyles.textBodyB3,
                height: 40,
                text: 'Go to journal library',
                onPressed: () {
                  Get.toNamed(AppRoutes.journalLibrary);
                },
              ),
            ),
            const BottomSpacing(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: AppTextStyles.textBodyB1.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        Get.find<JournalChatController>().title.value = title;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Text(
              title,
              style: AppTextStyles.textBodyB2.copyWith(
                color: AppColors.textColor300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
