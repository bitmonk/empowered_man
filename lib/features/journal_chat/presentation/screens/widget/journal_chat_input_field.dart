import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill/quill_delta.dart' as quill;

class JournalChatInputField extends StatefulWidget {
  const JournalChatInputField({
    required this.focusNode,
    required this.journalId,
    this.mainQuestionId,
    this.followupQuestionId,
    this.onMessageSent,
    this.isDisabled = false,
    super.key,
  });
  final FocusNode focusNode;
  final String journalId;
  final String? mainQuestionId;
  final String? followupQuestionId;
  final VoidCallback? onMessageSent;
  final bool isDisabled;

  @override
  State<JournalChatInputField> createState() => _JournalChatInputFieldState();
}

class _JournalChatInputFieldState extends State<JournalChatInputField> {
  final chatController = Get.find<JournalChatController>();
  late quill.QuillController _controller;
  bool showEditor = true;
  bool _contentChanged = false;
  late FocusNode _focusNode;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode;
    _controller = quill.QuillController.basic();

    // Initialize listeners
    chatController.addListener(_handleControllerChanges);

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

    // Initialize on first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeIfNeeded();
    });
  }

  @override
  void dispose() {
    chatController.removeListener(_handleControllerChanges);
    _controller.dispose();
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

    final textToEdit = chatController.chatController.text;

    if (textToEdit.isNotEmpty) {
      // Convert HTML/text to QuillDelta
      final delta = _convertHtmlToQuillDelta(textToEdit);

      // Create new document with the delta
      final newDocument = quill.Document.fromDelta(delta);

      // Update controller
      _controller.document = newDocument;

      // Move cursor to end after a short delay
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted && _isInitialized) {
          _controller.moveCursorToEnd();
          _focusNode.requestFocus();
       
        }
      });
    }

    _isInitialized = true;
    showEditor = true;
    setState(() {});
  }

  void _cleanupEditMode() {
    _isInitialized = false;
    _controller.clear();
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

      _controller.clear();
      setState(() {
        _contentChanged = false;
      });

      // Let the controller handle the message sending using existing method
      chatController.handleTextMessageSent().then((_) {
        widget.onMessageSent?.call();
      });
    }
  }

  @override
  void didUpdateWidget(JournalChatInputField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.focusNode != oldWidget.focusNode) {
      _focusNode = widget.focusNode;
    }

    // Check if we need to initialize edit mode
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeIfNeeded();
    });
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
                    controller: _controller,
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
