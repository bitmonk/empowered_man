import 'dart:io';

import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/data/model/journal_library_index_model.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_emotion_name_controller.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_pdf.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_summary_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

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
  }

  // Add this as a class member variable

  Future<void> _exportSelectedJournalsToPdf(bool shouldShare) async {
    final selectedCount = widget.selectedItems.where((item) => item).length;
    if (selectedCount == 0) {
      AppUtils.showErrorSnackbar(message: 'No journals selected for export');
      return;
    }

    // _showLoadingDialog('Preparing journals for download...');
    try {
      final journals = widget.searchJournal
          ? _controller.journalSearchList
          : _controller.journalLibraryList;

      final journalIds = [
        for (int i = 0;
            i < widget.selectedItems.length && i < journals.length;
            i++)
          if (widget.selectedItems[i]) journals[i].id.toString(),
      ];

      if (journalIds.isEmpty) {
        _closeDialogIfOpen();
        AppUtils.showErrorSnackbar(
            message: 'No valid journals found for export',);
        return;
      }

      // Get journal data for PDF
      await _controller.getBulkSeeJournal(journalIds);
      final userJournals =
          _controller.userJournalResponse.value.data?.userJournals;

      if (userJournals == null || userJournals.isEmpty) {
        _closeDialogIfOpen();
        AppUtils.showErrorSnackbar(message: 'No journal data available');
        return;
      }

      _showLoadingDialog(
          'Generating PDF for ${userJournals.length} journals...',);

      var status = await Permission.storage.request();

      if (!status.isGranted) {
        _closeDialogIfOpen();
        AppUtils.showErrorSnackbar(
          message: 'Storage permission is required to download journals',
        );
        return;
      }

      // Prepare directory
      final directory = await _getStorageDirectory();
      final pdf = JournalPdf().buildPdf(userJournals);

      final fileName =
          'journals_export_${DateTime.now().millisecondsSinceEpoch}.pdf';
      final file = File('${directory.path}/$fileName');

      await file.writeAsBytes(await pdf.save());

      _closeDialogIfOpen();

      if (shouldShare && await canShare(file.path)) {
        await Share.shareXFiles([XFile(file.path)], text: 'My Journal Export');
      } else {
        AppUtils.showSnackbar(message: 'Journal successfully saved!');
      }
    } catch (e) {
      // Close loading dialog if it was shown
      _closeDialogIfOpen();
      AppUtils.showErrorSnackbar(
        message: 'Failed to download journals. Please try again.',
      );
    } finally {
      _closeDialogIfOpen();
    }
  }

  void _showLoadingDialog(String message) {
    Get.dialog(
      Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(40),
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
                  const CircularProgressIndicator(strokeWidth: 3),
                  const SizedBox(height: 16),
                  Text(
                    message,
                    style: AppTextStyles.textBodyB3,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void _closeDialogIfOpen() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  Future<Directory> _getStorageDirectory() async {
    try {
      return await getApplicationDocumentsDirectory();
    } catch (_) {
      return getTemporaryDirectory();
    }
  }

// Helper function to check if sharing is available
  Future<bool> canShare(String filePath) async {
    try {
      return true; // Simplified check - assume sharing is available
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedCount = widget.selectedItems.where((item) => item).length;
    Future<void> delete() async {
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
        final journals = widget.searchJournal
            ? _controller.journalSearchList
            : _controller.journalLibraryList;

        for (var i = 0; i < widget.selectedItems.length; i++) {
          if (widget.selectedItems[i] && i < journals.length) {
            journalIds.add(journals[i].id.toString());
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

        _controller.journalLibraryIndexModel.value.data?.userJournals;
        for (var i = 0; i < widget.selectedItems.length; i++) {
          if (widget.selectedItems[i] && i < widget.journalList.length) {
            journalIds.add(widget.journalList[i].id.toString());
          }
        }

        if (journalIds.isEmpty) {
          AppUtils.showErrorSnackbar(message: 'No journals selected');

          return;
        }

        // Call API
        await _controller.getBulkSeeJournal(journalIds);

        final userJournals =
            _controller.userJournalResponse.value.data?.userJournals;
        Future.delayed(
          const Duration(seconds: 1),
        );

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
