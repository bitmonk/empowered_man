import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/habits/data/model/habit_model.dart';
import 'package:empowered/features/habits/presentation/controllers/habit_controller.dart';
import 'package:empowered/features/habits/presentation/widgets/share_dialog.dart';
import 'package:intl/intl.dart';

class HabitScreen extends StatefulWidget {
  const HabitScreen({super.key});

  @override
  State<HabitScreen> createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  final controller = Get.find<HabitController>();

  bool _isBodyExpanded = true;
  bool _isBalanceExpanded = false;
  bool _isMindExpanded = false;
  bool _isWealthExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const DrawerHeaderWithBack(title: 'Habits'),
              const VerticalSpacing(16),

              // Date Navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => controller.changeWeek(-1),
                    child: Assets.images.cirlceArrowBack.svg(),
                  ),
                  const HorizontalSpacing(20),
                  Text(
                    controller.getDateRange(),
                    style: AppTextStyles.textBodyB3
                        .copyWith(color: AppColors.textColor200),
                  ),
                  const HorizontalSpacing(20),
                  GestureDetector(
                    onTap: () => controller.changeWeek(1),
                    child: Assets.images.circleArrowForward.svg(),
                  ),
                ],
              ),

              const VerticalSpacing(16),

              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    controller.resetValue();
                  },
                  child: controller.getHabitState.value.showWidget(
                    orElse: () => const LoadingWidget(),
                    error: () => CustomErrorWidget(
                      error: controller.getHabitError.value,
                      onPressed: () {
                        controller.getHabit();
                      },
                    ),
                    success: () => Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'This Week',
                              style: TextStyle(color: AppColors.white),
                            ),
                            const HorizontalSpacing(6),
                            Text(
                              '${controller.totalCompletedHabits}/${controller.totalHabits.value * 7}',
                              style: const TextStyle(
                                color: AppColors.primary200,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ShareScoreDialog();
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Assets.images.share.image(width: 18),
                                  const HorizontalSpacing(6),
                                  const Text(
                                    'Share',
                                    style: AppTextStyles.textBodyB2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const VerticalSpacing(16),

                                // Expandable Habit Categories
                                _buildExpandableHabitCategory(
                                    'Body',
                                    controller.weeklyHabits['body'] ?? [],
                                    _isBodyExpanded, (expanded) {
                                  setState(() => _isBodyExpanded = expanded);
                                }),
                                _buildExpandableHabitCategory(
                                    'Balance',
                                    controller.weeklyHabits['balance'] ?? [],
                                    _isBalanceExpanded, (expanded) {
                                  setState(() => _isBalanceExpanded = expanded);
                                }),
                                _buildExpandableHabitCategory(
                                    'Mind',
                                    controller.weeklyHabits['mind'] ?? [],
                                    _isMindExpanded, (expanded) {
                                  setState(() => _isMindExpanded = expanded);
                                }),
                                _buildExpandableHabitCategory(
                                    'Wealth',
                                    controller.weeklyHabits['wealth'] ?? [],
                                    _isWealthExpanded, (expanded) {
                                  setState(() => _isWealthExpanded = expanded);
                                }),
                                const BottomSpacing(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableHabitCategory(
    String title,
    List<(String, SubDomain)> habits,
    bool isExpanded,
    Function(bool) onExpandToggle,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => onExpandToggle(!isExpanded),
            child: Row(
              children: [
                Text(
                  title,
                  style: AppTextStyles.textHeadingH3
                      .copyWith(color: AppColors.white),
                ),
                const HorizontalSpacing(4),
                if (isExpanded)
                  Assets.images.habitsArrowDown.svg()
                else
                  Assets.images.habitArrowRight.svg(),
              ],
            ),
          ),
          if (isExpanded)
            ThemedContainer(
              color: AppColors.bgBorder,
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: habits.map((habit) => _buildHabitRow(habit)).toList(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHabitRow((String, SubDomain) habit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpacing(8),
          Row(
            children: [
              AppCachedImage(
                imgUrl: habit.$2.logo ?? '',
                width: 20,
                height: 20,
                errorWid: const Icon(
                  Icons.image_not_supported,
                  size: 20,
                  color: AppColors.primary500,
                ),
                // color: AppColors.primary500,
              ),
              const HorizontalSpacing(8),
              Text(
                habit.$1,
                style: AppTextStyles.textBodyB1.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const VerticalSpacing(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...habit.$2.trackedData!.map((e) => _buildHabitCircle(e)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHabitCircle(WeekData data) {
    return Column(
      children: [
        Text(
          DateFormat('EEE').format(
            DateTime.parse(data.habitDate!),
          ), // Get the correct day name
          style: AppTextStyles.textSmallS2.copyWith(
            color: AppColors.textColor200,
          ),
        ),
        const VerticalSpacing(6),
        GestureDetector(
          onTap: () {
            // setState(() {
            //   habit.completionStatus[index] = !habit.completionStatus[index];
            // });

            if (DateFormat('yyyy MM dd')
                    .format(DateTime.parse(data.habitDate!))
                    .compareTo(
                      DateFormat('yyyy MM dd').format(DateTime.now()),
                    ) !=
                1) {
              controller.updateHabit(
                habitId: data.habitsId.toString(),
                status: data.status.toString() == '0' ? '1' : '0',
                habitDate: data.habitDate!,
              );
            } else {
              AppUtils.showErrorSnackbar(
                message: 'Future dates are not allowed.',
              );
            }
          },
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              border: Border.all(
                color: data.status == 1
                    ? AppColors.primary300
                    : AppColors.color3B5062,
              ),
              shape: BoxShape.circle,
              color: data.status == 1 ? Colors.blue : Colors.grey.shade800,
            ),
          ),
        ),
      ],
    );
  }
}
