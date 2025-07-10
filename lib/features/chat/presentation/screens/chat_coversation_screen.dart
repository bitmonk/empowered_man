import 'dart:async';

import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/audio_player_controller.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/chat/presentation/screens/chat_details.dart';
import 'package:empowered/features/chat/presentation/screens/customize_chat.dart';
import 'package:empowered/features/chat/presentation/screens/widget/chat_bubble_container.dart';
import 'package:empowered/features/chat/presentation/screens/widget/chat_input_field.dart';
import 'package:empowered/features/chat/presentation/screens/widget/media_view_screens.dart';
import 'package:empowered/features/chat/presentation/screens/widget/message_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:just_audio/just_audio.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.scrollToBottom();
    });
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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        //  statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark, // Others: dark icons
        systemNavigationBarColor: AppColors.black,
      ),
    );
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
                                          style: TextStyle(
                                            color: AppColors.baseWhite,
                                          ),
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
                                    MessageUtils.getMessageWidget(
                                  chat,
                                  isMe,
                                  chat.msgId,
                                  context,
                                );
                                return ChatBubbleContainer(
                                  messageId: chat.msgId,
                                  messageWidget: messageType,
                                  message: chat,
                                  isMine: isMe,
                                  timeStamp:
                                      DateTime.fromMillisecondsSinceEpoch(
                                    chat.serverTime,
                                  ).toLocal().toString(),
                                  // isLiked: controller.reactionMap
                                  //     .containsKey(chat.msgId),
                                  onLike: () {
                                    print(
                                        '🐛 onLike callback triggered for message: ${chat.msgId}',);
                                    final reactions =
                                        controller.reactionMap[chat.msgId] ??
                                            [];
                                    final isLiked = reactions.any((r) =>
                                        r.reaction == '👍' &&
                                        r.userList.contains(
                                            controller.currentUserId.value,),);
                                    if (isLiked) {
                                      controller.removeReaction(
                                          chat.msgId, '👍',);
                                    } else {
                                      controller.addReaction(chat.msgId, '👍');
                                    }
                                  },
                                  onEdit: () {
                                    print(
                                      '🐛 onEdit callback triggered for message: ${chat.msgId}',
                                    );

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
  StreamSubscription<Duration>? _positionSub;
  StreamSubscription<PlayerState>? _playerStateSub;
  double _progress = 0;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initializeDuration();
    _listenToAudio();
  }

  Future<void> _initializeDuration() async {
    try {
      await controller.audioPlayer.setUrl(widget.url);
      final duration = await controller.audioPlayer.durationFuture;
      if (mounted && duration != null) {
        setState(() {
          _duration = duration;
        });
      }
      await controller.audioPlayer.stop();
      await controller.audioPlayer.seek(Duration.zero);
    } catch (e) {
      print('🐛 Error initializing audio duration: $e');
    }
  }

  void _listenToAudio() {
    _positionSub = controller.audioPlayer.positionStream.listen((pos) {
      if (mounted) {
        setState(() {
          _position = pos;
          if (_duration.inMilliseconds > 0) {
            _progress = pos.inMilliseconds / _duration.inMilliseconds;
          }
        });
      }
    });
    _playerStateSub = controller.audioPlayer.playerStateStream.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state.playing;
          if (state.processingState == ProcessingState.completed) {
            _position = Duration.zero;
            _progress = 0;
            _isPlaying = false;
          }
        });
      }
    });
    controller.audioPlayer.durationStream.listen((dur) {
      if (mounted && dur != null) {
        setState(() {
          _duration = dur;
        });
      }
    });
  }

  @override
  void dispose() {
    _positionSub?.cancel();
    _playerStateSub?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    final ms = d.inMilliseconds;
    if (ms < 0) return '0:00';
    final m = d.inMinutes;
    final s = d.inSeconds % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final isCurrent = controller.selectedAudioId.value == widget.id;

    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      // margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.only(top: 6, right: 10, bottom: 6),
      decoration: BoxDecoration(
        color: widget.isMine
            ? (isCurrent && _isPlaying ? Colors.blue[700] : Colors.blue)
            : (isCurrent && _isPlaying ? Colors.grey[400] : Colors.grey[300]),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              isCurrent && _isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
            ),
            onPressed: () async {
              if (isCurrent && _isPlaying) {
                await controller.stopAudio();
              } else {
                await controller.playVoiceMessage(
                  widget.url,
                  audioId: widget.id,
                );
              }
            },
          ),
          // const SizedBox(width: 8),
          Expanded(
            child: GestureDetector(
              onHorizontalDragUpdate: (details) async {
                if (_duration.inMilliseconds > 0) {
                  final box = context.findRenderObject()! as RenderBox;
                  final tapPos =
                      details.localPosition.dx.clamp(0.0, box.size.width);
                  final percent = tapPos / box.size.width;
                  final seekTo = _duration * percent;
                  await controller.audioPlayer.seek(seekTo);
                }
              },
              child: Container(
                height: 20,
                alignment: Alignment.centerLeft,
                child: LinearProgressIndicator(
                  value: isCurrent ? _progress : 0.0,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  minHeight: 4,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '${_formatDuration(isCurrent ? _position : Duration.zero)} / ${_formatDuration(_duration)}',
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
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

class MessageTypeText extends StatefulWidget {
  const MessageTypeText({
    required this.text,
    required this.isMine,
    super.key,
  });
  final String text;
  final bool isMine;

  @override
  State<MessageTypeText> createState() => _MessageTypeTextState();
}

class _MessageTypeTextState extends State<MessageTypeText> {
  String get htmlText => widget.text
      .replaceAll(RegExp(r'<p>\s*</p>'), '') // Remove empty p tags
      .replaceAll(RegExp('<p>'), '') // Remove opening p tags
      .replaceAll(RegExp('</p>'), '<br>') // Replace closing p tags with br
      .replaceAll(
          RegExp(r'\n+'), '<br>',) // Replace multiple newlines with single br
      .replaceAll(RegExp(r'(<br>\s*){2,}'),
          '<br>',) // Replace multiple br tags with single br
      .replaceAll(RegExp(r'^\s*<br>\s*|<br>\s*$'),
          '',) // Remove leading/trailing br tags
      .trim(); // Remove any remaining leading/trailing whitespace

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(10),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7, // Limit max width
      ),
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
        mainAxisSize: MainAxisSize.min, // Prevent unnecessary vertical space
        children: [
          HtmlWidget(
            htmlText,
            textStyle: AppTextStyles.textBodyB2,
          ),
        ],
      ),
    );
  }
}
