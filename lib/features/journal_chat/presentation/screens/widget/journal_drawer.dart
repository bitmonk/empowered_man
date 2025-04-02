import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';

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
                              child: AppCachedImage(
                            width: 48,
                            height: 48,
                            errorWid: const Icon(Icons.person),
                            imgUrl: Get.find<ProfileController>()
                                    .userProfile
                                    .value
                                    .image ??
                                '',
                          ),),
                        ),
                        const HorizontalSpacing(16),
                        Text(
                          Get.find<ProfileController>()
                                  .userProfile
                                  .value
                                  .fullName ??
                              '',
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
