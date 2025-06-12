import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:intl/intl.dart';

class ChatBubbleContainer extends StatefulWidget {
  const ChatBubbleContainer({
    required this.isMine,
    required this.message,
    required this.messageId,
    required this.timeStamp,
    required this.messageWidget,
    this.onEdit,
    this.onLike,
    this.isLiked = false,
    super.key,
  });

  final bool isMine;
  final String messageId;
  final ChatMessage message;
  final Function? onLike;
  final Function? onEdit;
  final bool isLiked;
  final String timeStamp;
  final Widget messageWidget;

  @override
  State<ChatBubbleContainer> createState() => _ChatBubbleContainerState();
}

class _ChatBubbleContainerState extends State<ChatBubbleContainer> {
  bool isLiked = false;
  bool showActions = false;
  final controller = Get.find<ChatController>();
  String? _messageText;

  @override
  void initState() {
    super.initState();

    _setUp();
    isLiked = widget.isLiked;
  }

  void _setUp() {
    var text = switch (widget.message.body) {
      ChatTextMessageBody body => body.content,
      _ => widget.message.toJson().containsKey('attributes') &&
              widget.message.toJson()['attributes'] != null &&
              widget.message.toJson()['attributes'].containsKey('caption')
          ? widget.message.toJson()['attributes']['caption']
          : ''
    };
    setState(() {
      _messageText = text;
    });
  }

  String _formatTimestamp(String timestamp) {
    try {
      final dateTime = DateTime.parse(timestamp).timeZoneName == 'UTC'
          ? DateTime.parse(timestamp).toLocal()
          : DateTime.parse(timestamp);

      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inDays == 0) {
        return DateFormat('hh:mm a').format(dateTime);
      } else if (difference.inDays == 1) {
        return 'Yesterday at ${DateFormat('hh:mm a').format(dateTime)}';
      } else if (difference.inDays < 7) {
        return DateFormat('EEEE').format(dateTime);
      } else {
        return DateFormat('MMM d, yyyy').format(dateTime);
      }
    } catch (e) {
      return timestamp;
    }
  }

  void _handleLongPress() {
    setState(() {
      showActions = true;
    });
    // Optionally auto-hide after a delay
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) setState(() => showActions = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final formattedTimestamp = _formatTimestamp(widget.timeStamp);

    return Align(
      alignment: widget.isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            widget.isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          const VerticalSpacing(16),
          GestureDetector(
            onLongPress: _handleLongPress,
            child: Column(
              crossAxisAlignment: widget.isMine
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                // Action Row
                // Replace your Action Row section with this:

// Action Row
                if (showActions)
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 4,
                      left: widget.isMine
                          ? 0
                          : 33, // 25 (avatar width) + 8 (padding) = 33
                      right: widget.isMine
                          ? 33
                          : 0, // 25 (avatar width) + 8 (padding) = 33
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: widget.isMine
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() => isLiked = !isLiked);
                            widget.onLike?.call();
                            setState(() => showActions = false);
                          },
                          child: Assets.images.chatLike.svg(
                            width: 20,
                            color: isLiked ? Colors.blue : null,
                          ),
                        ),
                        if (widget.isMine) ...[
                          if (widget.message.body is ChatTextMessageBody) ...[
                            const HorizontalSpacing(16),
                            InkWell(
                              onTap: () {
                                controller.chatController.text = _messageText!;
                                setState(() => showActions = false);
                                widget.onEdit?.call();
                              },
                              child: Assets.images.chatEdit.svg(width: 20),
                            ),
                          ],
                          const HorizontalSpacing(16),
                          InkWell(
                            onTap: () async {
                              controller.messageIdToDelete.value =
                                  widget.messageId;
                              await controller.deleteMessage();
                              setState(() => showActions = false);
                            },
                            child: Assets.images.deletePop
                                .image(width: 20, color: AppColors.appRed),
                          ),
                        ],
                      ],
                    ),
                  ),
                // Message Row
                Row(
                  mainAxisAlignment: widget.isMine
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!widget.isMine)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ClipOval(
                          child: widget.isMine
                              ? Assets.images.appIcon
                                  .image(height: 25, width: 25)
                              : Assets.images.chatUserPicTwo
                                  .image(height: 25, width: 25),
                        ),
                      ),
                    Flexible(
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: widget.isMine
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              widget.messageWidget,
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  formattedTimestamp,
                                  style: AppTextStyles.textCaptionC2,
                                ),
                              ),
                            ],
                          ),
                          if (isLiked)
                            Positioned(
                              bottom: 20,
                              right: widget.isMine ? 4 : null,
                              left: widget.isMine ? null : 4,
                              child:
                                  Assets.images.chatBubbleLike.image(width: 32),
                            ),
                        ],
                      ),
                    ),
                    if (widget.isMine)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: ClipOval(
                          child: AppCachedImage(
                            width: 25,
                            height: 25,
                            fit: BoxFit.cover,
                            errorWid: const Icon(Icons.person),
                            imgUrl: Get.find<ProfileController>()
                                    .userProfile
                                    .value
                                    .image ??
                                '',
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
