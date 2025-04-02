import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/presentation/screens/widgets/full_memory_sheet.dart';

class MyMemoryBottomSheet extends StatelessWidget {
  const MyMemoryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
        const Text(
          'My Memory Title',
          style: TextStyle(
            color: Colors.white60,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const VerticalSpacing(24),
        // Date
        Row(
          children: [
            Assets.images.guilt.svg(),
            const HorizontalSpacing(10),
            Text(
              'Guilt Stack',
              style: AppTextStyles.textBodyB1
                  .copyWith(color: AppColors.textColor200),
            ),
            const HorizontalSpacing(16),
            Text(
              'August 22nd 2024',
              style: AppTextStyles.textBodyB3.copyWith(
                color: AppColors.textColor200,
              ),
            ),
            const HorizontalSpacing(12),
            Assets.images.rotateRight.svg(),
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
                [
                  'I forgive myself for the mistakes I’ve made and choose to grow from them.',
                  'I release guilt and embrace self-compassion and understanding.',
                ],
                AppColors.primary500,
                false,
              ),
              _memorySection(
                'Your Story',
                [
                  'I am carrying the weight of unspoken apologies, unsure how to mend the damage.',
                  'I am letting someone down despite my intentions to support them.',
                  'I am breaking a promise, knowing it will impact the trust we’ve built.',
                  'I am neglecting a relationship, allowing distance to grow between us.',
                  'I am harming myself, whether by action or inaction, and struggling to change.',
                ],
                null,
                true,
              ),

              _memorySection(
                'Your Revelation',
                [
                  'Avoidance is deepening the wounds—for others and myself. Healing requires facing these issues directly.',
                ],
                null,
                true,
              ),
              _memorySection(
                'Your Action',
                [
                  'I will apologize sincerely, rebuild trust through consistent effort, reconnect with neglected relationships, and prioritize self-care to break the cycle and move forward.',
                ],
                null,
                false,
              ),
              const VerticalSpacing(20),
              // Buttons
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
                    onTap: () {
                      showModalBottomSheet(
                        useRootNavigator: true,
                        context: context,
                        isScrollControlled: true,
                        useSafeArea: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return DraggableScrollableSheet(
                            initialChildSize: 1,
                            minChildSize: 0.6,
                            builder: (_, controller) {
                              return Container(
                                decoration: const BoxDecoration(
                                  color: AppColors.color132534,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: SingleChildScrollView(
                                  controller: controller,
                                  child: const FullMemoryBottomSheet(),
                                ),
                              );
                            },
                          );
                        },
                      );
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
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
        const VerticalSpacing(40),
      ],
    );
  }

  Widget _memorySection(
    String title,
    List<String> content,
    Color? color,
    bool showDivider,
  ) {
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
          ...content.map(
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

  // Bottom Button Widget
  Widget _bottomButton(String text, {bool isPrimary = false}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? Colors.blue : Colors.grey.shade800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          color: isPrimary ? Colors.white : Colors.white70,
          fontSize: 14,
        ),
      ),
    );
  }
}
