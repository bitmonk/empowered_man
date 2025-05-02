import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/presentation/assesment_summary.dart';
import 'package:empowered/features/assesments/presentation/controllers/assessment_history_controller.dart';
import 'package:empowered/features/assesments/presentation/widgets/assesment_history.dart';
import 'package:empowered/features/assesments/presentation/widgets/assesment_pop_up.dart';

class AssessmentsScreen extends StatefulWidget {
  const AssessmentsScreen({super.key});

  @override
  State<AssessmentsScreen> createState() => _AssessmentsScreenState();
}

class _AssessmentsScreenState extends State<AssessmentsScreen> {
  int _selectedTabIndex = 0; // 0: Assessments, 1: History
  final controller = Get.find<AssessmentHistoryController>();
  final List<String> selectedIds = [];
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        title: 'Assessments',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8)
            .copyWith(bottom: context.devicePaddingBottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            AppTextFormField(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Assets.images.search.svg(),
              ),
              labelText: 'Search...',
              fillColor: AppColors.bgMedium,
              enabledBorderSide: const BorderSide(color: AppColors.transparent),
            ),
            const VerticalSpacing(12),

            // Tabs
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  _buildTab(
                    'Assessments',
                    isSelected: _selectedTabIndex == 0,
                    index: 0,
                  ),
                  const SizedBox(width: 8),
                  _buildTab(
                    'History',
                    isSelected: _selectedTabIndex == 1,
                    index: 1,
                  ),
                  const Spacer(),
                  AssesmentPopUp(
                    selectedIds: controller.selectedAssessmentIds,
                    onDeleteSuccess: () {
                      controller.getAssessmentHistory(isInitialLoad: true);
                    },
                  ),

                  // if (_selectedTabIndex == 1)
                  //   AssesmentPopUp(selectedIds: selectedIds)
                  // else
                  //   const VerticalSpacing(35),
                ],
              ),
            ),
            const VerticalSpacing(18),

            // IndexedStack for switching content
            Expanded(
              child: IndexedStack(
                index: _selectedTabIndex,
                children: const [
                  AssessmentSummary(),
                  AssesmentHistory(), // Table View
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Builds selectable tabs
  Widget _buildTab(
    String text, {
    required bool isSelected,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.color3B4B58),
          color: isSelected ? AppColors.color3B4B58 : Colors.black26,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text, style: AppTextStyles.textBodyB4),
      ),
    );
  }
}
