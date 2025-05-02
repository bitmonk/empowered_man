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
  List<bool> _selectedItems = [];
  final bool _selectAll = false;
  List<String> selectedIds = [];
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
    await controller.getAssessmentHistory(isInitialLoad: true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // if (_controller.tabDataLoaded[paginationName] != true) {
      controller.selectBulk.value = List.generate(
        controller.userAssessmentHistoryList.length,
        (_) => false,
      );
      _selectedItems = List.generate(
        controller.userAssessmentHistoryList.length,
        (_) => false,
      );
      // }
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent * 0.8) {
        controller.loadMoreData(paginationName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      padding: EdgeInsets.zero,
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
              controller.userAssessmentHistoryList.length,
              (index) => _buildTableRow(index),
            ),
          ],
        ),
      ),
    );
  }

  // void _toggleSelection(int index, bool isSelected) {
  //   setState(() {
  //     _selectedItems[index] = isSelected;
  //     _selectAll = _selectedItems.every((item) => item);

  //     // Update selected IDs
  //     final assessment = controller.userAssessmentHistoryList[index];
  //     if (isSelected) {
  //       if (!selectedIds.contains(assessment.id)) {
  //         selectedIds.add(assessment.id.toString());
  //       }
  //     } else {
  //       selectedIds.remove(assessment.id);
  //     }
  //   });
  // }

  // void _toggleSelectAll(bool isSelected) {
  //   setState(() {
  //     _selectAll = isSelected;
  //     _selectedItems = List.generate(_selectedItems.length, (_) => isSelected);

  //     // Update selected IDs
  //     selectedIds.clear();
  //     if (isSelected) {
  //       selectedIds.addAll(controller.userAssessmentHistoryList
  //           .where((assessment) => assessment.id != null)
  //           .map((assessment) => assessment.id.toString()));
  //     }
  //   });
  // }

  /// Table Header Row with "Select All"
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
            // onTap: () => controller.selectAllAssessments(!_selectAll),
            child: Icon(
              _selectAll
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: AppColors.color8798A7,
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
  TableRow _buildTableRow(int index) {
    final assessments = controller.userAssessmentHistoryList;
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
    if (controller.selectBulk.length <= index) {
      // Expand the list if needed
      controller.selectBulk.value = List.generate(
        assessments.length,
        (i) =>
            i < controller.selectBulk.length ? controller.selectBulk[i] : false,
      );
    }
    final assessment = assessments[index];
    var formattedTime = formatDateTime(assessment.assessmentDate ?? 'N/A');
    final scoreValue =
        '${assessment.isCompleted! ? assessment.totalObtainedScore : '--'} / ${assessment.totalScore}';
    var isPlaceholder = index == 0 || index == 3;
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            // onTap: () => controller.toggleAssessmentSelection(index.toString(), !_selectedItems[index]),
            onTap: () {
              setState(() {
                _selectedItems[index] = !_selectedItems[index];
                controller.selectBulk.value = List.generate(
                  controller.userAssessmentHistoryList.length,
                  (index) => _selectAll,
                );
                // _selectAll = _selectedItems.every((item) => item);
              });
            },
            child: Icon(
              _selectedItems[index]
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: AppColors.color8798A7,
            ),
          ),
        ),
        _tableCell(formattedTime, isLink: !isPlaceholder),
        _tableCell(
          assessment.assessmentName ?? 'Production',
          isLink: !isPlaceholder,
          isBlue: !isPlaceholder,
        ),
        _tableCell(scoreValue),
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
