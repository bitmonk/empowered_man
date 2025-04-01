import 'package:empowered/core/extension/extensions.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class ShareScoreDialog extends StatefulWidget {
  const ShareScoreDialog({super.key});

  @override
  _ShareScoreDialogState createState() => _ShareScoreDialogState();
}

class _ShareScoreDialogState extends State<ShareScoreDialog> {
  final quill.QuillController _controller = quill.QuillController.basic(
    configurations: const quill.QuillControllerConfigurations(
      editorConfigurations:
          quill.QuillEditorConfigurations(minHeight: 150, maxHeight: 300),
    ),
  );
  final FocusNode _focusNode = FocusNode();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.color132534,
        ),
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Share your score',
                style: AppTextStyles.textHeadingH3,
              ),
              const VerticalSpacing(16),
              const AppDivider(
                color: AppColors.bgBorderVLight,
              ),
              const VerticalSpacing(32),
              AppDropdown<String>(
                filled: false,
                enabledBorderColor: AppColors.bgBorderVLight,
                focusedBorderColor: AppColors.bgBorderVLight,
                icon: const Icon(
                  Icons.expand_more, // Replace with a suitable icon
                  color: AppColors.textColor100,
                ),
                labelText: 'Chat',
                value: 'Select Chat',
                items: ['Select Chat', 'Chat 1', 'Chat 2'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  // Handle dropdown change
                },
              ),
              const VerticalSpacing(24),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Description',
                  style: AppTextStyles.textSmallS2,
                ),
              ),
              const VerticalSpacing(12),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.bgBorderVLight,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Theme(
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
                            color: AppColors.color132534,
                          ),
                        ),
                      ),
                      const AppDivider(
                        color: AppColors.bgBorderVLight,
                      ),
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
                            configurations:
                                const quill.QuillEditorConfigurations(
                              minHeight: 60,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalSpacing(32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 68),
                child: AppOutlinedButton(
                  text: 'Share',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
