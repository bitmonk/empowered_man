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
    super.key,
  });

  final bool isMine;
  final String messageId;
  final ChatMessage message;
  final Function? onLike;
  final Function? onEdit;
  final String timeStamp;
  final Widget messageWidget;

  @override
  State<ChatBubbleContainer> createState() => _ChatBubbleContainerState();
}

class _ChatBubbleContainerState extends State<ChatBubbleContainer> {
  bool showActions = false;
  final controller = Get.find<ChatController>();
  String? _messageText;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _setUp();
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
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

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showActionsOverlay(BuildContext context) {
    _removeOverlay();

    final renderBox = context.findRenderObject()! as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => _ActionOverlay(
        position: position,
        size: size,
        isMine: widget.isMine,
        onLike: () async {
          await _handleLike();
          _removeOverlay();
        },
        onReply: () {
          controller..selectReply(widget.message)
          ..scrollToBottom();
          _removeOverlay();
        },
        onEdit: widget.isMine && widget.message.body is ChatTextMessageBody
            ? () {
                controller.chatController.text = _messageText!;
                widget.onEdit?.call();
                _removeOverlay();
              }
            : null,
        onDelete: widget.isMine
            ? () async {
                controller.messageIdToDelete.value = widget.messageId;
                await controller.deleteMessage();
                _removeOverlay();
              }
            : null,
        onDismiss: _removeOverlay,
        isLiked: _isLiked(),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);

    // Auto dismiss after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      _removeOverlay();
    });
  }

  void _handleLongPress() {
    _showActionsOverlay(context);
  }

  bool _isLiked() {
    final userId = controller.currentUserId.value;
    if (userId == null) {
      print(
          'Error: currentUserId is null in _isLiked for msgId ${widget.messageId}',);
      return false;
    }
    final reactions = controller.reactionMap[widget.messageId] ?? [];
    final isLiked =
        reactions.any((r) => r.reaction == '👍' && r.userList.contains(userId));
    print(
        'Checking if liked for msgId ${widget.messageId}: $isLiked, reactions: $reactions',);
    return isLiked;
  }

 Future<void> _handleLike() async {
  final userId = controller.currentUserId.value;
  if (userId == null) {
    print('Error: currentUserId is null in _handleLike');
    Get.snackbar('Error', 'User not logged in', snackPosition: SnackPosition.BOTTOM);
    return;
  }
  final isCurrentlyLiked = _isLiked();
  try {
    if (isCurrentlyLiked) {
      await controller.removeReaction(widget.messageId, '👍');
    } else {
      await controller.addReaction(widget.messageId, '👍');
    }
  } catch (e) {
    print('Error handling like: $e');
    Get.snackbar(
      'Error',
      'Failed to ${isCurrentlyLiked ? 'remove' : 'add'} reaction',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

  @override
  Widget build(BuildContext context) {
    final formattedTimestamp = _formatTimestamp(widget.timeStamp);
    final replyPreview = widget.message.attributes?['replyPreview'];
    final replyToSender = widget.message.attributes?['replyToSender'];
    final replyToMsgId = widget.message.attributes?['replyTo'];

    return Align(
      alignment: widget.isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            widget.isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          const VerticalSpacing(16),
          GestureDetector(
            onLongPress: _handleLongPress,
            child: Row(
              mainAxisAlignment: widget.isMine
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!widget.isMine)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ClipOval(
                      child: Assets.images.chatUserPicTwo
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
                          if (replyPreview != null && replyToSender != null)
                            GestureDetector(
                              onTap: () {
                                if (replyToMsgId != null) {
                                  controller.scrollToMessage(replyToMsgId);
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: widget.isMine
                                      ? AppColors.bgBorder
                                      : AppColors.bgContainer,
                                  borderRadius: BorderRadius.only(
                                    topLeft: const Radius.circular(16),
                                    topRight: const Radius.circular(16),
                                    bottomLeft:
                                        Radius.circular(widget.isMine ? 16 : 0),
                                    bottomRight:
                                        Radius.circular(widget.isMine ? 0 : 16),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: widget.isMine
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      replyToSender,
                                      style: const TextStyle(
                                        color: AppColors.primary500,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      replyPreview,
                                      style: const TextStyle(
                                        color: Colors.white60,
                                        fontSize: 13,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          Stack(
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
                              // Use Obx to reactively listen to reaction changes
                              Obx(() {
                                // Force rebuild when reactionMap changes
                                controller.reactionMap.value;

                                if (!_isLiked()) {
                                  return const SizedBox.shrink();
                                }

                                return Positioned(
                                  bottom: 20,
                                  right: widget.isMine ? 4 : null,
                                  left: widget.isMine ? null : 4,
                                  child: Assets.images.chatBubbleLike
                                      .image(width: 32),
                                );
                              }),
                            ],
                          ),
                        ],
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
          ),
        ],
      ),
    );
  }
}

class _ActionOverlay extends StatelessWidget {
  final Offset position;
  final Size size;
  final bool isMine;
  final VoidCallback onLike;
  final VoidCallback onReply;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback onDismiss;
  final bool isLiked;

  const _ActionOverlay({
    required this.position,
    required this.size,
    required this.isMine,
    required this.onLike,
    required this.onReply,
    required this.onDismiss,
    required this.isLiked,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: onDismiss,
        behavior: HitTestBehavior.opaque,
        child: Stack(
          children: [
            // Positioned overlay near the message
            Positioned(
              left: isMine ? null : position.dx + 40,
              right: isMine
                  ? MediaQuery.of(context).size.width -
                      position.dx -
                      size.width +
                      40
                  : null,
              top: position.dy - 60,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _ActionButton(
                      onTap: onLike,
                      child: Assets.images.chatLike.svg(
                        width: 20,
                        color: isLiked ? Colors.blue : Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    _ActionButton(
                      onTap: onReply,
                      child: const Icon(
                        Icons.reply,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    if (onEdit != null) ...[
                      const SizedBox(width: 8),
                      _ActionButton(
                        onTap: onEdit!,
                        child: Assets.images.chatEdit.svg(
                          width: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                    if (onDelete != null) ...[
                      const SizedBox(width: 8),
                      _ActionButton(
                        onTap: onDelete!,
                        child: Assets.images.deletePop.image(
                          width: 20,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {

  const _ActionButton({
    required this.onTap,
    required this.child,
  });
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,
      ),
    );
  }
}
