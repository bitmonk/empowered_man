import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/data/model/assessment_history_model.dart';
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
  List<String> selectedIds = [];
  List<bool> _selectedItems = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.selectedAssessment.value = null;
  }

  // List<String> getSelectedAssessmentIds() {
  //   selectedIds = <String>[];
  //   final isSearchActive = controller.queryText.value != null &&
  //       controller.queryText.value!.isNotEmpty;

  //   // Determine which list to use based on search state
  //   final selectionList =
  //       isSearchActive ? controller.selectSeaarchBulk : controller.selectBulk;

  //   final assessmentList = isSearchActive
  //       ? controller.userAssessmentSearchList
  //       : controller.userAssessmentHistoryList;

  //   for (var i = 0; i < assessmentList.length; i++) {
  //     if (i < selectionList.length && selectionList[i]) {
  //       final assessment = assessmentList[i];
  //       if (assessment.id != null) {
  //         selectedIds.add(assessment.id!.toString());
  //       }
  //     }
  //   }
  //   return selectedIds;
  // }

  bool get isSearchActive =>
      controller.queryText.value != null &&
      controller.queryText.value!.isNotEmpty;

  List<UserAssessment> get assessmentList => isSearchActive
      ? controller.userAssessmentSearchList
      : controller.userAssessmentHistoryList;

  void _handleSelectedItems(
    List<String> deletedIds,
    bool shouldClearSelection,
  ) {
    if (shouldClearSelection) {
      _resetSelectionState();
    } else {
      for (final id in deletedIds) {
        selectedIds.remove(id);
      }

      final isSearchActive = controller.queryText.value != null &&
          controller.queryText.value!.isNotEmpty;
      final assessmentList = isSearchActive
          ? controller.userAssessmentSearchList
          : controller.userAssessmentHistoryList;

      for (var i = 0; i < assessmentList.length; i++) {
        final isSelected =
            selectedIds.contains(assessmentList[i].id.toString());
        _selectedItems[i] = isSelected;
        if (isSearchActive) {
          controller.selectSeaarchBulk[i] = isSelected;
        } else {
          controller.selectBulk[i] = isSelected;
        }
      }
    }
  }

  void _resetSelectionState() {
    final isSearchActive = controller.queryText.value != null &&
        controller.queryText.value!.isNotEmpty;
    final itemCount = isSearchActive
        ? controller.userAssessmentSearchList.length
        : controller.userAssessmentHistoryList.length;

    setState(() {
      _selectedItems = List.generate(itemCount, (_) => false);
      // _selectAll = false;
      selectedIds.clear();

      if (isSearchActive) {
        controller.selectSeaarchBulk.value =
            List.generate(itemCount, (_) => false);
      } else {
        controller.selectBulk.value = List.generate(itemCount, (_) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        title: 'Assessments',
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            controller.selectedAssessment.value = null;
          });
          await controller.getAssessmentHistory(
            isInitialLoad: true,
            searchAssessment: isSearchActive,
            query: controller.queryText.value,
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8)
              .copyWith(bottom: context.devicePaddingBottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              AppTextFormField(
                controller: searchController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Assets.images.search.svg(),
                ),
                hintText: 'Search...',
                fillColor: AppColors.bgMedium,
                enabledBorderSide: const BorderSide(color: AppColors.transparent),
                onChanged: (value) {
                  if (value.isEmpty) {
                    controller.queryText.value = null;
                    controller.getAssessmentHistory(isInitialLoad: true);
                  } else {
                    controller.queryText.value = value;
                    controller.getAssessmentHistory(
                      isInitialLoad: true,
                      searchAssessment: true,
                      query: value,
                    );
                  }
                },
                suffixIcon: Obx(
                  () => controller.queryText.value != null &&
                          controller.queryText.value!.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            searchController.clear();
                            controller.queryText.value = null;
                            context.hideKeyboard();
                            controller.getAssessmentHistory(isInitialLoad: true);
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Icon(Icons.clear),
                          ),
                        )
                      : const SizedBox(),
                ),
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
                    Obx(() {
                      final isSearchActive = controller.queryText.value != null &&
                          controller.queryText.value!.isNotEmpty;
        
                      final selectionList = isSearchActive
                          ? controller.selectSeaarchBulk
                          : controller.selectBulk;
        
                      final hasSelections =
                          selectionList.any((element) => element == true);
        
                      if (hasSelections) {
                        return AssesmentPopUp(
                          selectedItems: selectionList,
                          assessmentHistoryList: isSearchActive
                              ? controller.userAssessmentSearchList
                              : controller.userAssessmentHistoryList,
                          searchAssessment: isSearchActive,
                          onSelected: _handleSelectedItems,
                        );
                      }
                      return const SizedBox();
                    }),
                    
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
