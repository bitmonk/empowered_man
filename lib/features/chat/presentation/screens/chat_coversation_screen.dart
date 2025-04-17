import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/chat/presentation/screens/chat_details.dart';
import 'package:empowered/features/chat/presentation/screens/customize_chat.dart';
import 'package:empowered/features/chat/presentation/screens/widget/chat_bubble_container.dart';
import 'package:empowered/features/chat/presentation/screens/widget/chat_input_field.dart';

class ChatCoversationScreen extends StatefulWidget {
  const ChatCoversationScreen({
    required this.isGroupChat,
    required this.isSoloChat,
    super.key,
  });
  final bool isGroupChat;
  final bool isSoloChat;

  @override
  State<ChatCoversationScreen> createState() => _ChatCoversationScreenState();
}

class _ChatCoversationScreenState extends State<ChatCoversationScreen> {
  final controller = Get.find<ChatController>();

  void openCustomizeChat() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CustomizeChat(),
    );
  }

  void openChatDetails() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ChatDetails(),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.scrollToBottom();
    });
  } // Helper function to style menu items

  PopupMenuItem<String> _buildPopupMenuItem(String text, String value) {
    return PopupMenuItem<String>(
      value: value,
      child: Text(text, style: AppTextStyles.textBodyB2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: widget.isGroupChat ? 'Liam, Sam' : 'Liam',
        actions: [
          if (widget.isGroupChat)
            PopupMenuButton<String>(
              offset: const Offset(0, 40),
              onSelected: (value) {
                if (value == 'customise') {
                  openCustomizeChat();
                } else if (value == 'details') {
                  openChatDetails();
                  // Handle 'View Chat Detail' action
                }
              },
              color: AppColors.bgMedium, // Dark background
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              itemBuilder: (context) => [
                _buildPopupMenuItem('Customise Chat', 'customise'),
                _buildPopupMenuItem('View Chat Detail', 'details'),
              ],
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Assets.images.menu.svg(width: 32),
              ),
            ),
          if (widget.isSoloChat)
            Image.asset(
              'assets/images/chat-download.png',
              width: 24,
            ).paddingOnly(right: 16),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Expanded(
            //   child: Obx(() {
            //     return ListView.builder(
            //       keyboardDismissBehavior:
            //           ScrollViewKeyboardDismissBehavior.onDrag,
            //       controller: controller.scrollController,
            //       padding: const EdgeInsets.symmetric(
            //         vertical: 24,
            //         horizontal: 16,
            //       ),
            //       itemCount: controller.chatConversationList.length,
            //       itemBuilder: (context, index) {
            //         var chat = controller.chatConversationList[index];
            //         return ChatBubbleContainer(
            //           message: chat.message,
            //           isMine: chat.isMine,
            //           timeStamp: chat.timeStamp,
            //           isAnotherUser: index == 1 && widget.isGroupChat,
            //           onLike: () {},
            //         );
            //       },
            //     );
            //   }),
            // ),
            ChatInputField(),
          ],
        ),
      ),
    );
  }
}
