import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/presentation/screens/widgets/home_header_widgets.dart';
import 'package:empowered/features/power_score_stats/widgets/average_score_pie_chart.dart';
import 'package:empowered/features/power_score_stats/widgets/average_weekly_score.dart';
import 'package:empowered/features/power_score_stats/widgets/line_power_stats.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class PowerScoreStatsScreen extends StatefulWidget {
  const PowerScoreStatsScreen({super.key});

  @override
  State<PowerScoreStatsScreen> createState() => _PowerScoreStatsScreenState();
}

class _PowerScoreStatsScreenState extends State<PowerScoreStatsScreen> {
  DateTime _startDate = DateTime.now();
  void _changeWeek(int days) {
    setState(() {
      _startDate = _startDate.add(Duration(days: days));
    });
  }

  /// **Get the first day (Sunday) of the current week**
  DateTime _getWeekStart(DateTime date) {
    return date.subtract(Duration(days: date.weekday % 7));
  }

  String _getDateRange() {
    var endDate = _startDate.add(const Duration(days: 6));
    return "${DateFormat("dd.MM").format(_startDate)} - ${DateFormat("dd.MM").format(endDate)}";
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.bgDark,
      appBar: CustomAppBar(
        title: 'Power Score Stats',
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeaderWidgets(
                hideControls: true,
              ),
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
              const VerticalSpacing(22),
              _buildAverageScore(),
              const VerticalSpacing(20),
              _buildScoreBreakdown(),
              const VerticalSpacing(20),
              _buildSummaryBreakdown(),
              const VerticalSpacing(20),
              const AverageWeeklyScore(),
              const VerticalSpacing(20),
              const LinePowerStats(),
              const BottomSpacing(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAverageScore() {
    return ThemedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Average Score',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const VerticalSpacing(8),
          const AverageScorePieChart(),
          const VerticalSpacing(8),
          _buildCategoryScores(),
          const BottomSpacing(),
        ],
      ),
    );
  }

  Widget _buildCategoryScores() {
    final categories = <Map<String, dynamic>>[
      {
        'name': 'Journal',
        'score': '45',
        'color': AppColors.color5CE0A0,
        'increment': '35',
      },
      {
        'name': 'Habit',
        'score': '32',
        'color': AppColors.primary300,
        'increment': '12',
      },
      {
        'name': 'Door',
        'score': '28',
        'color': AppColors.colorF5CA41,
        'increment': '10',
      },
      {
        'name': 'Goals',
        'score': '87',
        'color': AppColors.primary500,
        'increment': '40',
      },
    ];

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      shrinkWrap: true, // Important to prevent infinite height issues
      physics:
          const NeverScrollableScrollPhysics(), // Disable GridView's internal scrolling
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two columns
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 3.5, // Adjust this value for better layout
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return _categoryScore(
          category['name'],
          category['score'],
          category['color'],
          category['increment'],
        );
      },
    );
  }

  Widget _categoryScore(
    String name,
    String score,
    Color color,
    String increment,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 6,
          backgroundColor: color,
        ),
        const HorizontalSpacing(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyles.textBodyB3,
            ),
            Row(
              children: [
                Text(
                  '%$score',
                  style: AppTextStyles.textCaptionC2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Assets.images.increaseArrow.svg(),
                ),
                Text(
                  increment,
                  style: AppTextStyles.textCaptionC2
                      .copyWith(color: AppColors.color5CE0A0),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildScoreBreakdown() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 20,
      childAspectRatio: 1.6,
      children: [
        _scoreCard('Power Score', '54/100', Assets.images.powerLine.path),
        _scoreCard('Journal', '28/54', Assets.images.powerJournal.path),
        _scoreCard('Habits', '28/54', Assets.images.powerLine.path),
        _scoreCard('Tasks', '10/20', Assets.images.powerTasks.path),
        _scoreCard('Habits', '28/54', Assets.images.powerLine.path),
        _scoreCard('Tasks', '10/20', Assets.images.powerTasks.path),
      ],
    );
  }

  Widget _buildSummaryBreakdown() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 20,
      childAspectRatio: 1.4,
      children: [
        _summaryCard(
          'Previous week',
          '28/54',
        ),
        _summaryCard(
          '4 weeks averagee',
          '54/100',
        ),
        _summaryCard(
          'Year average',
          '28/54',
        ),
        _summaryCard(
          'Overall average',
          '10/20',
        ),
      ],
    );
  }

  Widget _scoreCard(String title, String score, String icon) {
    return ThemedContainer(
      border: Border.all(color: AppColors.bgBorder),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          const HorizontalSpacing(12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.textBodyB2,
              ),
              const SizedBox(height: 8),
              Text(
                score,
                style: AppTextStyles.textHeadingH3,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryCard(String title, String score) {
    return ThemedContainer(
      border: Border.all(color: AppColors.bgBorder),
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HorizontalSpacing(12),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.color008CFF,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Text(
                  score,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor50,
                  ),
                ),
              ),
              Text(
                title,
                style: AppTextStyles.textBodyB3
                    .copyWith(color: AppColors.textColor300),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
