import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/presentation/controllers/goals_chat_controller.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill/quill_delta.dart' as quill;

class GoalsChatInputField extends StatefulWidget {
  const GoalsChatInputField({
    required this.focusNode,
    required this.goalId,
    super.key,
    this.enabled = true,
    this.isEditMode = false,
    this.onMessageSent,    this.isDisabled = false,
    this.onCancel,
  });

  final FocusNode focusNode;
  final String goalId;
  final bool enabled;
  final bool isEditMode;
  final VoidCallback? onMessageSent;
  final VoidCallback? onCancel;  final bool isDisabled;


  @override
  State<GoalsChatInputField> createState() => _GoalsChatInputFieldState();
}

class _GoalsChatInputFieldState extends State<GoalsChatInputField> {
  late GoalsChatController chatController;
  late FocusNode _focusNode;
  late quill.QuillController _quillController;
  bool showEditor = true;
  bool _contentChanged = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    chatController = Get.find<GoalsChatController>();
    _focusNode = widget.focusNode;

    // Initialize Quill controller
    _quillController = quill.QuillController.basic();

    // Add listeners
    chatController.addListener(_handleControllerChanges);
    _quillController.addListener(() {
      if (mounted) {
        setState(() {
          _contentChanged = true;
        });
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeIfNeeded();
    });
  }
 @override
  void dispose() {
    chatController.removeListener(_handleControllerChanges);
    _quillController.dispose();
    super.dispose();
  }
  void _handleControllerChanges() {
    if (!mounted) return;

    // final wasEditing = _isInitialized && chatController.isEditMode.value;
    final isNowEditing = chatController.isEditMode.value;

    if (isNowEditing && !_isInitialized) {
      _initializeEditMode();
    } else if (!isNowEditing && _isInitialized) {
      _cleanupEditMode();
    }

    // Always update the UI
    setState(() {});
  }

  void _initializeIfNeeded() {
    if (chatController.isEditMode.value && !_isInitialized) {
      _initializeEditMode();
    }
  }

  void _initializeEditMode() {
    if (_isInitialized) return;

    var textToEdit = chatController.initialEditText.value ??
        chatController.chatController.text;

    if (textToEdit.isNotEmpty) {
      final delta = _convertHtmlToQuillDelta(textToEdit);

      final newDocument = quill.Document.fromDelta(delta);

      _quillController.document = newDocument;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _isInitialized) {
          _quillController.moveCursorToEnd();
          _focusNode.requestFocus();

          setState(() {
            _contentChanged = true;
          });
        }
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _focusNode.requestFocus();
        }
      });
    }

    _isInitialized = true;
    showEditor = true;

    if (mounted) {
      setState(() {});
    }
  }

// // Method to manually set text for editing
//   void setInitialEditText(String text) {
//     if (text.isNotEmpty) {
//       chatController.chatController.text = text;

//       if (_isInitialized) {
//         // If already initialized, update immediately
//         final delta = _convertHtmlToQuillDelta(text);
//         final newDocument = quill.Document.fromDelta(delta);
//         _quillController.document = newDocument;

//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           if (mounted) {
//             _quillController.moveCursorToEnd();
//             _focusNode.requestFocus();
//             setState(() {
//               _contentChanged = true;
//             });
//           }
//         });
//       }
//     }
//   }

//   @override
//   void dispose() {
//     chatController.chatController.removeListener(_onTextChanged);
//     _quillController.removeListener(_onQuillTextChanged);
//     _quillController.dispose();
//     super.dispose();
//   }

//   void _onTextChanged() {
//     final text = chatController.chatController.text.trim();
//     final isComposing = text.isNotEmpty;

//     if (_isComposing != isComposing) {
//       setState(() {
//         _isComposing = isComposing;
//       });
//     }
//   }

//   void _onQuillTextChanged() {
//     final text = _quillController.document.toPlainText().trim();
//     final isComposing = text.isNotEmpty;

//     if (_isComposing != isComposing) {
//       setState(() {
//         _isComposing = isComposing;
//       });
//     }
//   }

//   // bool get showEditor => chatController.showRichTextEditor.value;

//   bool get isDisabled =>
//       !widget.enabled || chatController.isSendingMessage.value;



  Future<void> sendMessageWithFormatting() async {
   // if (isDisabled) return;
   if (widget.isDisabled) return;
    final htmlContent = getFormattedHtml();
    if (htmlContent.trim().isEmpty) return;

    if (chatController.isEditMode.value) {
      // Handle edit mode
      chatController.updateMessage(htmlContent).then((_) {
        chatController.resetEditMode();
        _cleanupEditMode();
        widget.onMessageSent?.call();
      });
    } else {
      chatController.chatController.text = htmlContent;

      _quillController.clear();
      setState(() {
        _contentChanged = false;
      });

      // Let the controller handle the message sending using existing method
      chatController.handleTextMessageSent().then((_) {
        widget.onMessageSent?.call();
      });
    }
    // String messageText;

    // if (showEditor) {
    //   final delta = _quillController.document.toDelta();
    //   messageText = _quillController.document.toPlainText().trim();

    //   if (messageText.isEmpty) return;

    //   // Check if we're in edit mode
    //   if (chatController.isEditMode.value) {
    //     // Update existing message
    //     await chatController.updateGoalsAnswer(messageText);
    //   } else {
    //     // Send new message with formatting
    //     await chatController.sendMessageWithFormatting(
    //       text: messageText,
    //       delta: delta,
    //     );
    //   }

    //   _quillController.clear();
    // } else {
    //   messageText = chatController.chatController.text.trim();
    //   if (messageText.isEmpty) return;

    //   if (chatController.isEditMode.value) {
    //     await chatController.updateGoalsAnswer(messageText);
    //   } else {
    //     if (widget.onSend != null) {
    //       widget.onSend!(messageText);
    //     } else {
    //       await chatController.sendGoalsMessage(text: messageText);
    //     }
    //   }
    // }
  }

  void _cleanupEditMode() {
    _isInitialized = false;
    _quillController.clear();
    _contentChanged = false;
    setState(() {});
  }

  quill.Delta _convertHtmlToQuillDelta(String html) {

    final delta = quill.Delta();

    // Handle empty or null input
    if (html.trim().isEmpty) {
      delta.insert('\n');
      return delta;
    }

    if (!html.contains('<') || !html.contains('>')) {
      // Plain text case
      delta.insert(html);
      if (!html.endsWith('\n')) {
        delta.insert('\n');
      }
      print('Plain text delta created');
      return delta;
    }

    // Handle HTML with tags
    final tagPattern = RegExp(r'<(/?)(\w+)[^>]*>');
    final boldStack = <String>[];
    final italicStack = <String>[];
    final underlineStack = <String>[];
    final strikeStack = <String>[];
    final codeStack = <String>[];

    var lastIndex = 0;

    for (final match in tagPattern.allMatches(html)) {
      // Add text before the tag
      if (match.start > lastIndex) {
        final text = html.substring(lastIndex, match.start);
        if (text.isNotEmpty) {
          final attributes = <String, dynamic>{};

          if (boldStack.isNotEmpty) attributes['bold'] = true;
          if (italicStack.isNotEmpty) attributes['italic'] = true;
          if (underlineStack.isNotEmpty) attributes['underline'] = true;
          if (strikeStack.isNotEmpty) attributes['strike'] = true;
          if (codeStack.isNotEmpty) attributes['code'] = true;

          delta.insert(text, attributes.isEmpty ? null : attributes);
        }
      }

      final isClosingTag = match.group(1) == '/';
      final tagName = match.group(2)?.toLowerCase();

      // Handle different HTML tags
      switch (tagName) {
        case 'strong':
        case 'b':
          if (isClosingTag) {
            if (boldStack.isNotEmpty) boldStack.removeLast();
          } else {
            boldStack.add('bold');
          }
        case 'em':
        case 'i':
          if (isClosingTag) {
            if (italicStack.isNotEmpty) italicStack.removeLast();
          } else {
            italicStack.add('italic');
          }
        case 'u':
          if (isClosingTag) {
            if (underlineStack.isNotEmpty) underlineStack.removeLast();
          } else {
            underlineStack.add('underline');
          }
        case 's':
          if (isClosingTag) {
            if (strikeStack.isNotEmpty) strikeStack.removeLast();
          } else {
            strikeStack.add('strike');
          }
        case 'code':
          if (isClosingTag) {
            if (codeStack.isNotEmpty) codeStack.removeLast();
          } else {
            codeStack.add('code');
          }
      }

      lastIndex = match.end;
    }

    // Add remaining text after the last tag
    if (lastIndex < html.length) {
      final text = html.substring(lastIndex);
      if (text.isNotEmpty) {
        final attributes = <String, dynamic>{};

        if (boldStack.isNotEmpty) attributes['bold'] = true;
        if (italicStack.isNotEmpty) attributes['italic'] = true;
        if (underlineStack.isNotEmpty) attributes['underline'] = true;
        if (strikeStack.isNotEmpty) attributes['strike'] = true;
        if (codeStack.isNotEmpty) attributes['code'] = true;

        delta.insert(text, attributes.isEmpty ? null : attributes);
      }
    }

    // Ensure document ends with newline
    final lastOp = delta.operations.isNotEmpty ? delta.operations.last : null;
    if (lastOp?.data is String && !(lastOp!.data! as String).endsWith('\n')) {
      delta.insert('\n');
    } else if (delta.operations.isEmpty) {
      delta.insert('\n');
    }

    print('HTML delta created with ${delta.operations.length} operations');
    return delta;
  }

  String getFormattedHtml() {
    final document = _quillController.document;
    var html = '';
    for (final op in document.toDelta().operations) {
      if (op.data is String) {
        var text = op.data! as String;
        if (text == '\n') continue;

        var attributes = op.attributes;
        if (attributes == null || attributes.isEmpty) {
          html += text;
        } else {
          var formattedText = text;
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
@override
  void didUpdateWidget(GoalsChatInputField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.focusNode != oldWidget.focusNode) {
      _focusNode = widget.focusNode;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeIfNeeded();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isEditMode = chatController.isEditMode.value;

      return Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
                      customStyles: const quill.DefaultStyles(
                        placeHolder: quill.DefaultTextBlockStyle(
                          TextStyle(
                            fontSize: 14,
                            color: AppColors.textColor100,
                          ),
                          quill.HorizontalSpacing(0, 0),
                          quill.VerticalSpacing(5, 5),
                          quill.VerticalSpacing(5, 5),
                          BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
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
                      .copyWith(color: AppColors.textColor200, fontSize: 12),
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
                  onTap: widget.isDisabled ? null : sendMessageWithFormatting,
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
