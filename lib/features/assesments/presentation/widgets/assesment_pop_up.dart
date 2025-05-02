import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/presentation/controllers/assessment_history_controller.dart';

class AssesmentPopUp extends StatelessWidget {
  const AssesmentPopUp({
    required this.selectedIds,
    required this.onDeleteSuccess,
    super.key,
  });
  final List<String> selectedIds;
  final VoidCallback onDeleteSuccess;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AssessmentHistoryController>();

    return PopupMenuButton<String>(
      offset: const Offset(0, 50),
      icon: Assets.images.cirlceThreeDot.svg(), // Uses the three-dot icon
      color: AppColors.bgBorder, // Background color matching the UI
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onSelected: (value) async{
        switch (value) {
          case 'download':
            // Handle download action
            break;
          case 'delete':
            final success = await _handleDelete(controller, context);
            if (success == true) {
              onDeleteSuccess();
            }
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

Future<bool?> _handleDelete(
    AssessmentHistoryController controller,
    BuildContext context,
  ) async {
    if (selectedIds.isEmpty) return false;
    
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Assessments'),
        content: Text(
          'Are you sure you want to delete ${selectedIds.length} selected assessment(s)?',),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    
    if (confirmed != true) return false;
    
    return  controller.deleteAssessments(selectedIds);
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
