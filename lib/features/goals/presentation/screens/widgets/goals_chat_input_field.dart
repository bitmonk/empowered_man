import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_chat_controller.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class GoalsChatInputField extends StatefulWidget {
  const GoalsChatInputField({
    required this.focusNode,
    required this.goalId,
    super.key,
    this.enabled = true,
    this.isEditMode = false,
    this.onSend,
    this.onCancel,
  });

  final FocusNode focusNode;
  final String goalId;
  final bool enabled;
  final bool isEditMode;
  final Function(String)? onSend;
  final VoidCallback? onCancel;

  @override
  State<GoalsChatInputField> createState() => _GoalsChatInputFieldState();
}

class _GoalsChatInputFieldState extends State<GoalsChatInputField> {
  late GoalsChatController chatController;
  late FocusNode _focusNode;
  late quill.QuillController _quillController;
  bool showEditor = true;

  bool _isComposing = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    chatController = Get.find<GoalsChatController>();
    _focusNode = widget.focusNode;

    // Initialize Quill controller
    _quillController = quill.QuillController.basic();

    // Add listeners
    chatController.chatController.addListener(_onTextChanged);
    _quillController.addListener(_onQuillTextChanged);

    _isInitialized = true;
  }

  @override
  void dispose() {
    chatController.chatController.removeListener(_onTextChanged);
    _quillController.removeListener(_onQuillTextChanged);
    _quillController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final text = chatController.chatController.text.trim();
    final isComposing = text.isNotEmpty;

    if (_isComposing != isComposing) {
      setState(() {
        _isComposing = isComposing;
      });
    }
  }

  void _onQuillTextChanged() {
    final text = _quillController.document.toPlainText().trim();
    final isComposing = text.isNotEmpty;

    if (_isComposing != isComposing) {
      setState(() {
        _isComposing = isComposing;
      });
    }
  }

  // bool get showEditor => chatController.showRichTextEditor.value;

  bool get isDisabled =>
      !widget.enabled || chatController.isSendingMessage.value;

  void _cleanupEditMode() {
    chatController.chatController.clear();
    _quillController.clear();
  }

  Future<void> sendMessageWithFormatting() async {
  if (isDisabled) return;

  String messageText;

  if (showEditor) {
    final delta = _quillController.document.toDelta();
    messageText = _quillController.document.toPlainText().trim();
    
    if (messageText.isEmpty) return;

    // Check if we're in edit mode
    if (chatController.isEditMode.value) {
      // Update existing message
      await chatController.updateGoalsAnswer(messageText);
    } else {
      // Send new message with formatting
      await chatController.sendMessageWithFormatting(
        text: messageText,
        delta: delta,
      );
    }

    _quillController.clear();
  } else {
    messageText = chatController.chatController.text.trim();
    if (messageText.isEmpty) return;

    if (chatController.isEditMode.value) {
      await chatController.updateGoalsAnswer(messageText);
    } else {
      if (widget.onSend != null) {
        widget.onSend!(messageText);
      } else {
        await chatController.sendGoalsMessage(text: messageText);
      }
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isEditMode = chatController.isEditMode.value;

      return Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isEditMode
              ? AppColors.bgBorder.withOpacity(0.9)
              : AppColors.bgBorder,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          border: isEditMode
              ? Border.all(color: AppColors.primary500, width: 1.5)
              : null,
        ),
        child: Column(
          children: [
            if (isEditMode)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  'Editing message...',
                  style: AppTextStyles.textCaptionC2.copyWith(
                    color: AppColors.primary500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            if (showEditor)
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textColor100,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: quill.QuillEditor.basic(
                    focusNode: _focusNode,
                    controller: _quillController,
                    configurations: quill.QuillEditorConfigurations(
                      minHeight: 50,
                      placeholder:
                          isEditMode ? 'Edit your message...' : 'Message...',
                    ),
                  ),
                ),
              )
            else
              TextField(
                focusNode: _focusNode,
                onTap: () async {
                  await Future.delayed(const Duration(milliseconds: 500));
                  chatController.scrollToBottom();
                },
                controller: chatController.chatController,
                decoration: InputDecoration(
                  hintText: isEditMode ? 'Edit your message...' : 'Message...',
                  hintStyle: AppTextStyles.textBodyB2
                      .copyWith(color: AppColors.textColor200),
                  border: InputBorder.none,
                ),
                style: const TextStyle(color: Colors.white),
                maxLines: null,
                textInputAction: TextInputAction.newline,
              ),
            Row(
              children: [
                if (showEditor)
                  Expanded(
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        iconTheme: const IconThemeData(
                          color: Colors.white,
                        ),
                        buttonTheme: const ButtonThemeData(
                          buttonColor: Colors.white,
                        ),
                      ),
                      child: quill.QuillSimpleToolbar(
                        controller: _quillController,
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
                  ),
                const HorizontalSpacing(8),
                const HorizontalSpacing(8),
                if (isEditMode)
                  InkWell(
                    onTap: () {
                      chatController.resetEditMode();
                      _cleanupEditMode();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppColors.bgBorder,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: AppColors.textColor300,
                        size: 20,
                      ),
                    ),
                  ),
                const HorizontalSpacing(8),
                InkWell(
                  onTap: isDisabled ? null : sendMessageWithFormatting,
                  child:
                      Assets.images.sendMessageIcon.svg(width: 40, height: 40),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
