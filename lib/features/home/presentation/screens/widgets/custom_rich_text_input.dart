import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/presentation/controllers/reflection_journal_chat_controller.dart';

class CustomRichTextInput extends StatefulWidget {
  const CustomRichTextInput({
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
  State<CustomRichTextInput> createState() => _CustomRichTextInputState();
}

class _CustomRichTextInputState extends State<CustomRichTextInput> {
  final controller = Get.find<ReflectionJournalChatController>();
  // TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool isEditing = false;
  bool _contentChanged = false;
  bool showEditor = true;
  late FocusNode _focusNode;

  // Format tracking
  bool _isBold = false;
  bool _isItalic = false;
  bool _isUnderline = false;
  bool _isStrikethrough = false;
  bool _isCode = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode;
    _focusNode.addListener(_handleFocusChange);
    controller.addListener(_handleControllerChanges);
    if (controller.isEditMode.value) {
      _initializeWithEditingText();
    }
    // Request focus after build is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && showEditor) {
        _focusNode.requestFocus();
      }
    });
  }

  void _handleFocusChange() {
    // Only log focus changes but don't force refocus
    if (!_focusNode.hasFocus) {
      debugPrint('Focus lost');
    } else {
      debugPrint('Focus gained');
    }
  }

  @override
  void dispose() {
    controller.removeListener(_handleControllerChanges);
    // _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleControllerChanges() {
    if (mounted) {
      setState(() {
        var wasEditingBefore = isEditing;
      });
      // bool wasEditingBefore = isEditing;
      _updateEditState();

      // Only initialize with text if we're entering edit mode and the text field is empty
      if (controller.isEditMode.value && !isEditing) {
        _initializeWithEditingText();
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

      setState(() {
        //  _textController.text = plainText;
        _contentChanged = false;
        showEditor = true;
      });
    }
  }

  String getFormattedHtml() {
    final text = controller.chatController.text;
    if (text.isEmpty) return '';

    // We'll implement a simple parser that tracks formats applied
    var html = text;

    // Apply formatting in the correct order
    if (_isBold) {
      html = '<strong>$html</strong>';
    }

    if (_isItalic) {
      html = '<em>$html</em>';
    }

    if (_isUnderline) {
      html = '<u>$html</u>';
    }

    if (_isStrikethrough) {
      html = '<s>$html</s>';
    }

    if (_isCode) {
      html = '<code>$html</code>';
    }

    return html;
  }

  void sendMessageWithFormatting() {
    debugPrint('Sending message. isDisabled: ${widget.isDisabled}');
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
          // Reset editor
          controller.chatController.clear();
          setState(() {
            _contentChanged = false;
            _resetFormatting();
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
          controller.chatController.clear();
          setState(() {
            _contentChanged = false;
            _resetFormatting();
          });
          // Call onMessageSent callback if provided
          widget.onMessageSent?.call();
        });
      }
    }
  }

  void _resetFormatting() {
    _isBold = false;
    _isItalic = false;
    _isUnderline = false;
    _isStrikethrough = false;
    _isCode = false;
  }

  void _toggleBold() {
    setState(() {
      _isBold = !_isBold;
    });
    _focusNode.requestFocus();
  }

  void _toggleItalic() {
    setState(() {
      _isItalic = !_isItalic;
    });
    _focusNode.requestFocus();
  }

  void _toggleUnderline() {
    setState(() {
      _isUnderline = !_isUnderline;
    });
    _focusNode.requestFocus();
  }

  void _toggleStrikethrough() {
    setState(() {
      _isStrikethrough = !_isStrikethrough;
    });
    _focusNode.requestFocus();
  }

  void _toggleCode() {
    setState(() {
      _isCode = !_isCode;
    });
    _focusNode.requestFocus();
  }

  @override
  void didUpdateWidget(CustomRichTextInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update focus node if it changed
    if (widget.focusNode != oldWidget.focusNode) {
      _focusNode = widget.focusNode;
    }

    _updateEditState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: controller.isEditMode.value
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
            Container(
              constraints: const BoxConstraints(
                minHeight: 50,
                maxHeight: 120,
              ),
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: controller.chatController,
                focusNode: _focusNode,
                minLines: 1,
                maxLines: null,
                textAlignVertical: TextAlignVertical.top,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColor100,
                  fontWeight: _isBold ? FontWeight.bold : FontWeight.normal,
                  fontStyle: _isItalic ? FontStyle.italic : FontStyle.normal,
                  decoration: _getTextDecoration(),
                ),
                decoration: InputDecoration(
                  hintText: isEditing ? 'Edit your message...' : 'Message...',
                  hintStyle: const TextStyle(
                    color: AppColors.textColor300,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(4),
                  isDense: true,
                ),
                onChanged: (value) {
                  setState(() {
                    _contentChanged = true;
                  });
                  debugPrint('Text changed: $value');
                },
                onTap: () {
                  // setState(() {
                  //   _currentSelection = _textController.selection;
                  // });
                },
              ),
            ),
          Row(
            children: [
              if (showEditor)
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildToolbarButton(
                          Icons.format_bold,
                          _isBold,
                          _toggleBold,
                        ),
                        _buildToolbarButton(
                          Icons.format_italic,
                          _isItalic,
                          _toggleItalic,
                        ),
                        _buildToolbarButton(
                          Icons.format_underlined,
                          _isUnderline,
                          _toggleUnderline,
                        ),
                        _buildToolbarButton(
                          Icons.format_strikethrough,
                          _isStrikethrough,
                          _toggleStrikethrough,
                        ),
                        _buildToolbarButton(
                          Icons.code,
                          _isCode,
                          _toggleCode,
                        ),
                      ],
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
                        controller.chatController.clear();
                        // _textController.clear();
                        setState(() {
                          _contentChanged = false;
                          _resetFormatting();
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

  TextDecoration _getTextDecoration() {
    if (_isUnderline && _isStrikethrough) {
      return TextDecoration.combine([
        TextDecoration.underline,
        TextDecoration.lineThrough,
      ]);
    } else if (_isUnderline) {
      return TextDecoration.underline;
    } else if (_isStrikethrough) {
      return TextDecoration.lineThrough;
    }
    return TextDecoration.none;
  }

  Widget _buildToolbarButton(
    IconData icon,
    bool isSelected,
    VoidCallback onPressed,
  ) {
    return IconButton(
      icon: Icon(
        icon,
        color: isSelected ? AppColors.primary500 : Colors.white,
        size: 22,
      ),
      onPressed: onPressed,
      splashRadius: 20,
      constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
      padding: EdgeInsets.zero,
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

// class CustomQuillInputField extends StatefulWidget {
//   const CustomQuillInputField({
//     required this.focusNode,
//     required this.reflectionId,
//     this.mainQuestionId,
//     this.followupQuestionId,
//     this.onMessageSent,
//     this.isDisabled = false,
//     super.key,
//   });

//   final FocusNode focusNode;
//   final String reflectionId;
//   final String? mainQuestionId;
//   final String? followupQuestionId;
//   final VoidCallback? onMessageSent;
//   final bool isDisabled;

//   @override
//   State<CustomQuillInputField> createState() => _CustomQuillInputFieldState();
// }

// class _CustomQuillInputFieldState extends State<CustomQuillInputField> {
//   final controller = Get.find<ReflectionJournalChatController>();
//   late quill.QuillController _quillController;
//   bool isEditing = false;
//   bool showEditor = true;
//   bool _contentChanged = false;

//   @override
//   void initState() {
//     super.initState();
//     _quillController = quill.QuillController.basic();

//     // Listen for edit mode changes in your controller
//     controller.addListener(_handleControllerChanges);

//     // Listen for content changes
//     _quillController.document.changes.listen((event) {
//       if (!_contentChanged) {
//         setState(() {
//           _contentChanged = true;
//         });
//       }
//     });

//     // If in edit mode at start, load editing text
//     if (controller.isEditMode.value) {
//       _initializeWithEditingText();
//     }

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (mounted && showEditor) {
//         widget.focusNode.requestFocus();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     controller.removeListener(_handleControllerChanges);
//     _quillController.dispose();
//     super.dispose();
//   }

//   void _handleControllerChanges() {
//     if (!mounted) return;
//     setState(() {
//       isEditing = controller.isEditMode.value;
//     });
//     if (controller.isEditMode.value && !isEditing) {
//       _initializeWithEditingText();
//     }
//   }

//   void _initializeWithEditingText() {
//     final htmlText = controller.chatController.text;
//     if (htmlText.isNotEmpty) {
//       // Optionally, you can implement a custom HTML-to-Delta converter
//       // For now, treat as plain text
//       final plainText = htmlText.replaceAll(RegExp('<[^>]*>'), '');
//       final delta = quill.Delta()..insert(plainText + '\n');
//       setState(() {
//         _quillController = quill.QuillController(
//           document: quill.Document.fromDelta(delta),
//           selection: const TextSelection.collapsed(offset: 0),
//         );
//         _contentChanged = false;
//         showEditor = true;
//       });
//     }
//   }

//   String getFormattedHtml() {
//     // If you need real HTML export, use a proper converter like quill_html
//     // For simplicity, this only returns plain text
//     // You can use document.toDelta().toJson() or implement custom mapping
//     return _quillController.document.toPlainText().trim();
//   }

//   void sendMessageWithFormatting() {
//     if (widget.isDisabled) return;
//     final htmlContent = getFormattedHtml();
//     if (htmlContent.isEmpty) return;

//     if (controller.isEditMode.value) {
//       controller.updateMessage(htmlContent).then((_) {
//         controller.resetEditMode();
//         _quillController.clear();
//         setState(() {
//           _contentChanged = false;
//         });
//         widget.onMessageSent?.call();
//       });
//     } else {
//       controller
//           .sendMessage(
//         widget.reflectionId,
//         null,
//         htmlContent,
//         widget.mainQuestionId,
//         widget.followupQuestionId,
//       )
//           .then((_) {
//         _quillController.clear();
//         setState(() {
//           _contentChanged = false;
//         });
//         widget.onMessageSent?.call();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(12),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: controller.isEditMode.value
//             ? AppColors.bgBorder.withOpacity(0.9)
//             : AppColors.bgBorder,
//         borderRadius: const BorderRadius.all(Radius.circular(24)),
//         border: isEditing
//             ? Border.all(color: AppColors.primary500, width: 1.5)
//             : null,
//       ),
//       child: Column(
//         children: [
//           if (isEditing)
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 4),
//               child: Text(
//                 'Editing message...',
//                 style: AppTextStyles.textCaptionC2.copyWith(
//                   color: AppColors.primary500,
//                   fontStyle: FontStyle.italic,
//                 ),
//               ),
//             ),
//           if (showEditor)
//             Container(
//               constraints: const BoxConstraints(
//                 minHeight: 50,
//                 maxHeight: 120,
//               ),
//               padding: const EdgeInsets.all(8),
//               child: quill.QuillEditor.basic(
//                 controller: _quillController,
//                 focusNode: widget.focusNode,
//                 configurations: quill.QuillEditorConfigurations(
//                   minHeight: 50,
//                   maxHeight: 120,
//                   placeholder:
//                       isEditing ? 'Edit your message...' : 'Message...',
//                   // readOnly: false,
//                   expands: false,
//                   autoFocus: true,
//                   padding: const EdgeInsets.all(4),
//                   showCursor: true,
//                 ),
//               ),
//             ),
//           Row(
//             children: [
//               if (showEditor)
//                 Expanded(
//                   child: Theme(
//                     data: Theme.of(context).copyWith(
//                       iconTheme: const IconThemeData(
//                         color: Colors.white,
//                         size: 22,
//                       ),
//                       buttonTheme: const ButtonThemeData(
//                         buttonColor: Colors.white,
//                       ),
//                     ),
//                     child: quill.QuillSimpleToolbar(
//                       controller: _quillController,
//                       configurations:
//                           const quill.QuillSimpleToolbarConfigurations(
//                         toolbarSectionSpacing: 4,
//                         showJustifyAlignment: false,
//                         showListBullets: false,
//                         showCenterAlignment: false,
//                         showClearFormat: false,
//                         showFontFamily: false,
//                         showFontSize: false,
//                         showBackgroundColorButton: false,
//                         showColorButton: false,
//                         showHeaderStyle: false,
//                         showLink: false,
//                         showUndo: false,
//                         showRedo: false,
//                         showListCheck: false,
//                         showIndent: false,
//                         showSubscript: false,
//                         showSuperscript: false,
//                         showSearchButton: false,
//                         showClipboardCut: false,
//                         showClipboardCopy: false,
//                         showClipboardPaste: false,
//                         multiRowsDisplay: false,
//                         color: AppColors.transparent,
//                       ),
//                     ),
//                   ),
//                 ),
//               const SizedBox(width: 8),
//               Row(
//                 children: [
//                   if (isEditing)
//                     InkWell(
//                       onTap: () {
//                         controller.resetEditMode();
//                         _quillController.clear();
//                         setState(() {
//                           _contentChanged = false;
//                         });
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: const BoxDecoration(
//                           color: AppColors.bgBorder,
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.close,
//                           color: AppColors.textColor300,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                   const SizedBox(width: 8),
//                   InkWell(
//                     onTap: widget.isDisabled ? null : sendMessageWithFormatting,
//                     child: Assets.images.sendMessageIcon
//                         .svg(width: 40, height: 40),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
