import 'package:empowered/core/extension/extensions.dart';

class GoalsOverview extends StatefulWidget {
  const GoalsOverview({super.key});

  @override
  State<GoalsOverview> createState() => _GoalsOverviewState();
}

class _GoalsOverviewState extends State<GoalsOverview> {
  String selectedYear = '2024';
  int selectedQuarter = 0;

  final List<String> quarters = ['Q1', 'Q2', 'Q3', 'Q4'];
  final List<String> categories = ['Body', 'Mind', 'Balance', 'Wealth'];

  // Map different categories to each section when year/quarter is changed
  final Map<String, String> defaultMissionCategories = {
    'October': 'Body',
    'November': 'Mind',
    'December': 'Balance',
  };

  final List<String> factCategories = [
    'Body Facts',
    'Mind Facts',
    'Balance Facts',
    'Wealth Facts',
  ];
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
    _resetSelections(); // Initialize selections
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: 'Goals Overview'),
      body: SafeArea(
        child: SingleChildScrollView(
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
              _buildFactsAndTargets(),
              const VerticalSpacing(30),
            ],
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
          value: selectedYear,
          dropdownColor: const Color(0xFF161B22),
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.white,
          ),
          style: const TextStyle(color: Colors.white, fontSize: 16),
          items: ['2024', '2025', '2026'].map((year) {
            return DropdownMenuItem(value: year, child: Text(year));
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedYear = value!;
              _resetSelections(); // Change default selections
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
            setState(() {
              if (selectedQuarter > 0) {
                selectedQuarter--;
                _resetSelections();
              }
            });
          },
          child: Assets.images.cirlceArrowBack.svg(width: 40),
        ),
        Row(
          children: List.generate(quarters.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedQuarter = index;
                  _resetSelections();
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: selectedQuarter == index
                          ? AppColors.primary500
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  quarters[index],
                  style: const TextStyle(
                    color: AppColors.textColor200,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }),
        ),
        InkWell(
          onTap: () {
            setState(() {
              if (selectedQuarter < 3) {
                selectedQuarter++;
                _resetSelections();
              }
            });
          },
          child: Assets.images.circleArrowForward.svg(width: 40),
        ),
      ],
    );
  }

  Widget _buildMonthlyMissions() {
    return ThemedContainer(
      color: AppColors.bgBorder,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: ['October', 'November', 'December'].map((month) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: categories.map((category) {
                  return _buildCategoryButton(
                    category,
                    selectedMissionCategory[month] == category,
                    () {},
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
    return Column(
      children: [
        _buildCategoryBox(
          'Fact Assessments',
          factCategories,
          selectedFactCategory,
          (String value) {},
        ),
        const SizedBox(height: 16),
        _buildCategoryBox(
          'Yearly Targets',
          targetCategories,
          selectedTargetCategory,
          (String value) {},
        ),
      ],
    );
  }

  Widget _buildCategoryBox(
    String title,
    List<String> items,
    String selectedItem,
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
                selectedItem == item,
                () => onSelect(item),
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
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
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
    selectedMissionCategory = {
      'October': categories[selectedQuarter % categories.length],
      'November': categories[(selectedQuarter + 1) % categories.length],
      'December': categories[(selectedQuarter + 2) % categories.length],
    };

    selectedFactCategory =
        factCategories[(selectedQuarter + 1) % factCategories.length];
    selectedTargetCategory =
        targetCategories[(selectedQuarter + 2) % targetCategories.length];
  }
}

Widget _buildSectionTitle(String title) {
  return Text(
    title,
    style: AppTextStyles.textHeadingH3,
  );
}
