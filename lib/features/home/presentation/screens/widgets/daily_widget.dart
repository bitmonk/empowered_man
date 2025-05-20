import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/presentation/screens/am_pm_journal_screen.dart';
import 'package:empowered/features/home/presentation/screens/widgets/habits_container.dart';
import 'package:empowered/features/home/presentation/screens/widgets/home_journal_widget.dart';
import 'package:empowered/features/home/presentation/screens/widgets/important_tasks_widget.dart';
import 'package:empowered/features/home/presentation/screens/widgets/my_memory_bottom_sheet.dart';

class DailyWidget extends StatelessWidget {
  const DailyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(AmPmJournalScreen(
                reflectionType: "am",
              ));
            },
            child: HomeJournalWidget(
              image: Assets.images.stickynote.path,
              title: 'AM Journal',
              decription: 'You have not completed your AM journal today.',
            ),
          ),
          const VerticalSpacing(20),
          GestureDetector(
            onTap: () {
              Get.to(AmPmJournalScreen(
                reflectionType: "pm",
              ));
            },
            child: HomeJournalWidget(
              image: Assets.images.journalPng.path,
              title: 'PM Journal',
              decription: 'You have not completed your Pm reflection today.',
            ),
          ),
          const VerticalSpacing(20),
          ThemedContainer(
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'My Memory',
                      style: AppTextStyles.textBodyB1,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        _showMemoryBottomSheet(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.primary500,
                        ),
                        child: const Text(
                          'View all memory',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textColor50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const VerticalSpacing(14),
                Text(
                  'View a random journal memory and take a moment to reflect on your thoughts and experiences.',
                  style: AppTextStyles.textBodyB2
                      .copyWith(color: AppColors.textColor100),
                ),
              ],
            ),
          ),
          const VerticalSpacing(20),
          ThemedContainer(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Habits',
                  style: AppTextStyles.textBodyB1,
                ),
                const VerticalSpacing(6),
                const Text(
                  'Body',
                  style: AppTextStyles.textBodyB3,
                ),
                const VerticalSpacing(12),
                Row(
                  children: [
                    HabitsContainer(
                      label: 'Exercise',
                      image: Assets.images.exercise.path,
                    ),
                    const HorizontalSpacing(16),
                    HabitsContainer(
                      label: 'Nutrition',
                      image: Assets.images.nutrition.path,
                    ),
                  ],
                ),
                const VerticalSpacing(16),
                const Text(
                  'Mind',
                  style: AppTextStyles.textBodyB3,
                ),
                const VerticalSpacing(12),
                Row(
                  children: [
                    HabitsContainer(
                      label: 'Breathwork',
                      image: Assets.images.breathwork.path,
                    ),
                    const HorizontalSpacing(16),
                    HabitsContainer(
                      label: 'Journal',
                      image: Assets.images.note.path,
                    ),
                  ],
                ),
                const VerticalSpacing(16),
                const Text(
                  'Balance',
                  style: AppTextStyles.textBodyB3,
                ),
                const VerticalSpacing(12),
                Row(
                  children: [
                    HabitsContainer(
                      label: 'Deposit 1',
                      image: Assets.images.deposit.path,
                    ),
                    const HorizontalSpacing(16),
                    HabitsContainer(
                      label: 'Deposit 2',
                      image: Assets.images.deposit.path,
                    ),
                  ],
                ),
                const VerticalSpacing(16),
                const Text(
                  'Wealth',
                  style: AppTextStyles.textBodyB3,
                ),
                const VerticalSpacing(12),
                Row(
                  children: [
                    HabitsContainer(
                      label: 'Learn',
                      image: Assets.images.learn.path,
                    ),
                    const HorizontalSpacing(16),
                    HabitsContainer(
                      label: 'Lead',
                      image: Assets.images.lead.path,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const VerticalSpacing(20),
          const ImportantTasksWidget(),
          const VerticalSpacing(120),
        ],
      ),
    );
  }

  void _showMemoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.8,
          maxChildSize: 0.9,
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
                child: const MyMemoryBottomSheet(),
              ),
            );
          },
        );
      },
    );
  }
}
