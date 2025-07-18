import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/presentation/screens/widgets/full_memory_sheet.dart';
import 'package:empowered/features/home/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:empowered/features/home/data/model/my_memory_model.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
import 'package:empowered/features/journal_chat/presentation/screens/journal_chat_screen.dart';

class MyMemoryBottomSheet extends StatelessWidget {
  const MyMemoryBottomSheet({super.key});

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
                    (answers?.lesson
                                ?.cast<String?>()
                                .whereType<String>()
                                .toList() ??
                            []) +
                        (answers?.lesson
                                ?.whereType<Tion>()
                                .map((e) => e.text ?? '')
                                .toList() ??
                            []),
                    AppColors.primary500,
                    false,
                  ),
                  _memorySection(
                    'Your Story',
                    (answers?.story
                                ?.cast<String?>()
                                .whereType<String>()
                                .toList() ??
                            []) +
                        (answers?.story
                                ?.whereType<Tion>()
                                .map((e) => e.text ?? '')
                                .toList() ??
                            []),
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
                          final memory =
                              controller.myMemoryData.value?.data?.memory;
                          final journalId = memory?.journalId?.toString();
                          if (journalId != null) {
                            final chatController =
                                Get.find<JournalChatController>();
                            chatController.resetEditMode();
                            // You may want to clear previous data here if needed
                            await chatController
                                .getJournalWithQuestionsAndAnswersById('1');
                            Get.to(() => const JournalChatScreen());
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
                        child: Text(
                          text,
                          style: AppTextStyles.textBodyB2
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
