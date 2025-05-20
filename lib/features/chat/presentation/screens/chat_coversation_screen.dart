import 'package:agora_chat_sdk/agora_chat_sdk.dart';
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
    controller.chatScreenScrollController.addListener(() {
      if (controller.chatScreenScrollController.position.pixels <=
          controller.chatScreenScrollController.position.minScrollExtent +
              100) {
        print('a');
        controller.loadPreviousMessages();
      }
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
        // title: widget.isGroupChat ? 'Liam, Sam' : 'Liam',
        title: controller.selectedConversation.value!.id,
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
            Expanded(
              child: Obx(
                () => controller.loadingMessageState.value.showWidget(
                  loading: () => const LoadingWidget(),
                  error: () => CustomErrorWidget(
                    error: controller.loadingMessageError.value,
                    onPressed: () {},
                  ),
                  success: () => controller.messages.isEmpty
                      ? const Center(
                          child: CustomErrorWidget(
                            error: 'No Message',
                          ),
                        )
                      : ListView.builder(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          controller: controller.chatScreenScrollController,
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                            horizontal: 16,
                          ),
                          itemCount: controller.messages.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Obx(
                                () => controller.loadingPrevoiusMessageState
                                            .value ==
                                        TheStates.loading
                                    ? const Center(
                                        child: Text(
                                          'Loading more messages...',
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              );
                            }
                            var chat = controller.messages[index - 1];
                            final isMe =
                                chat.from == controller.currentUserId.value;
                            print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
                            print(chat.toJson());
                            print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');

                            return ChatBubbleContainer(
                              message: switch (chat.body) {
                                ChatTextMessageBody body => body.content,
                                _ => chat.toJson().containsKey('attributes') &&
                                        chat.toJson()['attributes'] != null &&
                                        chat
                                            .toJson()['attributes']
                                            .containsKey('caption')
                                    ? chat.toJson()['attributes']['caption']
                                    : ''
                              },
                              isMine: isMe,
                              timeStamp: DateTime.fromMillisecondsSinceEpoch(
                                chat.serverTime,
                              ).toLocal().toString(),
                              // isAnotherUser: index == 1 && widget.isGroupChat,
                              images: chat.body is ChatImageMessageBody &&
                                      chat.body
                                          .toJson()
                                          .containsKey('remotePath')
                                  ? [chat.body.toJson()['remotePath']]
                                  : null,
                              videos: chat.body is ChatVideoMessageBody &&
                                      chat.body
                                          .toJson()
                                          .containsKey('remotePath')
                                  ? [chat.body.toJson()['remotePath']]
                                  : null,
                              voices: chat.body is ChatVoiceMessageBody &&
                                      chat.body
                                          .toJson()
                                          .containsKey('remotePath')
                                  ? [chat.body.toJson()['remotePath']]
                                  : null,
                              files: chat.body.toJson()['type'] == 'file' &&
                                      chat.body is ChatFileMessageBody &&
                                      chat.body
                                          .toJson()
                                          .containsKey('remotePath')
                                  ? [chat.body.toJson()['remotePath']]
                                  : null,
                              isLiked: controller.reactionMap
                                  .containsKey(chat.msgId),
                              onLike: () {
                                if (controller.reactionMap
                                    .containsKey(chat.msgId)) {
                                  controller.removeReaction(chat.msgId, '👍');
                                } else {
                                  controller.addReaction(chat.msgId, '👍');
                                }
                              },
                            );
                          },
                        ),
                ),
              ),
            ),
            const ChatInputField(),
          ],
        ),
      ),
    );
  }
}
