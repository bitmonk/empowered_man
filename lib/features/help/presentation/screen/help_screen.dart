import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/faq/presentation/controllers/faq_support_bindings.dart';
import 'package:empowered/features/faq/presentation/screens/faq_support_screen.dart';
import 'package:empowered/features/help/presentation/controller/help_controller.dart';

class HelpScreen extends GetView<HelpController> {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'HELP',
        onTap: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpacing(20),
                Text(
                  'If you have any questions, concerns, or need support, feel free to email us at:',
                  style: AppTextStyles.bodyLGMedium.copyWith(
                    color: const Color(0xFF0E2741),
                  ),
                ),
                const VerticalSpacing(16),
                AppTextFormField(
                  labelText: 'Title',
                  controller: controller.titleController,
                  textInputType: TextInputType.emailAddress,
                ),
                const VerticalSpacing(16),
                AppTextFormField(
                  labelText: 'Write the problem',
                  controller: controller.writeProblemController,
                  textInputAction: TextInputAction.newline,
                  textInputType: TextInputType.multiline,
                  alignLabelWithHint: true,
                  maxLines: 6,
                ),
                const VerticalSpacing(32),
                AppOutlinedButton(
                  text: 'Submit',
                  onPressed: () {},
                ),
                const VerticalSpacing(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Check FAQs for quick answers.',
                      style: AppTextStyles.captionRegular,
                    ),
                    AppTextButton(
                      fontSize: 12,
                      onTap: () {
                        FaqInitializer.destroy();
                        FaqInitializer.initialize();
                        NavigationHelper.navigateWithFadeTransition(
                          context,
                          const FaqScreen(),
                        );
                      },
                      label: 'FAQ',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
