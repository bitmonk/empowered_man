import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/screens/widget/chat_bubble_container.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_chat_input_field.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_drawer.dart';

class JournalChatScreen extends StatefulWidget {
  const JournalChatScreen({super.key, this.isFromGoals = false});
  final bool isFromGoals;

  @override
  State<JournalChatScreen> createState() => _JournalChatScreenState();
}

class _JournalChatScreenState extends State<JournalChatScreen> {
  final controller = Get.find<JournalChatController>();
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AppWidgetKey.journalKey,
      drawer: const JournalDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: JournalHeader(
                  title: controller.title.value,
                  onDrawerTap: () {
                    AppWidgetKey.journalKey.currentState!.openDrawer();
                  },
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 16,
                  ),
                  itemCount: controller.chatConversationList.length,
                  itemBuilder: (context, index) {
                    var chat = controller.chatConversationList[index];

                    return Column(
                      children: [
                        if (chat.hide)
                          const SizedBox()
                        else
                          ChatBubbleContainer(
                            isJournal: true,
                            message: chat.message,
                            isMine: chat.isMine,
                            timeStamp: chat.timeStamp,
                            onLike: () {},
                          ),
                        if (index == 1 &&
                            controller.chatConversationList.length < 3)
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 32,
                              left: 40,
                              right: 40,
                            ),
                            child: AppOutlinedButton(
                              text: 'Begin Journaling',
                              onPressed: () {
                                focusNode.requestFocus();
                              },
                            ),
                          ),
                      ],
                    );
                  },
                );
              }),
            ),
            JournalChatInputField(
              focusNode: focusNode,
            ),
          ],
        ),
      ),
    );
  }
}
