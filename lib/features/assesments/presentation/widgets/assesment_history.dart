import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/presentation/controllers/assessment_history_controller.dart';
import 'package:intl/intl.dart';

class AssesmentHistory extends StatefulWidget {
  const AssesmentHistory({super.key});

  @override
  State<AssesmentHistory> createState() => _AssesmentHistoryState();
}

class _AssesmentHistoryState extends State<AssesmentHistory> {
  final AssessmentHistoryController controller =
      Get.find<AssessmentHistoryController>();
  AssessmentHistoryPagination paginationName =
      AssessmentHistoryPagination.history;

  @override
  void initState() {
    super.initState();
    // controller.getAssessmentHistory(isInitialLoad: true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeData();
    });
  }

  Future<void> _initializeData() async {
    controller.seletedAssessmentHistoryPagination.value = paginationName;
    final scrollController = controller.getScrollController(
      paginationName,
    );
    controller.userAssessmentSearchList.clear();

    // Reset selection states
    controller.selectBulk.clear();
    controller.selectSeaarchBulk.clear();
    controller.selectedIds.clear();
    controller.selectAllFlag.value = false;

    // Initial load of assessment history
    await controller.getAssessmentHistory(isInitialLoad: true);

    // If there's an active query, load search results as well
    if (controller.queryText.value != null &&
        controller.queryText.value!.isNotEmpty) {
      await controller.getAssessmentHistory(
        isInitialLoad: true,
        searchAssessment: true,
        query: controller.queryText.value,
      );
    }

    // Initialize selection data after data is loaded
    controller.initializeSelectionData();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent * 0.8) {
        final isSearchActive = controller.queryText.value != null &&
            controller.queryText.value!.isNotEmpty;

        if (isSearchActive) {
          controller.loadMoreData(AssessmentHistoryPagination.search);
        } else {
          controller.loadMoreData(paginationName);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSearchActive = controller.queryText.value != null &&
          controller.queryText.value!.isNotEmpty;
      final assessmentList = isSearchActive
          ? controller.userAssessmentSearchList
          : controller.userAssessmentHistoryList;

      return ThemedContainer(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            if (isSearchActive)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Text(
                      'Search results for "${controller.queryText.value}"',
                      style: AppTextStyles.textBodyB3,
                    ),
                    const Spacer(),
                    Text(
                      '${assessmentList.length} found',
                      style: AppTextStyles.textBodyB4
                          .copyWith(color: AppColors.textColor300),
                    ),
                  ],
                ),
              ),
            if (controller.getAssessmentHistorySearchState.value ==
                    TheStates.loading &&
                isSearchActive)
              const Padding(
                padding: EdgeInsets.all(20),
                child: Center(child: CircularProgressIndicator()),
              ),
            if (controller.searchError.value != null && isSearchActive)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    controller.searchError.value!,
                    style: AppTextStyles.textBodyB3.copyWith(color: Colors.red),
                  ),
                ),
              ),
            if (assessmentList.isEmpty &&
                controller.getAssessmentHistorySearchState.value !=
                    TheStates.loading &&
                isSearchActive)
              const Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'No assessments found matching your search',
                    style: TextStyle(color: AppColors.textColor300),
                  ),
                ),
              ),
            if (assessmentList.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                  child: Table(
                    columnWidths: const {
                      0: FixedColumnWidth(35), // Selection icon column
                      1: FlexColumnWidth(1.2),
                      2: FlexColumnWidth(),
                      3: FlexColumnWidth(),
                    },
                    children: [
                      _buildTableHeaderRow(),
                      ...List.generate(
                        assessmentList.length,
                        (index) => _buildTableRow(index, isSearchActive),
                      ),
                    ],
                  ),
                ),
              ),
            if ((isSearchActive &&
                    controller.getAssessmentHistorySearchState.value ==
                        TheStates.loading &&
                    !controller
                        .assessmentHistoryPaginationPageController[
                            AssessmentHistoryPagination.search]!
                        .isInitialLoading
                        .value) ||
                (!isSearchActive &&
                    controller.getAssessmentHistoryState.value ==
                        TheStates.loading &&
                    !controller
                        .assessmentHistoryPaginationPageController[
                            paginationName]!
                        .isInitialLoading
                        .value))
              const Padding(
                padding: EdgeInsets.all(10),
                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
              ),
          ],
        ),
      );
    });
  }

  TableRow _buildTableHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(
        color: AppColors.color1B2C3A,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 12, left: 12),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () =>
                controller.toggleSelectAll(!controller.selectAllFlag.value),
            child: Obx(
              () => Icon(
                controller.selectAllFlag.value
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: AppColors.color8798A7,
              ),
            ),
          ),
        ),
        _tableHeaderCell('Date'),
        _tableHeaderCell('Type'),
        _tableHeaderCell('Score'),
      ],
    );
  }

  /// Table Data Row with selection icon
  TableRow _buildTableRow(int index, bool isSearchResults) {
    final assessments = isSearchResults
        ? controller.userAssessmentSearchList
        : controller.userAssessmentHistoryList;
    if (index >= assessments.length) {
      return TableRow(
        children: [
          _tableCell(''),
          _tableCell(''),
          _tableCell(''),
          _tableCell(''),
        ],
      );
    }

    final assessment = assessments[index];
    var formattedTime = formatDateTime(assessment.assessmentDate ?? 'N/A');
    final scoreValue =
        '${assessment.isCompleted! ? assessment.totalObtainedScore : '--'} / ${assessment.isCompleted! ? assessment.totalScore : '--'}';

    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              final selectionList = isSearchResults
                  ? controller.selectSeaarchBulk
                  : controller.selectBulk;

              final isSelected =
                  index < selectionList.length ? selectionList[index] : false;

              controller.toggleSelection(index, !isSelected);
            },
            child: Obx(() {
              final selectionList = isSearchResults
                  ? controller.selectSeaarchBulk
                  : controller.selectBulk;
              final isSelected =
                  index < selectionList.length ? selectionList[index] : false;

              return Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: AppColors.color8798A7,
              );
            }),
          ),
        ),
        _tableCell(formattedTime, isLink: !assessment.isCompleted!),
        _tableCell(
          assessment.assessmentName ?? 'Production',
          isLink: assessment.isCompleted!,
          isBlue: assessment.isCompleted!,
        ),
        _tableCell(scoreValue, isLink: assessment.isCompleted!),
        // _tableCell(isPlaceholder ? '--/96' : '92/96', isLink: !isPlaceholder),
      ],
    );
  }

  /// Helper to create table header cells
  Widget _tableHeaderCell(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Text(
        title,
        style: AppTextStyles.textBodyB1.copyWith(color: AppColors.white),
      ),
    );
  }

  String formatDateTime(String? dateTimeStr) {
    if (dateTimeStr == null) return 'N/A';
    try {
      final dateTime = DateTime.parse(dateTimeStr);
      return DateFormat.yMd().format(dateTime.toLocal());
    } catch (e) {
      return 'N/A';
    }
  }

  /// Helper to create table data cells
  Widget _tableCell(String text, {bool isLink = false, bool isBlue = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Text(
        text,
        style: TextStyle(
          color: isBlue
              ? AppColors.primary500
              : isLink
                  ? AppColors.white
                  : AppColors.textColor300,
        ),
      ),
    );
  }
}
