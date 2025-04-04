import 'dart:math';

import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/widgets/empty_goal.dart';
import 'package:empowered/features/goals/widgets/goal_type_scroll.dart';
import 'package:empowered/features/goals/widgets/goals_buttons.dart';
import 'package:empowered/features/goals/widgets/goals_header.dart';
import 'package:empowered/features/goals/widgets/progress_goal_widget.dart';
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
  late List<bool> _goalStates;
  late List<bool> _showButtonStates;

  int _selectedGoalIndex = 0; // Store selected goal index

  final List<String> goalTypes = [
    'Body',
    'Mind',
    'Balance',
    'Wealth',
  ];

  @override
  void initState() {
    super.initState();
    _randomizeGoals();
  }

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

  void _changeWeek(int days) {
    setState(() {
      _startDate = _startDate.add(Duration(days: days));
      _randomizeGoals();
    });
  }

  String _getDateRange() {
    var endDate = _startDate.add(const Duration(days: 6));
    return "${DateFormat("dd.MM").format(_startDate)} - ${DateFormat("dd.MM").format(endDate)}";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GoalsHeader(),
            const VerticalSpacing(26),

            // Pass selected index and callback to GoalTypeScroll
            GoalTypeScroll(
              selectedIndex: _selectedGoalIndex,
              onSelected: (index) {
                setState(() {
                  _selectedGoalIndex = index;
                });
              },
            ),

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
                          selectedTent: goalTypes[
                              _selectedGoalIndex], // Pass selected goal type
                          title: '${GoalDurationEnum
                                  .values[index].name.capitalizeFirst!} Tasks',
                        );
                      } else {
                        return EmptyGoal(
                          title: GoalDurationEnum
                                  .values[index].name.capitalizeFirst ??
                              '',
                          showStart: _showButtonStates[index],
                          selectedTent: goalTypes[_selectedGoalIndex], //
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
