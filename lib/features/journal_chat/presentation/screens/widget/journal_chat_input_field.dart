// import 'dart:async';

// import 'package:empowered/core/extension/extensions.dart';
// import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
// import 'package:flutter_quill/flutter_quill.dart' as quill;
// import 'package:flutter_quill/quill_delta.dart' as quill;
// import 'package:flutter_quill_delta_from_html/parser/html_to_delta.dart';

// import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

// class JournalChatInputField extends StatefulWidget {
//   const JournalChatInputField({
//     required this.focusNode,
//     required this.journalId,
//     this.mainQuestionId,
//     this.followupQuestionId,
//     this.onMessageSent,
//     super.key,
//   });
//   final FocusNode focusNode;
//   final String journalId;
//   final String? mainQuestionId;
//   final String? followupQuestionId;
//   final VoidCallback? onMessageSent;

//   @override
//   State<JournalChatInputField> createState() => _JournalChatInputFieldState();
// }

// class _JournalChatInputFieldState extends State<JournalChatInputField> {
//   final chatController = Get.find<JournalChatController>();
//   quill.QuillController _controller = quill.QuillController.basic();
//   bool showEditor = true;
//   // bool isEditing = false;
//   bool _contentChanged = false;
//   late FocusNode _focusNode;
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     _focusNode = widget.focusNode;
//     _focusNode.addListener(_handleFocusChange);
//     chatController.addListener(_handleControllerChanges);
//     if (chatController.isEditMode.value) {
//       _initializeWithEditingText();
//     }
//     // Request focus after build is complete
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (mounted && showEditor) {
//         _focusNode.requestFocus();
//       }
//     });
//   }

//   void _handleFocusChange() {
//     // Only log focus changes but don't force refocus
//     if (!_focusNode.hasFocus) {
//       debugPrint('Focus lost');
//     } else {
//       debugPrint('Focus gained');
//     }
//   }

//   @override
//   void dispose() {
//     chatController.removeListener(_handleControllerChanges);
//     // _textController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _handleControllerChanges() {
//     if (mounted) {
//       setState(() {
//         var wasEditingBefore = chatController.isEditMode.value;
//       });
//       // bool wasEditingBefore = isEditing;
//       // _updateEditState();

//       // Only initialize with text if we're entering edit mode and the text field is empty
//       if (chatController.isEditMode.value) {
//         _initializeWithEditingText();
//       }
//     }
//   }

//   // void _updateEditState() {
//   //   setState(() {
//   //     isEditing = chatController.isEditMode.value;
//   //   });
//   // }

//   void _initializeWithEditingText() {
//     if (chatController.isEditMode.value &&
//         chatController.chatController.text.isNotEmpty) {
//       final htmlText = chatController.chatController.text;
//       final plainText = htmlText.replaceAll(RegExp('<[^>]*>'), '');

//       setState(() {
//         //  _textController.text = plainText;
//         _contentChanged = false;
//         showEditor = true;
//       });
//     }
//   }

//   quill.QuillController convertHtmlToQuill(String html) {
//     final delta = HtmlToDelta().convert(html);
//     final document = quill.Document.fromDelta(delta);
//     return quill.QuillController(
//       document: document,
//       selection: const TextSelection.collapsed(offset: 0),
//     );
//   }

//   String getFormattedHtml() {
//     final converter = QuillDeltaToHtmlConverter(
//       _controller.document.toDelta().toJson(),
//       ConverterOptions.forEmail(),
//     );
//     return converter.convert();
//   }

//   void sendMessageWithFormatting() {
//     final htmlContent = getFormattedHtml();
//     if (htmlContent.trim().isNotEmpty) {
//       if (chatController.isEditMode.value) {
//         // We're in edit mode, update the existing message
//         chatController
//             .updateMessage(
//           htmlContent,
//         )
//             .then((_) {
//           chatController.resetEditMode();
//           // Reset editor
//           chatController.chatController.clear();
//           setState(() {
//             _contentChanged = false;
//           });
//           widget.onMessageSent?.call();
//         });
//       } else {
//         chatController
//             .sendMessage(
//           widget.journalId,
//           null,
//           htmlContent,
//           widget.mainQuestionId,
//           widget.followupQuestionId,
//         )
//             .then((_) {
//           _controller = quill.QuillController.basic();
//           chatController.chatController.clear();
//           setState(() {
//             _contentChanged = false;
//           });
//           // Call onMessageSent callback if provided
//           widget.onMessageSent?.call();
//         });
//       }
//     }
//   }

//   @override
//   void didUpdateWidget(JournalChatInputField oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     // Update focus node if it changed
//     if (widget.focusNode != oldWidget.focusNode) {
//       _focusNode = widget.focusNode;
//     }

//     //  _updateEditState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(12),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: chatController.isEditMode.value
//             ? AppColors.bgBorder.withOpacity(0.9)
//             : AppColors.bgBorder,
//         borderRadius: const BorderRadius.all(Radius.circular(24)),
//         border: chatController.isEditMode.value
//             ? Border.all(color: AppColors.primary500, width: 1.5)
//             : null,
//       ),
//       child: Column(
//         children: [
//           if (chatController.isEditMode.value)
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
//             DefaultTextStyle(
//               style: const TextStyle(
//                 fontSize: 12,
//                 color: AppColors.textColor100,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: quill.QuillEditor.basic(
//                   focusNode: widget.focusNode,
//                   controller: _controller,
//                   configurations: quill.QuillEditorConfigurations(
//                     minHeight: showEditor ? 50 : 50,
//                     placeholder: chatController.isEditMode.value
//                         ? 'Edit your message...'
//                         : 'Message...',
//                   ),
//                 ),
//               ),
//             )
//           else
//             TextField(
//               focusNode: widget.focusNode,
//               onTap: () async {
//                 await Future.delayed(const Duration(milliseconds: 500));
//                 chatController.scrollToBottom();
//               },
//               controller: chatController.chatController,
//               decoration: InputDecoration(
//                 hintText: 'Message...',
//                 hintStyle: AppTextStyles.textBodyB2
//                     .copyWith(color: AppColors.textColor200),
//                 border: InputBorder.none,
//               ),
//               style: const TextStyle(color: Colors.white),
//             ),
//           Row(
//             children: [
//               if (showEditor)
//                 Expanded(
//                   child: Theme(
//                     data: Theme.of(context).copyWith(
//                       iconTheme: const IconThemeData(
//                         color: Colors.white,
//                       ), // Set tool icons to white
//                       buttonTheme: const ButtonThemeData(
//                         buttonColor: Colors.white,
//                       ), // For buttons, if applicable
//                     ),
//                     child: quill.QuillSimpleToolbar(
//                       controller: _controller,
//                       configurations:
//                           const quill.QuillSimpleToolbarConfigurations(
//                         toolbarSectionSpacing: 2,
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
//               const HorizontalSpacing(8),
//               if (chatController.isEditMode.value)
//                 InkWell(
//                   onTap: () {
//                     // Cancel editing
//                     chatController.resetEditMode();
//                     chatController.chatController.clear();
//                     // _textController.clear();
//                     setState(() {
//                       _contentChanged = false;
//                       // _resetFormatting();
//                     });
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: const BoxDecoration(
//                       color: AppColors.bgBorder,
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(
//                       Icons.close,
//                       color: AppColors.textColor300,
//                       size: 20,
//                     ),
//                   ),
//                 ),
//               const HorizontalSpacing(8),
//               InkWell(
//                 onTap: sendMessageWithFormatting,
//                 child: Assets.images.sendMessageIcon.svg(width: 40, height: 40),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
