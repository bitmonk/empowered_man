import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/audio_player_controller.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/chat/presentation/screens/chat_details.dart';
import 'package:empowered/features/chat/presentation/screens/customize_chat.dart';
import 'package:empowered/features/chat/presentation/screens/widget/chat_bubble_container.dart';
import 'package:empowered/features/chat/presentation/screens/widget/chat_input_field.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    AudioPlayerInitializer.destroy();
  }

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
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   controller.scrollToBottom();
    // });
    controller.chatScreenScrollController.addListener(() {
      if (controller.chatScreenScrollController.position.pixels <=
          controller.chatScreenScrollController.position.minScrollExtent +
              100) {
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
        title: controller.selectedConversation.value!.userName,
        actions: [
          if (widget.isGroupChat)
            PopupMenuButton<String>(
              offset: const Offset(0, 40),
              onSelected: (value) {
                if (value == 'customise') {
                  controller.getMemberList(isInitialLoad: true);
                  openCustomizeChat();
                } else if (value == 'details') {
                  controller.getGroupInfo();
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
                            return Obx(
                              () {
                                final messageType =
                                    getMessageWidget(chat, isMe, chat.msgId);
                                return ChatBubbleContainer(
                                  messageId: chat.msgId,
                                  messageWidget: messageType,
                                  message: chat,
                                  isMine: isMe,
                                  timeStamp:
                                      DateTime.fromMillisecondsSinceEpoch(
                                    chat.serverTime,
                                  ).toLocal().toString(),
                                  isLiked: controller.reactionMap
                                      .containsKey(chat.msgId),
                                  onLike: () {
                                    if (controller.reactionMap
                                        .containsKey(chat.msgId)) {
                                      controller.removeReaction(
                                        chat.msgId,
                                        '👍',
                                      );
                                    } else {
                                      controller.addReaction(chat.msgId, '👍');
                                    }
                                  },
                                  onEdit: () {
                                    controller.messageToEdit.value = chat;
                                  },
                                );
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

  Widget getMessageWidget(ChatMessage message, bool isMine, String messageId) {
    var jsonMessage = message.body.toJson();
    String messageWidgetType = jsonMessage['type'] == 'file' &&
            jsonMessage['displayName']?.contains('.m4a') == true
        ? 'audio'
        : jsonMessage['type'];

    if (controller.sendingMessageState.value == TheStates.loading) {
      return const Text('sending...');
    } else if (controller.sendingMessageState.value == TheStates.error) {
      return const Text('Message not sent. Please send again.');
    } else {
      Widget wid;
      switch (messageWidgetType) {
        case 'txt':
          wid = MessaageTypeText(
            text: jsonMessage['content'] ?? '',
            isMine: isMine,
          );

        case 'file':
          wid = const Text('file');

        case 'img':
          final remotePath = jsonMessage['remotePath'];
          wid = (remotePath != null && remotePath.toString().isNotEmpty)
              ? MessaageTypeImage(images: [jsonMessage['remotePath']])
              : const Text('Invalid image');

        case 'video':
          final remotePath = jsonMessage.containsKey('remotePath');
          wid = remotePath
              ? MessaageTypeVideo(videoUrl: jsonMessage['remotePath'])
              : const Text('Invalid video');

        case 'audio':
          final remotePath = jsonMessage.containsKey('remotePath');
          wid = remotePath
              ? MessageTypeAudio(
                  url: jsonMessage['remotePath'] ?? '',
                  id: messageId,
                  isMine: isMine,
                )
              : const Text('Invalid audio');

        default:
          wid = const SizedBox.shrink();
      }

      return wid;
    }
  }
}

class MessageTypeAudio extends StatefulWidget {
  const MessageTypeAudio({
    required this.url,
    required this.id,
    super.key,
    this.isMine = false,
  });

  final String url;
  final String id;
  final bool isMine;

  @override
  State<MessageTypeAudio> createState() => _MessageTypeAudioState();
}

class _MessageTypeAudioState extends State<MessageTypeAudio> {
  final controller = Get.find<AudioPlayerController>();
  @override
  void initState() {
    super.initState();
    // controller.selectedAudioId.value=widget.
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildControls() {
    if (controller.isPlaying.value != true) {
      return IconButton(
        icon: const Icon(Icons.play_arrow, color: Colors.white),
        onPressed: () async {
          await controller.playVoiceMessage(widget.url);
        },
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.pause, color: Colors.white),
        onPressed: controller.stopAudio,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: 300,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: widget.isMine ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                _buildControls(),
                const SizedBox(width: 8),
                // Expanded(
                //   child: ProgressBar(
                //     progress: position,
                //     total: duration,
                //     onSeek: _audioPlayer.seek,
                //     timeLabelLocation: TimeLabelLocation.none,
                //     baseBarColor: Colors.grey[400],
                //     progressBarColor: Colors.white,
                //     thumbColor: Colors.white,
                //     timeLabelTextStyle: const TextStyle(fontSize: 12),
                //   ),
                // ),
                const SizedBox(width: 8),
                const Text(
                  '0',
                  // "${_formatDuration(position)} / ${_formatDuration(duration)}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            // Optional Waveform UI
            // FutureBuilder<WaveformData>(
            //   future: WaveformData.fromAudioFile(widget.url),
            //   builder: (context, snapshot) {
            //     if (!snapshot.hasData) return const SizedBox.shrink();
            //     return Waveform(
            //       waveformData: snapshot.data!,
            //       width: double.infinity,
            //       height: 40,
            //       activeColor: Colors.white,
            //       inactiveColor: Colors.grey[400],
            //       duration: duration,
            //       currentPosition: position,
            //       onSeek: _audioPlayer.seek,
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class MessaageTypeImage extends StatefulWidget {
  const MessaageTypeImage({required this.images, super.key});
  final List<String> images;

  @override
  State<MessaageTypeImage> createState() => _MessaageTypeImageState();
}

class _MessaageTypeImageState extends State<MessaageTypeImage> {
  @override
  Widget build(BuildContext context) {
    return widget.images.isNotEmpty
        ? InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullscreenImageView(
                    imagePath: widget.images.first,
                  ),
                ),
              );
            },
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.images.map((url) {
                return Container(
                  width: 150,
                  height: 150,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                    loadingBuilder: (
                      context,
                      child,
                      loadingProgress,
                    ) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) =>
                        const ColoredBox(
                      color: Colors.black,
                      child: Icon(
                        Icons.broken_image,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        : const SizedBox.shrink();
  }
}

class MessaageTypeVideo extends StatefulWidget {
  const MessaageTypeVideo({required this.videoUrl, super.key});
  final String videoUrl;

  @override
  State<MessaageTypeVideo> createState() => _MessaageTypeVideoState();
}

class _MessaageTypeVideoState extends State<MessaageTypeVideo> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AppVideoPlayer(
              videoUrl: widget.videoUrl,
            ),
          ),
        );
      },
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        child: const Icon(
          Icons.play_arrow,
          color: Colors.white,
          size: 48,
        ),
      ),
    );
  }
}

class MessaageTypeText extends StatefulWidget {
  const MessaageTypeText({required this.text, required this.isMine, super.key});
  final String text;
  final bool isMine;

  @override
  State<MessaageTypeText> createState() => _MessaageTypeTextState();
}

class _MessaageTypeTextState extends State<MessaageTypeText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: !widget.isMine ? AppColors.bgBorder : Colors.transparent,
        ),
        color: widget.isMine ? AppColors.primary500 : AppColors.bgMedium,
        borderRadius: BorderRadius.only(
          bottomRight: const Radius.circular(14),
          topLeft: !widget.isMine ? Radius.zero : const Radius.circular(14),
          bottomLeft: const Radius.circular(14),
          topRight: widget.isMine ? Radius.zero : const Radius.circular(14),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          HtmlWidget(
            //  shrinkWrap: true,
            widget.text,
            textStyle: AppTextStyles.textBodyB2,
          ),
        ],
      ),
    );
  }
}
