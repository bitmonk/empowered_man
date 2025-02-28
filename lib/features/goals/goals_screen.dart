import 'dart:math';
import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/goals/widgets/empty_goal.dart';
import 'package:empowered/features/goals/widgets/goal_type_scroll.dart';
import 'package:empowered/features/goals/widgets/goals_buttons.dart';
import 'package:empowered/features/goals/widgets/goals_header.dart';
import 'package:empowered/features/goals/widgets/progress_goal_widget.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

enum GoalDurationEnum {
  weekly,
  monthly,
  quarterly,
  yearly,
}

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  DateTime _startDate = DateTime.now();
  final Random _random = Random();
  late List<bool>
      _goalStates; // Stores whether to show ProgressGoalWidget or EmptyGoalWidget
  late List<bool>
      _showButtonStates; // Stores whether to show button for EmptyGoalWidget

  @override
  void initState() {
    super.initState();
    _randomizeGoals();
  }

  /// **Randomize goals for the current date range**
  void _randomizeGoals() {
    _goalStates = List.generate(
      GoalDurationEnum.values.length,
      (_) => _random.nextBool(),
    );
    _showButtonStates = List.generate(
      GoalDurationEnum.values.length,
      (_) => _random.nextBool(),
    );
  }

  /// **Get the first day (Sunday) of the current week**
  DateTime _getWeekStart(DateTime date) {
    return date.subtract(Duration(days: date.weekday % 7));
  }

  /// **Change week and reload data**
  void _changeWeek(int days) {
    setState(() {
      _startDate = _startDate.add(Duration(days: days));
      _randomizeGoals(); // Randomize again when date changes
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

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GoalsHeader(),
            const VerticalSpacing(26),
            const GoalTypeScroll(),
            const VerticalSpacing(16),
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
            const VerticalSpacing(24),
            const GoalsButtons(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  children: [
                    ...List.generate(GoalDurationEnum.values.length, (index) {
                      if (_goalStates[index]) {
                        return ProgressGoalWidget(
                          title: GoalDurationEnum
                                  .values[index].name.capitalizeFirst ??
                              '',
                        );
                      } else {
                        return EmptyGoal(
                          title: GoalDurationEnum
                                  .values[index].name.capitalizeFirst ??
                              '',
                          showStart: _showButtonStates[index],
                        );
                      }
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
}
