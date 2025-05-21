import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/presentation/controllers/reflection_journal_chat_controller.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill/quill_delta.dart' as quill;

class AmPmChatInputField extends StatefulWidget {
  const AmPmChatInputField({
    required this.focusNode,
    required this.reflectionId,
    this.mainQuestionId,
    this.followupQuestionId,
    this.onMessageSent,
    this.isDisabled = false,
    super.key,
  });

  final FocusNode focusNode;
  final String reflectionId;
  final String? mainQuestionId;
  final String? followupQuestionId;
  final VoidCallback? onMessageSent;
  final bool isDisabled;

  @override
  State<AmPmChatInputField> createState() => _AmPmChatInputFieldState();
}

class _AmPmChatInputFieldState extends State<AmPmChatInputField> {
  final controller = Get.find<ReflectionJournalChatController>();
  bool isEditing = false;
  final quill.QuillController _controller = quill.QuillController.basic();
  bool showEditor = true;
  late FocusNode _focusNode;
  bool _contentChanged = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode;
    // Initialize with proper configuration
    _updateEditState();
    _initializeWithEditingText();
    controller.addListener(_handleControllerChanges);

    // Track content changes
    _controller.addListener(() {
      if (mounted) {
        setState(() {
          _contentChanged = true;
        });
      }
    });

    // Debug focus issues
    _focusNode.addListener(() {
      print('FocusNode has focus: ${_focusNode.hasFocus}');
      if (!_focusNode.hasFocus) {
        // Re-request focus if lost unexpectedly
        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted && showEditor) {
            _focusNode.requestFocus();
          }
        });
      }
    });

    // Request focus after build is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && showEditor) {
        print('Requesting focus in initState');
        _focusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    controller.removeListener(_handleControllerChanges);
    _controller.dispose(); // Important: dispose the QuillController
    super.dispose();
  }

  void _handleControllerChanges() {
    if (mounted) {
      _updateEditState();

      // Only initialize with text if we're entering edit mode
      if (controller.isEditMode.value && !isEditing) {
        _initializeWithEditingText();
      }

      // Request focus after content change, but not during regular typing
      if (controller.isEditMode.value && !_contentChanged) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _focusNode.requestFocus();
          }
        });
      }
    }
  }

  void _updateEditState() {
    setState(() {
      isEditing = controller.isEditMode.value;
    });
  }

  void _initializeWithEditingText() {
    if (controller.isEditMode.value &&
        controller.chatController.text.isNotEmpty) {
      final htmlText = controller.chatController.text;
      final plainText = htmlText.replaceAll(RegExp('<[^>]*>'), '');

      final newDelta = quill.Delta()..insert(plainText);
      if (!plainText.endsWith('\n')) {
        newDelta.insert('\n');
      }

      final currentDelta = _controller.document.toDelta();
      if (currentDelta != newDelta) {
        setState(() {
          _controller.document = quill.Document.fromDelta(newDelta);
          _contentChanged = false;
        });

        print('Initialized document: ${_controller.document.toDelta()}');

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _focusNode.requestFocus();
          }
        });
      }
    }
  }

  String getFormattedHtml() {
    final document = _controller.document;
    // Create an HTML representation of the Quill document
    var html = '';
    // Process each operation in the Delta
    for (final op in document.toDelta().operations) {
      if (op.data is String) {
        var text = op.data! as String;
        if (text == '\n') continue; // Skip standalone newlines

        var attributes = op.attributes;
        if (attributes == null || attributes.isEmpty) {
          html += text;
        } else {
          // Start with the raw text
          var formattedText = text;
          // Apply formatting based on attributes
          if (attributes.containsKey('bold') && attributes['bold'] == true) {
            formattedText = '<strong>$formattedText</strong>';
          }
          if (attributes.containsKey('italic') &&
              attributes['italic'] == true) {
            formattedText = '<em>$formattedText</em>';
          }
          if (attributes.containsKey('underline') &&
              attributes['underline'] == true) {
            formattedText = '<u>$formattedText</u>';
          }
          if (attributes.containsKey('strike') &&
              attributes['strike'] == true) {
            formattedText = '<s>$formattedText</s>';
          }
          if (attributes.containsKey('code') && attributes['code'] == true) {
            formattedText = '<code>$formattedText</code>';
          }
          html += formattedText;
        }
      }
    }
    return html;
  }

  void sendMessageWithFormatting() {
    print('isDisabled: ${widget.isDisabled}');
    if (widget.isDisabled) return;

    final htmlContent = getFormattedHtml();
    if (htmlContent.trim().isNotEmpty) {
      if (controller.isEditMode.value) {
        // We're in edit mode, update the existing message
        controller
            .updateMessage(
          htmlContent,
        )
            .then((_) {
          // Reset edit mode after successful update
          controller.resetEditMode();
          // Reset quill editor
          _controller.clear();
          setState(() {
            _contentChanged = false;
          });
          // Call onMessageSent callback if provided
          widget.onMessageSent?.call();
        });
      } else {
        // Normal sending mode, create a new message
        controller
            .sendMessage(
          widget.reflectionId,
          null,
          htmlContent,
          widget.mainQuestionId,
          widget.followupQuestionId,
        )
            .then((_) {
          setState(() {
            _contentChanged = false;
          });
          // Call onMessageSent callback if provided
          widget.onMessageSent?.call();
        });
      }
      // Clear the editor
      setState(() {
        _controller.clear();
      });
    }
  }

  @override
  void didUpdateWidget(AmPmChatInputField oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update focus node if it changed
    if (widget.focusNode != oldWidget.focusNode) {
      _focusNode = widget.focusNode;
    }

    _updateEditState();

    // Only reinitialize if editing status changed
    if (isEditing != oldWidget.key) {
      _initializeWithEditingText();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isEditing
            ? AppColors.bgBorder.withOpacity(0.9)
            : AppColors.bgBorder,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        border: isEditing
            ? Border.all(color: AppColors.primary500, width: 1.5)
            : null,
      ),
      child: Column(
        children: [
          if (isEditing)
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
                fontSize: 16,
                color: AppColors.textColor100,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: quill.QuillEditor.basic(
                  focusNode: _focusNode,
                  controller: _controller,
                  configurations: quill.QuillEditorConfigurations(
                    minHeight: 50,
                    maxHeight: 120,
                    placeholder:
                        isEditing ? 'Edit your message...' : 'Message...',
                    // readOnly: false, // Explicitly set to false
                    showCursor: true,
                    padding: const EdgeInsets.all(4),
                    autoFocus: true,
                  ),
                ),
              ),
            ),
          Row(
            children: [
              if (showEditor)
                Expanded(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      iconTheme: const IconThemeData(
                        color: Colors.white,
                        size: 22, // Slightly larger icons
                      ),
                      buttonTheme: const ButtonThemeData(
                        buttonColor: Colors.white,
                      ),
                    ),
                    child: quill.QuillSimpleToolbar(
                      controller: _controller,
                      configurations:
                          const quill.QuillSimpleToolbarConfigurations(
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
              const SizedBox(width: 8),
              Row(
                children: [
                  if (isEditing)
                    InkWell(
                      onTap: () {
                        // Cancel editing
                        controller.resetEditMode();
                        _controller.clear();
                        setState(() {
                          _contentChanged = false;
                        });
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
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: widget.isDisabled ? null : sendMessageWithFormatting,
                    child: Assets.images.sendMessageIcon
                        .svg(width: 40, height: 40),
                  ),
                ],
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
          InkWell(
            onTap: () {
              setState(() {
                showEditor = true;
                // Request focus when showing editor
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    _focusNode.requestFocus();
                  }
                });
              });
            },
            child: Assets.images.chatText.image(width: 20),
          ),
          const SizedBox(width: 20),
          const Spacer(),
        ],
      ),
    );
  }
}

// Note: Make sure you have the Tuple2 class available, either import it or
// add this class if needed:
class Tuple2<T1, T2> {
  const Tuple2(this.item1, this.item2);
  final T1 item1;
  final T2 item2;
}
