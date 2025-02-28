import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:get/get.dart';

class JournalChatInputField extends StatefulWidget {
  const JournalChatInputField({required this.focusNode, super.key});
  final FocusNode focusNode;

  @override
  State<JournalChatInputField> createState() => _JournalChatInputFieldState();
}

class _JournalChatInputFieldState extends State<JournalChatInputField> {
  final controller = Get.find<JournalChatController>();
  final quill.QuillController _controller = quill.QuillController.basic();
  bool showEditor = false;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                onTap: controller.sendMessage,
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
          Assets.images.chatMic.image(width: 20),
          const HorizontalSpacing(20),
          Assets.images.chatAttachment.image(width: 20),
          const Spacer(),
        ],
      ),
    );
  }
}
