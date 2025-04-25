import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/export_pdf/custom_pdf.dart';
import 'package:empowered/features/journal_chat/data/model/journal_library_index_model.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_emotion_name_controller.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_summary_dialog.dart';
import 'package:path_provider/path_provider.dart';

class JournalLibraryPopUp extends StatefulWidget {
  const JournalLibraryPopUp({
    required this.selectedItems,
    required this.onSelected,
    required this.searchJournal,
    required this.journalList,
    super.key,
  });
  final List<bool> selectedItems;
  final bool searchJournal;
  final Function(List<String> deletedIds, bool shouldClearSelection) onSelected;
  final List<UserJournal> journalList;
  @override
  State<JournalLibraryPopUp> createState() => _JournalLibraryPopUpState();
}

class _JournalLibraryPopUpState extends State<JournalLibraryPopUp> {
  final JournalEmotionNameController _controller =
      Get.find<JournalEmotionNameController>();
  @override
  void initState() {
    super.initState();

    _initializeData();
  }

  // Add this as a class member variable

  Future<void> _exportSelectedJournalsToPdf(bool shouldShare) async {
    final selectedCount = widget.selectedItems.where((item) => item).length;
    if (selectedCount == 0) {
      AppUtils.showErrorSnackbar(message: 'No journals selected for export');
      return;
    }

    // Get selected journal data
    final journalIds = <String>[];
    final journals =
        _controller.journalLibraryIndexModel.value.data?.userJournals;
    print('Available journals count: ${journals?.length}');
    if (journals != null) {
      for (var i = 0; i < widget.selectedItems.length; i++) {
        if (widget.selectedItems[i] && i < journals.length) {
          journalIds.add(journals[i].id.toString());
          print('Selected journal ID: ${journals[i].id}');
        }
      }
    }

    if (journalIds.isEmpty) {
      print('No journal IDs found. Selected items: ${widget.selectedItems}');
      AppUtils.showErrorSnackbar(message: 'No valid journals found for export');
      return;
    }

    try {
      // Get journal data for PDF
      await _controller.getBulkSeeJournal(journalIds);
      final userJournals =
          _controller.userJournalResponse.value.data?.userJournals;
      if (userJournals == null || userJournals.isEmpty) {
        AppUtils.showErrorSnackbar(message: 'No journal data available');
        return;
      }

      // Show loading indicator

      Get.dialog(
        Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.bgBorder,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 16),
                  Text(
                    'Preparing ${userJournals.length} journals for export...',
                    style: AppTextStyles.textBodyB3,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );
      final directory = await getApplicationDocumentsDirectory();

      // Convert each journal to PDF content
      final pdfContents = <String>[];
      for (final journal in userJournals) {
        pdfContents.add(_formatJournalDataForPdf());
      }

      // Save files in batch
      final savedFiles = await BatchFileManager.saveMultipleFiles(
        pdfContents,
        'journal_export',
        directory,
      );

      // Close loading dialog
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }

      if (savedFiles.isNotEmpty) {
        AppUtils.showSnackbar(
            message: '${savedFiles.length} journals exported successfully');

        if (shouldShare) {
          // Implement sharing logic here
        }
      } else {
        AppUtils.showErrorSnackbar(message: 'No files were exported');
      }

      //   // Format data for PDF
      //   var formattedData = '';
      //   var fromToDate = '';
      //   if (userJournals.isNotEmpty) {
      //     formattedData = _formatJournalDataForPdf();
      //     if (userJournals.length == 1 && userJournals.first.createdAt != null) {
      //       fromToDate = userJournals.first.createdAt!;
      //     } else {
      //       final dates = userJournals
      //           .where((j) => j.createdAt != null)
      //           .map((j) => j.createdAt!)
      //           .toList();
      //       if (dates.isNotEmpty) {
      //         dates.sort();
      //         fromToDate = '${dates.first} - ${dates.last}';
      //       } else {
      //         fromToDate = 'Journal Export';
      //       }
      //     }
      //   }

      //   // Export the PDF with sharing enabled
      //   await exportPdf(
      //     context,
      //     data: formattedData,
      //     fromToDate: fromToDate,
      //     shouldShare: shouldShare,
      //   );

      //   // Close the dialog after export is complete

      //   if (Get.isDialogOpen ?? false) {
      //     Get.back();
      //   }

      //   AppUtils.showSnackbar(message: 'Journals exported successfully');
      // } catch (e) {
      //   // Close loading dialog if it was shown

      //   if (Get.isDialogOpen ?? false) {
      //     Get.back();
      //   }

      //   print('Error sharing journals to PDF: $e');
      //   AppUtils.showErrorSnackbar(message: 'Failed to share journals: $e');
    } finally {
      // Always dismiss dialog in finally block to ensure it gets executed

      // Add a small delay to ensure UI has time to process
      await Future.delayed(const Duration(milliseconds: 200));
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
    }
  }

  String _formatJournalDataForPdf() {
    final buffer = StringBuffer();
    for (final journal
        in _controller.userJournalResponse.value.data?.userJournals ?? []) {
      // Add journal emotion/title
      buffer
        ..writeln('${journal.journal?.emotionName ?? "Untitled Journal"}')
        ..writeln('-------------------------------------------');

      final journalAnswers = journal.journalAnswers;
      if (journalAnswers != null && journalAnswers.isNotEmpty) {
        for (final answer in journalAnswers) {
          // Add main question and answer
          if (answer.mainQuestion != null) {
            buffer
              ..writeln('Q: ${answer.mainQuestion!.question ?? "Question"}')
              ..writeln('A: ${answer.text ?? "No answer provided"}')
              ..writeln();
          }
          // Add follow-up question and answer if available
          if (answer.followUpQuestion != null) {
            buffer
              ..writeln(
                'Q: ${answer.followUpQuestion!.question ?? "Follow-up Question"}',
              )
              ..writeln('A: ${answer.text ?? "No answer provided"}')
              ..writeln();
          }
        }
      } else {
        buffer.writeln('No answers available for this journal.');
      }
      buffer.writeln('\n\n');
    }
    return buffer.toString();
  }

  Future<void> _initializeData() async {}

  @override
  Widget build(BuildContext context) {
    final selectedCount = widget.selectedItems.where((item) => item).length;
    delete() async {
      Future.delayed(const Duration(milliseconds: 100), () async {
        if (widget.selectedItems.where((item) => item).isEmpty) {
          AppUtils.showErrorSnackbar(
            message: 'No journals selected for deletion',
          );
          return;
        }

        final shouldDelete = await Get.dialog<bool>(
          AlertDialog(
            backgroundColor: AppColors.bgBorder,
            title: const Text(
              'Delete Journals',
              style: AppTextStyles.textHeadingH3,
            ),
            content: const Text(
              'Are you sure you want to delete the selected journals? This action cannot be undone.',
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

        final journalIds = <String>[];
        final journals =
            _controller.journalLibraryIndexModel.value.data?.userJournals;
        if (journals != null) {
          for (var i = 0; i < widget.selectedItems.length; i++) {
            if (widget.selectedItems[i] && i < journals.length) {
              journalIds.add(journals[i].id.toString());
            }
          }
        }

        if (journalIds.isEmpty) {
          AppUtils.showErrorSnackbar(
            message: 'No valid journals found for deletion',
          );
          return;
        }

        try {
          final result = await _controller.deleteBulkJournal(journalIds);
          if (result == true) {
            widget.onSelected(journalIds, true);
            await _controller.getJournalLibrary(
              isInitialLoad: true,
              searchJournal: widget.searchJournal,
            );
            // Get.close(1);
          }
        } catch (e) {
          print('Error deleting journals: $e');
          AppUtils.showErrorSnackbar(
            message: 'Failed to delete journals: $e',
          );
        }
      });
    }

    Future<void> seeJournal() async {
      if (selectedCount > 0) {
        final journalIds = List<String>.empty(growable: true);
        final journals =
            _controller.journalLibraryIndexModel.value.data?.userJournals;
        for (var i = 0; i < widget.selectedItems.length; i++) {
          if (widget.selectedItems[i] && i < widget.journalList.length) {
            journalIds.add(widget.journalList[i].id.toString());
          }
        }
        // if (journals != null) {
        //   for (var i = 0; i < widget.selectedItems.length; i++) {
        //     if (widget.selectedItems[i] && i < journals.length) {
        //       journalIds.add(journals[i].id.toString());
        //     }
        //   }
        // }

        print('Selected journal IDs: $journalIds');

        if (journalIds.isEmpty) {
          AppUtils.showErrorSnackbar(message: 'No journals selected');

          return;
        }

        // Call API
        final result = await _controller.getBulkSeeJournal(journalIds);

        final userJournals =
            _controller.userJournalResponse.value.data?.userJournals;
        Future.delayed(
          const Duration(seconds: 1),
        );
        print('User Journals: $userJournals');

        if (userJournals != null) {
          Get.to(
            () => JournalSummaryDialog(
              userJournal: userJournals,
            ),
          );
        } else {
          AppUtils.showErrorSnackbar(
            message: 'No journal data available',
          );
        }
      }
    }

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
            _exportSelectedJournalsToPdf(false);
          // Handle download action
          case 'delete':
            delete();
          case 'share':
            _exportSelectedJournalsToPdf(true); // Share only

          // Handle share action
          case 'see_journal':
            seeJournal();
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
          'See Journal',
          Assets.images.note.path,
          'see_journal',
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
