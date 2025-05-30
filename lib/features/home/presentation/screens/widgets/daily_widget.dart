import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/presentation/controllers/home_controller.dart';
import 'package:empowered/features/home/presentation/controllers/reflection_journal_chat_controller.dart';
import 'package:empowered/features/home/presentation/screens/am_pm_journal_screen.dart';
import 'package:empowered/features/home/presentation/screens/widgets/habits_container.dart';
import 'package:empowered/features/home/presentation/screens/widgets/home_journal_widget.dart';
import 'package:empowered/features/home/presentation/screens/widgets/important_tasks_widget.dart';
import 'package:empowered/features/home/presentation/screens/widgets/my_memory_bottom_sheet.dart';

class DailyWidget extends StatefulWidget {
  const DailyWidget({super.key});

  @override
  State<DailyWidget> createState() => _DailyWidgetState();
}

class _DailyWidgetState extends State<DailyWidget> {
  final controller = Get.find<ReflectionJournalChatController>();
  final homeController = Get.find<HomeController>();

  // String period = DateTime.now().hour < 12 ? 'am' : 'pm';

  String period = '';

  @override
  void initState() {
    super.initState();
    period = DateTime.now().hour >= 12 ? 'pm' : 'am';
    controller.getReflectionWithQuestionAnswers(period);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        homeController
          ..dailyMITlists()
          ..dashboardLevel()
          ..dashboardHabit();
      },
      child: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  controller.resetEditMode();
                  if (period == 'am') {
                    Get.to(
                      const AmPmJournalScreen(
                        reflectionType: 'am',
                      ),
                    );
                  } else {
                    AppUtils.showErrorSnackbar(
                      message:
                          'You can only access AM questions in the morning.',
                    );
                  }
                },
                child: HomeJournalWidget(
                  image: Assets.images.stickynote.path,
                  title: 'AM Journal',
                  decription: _getJournalDescription('am'),
                ),
              ),
              const VerticalSpacing(20),
              GestureDetector(
                onTap: () {
                  controller.resetEditMode();
                  if (period == 'pm') {
                    Get.to(
                      const AmPmJournalScreen(
                        reflectionType: 'pm',
                      ),
                    );
                  } else {
                    AppUtils.showErrorSnackbar(
                      message:
                          'You can only access PM questions in the afternoon.',
                    );
                  }
                },
                child: HomeJournalWidget(
                  image: Assets.images.journalPng.path,
                  title: 'PM Journal',
                  decription: _getJournalDescription('pm'),
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
              homeController.dashboardHabitlState.value.showWidget(
                // loading: () => LoadingWidget(),
                error: () => Row(
                  children: [
                    Expanded(
                      child: CustomErrorWidget(
                        error: homeController.dashboardHabitlError.value,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.refresh,
                        color: AppColors.primary500,
                      ),
                    ),
                  ],
                ),
                orElse: () => homeController.dashboardHabitlData.isNotEmpty
                    ? ThemedContainer(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Habits',
                              style: AppTextStyles.textBodyB1,
                            ),
                            const VerticalSpacing(6),
                            ...homeController.dashboardHabitlData.map((e) {
                              if (e.habits?.isNotEmpty ?? false) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.category?.capitalize ?? '',
                                        style: AppTextStyles.textBodyB3,
                                      ),
                                      const VerticalSpacing(12),
                                      GridView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 16,
                                          crossAxisSpacing: 16,
                                          crossAxisCount: 2,
                                        ),
                                        itemCount: e.habits?.length,
                                        itemBuilder: (context, i) {
                                          return HabitsContainer(
                                            habit: e.habits![i],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            }),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              if (homeController.dashboardHabitlData.isNotEmpty)
                const VerticalSpacing(20),
              const ImportantTasksWidget(),
              const VerticalSpacing(120),
            ],
          ),
        ),
      ),
    );
  }

  String _getJournalDescription(String journalType) {
    final response = controller.reflectionQuestionAnswerResponse.value;

    if (response.data == null) {
      return 'Loading...';
    }

    final isCompleted = response.data?.isCompleted ?? false;

    if (isCompleted) {
      return 'You have completed your ${journalType.toUpperCase()} journal today.';
    } else {
      return 'You have not completed your ${journalType.toUpperCase()} journal today.';
    }
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
