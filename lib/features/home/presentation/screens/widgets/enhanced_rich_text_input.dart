import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:empowered/features/home/presentation/controllers/reflection_journal_chat_controller.dart';
import 'package:empowered/core/extension/extensions.dart';

class TextFormat {
  final bool bold;
  final bool italic;
  final bool underline;
  final bool strikethrough;
  final bool code;

  const TextFormat({
    this.bold = false,
    this.italic = false,
    this.underline = false,
    this.strikethrough = false,
    this.code = false,
  });

  TextFormat copyWith({
    bool? bold,
    bool? italic,
    bool? underline,
    bool? strikethrough,
    bool? code,
  }) {
    return TextFormat(
      bold: bold ?? this.bold,
      italic: italic ?? this.italic,
      underline: underline ?? this.underline,
      strikethrough: strikethrough ?? this.strikethrough,
      code: code ?? this.code,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TextFormat &&
        other.bold == bold &&
        other.italic == italic &&
        other.underline == underline &&
        other.strikethrough == strikethrough &&
        other.code == code;
  }

  @override
  int get hashCode {
    return bold.hashCode ^
        italic.hashCode ^
        underline.hashCode ^
        strikethrough.hashCode ^
        code.hashCode;
  }
}

class EnhancedRichTextInput extends StatefulWidget {
  const EnhancedRichTextInput({
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
  State<EnhancedRichTextInput> createState() => _EnhancedRichTextInputState();
}

class _EnhancedRichTextInputState extends State<EnhancedRichTextInput> {
  final controller = Get.find<ReflectionJournalChatController>();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // State variables
  bool isEditing = false;
  bool _contentChanged = false;
  bool showEditor = true;
  late FocusNode _focusNode;

  // Current active format for new text being typed
  TextFormat _currentFormat = const TextFormat();

  // Store a list of text segments with their formatting
  final List<FormattedTextSegment> _textSegments = [];

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode;
    _updateEditState();
    _initializeWithEditingText();
    controller.addListener(_handleControllerChanges);

    // Track content changes
    _textController.addListener(() {
      if (mounted) {
        setState(() {
          _contentChanged = true;
          _updateTextSegments();
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
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleControllerChanges() {
    if (mounted) {
      _updateEditState();

      // Only initialize with text if we're entering edit mode
      if (controller.isEditMode && !isEditing) {
        _initializeWithEditingText();
      }

      // Request focus after content change, but not during regular typing
      if (controller.isEditMode && !_contentChanged) {
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
      isEditing = controller.isEditMode;
    });
  }

  void _initializeWithEditingText() {
    if (controller.isEditMode && controller.chatController.text.isNotEmpty) {
      final htmlText = controller.chatController.text;
      final plainText = htmlText.replaceAll(RegExp(r'<[^>]*>'), '');

      if (_textController.text != plainText) {
        setState(() {
          _textSegments.clear();
          _textController.text = plainText;
          _textSegments.add(FormattedTextSegment(
              text: plainText, format: const TextFormat()));
          _contentChanged = false;
        });

        print('Initialized text: ${_textController.text}');

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _focusNode.requestFocus();
          }
        });
      }
    }
  }

  void _updateTextSegments() {
    // In a real implementation, you would track formatting changes per segment
    // For simplicity, we'll use a single segment with the current format
    if (_textSegments.isEmpty) {
      _textSegments.add(FormattedTextSegment(
          text: _textController.text, format: _currentFormat));
    } else {
      _textSegments[0] = FormattedTextSegment(
          text: _textController.text, format: _currentFormat);
    }
  }

  String getFormattedHtml() {
    if (_textSegments.isEmpty) return '';

    // Convert text segments to HTML
    final buffer = StringBuffer();

    for (final segment in _textSegments) {
      String text = segment.text;
      final format = segment.format;

      // Apply formatting in the right order (from inside out)
      if (format.code) {
        text = '<code>$text</code>';
      }

      if (format.strikethrough) {
        text = '<s>$text</s>';
      }

      if (format.underline) {
        text = '<u>$text</u>';
      }

      if (format.italic) {
        text = '<em>$text</em>';
      }

      if (format.bold) {
        text = '<strong>$text</strong>';
      }

      buffer.write(text);
    }

    return buffer.toString();
  }

  void sendMessageWithFormatting() {
    print('isDisabled: ${widget.isDisabled}');
    if (widget.isDisabled) return;

    final htmlContent = getFormattedHtml();
    if (htmlContent.trim().isNotEmpty) {
      if (controller.isEditMode && controller.editingAnswerId != null) {
        // We're in edit mode, update the existing message
        controller
            .updateMessage(
          controller.editingAnswerId!,
          htmlContent,
        )
            .then((_) {
          // Reset edit mode after successful update
          controller.resetEditMode();
          // Reset editor
          _textController.clear();
          setState(() {
            _contentChanged = false;
            _resetFormatting();
            _textSegments.clear();
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
        _textController.clear();
        _resetFormatting();
        _textSegments.clear();
      });
    }
  }

  void _resetFormatting() {
    setState(() {
      _currentFormat = const TextFormat();
    });
  }

  void _toggleBold() {
    setState(() {
      _currentFormat = _currentFormat.copyWith(bold: !_currentFormat.bold);
      _updateTextSegments();
    });
  }

  void _toggleItalic() {
    setState(() {
      _currentFormat = _currentFormat.copyWith(italic: !_currentFormat.italic);
      _updateTextSegments();
    });
  }

  void _toggleUnderline() {
    setState(() {
      _currentFormat =
          _currentFormat.copyWith(underline: !_currentFormat.underline);
      _updateTextSegments();
    });
  }

  void _toggleStrikethrough() {
    setState(() {
      _currentFormat =
          _currentFormat.copyWith(strikethrough: !_currentFormat.strikethrough);
      _updateTextSegments();
    });
  }

  void _toggleCode() {
    setState(() {
      _currentFormat = _currentFormat.copyWith(code: !_currentFormat.code);
      _updateTextSegments();
    });
  }

  @override
  void didUpdateWidget(EnhancedRichTextInput oldWidget) {
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
                "Editing message...",
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
              child: _buildRichTextField(),
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
                          _currentFormat.bold,
                          _toggleBold,
                        ),
                        _buildToolbarButton(
                          Icons.format_italic,
                          _currentFormat.italic,
                          _toggleItalic,
                        ),
                        _buildToolbarButton(
                          Icons.format_underlined,
                          _currentFormat.underline,
                          _toggleUnderline,
                        ),
                        _buildToolbarButton(
                          Icons.format_strikethrough,
                          _currentFormat.strikethrough,
                          _toggleStrikethrough,
                        ),
                        _buildToolbarButton(
                          Icons.code,
                          _currentFormat.code,
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
                        _textController.clear();
                        setState(() {
                          _contentChanged = false;
                          _resetFormatting();
                          _textSegments.clear();
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

  Widget _buildRichTextField() {
    return TextField(
      controller: _textController,
      focusNode: _focusNode,
      scrollController: _scrollController,
      maxLines: null,
      style: TextStyle(
        fontSize: 16,
        color: AppColors.textColor100,
        fontWeight: _currentFormat.bold ? FontWeight.bold : FontWeight.normal,
        fontStyle: _currentFormat.italic ? FontStyle.italic : FontStyle.normal,
        decoration: _getTextDecoration(),
        fontFamily: _currentFormat.code ? 'monospace' : null,
        backgroundColor: _currentFormat.code ? Colors.black12 : null,
      ),
      decoration: InputDecoration(
        hintText: isEditing ? 'Edit your message...' : 'Message...',
        hintStyle: const TextStyle(
          color: AppColors.textColor300,
          fontSize: 16,
        ),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.all(4),
      ),
    );
  }

  TextDecoration _getTextDecoration() {
    if (_currentFormat.underline && _currentFormat.strikethrough) {
      return TextDecoration.combine([
        TextDecoration.underline,
        TextDecoration.lineThrough,
      ]);
    } else if (_currentFormat.underline) {
      return TextDecoration.underline;
    } else if (_currentFormat.strikethrough) {
      return TextDecoration.lineThrough;
    }
    return TextDecoration.none;
  }

  Widget _buildToolbarButton(
      IconData icon, bool isSelected, VoidCallback onPressed) {
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

class FormattedTextSegment {
  final String text;
  final TextFormat format;

  FormattedTextSegment({
    required this.text,
    required this.format,
  });

  @override
  String toString() => 'FormattedTextSegment(text: $text, format: $format)';
}
