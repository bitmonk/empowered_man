import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/data/model/journal_emotion_names_model.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_emotion_name_controller.dart';
import 'package:empowered/features/journal_chat/presentation/screens/journal_chat_screen.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';

class JournalDrawer extends StatefulWidget {
  const JournalDrawer({super.key});

  @override
  State<JournalDrawer> createState() => _JournalDrawerState();
}

class _JournalDrawerState extends State<JournalDrawer> {
  final controller = Get.find<JournalEmotionNameController>();

  @override
  void initState() {
    super.initState();
    controller.getJournalEmotionName();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.bgMedium,
      child: Container(
        padding: const EdgeInsets.all(24),
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
                    ),
                  ),
                ),
                const HorizontalSpacing(16),
                Text(
                  Get.find<ProfileController>().userProfile.value.fullName ??
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEmotionList(context),

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
                  final emotions =
                      controller.journalEmotionName.value.data?.emotionNames ??
                          [];
                  print('>>>>>>>>>>>>.>>>>>>>>>>>>>>>>>>Emotions: $emotions');
                  Get.toNamed(
                    AppRoutes.journalLibrary,
                    arguments: {
                      'emotion_names': emotions,
                    },
                  );
                },
              ),
            ),
            const BottomSpacing(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmotionList(BuildContext context) {
    return Obx(() {
      final emotions =
          controller.journalEmotionName.value.data?.emotionNames ?? [];
      if (controller.journalEmotionNameState.value == TheStates.loading) {
        return const LoadingWidget();
      }
      if (controller.journalEmotionNameState.value == TheStates.error) {
        return const Center(
          child: Text(
            'Failed to load emotions',
            style: TextStyle(color: Colors.red),
          ),
        );
      }

      if (emotions.isEmpty) {
        return const Center(
          child: Text(
            'No emotions available',
            style: TextStyle(color: Colors.grey),
          ),
        );
      }

      return Column(
        children: emotions
            .map(
              (emotion) => _buildMenuItem(
                emotion.emotionName ?? '',
                context,
                emotion: emotion,
              ),
            )
            .toList(),
      );
    });
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

  Widget _buildMenuItem(
    String title,
    BuildContext context, {
    EmotionName? emotion,
  }) {
    return InkWell(
      onTap: () async {
        Navigator.pop(context);

        final journalChatController = Get.find<JournalChatController>();
        journalChatController.selectedEmotion.value = emotion;
        journalChatController.chatConversationList.clear();
        journalChatController.getJournalWithQuestionsAndAnswers();
        Get.to(
          () => const JournalChatScreen(),
        );
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
