import 'dart:io';

import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/data/model/journal_library_index_model.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_emotion_name_controller.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_summary_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
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

    _initializeData();
  }

  // Add this as a class member variable

  Future<void> _exportSelectedJournalsToPdf(bool shouldShare) async {
    final selectedCount = widget.selectedItems.where((item) => item).length;
    if (selectedCount == 0) {
      AppUtils.showErrorSnackbar(message: 'No journals selected for export');
      return;
    }

    // Show loading indicator
    _showLoadingDialog('Preparing journals for export...');

    try {
      // Check storage permission first

      // Get selected journal data
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
        if (Get.isDialogOpen ?? false) {
          Get.back(); // Close loading dialog
        }
        AppUtils.showErrorSnackbar(
            message: 'No valid journals found for export');
        return;
      }

      // Get journal data for PDF
      await _controller.getBulkSeeJournal(journalIds);
      final userJournals =
          _controller.userJournalResponse.value.data?.userJournals;

      if (userJournals == null || userJournals.isEmpty) {
        if (Get.isDialogOpen ?? false) {
          Get.back(); // Close loading dialog
        }
        AppUtils.showErrorSnackbar(message: 'No journal data available');
        return;
      }

      // Update loading message
      _updateLoadingDialog(
          'Generating PDF for ${userJournals.length} journals...');

      // Prepare directory
      Directory directory;
      try {
        if (Platform.isAndroid) {
          directory = await getApplicationDocumentsDirectory();
        } else {
          // For iOS
          directory = await getApplicationDocumentsDirectory();
        }
      } catch (e) {
        // Fallback to temporary directory if documents fails
        directory = await getTemporaryDirectory();
      }

      // Create a single PDF for all journals
      final pdf = pw.Document()

        // Add cover page
        ..addPage(
          pw.Page(
            build: (pw.Context context) => pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text(
                  'Journal Export',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 10),
                pw.Text(
                  'Date: ${DateTime.now().toLocal().toString().split(' ')[0]}',
                  style: const pw.TextStyle(
                    fontSize: 16,
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  'Number of Journals: ${userJournals.length}',
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );

      // Add content pages for each journal
      for (final journal in userJournals) {
        // Add journal pages (existing code)
        // [... existing journal PDF content generation ...]
        final emotionName = journal.journal?.emotionName ?? 'Untitled Journal';

        // Add journal page
        pdf.addPage(
          pw.MultiPage(
            pageFormat: PdfPageFormat.a4,
            margin: const pw.EdgeInsets.all(32),
            build: (pw.Context context) {
              final paragraphs = <pw.Widget>[];

              // Add journal title
              paragraphs.add(
                pw.Text(
                  emotionName,
                  style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              );

              paragraphs.add(pw.SizedBox(height: 10));
              paragraphs.add(
                pw.Divider(
                  thickness: 1,
                  color: PdfColors.grey300,
                ),
              );
              paragraphs.add(pw.SizedBox(height: 10));

              // Add creation date if available
              if (journal.createdAt != null) {
                paragraphs.add(
                  pw.Text(
                    'Created: ${journal.createdAt}',
                    style: pw.TextStyle(
                      fontSize: 12,
                      fontStyle: pw.FontStyle.italic,
                    ),
                  ),
                );
                paragraphs.add(pw.SizedBox(height: 10));
              }

              // Add journal answers
              final journalAnswers = journal.journalAnswers;
              if (journalAnswers != null && journalAnswers.isNotEmpty) {
                for (final answer in journalAnswers) {
                  if (answer.mainQuestion != null) {
                    paragraphs.add(
                      pw.Text(
                        'Q: ${answer.mainQuestion!.question ?? "Question"}',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.blueGrey800,
                        ),
                      ),
                    );
                    paragraphs.add(
                      pw.Text(
                        'A: ${answer.text ?? "No answer provided"}',
                        style: const pw.TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    );
                    paragraphs.add(pw.SizedBox(height: 8));
                  }

                  // Add follow-up if available
                  if (answer.followUpQuestion != null) {
                    paragraphs.add(
                      pw.Text(
                        'Q: ${answer.followUpQuestion!.question ?? "Follow-up Question"}',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.blueGrey800,
                        ),
                      ),
                    );
                    paragraphs.add(
                      pw.Text(
                        'A: ${answer.followUpQuestion?.answer ?? "No answer provided"}',
                        style: const pw.TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    );
                    paragraphs.add(pw.SizedBox(height: 8));
                  }
                }
              } else {
                paragraphs.add(
                  pw.Text(
                    'No answers available for this journal.',
                    style: pw.TextStyle(
                      fontSize: 12,
                      fontStyle: pw.FontStyle.italic,
                    ),
                  ),
                );
              }

              return paragraphs;
            },
          ),
        );
      }

      // Save the PDF file
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filename = 'journals_export_$timestamp.pdf';
      final file = File('${directory.path}/$filename');

      await file.writeAsBytes(await pdf.save());

      // Close loading dialog
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }

      // Share or notify about download
      if (shouldShare) {
        try {
          await Share.shareXFiles([XFile(file.path)],
              text: 'My Journal Export');
        } catch (shareError) {
          AppUtils.showSnackbar(
            message: 'Journal saved to: ${file.path}',
          );
        }
      } else {
        AppUtils.showSnackbar(
          message: 'Journal successfully saved to your device',
          // For more technical users, you might want to show the path
          // message: 'Journal saved to: ${file.path}',
        );
      }
    } catch (e) {
      // Close loading dialog if it was shown
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
      print('Error exporting journals to PDF: $e');
      AppUtils.showErrorSnackbar(
        message: 'Failed to export journals. Please try again.',
      );
    }
  }

// Helper method to show loading dialog
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
                  const CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
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

// Helper method to update loading dialog
  void _updateLoadingDialog(String message) {
    if (Get.isDialogOpen ?? false) {
      Get.back(); // Close current dialog
      _showLoadingDialog(message); // Show new dialog with updated message
    }
  }

  Future<bool> _handleStoragePermission() async {
    // First check current status
    final status = await Permission.storage.status;

    if (status.isGranted) {
      return true;
    }

    // Request permission
    final permissionStatus = await Permission.storage.request();

    if (permissionStatus.isGranted) {
      return true;
    } else if (permissionStatus.isPermanentlyDenied) {
      // User has permanently denied - suggest opening settings
      final openSettings = await Get.dialog<bool>(
        AlertDialog(
          backgroundColor: AppColors.bgBorder,
          title: const Text(
            'Storage Permission Required',
            style: AppTextStyles.textHeadingH3,
          ),
          content: const Text(
            'Storage permission is required to download journals. Would you like to open app settings to enable it?',
            style: AppTextStyles.textBodyB2,
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(result: false),
              child: const Text(
                'Not Now',
                style: TextStyle(color: AppColors.textColor50),
              ),
            ),
            TextButton(
              onPressed: () => Get.back(result: true),
              child: const Text(
                'Open Settings',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      );

      if (openSettings == true) {
        await openAppSettings();
      }
      return false;
    } else if (permissionStatus.isRestricted) {
      AppUtils.showErrorSnackbar(
        message:
            'Storage access is restricted on this device. Please check your device settings.',
      );
      return false;
    } else {
      // Regular denial
      AppUtils.showErrorSnackbar(
        message: 'Storage permission is required to download journals',
      );
      return false;
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
