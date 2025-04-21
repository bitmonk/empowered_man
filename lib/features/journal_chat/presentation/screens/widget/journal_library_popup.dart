import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_emotion_name_controller.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_summary_dialog.dart';

class JournalLibraryPopUp extends StatefulWidget {
  const JournalLibraryPopUp({
    required this.selectedItems,
    required this.onSelected,
    super.key,
  });
  final List<bool> selectedItems;
  final Function(List<String> deletedIds, bool shouldClearSelection) onSelected;

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

  Future<void> _initializeData() async {}

  @override
  Widget build(BuildContext context) {
    final selectedCount = widget.selectedItems.where((item) => item).length;
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
            // Handle download action
            break;
          case 'delete':
            // Handle delete action
            break;
          case 'share':
            // Handle share action
            break;
          case 'see_journal':
            // Handle share action
            break;
        }
      },
      itemBuilder: (context) => [
        _buildPopupMenuItem(
          'Share',
          Assets.images.sharePop.path,
          'share',
          () {},
        ),
        _buildPopupMenuItem(
          'Download',
          Assets.images.download.path,
          'download',
          () {},
        ),
        _buildPopupMenuItem(
          'See Journal',
          Assets.images.note.path,
          'see_journal',
          () async {
            if (selectedCount > 0) {
              final journalIds = List<String>.empty(growable: true);
              final journals =
                  _controller.journalLibraryIndexModel.value.data?.userJournals;

              if (journals != null) {
                for (var i = 0; i < widget.selectedItems.length; i++) {
                  if (widget.selectedItems[i] && i < journals.length) {
                    journalIds.add(journals[i].id.toString());
                  }
                }
              }

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
          },
        ),

        // if (selectedCount == 1) ...[

        // ],
        _buildPopupMenuItem(
          'Delete',
          Assets.images.deletePop.path,
          'delete',
          () async {
            Future.delayed(Duration(milliseconds: 100), () async {
              if (widget.selectedItems.where((item) => item).isEmpty) {
                AppUtils.showErrorSnackbar(
                  message: 'No journals selected for deletion',
                );
                return;
              }

              final shouldDelete = await Get.dialog<bool>(
                AlertDialog(
                  backgroundColor: AppColors.bgBorder,
                  title: const Text('Delete Journals',
                      style: AppTextStyles.textHeadingH3),
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
                      1, '', null, null, null, 10);
                  Get.close(1);
                }
              } catch (e) {
                print('Error deleting journals: $e');
                AppUtils.showErrorSnackbar(
                    message: 'Failed to delete journals: $e');
              }
            });
          },
        ),
      ],
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(
    String text,
    String icon,
    String value,
    VoidCallback? onPressed,
  ) {
    return PopupMenuItem(
      value: value,
      child: GestureDetector(
        onTap: onPressed,
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
