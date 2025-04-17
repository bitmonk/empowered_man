import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_bindings.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
import 'package:empowered/features/journal_chat/presentation/screens/journal_chat_screen.dart';

class ReflectionScreen extends StatelessWidget {
  const ReflectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.bgMedium,
      appBar: const CustomAppBar(
        backgroundColor: AppColors.bgMedium,
        title: 'Reflection Title',
      ),
      body: Column(
        children: [
          const Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reflectionFirst,
                    style: AppTextStyles.textBodyB2,
                  ),
                  VerticalSpacing(40),
                  Text(
                    'Title Placeholder #1',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor100,
                    ),
                  ),
                  VerticalSpacing(24),
                  Text(
                    reflectionSecond,
                    style: AppTextStyles.textBodyB2,
                  ),
                  VerticalSpacing(24),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      JournalChatInitializer.destroy();
                      JournalChatInitializer.initialize();
                      Get.find<JournalChatController>().title.value =
                          'Mind Tent';
                      var chatConversationList = [
//                         ChatConversationModel(
//                           isMine: false,
//                           timeStamp: '10:30 AM',
//                           profileImageUrl: '',
//                           name: '',
//                           message: '''
// A new week has arrived! Take a moment to review 
// the insights from the past week in the Mind domain 
// and create your updated fire map for the week ahead.''',
//                           dateTime: '2024-02-10 10:30:00',
//                         ),
//                         ChatConversationModel(
//                           isMine: true,
//                           timeStamp: '11:00 AM',
//                           hide: true,
//                           profileImageUrl: '',
//                           name: '',
//                           message: 'Angry!',
//                           dateTime: '2024-02-10 11:00:00',
//                         ),
                      ].obs;
                      // Get.find<JournalChatController>()
                      //     .chatConversationList
                      //     .value = chatConversationList;
                      Get.to(
                        () => const JournalChatScreen(
                          isFromGoals: true,
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: AppColors.primary500,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Text(
                        'Edit',
                        style: AppTextStyles.textBodyB1,
                      ),
                    ),
                  ),
                ),
                const HorizontalSpacing(20),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: AppColors.primary500,
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: AppTextStyles.textBodyB1.copyWith(
                          color: AppColors.primary500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const BottomSpacing(),
        ],
      ),
    );
  }
}

const String reflectionFirst = '''
What new REASONABLE FRUIT in the BODY domain would be available to you that would make you pleased with your progress in the battle for more Freedom? What new REASONABLE FRUIT in the BODY domain would be available to you that would make you pleased with your progress in  Reasonable: Good results that don't exceed the limits prescribed by reason; not excessive, logical, or moderate. (1-2x growth)
''';
const String reflectionSecond = '''
Reasonable: Good results that don't exceed the limits prescribed by reason; not excessive, logical, or moderate. (1-2x growth). This is placeholder text only, intended for visual demonstration purposes only.This is placeholder text only, intended for visual demonstration purposes only.
''';
