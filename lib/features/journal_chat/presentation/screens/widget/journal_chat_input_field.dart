import 'dart:io';

import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:video_player/video_player.dart';

class JournalChatInputField extends StatefulWidget {
  const JournalChatInputField({
    required this.focusNode,
    required this.journalId,
    this.mainQuestionId,
    this.followupQuestionId,
    super.key,
  });
  final FocusNode focusNode;
  final String journalId;
  final String? mainQuestionId;
  final String? followupQuestionId;

  @override
  State<JournalChatInputField> createState() => _JournalChatInputFieldState();
}

class _JournalChatInputFieldState extends State<JournalChatInputField> {
  final controller = Get.find<JournalChatController>();
  final quill.QuillController _controller = quill.QuillController.basic();
  bool showEditor = false;
  List<String> _selectedMediaPaths = [];
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  VideoPlayerController? _videoController;
  //  Future<void> _pickImage() async {
  //   // Use image_picker to select an image
  //   final pickedImage = await _imagePicker.pickImage(
  //     source: await _showImageSourceDialog(context),
  //   );
  //   if (pickedImage != null) {
  //     // Handle the picked image (e.g., upload it or display it)
  //     final filePath = pickedImage.path;
  //     // You can use the filePath to send the image or perform any other action
  //     controller.sendMessage(
  //       widget.journalId,
  //       filePath, // mediaPath
  //       null, // text parameter
  //       widget.mainQuestionId,
  //       widget.followupQuestionId,
  //     );

  //   }
  // }

  Future<void> _loadVideo(String filePath) async {
    if (_videoController != null) {
      await _videoController!.dispose();
    }

    final controller = VideoPlayerController.file(File(filePath));
    await controller.initialize();

    setState(() {
      _videoController = controller;
      _videoController!.pause(); // Ensure it is paused
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.bgBorder,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        children: [
          if (showEditor)
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textColor100,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: quill.QuillEditor.basic(
                  focusNode: widget.focusNode,
                  controller: _controller,
                  configurations: quill.QuillEditorConfigurations(
                    minHeight: showEditor ? 120 : 50,
                  ),
                ),
              ),
            )
          else
            TextField(
              focusNode: widget.focusNode,
              onTap: () async {
                await Future.delayed(const Duration(milliseconds: 500));
                controller.scrollToBottom();
              },
              controller: controller.chatController,
              decoration: InputDecoration(
                hintText: 'Message...',
                hintStyle: AppTextStyles.textBodyB2
                    .copyWith(color: AppColors.textColor200),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.white),
            ),
          Row(
            children: [
              if (showEditor)
                InkWell(
                  onTap: () {
                    setState(() {
                      showEditor = false;
                    });
                  },
                  child: const Icon(
                    Icons.close,
                    color: AppColors.primary500,
                  ).paddingOnly(right: 4),
                ),
              if (showEditor)
                Expanded(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      iconTheme: const IconThemeData(
                        color: Colors.white,
                      ), // Set tool icons to white
                      buttonTheme: const ButtonThemeData(
                        buttonColor: Colors.white,
                      ), // For buttons, if applicable
                    ),
                    child: quill.QuillSimpleToolbar(
                      controller: _controller,
                      configurations:
                          const quill.QuillSimpleToolbarConfigurations(
                        toolbarSectionSpacing: 2,
                        showJustifyAlignment: false,
                        showListBullets: false,
                        showCenterAlignment: false,
                        showClearFormat: false,
                        showFontFamily: false,
                        showFontSize: false,
                        showBackgroundColorButton: false,
                        showColorButton: false,
                        showHeaderStyle: false,
                        showLink: false,
                        showUndo: false,
                        showRedo: false,
                        showListCheck: false,
                        showIndent: false,
                        showSubscript: false,
                        showSuperscript: false,
                        showSearchButton: false,
                        showClipboardCut: false,
                        showClipboardCopy: false,
                        showClipboardPaste: false,
                        multiRowsDisplay: false,
                        color: AppColors.transparent,
                      ),
                    ),
                  ),
                )
              else
                buildControls(),
              const HorizontalSpacing(8),
              InkWell(
                onTap: () async {
                  if (showEditor) {
                    final text = _controller.document.toPlainText();
                    if (_selectedMediaPaths.isNotEmpty ||
                        text.trim().isNotEmpty) {
                      // Send text if available
                      if (text.trim().isNotEmpty) {
                        controller.sendMessage(
                          widget.journalId,
                          null,
                          text.trim(),
                          widget.mainQuestionId,
                          widget.followupQuestionId,
                        );
                      }

                      // Send all selected files
                      for (final filePath in _selectedMediaPaths) {
                        controller.sendMessage(
                          widget.journalId,
                          filePath,
                          null,
                          widget.mainQuestionId,
                          widget.followupQuestionId,
                        );
                      }
                    }
                  } else {
                    if (_selectedMediaPaths.isNotEmpty ||
                        controller.chatController.text.trim().isNotEmpty) {
                      // Send text if available
                      if (controller.chatController.text.trim().isNotEmpty) {
                        controller.sendMessage(
                          widget.journalId,
                          null,
                          controller.chatController.text,
                          widget.mainQuestionId,
                          widget.followupQuestionId,
                        );
                      }

                      // Send all selected files
                      for (final filePath in _selectedMediaPaths) {
                        controller.sendMessage(
                          widget.journalId,
                          filePath,
                          null,
                          widget.mainQuestionId,
                          widget.followupQuestionId,
                        );
                      }
                    }
                  }
                  setState(() {
                    _selectedMediaPaths = []; // Reset selection
                    if (showEditor) {
                      _controller.clear();
                    } else {
                      controller.chatController.clear();
                    }
                  });
                },
                child: Assets.images.sendMessageIcon.svg(width: 40, height: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Expanded buildControls() {
    return Expanded(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child:
                Assets.images.addIconWithBackground.svg(width: 40, height: 40),
          ),
          Assets.images.chatMicrophone.image(width: 20),
          const HorizontalSpacing(20),
          InkWell(
            onTap: () {
              setState(() {
                showEditor = true;
              });
            },
            child: Assets.images.chatText.image(width: 20),
          ),
          const HorizontalSpacing(20),
          InkWell(
            onTap: () async {
              try {
                final result = await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                  // type: FileType.custom,
                  type: FileType.any,
                );

                if (result != null && result.files.isNotEmpty) {
                  for (final file in result.files) {
                    if (file.path != null) {
                      final filePath = file.path!;
                      if (filePath.endsWith('.mp4') ||
                          filePath.endsWith('.mov')) {
                        await _loadVideo(filePath);
                      } else {
                        await controller.sendMessage(
                          widget.journalId,
                          filePath,
                          null,
                          widget.mainQuestionId,
                          widget.followupQuestionId,
                        );
                      }
                    } else {
                      debugPrint('File path is null for a selected file');
                    }
                  }
                } else {
                  debugPrint('No files selected or result is null');
                }
              } catch (e) {
                debugPrint('File picking error: $e');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error selecting files: $e')),
                );
              }
            },
            child: Assets.images.chatAttachment.image(width: 20),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
