import 'package:empowered/core/extension/extensions.dart';

class FullMemoryBottomSheet extends StatelessWidget {
  const FullMemoryBottomSheet({super.key});

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
          child: Column(
            children: [
              _memorySection(
                'Your Lesson',
                [
                  "I forgive myself for the mistakes I've made and choose to grow from them.",
                  'I release guilt and embrace self-compassion and understanding.',
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
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
          child: Column(
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 36,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.primary500,
                        ),
                      ),
                      child: Text(
                        'Back To My Memory',
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
  }

  Widget _memorySection(
    String title,
    List<String> content,
    Color? color,
    bool showDivider,
  ) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
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
          const Text(
            'Full Stack Memory: Guilt Journal',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const VerticalSpacing(8),
          _buildRichText(
            'What are you going to title this guilt stack?',
            'Broken Promises and Neglect',
          ),
          _buildRichText('What domain of CORE 4 are you stacking?', 'Body'),
          _buildRichText('Who/What are you stacking?', 'Myself'),
          _buildRichText(
            'In this moment, why has Myself triggered you to feel guilt for something you have said or done?',
            "I've neglected my relationships, broken promises, and allowed myself to drift away from who I want to be.",
          ),
          _buildRichText(
            'If you could tell Myself anything you wanted, to their face right now, with no filter, what would you say?',
            "Why are you sabotaging yourself and others? You're better than this. Take ownership, stop making excuses, and fix it.",
          ),
          const SizedBox(height: 12),
          _buildBulletList(
            "What is the story you're telling yourself, created by this trigger, about Myself and the situation?",
            [
              'I am failing the people who trust me.',
              'I don’t deserve forgiveness.',
              'I can’t fix the damage I’ve caused.',
            ],
          ),
          _buildBulletList(
            'Describe the single word feelings that arise for you when you tell yourself that story.',
            ['Shame.', 'Guilt.', 'Disappointment.', 'Fear.', 'Regret.'],
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

  Widget _buildRichText(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title\n\n',
              style: const TextStyle(
                color: AppColors.textColor300,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: content,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletList(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textColor300,
              fontSize: 16,
            ),
          ),
          const VerticalSpacing(4),
          Column(
            children: items.map((item) {
              return Padding(
                padding: const EdgeInsets.only(left: 8, top: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '•  ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
