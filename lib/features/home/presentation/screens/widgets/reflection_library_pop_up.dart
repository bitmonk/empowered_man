import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/export_pdf/custom_pdf.dart';
import 'package:empowered/features/home/data/model/reflection_library_model.dart';
import 'package:empowered/features/home/presentation/controllers/reflection_library_controller.dart';
import 'package:empowered/features/home/presentation/screens/widgets/reflection_summary_dialog.dart';

class ReflectionLibraryPopUp extends StatefulWidget {
  const ReflectionLibraryPopUp({
    required this.selectedItems,
    required this.onSelected,
    required this.searchReflection,
    required this.reflectionList,
    super.key,
  });
  final List<bool> selectedItems;
  final bool searchReflection;
  final Function(List<String> deletedIds, bool shouldClearSelection) onSelected;
  final List<UserReflection> reflectionList;
  @override
  State<ReflectionLibraryPopUp> createState() => _ReflectionLibraryPopUpState();
}

class _ReflectionLibraryPopUpState extends State<ReflectionLibraryPopUp> {
  final ReflectionLibraryController _controller =
      Get.find<ReflectionLibraryController>();

  Future<void> _exportSelectedReflectionsToPdf(bool shouldShare) async {
    final selectedCount = widget.selectedItems.where((item) => item).length;
    if (selectedCount == 0) {
      AppUtils.showErrorSnackbar(message: 'No Reflections selected for export');
      return;
    }

    // Get selected Reflection data
    final reflectionIds = <String>[];
    final reflections = widget.searchReflection
        ? _controller.reflectionSearchList
        : _controller.reflectionLibraryList;

    for (var i = 0; i < widget.selectedItems.length; i++) {
      if (widget.selectedItems[i] && i < reflections.length) {
        reflectionIds.add(reflections[i].id.toString());
      }
    }

    if (reflectionIds.isEmpty) {
      AppUtils.showErrorSnackbar(
        message: 'No valid Reflections found for export',
      );
      return;
    }

    try {
      // Get Reflection data for PDF
      await _controller.getBulkSeeReflection(reflectionIds);
      final userReflections =
          _controller.userReflectionResponse.value.data?.userReflections;
      if (userReflections == null || userReflections.isEmpty) {
        AppUtils.showErrorSnackbar(message: 'No Reflection data available');
        return;
      }

      // Show loading indicator
      AppUtils.showDownloadingDialog(
        message:
            'Preparing ${userReflections.length} Reflections for export...',
      );

      // Format data for PDF
      var formattedData = '';
      var fromToDate = '';
      if (userReflections.isNotEmpty) {
        formattedData = _formatReflectionDataForPdf();
        if (userReflections.length == 1 &&
            userReflections.first.createdAt != null) {
          fromToDate = userReflections.first.createdAt!.toString();
        } else {
          final dates = userReflections
              .where((j) => j.createdAt != null)
              .map((j) => j.createdAt!)
              .toList();
          if (dates.isNotEmpty) {
            dates.sort();
            fromToDate = '${dates.first} - ${dates.last}';
          } else {
            fromToDate = 'Reflection Export';
          }
        }
      }

      // Export the PDF with sharing enabled
      await exportPdf(
        context,
        data: formattedData,
        fromToDate: fromToDate,
        shouldShare: shouldShare,
      );

      // Close the dialog after export is complete

      if (Get.isDialogOpen ?? false) {
        Get.back();
      }

      AppUtils.showSnackbar(message: 'Reflections exported successfully');
    } catch (e) {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }

      print('Error sharing Reflections to PDF: $e');
      AppUtils.showErrorSnackbar(message: 'Failed to share Reflections: $e');
    } finally {
      await Future.delayed(const Duration(milliseconds: 200));
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
    }
  }

  // In your _formatReflectionDataForPdf method
  String _formatReflectionDataForPdf() {
    final buffer = StringBuffer();

    for (final reflection
        in _controller.userReflectionResponse.value.data?.userReflections ??
            []) {
      // Add Reflection emotion/title
      buffer
        ..writeln(
          '${reflection.reflection?.emotionName ?? "Untitled reflection"}',
        )
        ..writeln('-------------------------------------------');

      final reflectionAnswers = reflection.reflectionAnswers;
      if (reflectionAnswers != null && reflectionAnswers.isNotEmpty) {
        for (final answer in reflectionAnswers) {
          // Add main question and answer
          if (answer.mainQuestion != null) {
            // Safely access question through MainQuestion object
            final question = answer.mainQuestion?.question ?? 'Question';
            final answerText = answer.text ?? 'No answer provided';

            buffer
              ..writeln('Q: $question')
              ..writeln('A: $answerText')
              ..writeln();
          }

          // Add follow-up question and answer if available
          if (answer.followUpQuestion != null) {
            final followUpQuestion =
                answer.followUpQuestion?.question ?? 'Follow-up Question';
            final followUpAnswer = answer.text ?? 'No answer provided';

            buffer
              ..writeln('Q: $followUpQuestion')
              ..writeln('A: $followUpAnswer')
              ..writeln();
          }
        }
      } else {
        buffer.writeln('No answers available for this reflection.');
      }
      buffer.writeln('\n\n');
    }
    return buffer.toString();
  }

  Future<bool> canShare(String filePath) async {
    try {
      return true; // Simplified check - assume sharing is available
    } catch (e) {
      return false;
    }
  }

  Future<void> seeReflection() async {
    final selectedCount = widget.selectedItems.where((item) => item).length;

    if (selectedCount > 0) {
      final reflectionIds = List<String>.empty(growable: true);
      for (var i = 0; i < widget.selectedItems.length; i++) {
        if (widget.selectedItems[i] && i < widget.reflectionList.length) {
          reflectionIds.add(widget.reflectionList[i].id.toString());
        }
      }

      if (reflectionIds.isEmpty) {
        AppUtils.showErrorSnackbar(message: 'No reflections selected');
        return;
      }

      final success = await _controller.getBulkSeeReflection(reflectionIds);

      if (!success!) {
        return;
      }

      // Handle both single and multiple Reflection cases
      final userReflections =
          _controller.userReflectionResponse.value.data?.userReflections;

      if (userReflections != null && userReflections.isNotEmpty) {
        // If only one Reflection, pass it directly
        if (userReflections.length == 1) {
          Get.to(() => ReflectionSummaryDialog(
                userReflection: [userReflections.first],
              ),);
        } else {
          // If multiple Reflections, pass the list
          Get.to(() => ReflectionSummaryDialog(
                userReflection: userReflections,
              ),);
        }
      } else {
        AppUtils.showErrorSnackbar(
          message: 'No Reflection data available',
        );
      }
    }
  }

  Future<void> delete() async {
    Future.delayed(const Duration(milliseconds: 100), () async {
      if (widget.selectedItems.where((item) => item).isEmpty) {
        AppUtils.showErrorSnackbar(
          message: 'No Reflections selected for deletion',
        );
        return;
      }

      final shouldDelete = await Get.dialog<bool>(
        AlertDialog(
          backgroundColor: AppColors.bgBorder,
          title: const Text(
            'Delete Reflections',
            style: AppTextStyles.textHeadingH3,
          ),
          content: const Text(
            'Are you sure you want to delete the selected Reflections? This action cannot be undone.',
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

      final reflectionIds = <String>[];
      final reflections = widget.searchReflection
          ? _controller.reflectionSearchList
          : _controller.reflectionLibraryList;

      for (var i = 0; i < widget.selectedItems.length; i++) {
        if (widget.selectedItems[i] && i < reflections.length) {
          reflectionIds.add(reflections[i].id.toString());
        }
      }

      if (reflectionIds.isEmpty) {
        AppUtils.showErrorSnackbar(
          message: 'No valid reflections found for deletion',
        );
        return;
      }

      try {
        final result = await _controller.deleteBulkReflection(reflectionIds);
        if (result == true) {
          widget.onSelected(reflectionIds, true);
          await _controller.getReflectionLibrary(
            isInitialLoad: true,
            searchReflection: widget.searchReflection,
          );
          _controller.refreshData();

          // Get.close(1);
        }
      } catch (e) {
        print('Error deleting Reflections: $e');
        AppUtils.showErrorSnackbar(
          message: 'Failed to delete Reflections: $e',
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 50),
      icon: SizedBox(
        height: 33,
        width: 33,
        child: Assets.images.circleThreeDot.svg(),
      ),
      color: AppColors.bgBorder,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onSelected: (value) {
        switch (value) {
          case 'download':
            _exportSelectedReflectionsToPdf(false);
          // Handle download action
          case 'delete':
            delete();
          case 'share':
            _exportSelectedReflectionsToPdf(true); // Share only

          // Handle share action
          case 'see_reflection':
            seeReflection();
        }
      },
      itemBuilder: (context) => [
        _buildPopupMenuItem(
          'Share',
          Assets.images.sharePop.path,
          'share',
        ),
        _buildPopupMenuItem(
          'Download',
          Assets.images.download.path,
          'download',
        ),
        _buildPopupMenuItem(
          'See Reflection',
          Assets.images.note.path,
          'see_reflection',
        ),

        // if (selectedCount == 1) ...[

        // ],
        _buildPopupMenuItem(
          'Delete',
          Assets.images.deletePop.path,
          'delete',
        ),
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
      child: GestureDetector(
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 20,
              color: AppColors.textColor50,
            ),
            const HorizontalSpacing(6),
            Text(text, style: AppTextStyles.textBodyB2),
          ],
        ),
      ),
    );
  }
}
