import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/data/model/my_memory_model.dart';
import 'package:empowered/features/home/presentation/controllers/home_controller.dart';
import 'package:empowered/features/journal_chat/data/model/journal_emotion_names_model.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_bindings.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_emotion_name_bindings.dart';
import 'package:empowered/features/journal_chat/presentation/screens/journal_chat_screen.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';

class MyMemoryBottomSheet extends StatelessWidget {

  const MyMemoryBottomSheet({super.key});
  List<String> extractTextList(dynamic list) {
    if (list == null) return [];
    return List<String>.from(
      (list as List).map((item) {
        if (item is String) return item;
        if (item is Tion) return item.text ?? '';
        if (item is Map<String, dynamic>) return item['text'] ?? '';
        return '';
      }),
    ).where((e) => e.isNotEmpty).toList();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    // Fetch memory if not already loaded
    if (controller.myMemoryState.value == TheStates.initial) {
      controller.getMyMemory();
    }
    return Obx(() {
      final state = controller.myMemoryState.value;
      if (state == TheStates.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state == TheStates.error) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                controller.myMemoryError.value ?? 'Error loading memory',
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: controller.getMyMemory,
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      } else if (state == TheStates.success &&
          controller.myMemoryData.value != null) {
        final memory = controller.myMemoryData.value!.data?.memory;
        final answers = memory?.answers;
        final createdAt = memory?.createdAt;
        final emotionName = memory?.emotionName ?? '-';
        var formattedDate = createdAt != null
            ? DateFormat('MMMM d, yyyy').format(createdAt)
            : '-';
        return Column(
          children: [
            // Title
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: const Text(
                    'My Memory',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.textColor100,
                      size: 28,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            Text(
              emotionName,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const VerticalSpacing(24),
            // Date and emotion
            Row(
              children: [
                Assets.images.guilt.svg(),
                const HorizontalSpacing(10),
                Text(
                  '$emotionName Stack',
                  style: AppTextStyles.textBodyB1
                      .copyWith(color: AppColors.textColor200),
                ),
                const HorizontalSpacing(16),
                Text(
                  formattedDate,
                  style: AppTextStyles.textBodyB3.copyWith(
                    color: AppColors.textColor200,
                  ),
                ),
                const HorizontalSpacing(12),
                GestureDetector(
                  onTap: () {
                    // final homeController = Get.find<HomeController>();
                    controller.getMyMemory();
                  },
                  child: Assets.images.rotateRight.svg(),
                ),
              ],
            ),
            const VerticalSpacing(24),
            // Memory Sections
            ThemedContainer(
              color: AppColors.color1B3144,
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  _memorySection(
                    'Your Lesson',
                    extractTextList(answers?.lesson),
                    AppColors.primary500,
                    false,
                  ),
                  _memorySection(
                    'Your Story',
                    extractTextList(answers?.story),
                    null,
                    true,
                  ),
                  _memorySection(
                    'Your Revelation',
                    answers?.revelation?.map((e) => e.text ?? '').toList() ??
                        [],
                    null,
                    true,
                  ),
                  _memorySection(
                    'Your Action',
                    answers?.action?.map((e) => e.text ?? '').toList() ?? [],
                    null,
                    false,
                  ),
                  const VerticalSpacing(20),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 16),
              child: Column(
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          JournalChatInitializer.initialize();
                          final memory =
                              controller.myMemoryData.value?.data?.memory;
                          final journalId = memory?.journalId?.toString();
                          final emotionName = memory?.emotionName;
                          if (journalId != null && emotionName != null) {
                            final chatController =
                                Get.find<JournalChatController>();
                            chatController.resetEditMode();
                            // Set selectedEmotion to avoid null access in UI
                            chatController.selectedEmotion.value = EmotionName(
                              id: int.tryParse(
                                  journalId,), // Convert journalId to int
                              emotionName: emotionName,
                            );
                            await chatController
                                .getJournalWithQuestionsAndAnswersById(
                                    journalId,);
                            JournalChatInitializer.destroy();
                            JournalChatInitializer.initialize();
                            JournalEmotionNameInitializer.destroy();
                            JournalEmotionNameInitializer.initialize();
                            Navigator.pop(context);
                            Get.to(
                                () => JournalChatScreen(journalId: journalId),);
                          } else {
                            AppUtils.showErrorSnackbar(
                                message: 'Unable to load journal',);
                          }
                        },
                        child: Container(
                          height: 36,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 50,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.primary500,
                            ),
                          ),
                          child: Text(
                            'Full Memory',
                            style: AppTextStyles.textBodyB3.copyWith(
                              color: AppColors.primary500,
                            ),
                          ),
                        ),
                      ),
                      const VerticalSpacing(16),
                      AppOutlinedButton(
                        text: 'Share',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const VerticalSpacing(40),
          ],
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }

  Widget _memorySection(
    String title,
    List<String> content,
    Color? color,
    bool showDivider,
  ) {
    if (content.isEmpty || content.every((e) => e.isEmpty)) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const VerticalSpacing(8),
          ...content.where((text) => text.isNotEmpty).map(
                (text) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '•',
                        style: AppTextStyles.textBodyB2.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const HorizontalSpacing(4),
                      Expanded(
                        child: HtmlWidget(
                          text,
                          textStyle: AppTextStyles.textBodyB2
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          if (showDivider)
            const Divider(
              color: AppColors.color324E65,
            ),
        ],
      ),
    );
  }
}
