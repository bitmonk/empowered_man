import 'dart:math'; // For random selection
import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/common/drawer_header.dart';
import 'package:empowered/features/common/themed_container.dart';
import 'package:empowered/features/habits/presentation/widgets/share_dialog.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// **Model to store habit details**
class HabitModel {
  HabitModel({
    required this.name,
    required this.icon,
    required this.completionStatus,
  });
  final String name;
  final String icon;
  List<bool> completionStatus;
}

class HabitScreen extends StatefulWidget {
  const HabitScreen({super.key});

  @override
  State<HabitScreen> createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  DateTime _startDate = DateTime.now();
  int totalHabits = 28;
  final Random _random = Random();

  bool _isBodyExpanded = true;
  bool _isBalanceExpanded = true;
  bool _isMindExpanded = true;
  bool _isWealthExpanded = true;

  /// **Habit categories mapped by date**
  Map<DateTime, Map<String, List<HabitModel>>> weeklyHabits = {};

  @override
  void initState() {
    super.initState();
    _initializeHabits();
  }

  /// **Initialize habits for the current week with random values**
  void _initializeHabits() {
    var currentWeekStart = _getWeekStart(_startDate);

    if (!weeklyHabits.containsKey(currentWeekStart)) {
      weeklyHabits[currentWeekStart] = {
        'Body': [
          HabitModel(
            name: 'Exercise',
            icon: Assets.images.exercise.path,
            completionStatus: _generateRandomCompletion(),
          ),
          HabitModel(
            name: 'Nutrition',
            icon: Assets.images.nutrition.path,
            completionStatus: _generateRandomCompletion(),
          ),
        ],
        'Balance': [
          HabitModel(
            name: 'Deposit 1',
            icon: Assets.images.deposit.path,
            completionStatus: _generateRandomCompletion(),
          ),
          HabitModel(
            name: 'Deposit 2',
            icon: Assets.images.deposit.path,
            completionStatus: _generateRandomCompletion(),
          ),
        ],
        'Mind': [
          HabitModel(
            name: 'Breathwork',
            icon: Assets.images.breathwork.path,
            completionStatus: _generateRandomCompletion(),
          ),
          HabitModel(
            name: 'Journal',
            icon: Assets.images.journalPng.path,
            completionStatus: _generateRandomCompletion(),
          ),
        ],
        'Wealth': [
          HabitModel(
            name: 'Learn',
            icon: Assets.images.learn.path,
            completionStatus: _generateRandomCompletion(),
          ),
          HabitModel(
            name: 'Lead',
            icon: Assets.images.lead.path,
            completionStatus: _generateRandomCompletion(),
          ),
        ],
      };
    }
    setState(() {});
  }

  /// **Generate random habit completion status for a week**
  List<bool> _generateRandomCompletion() {
    return List.generate(7, (_) => _random.nextBool());
  }

  /// **Get the first day (Sunday) of the current week**
  DateTime _getWeekStart(DateTime date) {
    return date.subtract(Duration(days: date.weekday % 7));
  }

  /// **Change week and reload data**
  void _changeWeek(int days) {
    setState(() {
      _startDate = _startDate.add(Duration(days: days));
      _initializeHabits();
    });
  }

  /// **Get formatted date range**
  String _getDateRange() {
    var endDate = _startDate.add(const Duration(days: 6));
    return "${DateFormat("dd.MM").format(_startDate)} - ${DateFormat("dd.MM").format(endDate)}";
  }

  @override
  Widget build(BuildContext context) {
    var currentWeekStart = _getWeekStart(_startDate);
    var habitsByCategory = weeklyHabits[currentWeekStart] ?? {};

    var completedHabits = habitsByCategory.values.expand((list) => list).fold(
          0,
          (sum, habit) =>
              sum + habit.completionStatus.where((status) => status).length,
        );

    return SafeArea(
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
                  onTap: () => _changeWeek(-7),
                  child: Assets.images.cirlceArrowBack.svg(),
                ),
                const HorizontalSpacing(20),
                Text(
                  _getDateRange(),
                  style: AppTextStyles.textBodyB3
                      .copyWith(color: AppColors.textColor200),
                ),
                const HorizontalSpacing(20),
                GestureDetector(
                  onTap: () => _changeWeek(7),
                  child: Assets.images.circleArrowForward.svg(),
                ),
              ],
            ),

            const VerticalSpacing(16),

            // Weekly Progress
            Row(
              children: [
                const Text(
                  'This Week',
                  style: TextStyle(color: AppColors.white),
                ),
                const HorizontalSpacing(6),
                Text(
                  '$completedHabits/$totalHabits',
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
                      const Text('Share', style: AppTextStyles.textBodyB2),
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
                        'Body', habitsByCategory['Body'] ?? [], _isBodyExpanded,
                        (expanded) {
                      setState(() => _isBodyExpanded = expanded);
                    }),
                    _buildExpandableHabitCategory(
                        'Balance',
                        habitsByCategory['Balance'] ?? [],
                        _isBalanceExpanded, (expanded) {
                      setState(() => _isBalanceExpanded = expanded);
                    }),
                    _buildExpandableHabitCategory(
                        'Mind', habitsByCategory['Mind'] ?? [], _isMindExpanded,
                        (expanded) {
                      setState(() => _isMindExpanded = expanded);
                    }),
                    _buildExpandableHabitCategory(
                        'Wealth',
                        habitsByCategory['Wealth'] ?? [],
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
    );
  }

  Widget _buildExpandableHabitCategory(
    String title,
    List<HabitModel> habits,
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

  Widget _buildHabitRow(HabitModel habit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpacing(8),
          Row(
            children: [
              Image.asset(
                habit.icon,
                width: 20,
                color: AppColors.primary500,
              ),
              const HorizontalSpacing(8),
              Text(
                habit.name,
                style: AppTextStyles.textBodyB1.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const VerticalSpacing(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
                List.generate(7, (index) => _buildHabitCircle(habit, index)),
          ),
        ],
      ),
    );
  }

  Widget _buildHabitCircle(HabitModel habit, int index) {
    var weekdays = <String>['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return Column(
      children: [
        Text(
          weekdays[index], // Get the correct day name
          style: AppTextStyles.textSmallS2.copyWith(
            color: AppColors.textColor200,
          ),
        ),
        const VerticalSpacing(6),
        GestureDetector(
          onTap: () {
            setState(() {
              habit.completionStatus[index] = !habit.completionStatus[index];
            });
          },
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              border: Border.all(
                color: habit.completionStatus[index]
                    ? AppColors.primary300
                    : AppColors.color3B5062,
              ),
              shape: BoxShape.circle,
              color: habit.completionStatus[index]
                  ? Colors.blue
                  : Colors.grey.shade800,
            ),
          ),
        ),
      ],
    );
  }
}
