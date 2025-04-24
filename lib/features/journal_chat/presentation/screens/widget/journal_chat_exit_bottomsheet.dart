import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';

class JournalChatExitBottomsheet extends StatelessWidget {
  const JournalChatExitBottomsheet({required this.controller, super.key});
  final JournalChatController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(
          0xff132534,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 43,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(
                  0xFF4A5D72,
                ),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
            ),
            const VerticalSpacing(14),
            const Text(
              'Do you want to leave?',
              style: AppTextStyles.titleHeading,
            ),
            const VerticalSpacing(20),
            const GreyDivider(),
            const VerticalSpacing(20),
            Text(
              textAlign: TextAlign.center,
              'You can continue this journal from dashboard or journal library',
              style: AppTextStyles.titleMd.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.textColor200,
              ),
            ),
            const VerticalSpacing(24),
            AppOutlinedButton.orange(
              text: 'Yes',
              // isLoading:
              //     controller.chatController.value == TheStates.loading,
              onPressed: () {
                Navigator.pop(context);
                AppWidgetKey.journalKey.currentState?.openDrawer();
              },
              
            ),
            const VerticalSpacing(16),
            AppOutlinedButton.withOutlined(
              safePadding: true,
              hasShadow: false,
              backgroundColor: const Color(
                0xff132534,
              ),
              text: 'No',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const BottomSpacing(),
          ],
        ),
      ),
    );
  }
}
