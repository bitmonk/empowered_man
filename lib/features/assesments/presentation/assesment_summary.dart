import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/presentation/controllers/assessment_history_controller.dart';
import 'package:empowered/features/assesments/presentation/widgets/assesment_card.dart';

class AssessmentSummary extends StatefulWidget {
  const AssessmentSummary({super.key});

  @override
  State<AssessmentSummary> createState() => _AssessmentSummaryState();
}

class _AssessmentSummaryState extends State<AssessmentSummary> {
  final searchController = TextEditingController();
  final controller = Get.find<AssessmentHistoryController>();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(_handleSearch);
  }

  @override
  void dispose() {
    searchController.removeListener(_handleSearch);
    scrollController.dispose();
    super.dispose();
  }

  void _handleSearch() {
    if (searchController.text.isEmpty) {
      controller.getAssessment();
    } else {
      controller.getAssessment(searchQuery: searchController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Fixed search area
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: AppTextFormField(
            controller: searchController,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Assets.images.search.svg(),
            ),
            hintText: 'Search...',
            textInputAction: TextInputAction.search,
            fillColor: AppColors.bgMedium,
            enabledBorderSide: const BorderSide(color: AppColors.transparent),
            onChanged: (value) => _handleSearch(),
            suffixIcon: ValueListenableBuilder<TextEditingValue>(
              valueListenable: searchController,
              builder: (context, value, child) {
                return value.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          searchController.clear();
                          context.hideKeyboard();
                          controller.getAssessment();
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Icon(Icons.clear),
                        ),
                      )
                    : const SizedBox();
              },
            ),
          ),
        ),
        
        // Scrollable content area
        Expanded(
          child: Obx(() {
            if (controller.getAssessmentState.value == TheStates.loading) {
              return const LoadingWidget();
            }
            
            final model = controller.getAssessmentModel.value;
            final isGrowthEmpty =
                model.data?.assessments?.growth?.isEmpty ?? true;
            final isWealthEmpty =
                model.data?.assessments?.wealth?.isEmpty ?? true;

            if (model.data == null || (isGrowthEmpty && isWealthEmpty)) {
              return RefreshIndicator(
                onRefresh: () async {
                  searchController.clear();
                  await controller.getAssessment();
                },
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Text(
                          'No data found',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            
            // Create list items first
            List<Widget> listItems = [];
            
            // Growth section
            if (!isGrowthEmpty) {
              listItems.add(_buildSectionTitle('The Growth Assessments'));
              listItems.addAll(
                model.data!.assessments!.growth!.map(
                  (growth) => AssessmentCard(
                    title: growth.name ?? 'Untitled',
                    score: '${growth.currentScore ?? 0} / ${growth.totalScore}',
                    iconPath: growth.image ?? '',
                    id: growth.id.toString(),
                    onTap: () {},
                    status: growth.status ?? 'Start Now',
                    scoreHistory: growth.scoreHistory,
                    totalScore: growth.totalScore.toString(),
                  ),
                ),
              );
              listItems.add(const SizedBox(height: 16));
            }
            
            // Wealth section
            if (!isWealthEmpty) {
              listItems.add(_buildSectionTitle('The Wealth Assessments'));
              listItems.addAll(
                model.data!.assessments!.wealth!.map(
                  (wealth) => AssessmentCard(
                    title: wealth.name ?? 'Untitled',
                    score: '${wealth.currentScore ?? 0} / ${wealth.totalScore}',
                    iconPath: wealth.image ?? '',
                    status: wealth.status ?? 'Start Now',
                    id: wealth.id.toString(),
                    scoreHistory: wealth.scoreHistory,
                    totalScore: wealth.totalScore.toString(),
                    onTap: () {},
                  ),
                ),
              );
            }
            
            // Add bottom spacing
            listItems.add(const BottomSpacing());
            
            return RefreshIndicator(
              onRefresh: () async {
                searchController.clear();
                await controller.getAssessment();
              },
              child: ListView(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 12),
                children: listItems,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}