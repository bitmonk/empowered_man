import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/data/model/assessment_history_model.dart';
import 'package:empowered/features/assesments/presentation/controllers/assessment_history_controller.dart';

class AssesmentPopUp extends StatefulWidget {
  const AssesmentPopUp({
    required this.selectedItems,
    required this.assessmentHistoryList,
    required this.onSelected,
    required this.searchAssessment,
    super.key,
  });
  final List<bool> selectedItems;
  final bool searchAssessment;
  final Function(List<String> deletedIds, bool shouldClearSelection) onSelected;
  final List<UserAssessment> assessmentHistoryList;

  @override
  State<AssesmentPopUp> createState() => _AssesmentPopUpState();
}

class _AssesmentPopUpState extends State<AssesmentPopUp> {
  final AssessmentHistoryController controller =
      Get.find<AssessmentHistoryController>();

  Future<void> _handleDelete() async {
    Future.delayed(const Duration(milliseconds: 100), () async {
      // First determine which assessment list to use based on search status
      final assessments = widget.searchAssessment
          ? controller.userAssessmentSearchList
          : controller.userAssessmentHistoryList;

      // Get the active selection list
      final selectionList = widget.searchAssessment
          ? controller.selectSeaarchBulk
          : controller.selectBulk;

      // Check if any items are selected
      if (selectionList.where((item) => item).isEmpty) {
        AppUtils.showErrorSnackbar(
          message: 'No assessment selected for deletion',
        );
        return;
      }

      final shouldDelete = await Get.dialog<bool>(
        AlertDialog(
          backgroundColor: AppColors.bgBorder,
          title: const Text(
            'Delete assessments',
            style: AppTextStyles.textHeadingH3,
          ),
          content: const Text(
            'Are you sure you want to delete the selected assessments? This action cannot be undone.',
            style: AppTextStyles.textBodyB2,
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(result: false),
              child: const Text(
                'Cancel',
                style: TextStyle(color: AppColors.textColor50),
              ),
            ),
            TextButton(
              onPressed: () => Get.back(result: true),
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ],
        ),
      );

      if (shouldDelete != true) return;

      final assessmentIds = <String>[];

      // Correctly collect IDs from the appropriate list
      for (var i = 0; i < selectionList.length; i++) {
        if (selectionList[i] && i < assessments.length) {
          assessmentIds.add(assessments[i].id.toString());
        }
      }

      if (assessmentIds.isEmpty) {
        AppUtils.showErrorSnackbar(
          message: 'No valid assessments found for deletion',
        );
        return;
      }

      try {
        final result = await controller.deleteAssessments(assessmentIds);
        if (result == true) {
          widget.onSelected(assessmentIds, true);

          await controller.getAssessmentHistory(
            isInitialLoad: true,
            searchAssessment: widget.searchAssessment,
          );
        }
      } catch (e) {
        AppUtils.showErrorSnackbar(
          message: 'Failed to delete assessments: $e',
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 50),
      icon: Assets.images.cirlceThreeDot.svg(), // Uses the three-dot icon
      color: AppColors.bgBorder, // Background color matching the UI
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onSelected: (value) async {
        switch (value) {
          case 'download':
            // Handle download action
            break;
          case 'delete':
            _handleDelete();
          case 'share':
            // Handle share action
            break;
        }
      },
      itemBuilder: (context) => [
        _buildPopupMenuItem(
          'Download',
          Assets.images.download.path,
          'download',
        ),
        _buildPopupMenuItem(
          'Delete',
          Assets.images.deletePop.path,
          'delete',
        ),
        _buildPopupMenuItem('Share', Assets.images.sharePop.path, 'share'),
      ],
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(
    String text,
    String icon,
    String value,
  ) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 20,
          ),
          const HorizontalSpacing(6),
          Text(text, style: AppTextStyles.textBodyB2),
        ],
      ),
    );
  }
}
