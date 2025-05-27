import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_overview_controller.dart';

class GoalsOverview extends StatefulWidget {
  const GoalsOverview({super.key});

  @override
  State<GoalsOverview> createState() => _GoalsOverviewState();
}

class _GoalsOverviewState extends State<GoalsOverview> {
  final controller = Get.find<GoalsOverviewController>();

  final List<String> quarters = ['Q1', 'Q2', 'Q3', 'Q4'];

  // final List<String> factCategories = [
  //   'Body Facts',
  //   'Mind Facts',
  //   'Balance Facts',
  //   'Wealth Facts',
  // ];
  final List<String> targetCategories = [
    'Body Targets',
    'Mind Targets',
    'Balance Targets',
    'Wealth Targets',
  ];

  // Selected values for Monthly Missions, Fact Assessments, and Yearly Targets
  Map<String, String> selectedMissionCategory = {};
  String selectedFactCategory = 'Mind Facts';
  String selectedTargetCategory = 'Wealth Targets';

  @override
  void initState() {
    super.initState();
    _resetSelections();
    controller.goalOverview.value;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: 'Goals Overview'),
      body: Obx(
        () => SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              controller.resetValue();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildYearDropdown(),
                  const VerticalSpacing(24),
                  _buildQuarterTabs(),
                  const VerticalSpacing(24),
                  _buildSectionTitle('Monthly Missions'),
                  const VerticalSpacing(24),
                  _buildMonthlyMissions(),
                  const VerticalSpacing(24),
                  _buildSectionTitle('Quarterly Facts & Yearly Targets'),
                  const VerticalSpacing(24),
                  _buildFactsAndTargets(),
                  const VerticalSpacing(30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildYearDropdown() {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.bgBorder),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Year',
            labelStyle: TextStyle(color: AppColors.textColor300),
          ),
          value: controller.selectedYear.value.toString(),
          dropdownColor: const Color(0xFF161B22),
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.white,
          ),
          style: const TextStyle(color: Colors.white, fontSize: 16),
          items: List.generate(4, (index) {
            final year = DateTime.now().year - index;
            return DropdownMenuItem(
              value: year.toString(),
              child: Text(year.toString()),
            );
          }),
          onChanged: (value) {
            final selected = int.parse(value!);
            controller.changeYear(selected);
            setState(() {
              _resetSelections();
            });
          },
        ),
      ),
    );
  }

  Widget _buildQuarterTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            if (controller.currentQuarter.value > 1) {
              controller.changeQuarter(-1);
              setState(_resetSelections);
            }
          },
          child: Assets.images.cirlceArrowBack.svg(width: 40),
        ),
        Row(
          children: List.generate(4, (index) {
            final quarterNumber = index + 1;
            final isSelected = controller.currentQuarter.value == quarterNumber;

            return GestureDetector(
              onTap: () {
                controller.setQuarter(quarterNumber);
                setState(_resetSelections);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected
                          ? AppColors.primary500
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  'Q$quarterNumber',
                  style: TextStyle(
                    color: isSelected
                        ? AppColors.primary500
                        : AppColors.textColor200,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }),
        ),
        InkWell(
          onTap: () {
            if (controller.currentQuarter.value < 4) {
              controller.changeQuarter(1);
              setState(_resetSelections);
            }
          },
          child: Assets.images.circleArrowForward.svg(width: 40),
        ),
      ],
    );
  }

  Widget _buildMonthlyMissions() {
    final quarter = controller.currentQuarter.value;
    final quarterlyGoals = controller.getMonthlyGoalsMap(quarter);
    final categories = controller.getCategoriesForMonths();

    return ThemedContainer(
      color: AppColors.bgBorder,
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: controller.months.map((month) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  month,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Wrap(
                spacing: 9,
                runSpacing: 9,
                children: categories.map((category) {
                  return _buildCategoryButton(
                    category,
                    quarterlyGoals[category] ?? false,
                  );
                }).toList(),
              ),
              const VerticalSpacing(24),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFactsAndTargets() {
    final factCategories = controller.getCategoriesForQuarter();
    final factGoals =
        controller.getQuarterlyGoalsMap(controller.currentQuarter.value);
    final yearlyGoals =
        controller.goalOverview.value?.data?.goalOverview?.yearlyGoals;
    return Column(
      children: [
        _buildCategoryBox(
          'Fact Assessments',
          factCategories,
          factGoals,
          (String value) {},
        ),
        const SizedBox(height: 24),
        _buildCategoryBox(
          'Yearly Targets',
          targetCategories,
          yearlyGoals,
          (String value) {},
        ),
      ],
    );
  }

  Widget _buildCategoryBox(
    String title,
    List<String> items,
    Map<String, bool>? selectedGoals,
    Function(String) onSelect,
  ) {
    return ThemedContainer(
      width: double.infinity,
      color: AppColors.bgBorder,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.textBodyB1),
          const VerticalSpacing(24),
          Wrap(
            spacing: 9,
            runSpacing: 9,
            children: items.map((item) {
              return _buildCategoryButton(
                item,
                selectedGoals != null ? selectedGoals[item] ?? false : false,
                //() => onSelect(item),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(
    String text,
    bool isSelected,
    // VoidCallback onTap,
  ) {
    return GestureDetector(
      // onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white24),
        ),
        child: Text(
          text,
          style: TextStyle(color: isSelected ? Colors.white : Colors.white70),
        ),
      ),
    );
  }

  void _resetSelections() {
    final categories = controller.getCategoriesForMonths();
    final factCategories = controller.getCategoriesForQuarter();
    // Add null safety checks
    if (controller.months.isEmpty || categories.isEmpty) return;

    if (categories.isEmpty) {
      selectedMissionCategory.clear();
      return;
    }

    // Ensure safe modulo operations
    selectedMissionCategory = {
      controller.months[0]:
          categories[(controller.currentQuarter.value - 1) % categories.length],
      controller.months[1]:
          categories[controller.currentQuarter.value % categories.length],
      controller.months[2]:
          categories[(controller.currentQuarter.value + 1) % categories.length],
    };

    // Add bounds checking for factCategories and targetCategories
    selectedFactCategory =
        factCategories[controller.currentQuarter.value % factCategories.length];
    selectedTargetCategory = targetCategories[
        (controller.currentQuarter.value + 1) % targetCategories.length];
  }
}

Widget _buildSectionTitle(String title) {
  return Text(
    title,
    style: AppTextStyles.textHeadingH3,
  );
}
