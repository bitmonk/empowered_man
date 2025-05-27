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
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode;
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

    _focusNode.addListener(() {
      print('FocusNode has focus: ${_focusNode.hasFocus}');
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && showEditor && isEditing) {
        print('Requesting focus in initState');
        _focusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    controller.removeListener(_handleControllerChanges);
    _controller.dispose();
    super.dispose();
  }

  void _handleControllerChanges() {
    if (mounted) {
      final wasEditing = isEditing;
      _updateEditState();

      if (controller.isEditMode.value && !wasEditing) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _initializeWithEditingText();
            _isInitialized = true;
            _focusNode.requestFocus();
          }
        });
      }

      if (!controller.isEditMode.value && wasEditing) {
        _isInitialized = false;
      }
    }
  }

  void _updateEditState() {
    setState(() {
      isEditing = controller.isEditMode.value;
      if (isEditing) {
        showEditor = true;
      }
    });
  }

  void _initializeWithEditingText() {
    if (controller.isEditMode.value &&
        controller.chatController.text.isNotEmpty) {
      final htmlText = controller.chatController.text;

      print('Initializing with HTML: $htmlText'); // Debug print

      final newDelta = _convertHtmlToQuillDelta(htmlText);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _controller.document = quill.Document.fromDelta(newDelta);
            _contentChanged = false;
          });

          _controller.moveCursorToEnd();

          print(
              'Document updated with formatting: ${_controller.document.toPlainText()}',);
        }
      });
    }
  }

  quill.Delta _convertHtmlToQuillDelta(String html) {
    final delta = quill.Delta();

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

    return delta;
  }

  String getFormattedHtml() {
    final document = _controller.document;
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

  void sendMessageWithFormatting() {
    print('isDisabled: ${widget.isDisabled}');
    if (widget.isDisabled) return;

    final htmlContent = getFormattedHtml();
    if (htmlContent.trim().isNotEmpty) {
      if (controller.isEditMode.value) {
        controller.updateMessage(htmlContent).then((_) {
          controller.resetEditMode();
          _controller.clear();
          setState(() {
            _contentChanged = false;
            _isInitialized = false;
          });
          widget.onMessageSent?.call();
        });
      } else {
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
          widget.onMessageSent?.call();
        });
      }
      setState(() {
        _controller.clear();
      });
    }
  }

  @override
  void didUpdateWidget(AmPmChatInputField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.focusNode != oldWidget.focusNode) {
      _focusNode = widget.focusNode;
    }

    final wasEditing = isEditing;
    _updateEditState();

    if (controller.isEditMode.value && !wasEditing) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _initializeWithEditingText();
          _isInitialized = true;
        }
      });
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
                    showCursor: true,
                    padding: const EdgeInsets.all(4),
                    
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
                        size: 22,
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
                        controller.resetEditMode();
                        _controller.clear();
                        setState(() {
                          _contentChanged = false;
                          _isInitialized = false;
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
              });
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  _focusNode.requestFocus();
                }
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
