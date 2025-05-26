import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:chewie/chewie.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:video_player/video_player.dart';

class ChatBubbleContainer extends StatefulWidget {
  const ChatBubbleContainer(
      {required this.isMine,
      required this.message,
      required this.messageId,
      required this.timeStamp,
      required this.messageWidget, this.onEdit,
      this.onLike,
      this.isLiked = false,
      super.key,});

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
  bool isLiked = false; // Internal state for like
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
      // Parse the ISO 8601 timestamp
      final dateTime = DateTime.parse(timestamp).timeZoneName == 'UTC'
          ? DateTime.parse(timestamp).toLocal()
          : DateTime.parse(timestamp);

      // Format based on how long ago the message was sent
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inDays == 0) {
        // Same day - show time only
        return DateFormat('hh:mm a').format(dateTime);
      } else if (difference.inDays == 1) {
        // Yesterday - show "Yesterday at HH:MM"
        return 'Yesterday at ${DateFormat('hh:mm a').format(dateTime)}';
      } else if (difference.inDays < 7) {
        // Within last week - show weekday
        return DateFormat('EEEE').format(dateTime);
      } else {
        // Older than a week - show date
        return DateFormat('MMM d, yyyy').format(dateTime);
      }
    } catch (e) {
      // Fallback to original timestamp if parsing fails
      return timestamp;
    }
  }

  void _showPopupMenu(BuildContext context, Offset position) {
    final left = position.dx - 60; // Adjust for alignment
    final top = position.dy - 130; // Position above the bubble

    showDialog(
      context: context,
      barrierColor: AppColors.transparent,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              left: left,
              top: top,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.bgMedium,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isLiked = !isLiked; // Toggle like state
                          });
                          widget.onLike?.call();
                          Navigator.pop(context);
                        },
                        child: Assets.images.chatLike.svg(width: 20),
                      ),
                      const HorizontalSpacing(16),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Assets.images.chatUndo.svg(width: 20),
                      ),
                      if (widget.isMine) const HorizontalSpacing(16),
                      if (widget.isMine)
                        InkWell(
                          onTap: () {
                            controller.chatController.text = _messageText!;
                            Navigator.pop(context);
                            widget.onEdit?.call();
                          },
                          child: Assets.images.chatEdit.svg(width: 20),
                        ),
                      if (widget.isMine) const HorizontalSpacing(16),
                      if (widget.isMine)
                        InkWell(
                          onTap: () {
                            controller.messageIdToDelete.value =
                                widget.messageId;

                            controller.deleteMessage();
                            Navigator.pop(context);
                          },
                          child: Assets.images.deletePop
                              .image(width: 20, color: AppColors.white),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final displayMessage = _extractTextFromHtml(widget.message);
    final formattedTimestamp = _formatTimestamp(widget.timeStamp);

    return Align(
      alignment: widget.isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            widget.isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          const VerticalSpacing(16),
          GestureDetector(
            onLongPressStart: (details) {
              _showPopupMenu(context, details.globalPosition);
            },
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
                      child: widget.isMine
                          ? Assets.images.appIcon.image(height: 25, width: 25)
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
                      // if (widget.isLoading)
                      //   Positioned(
                      //     bottom: -10,
                      //     right: widget.isMine ? -10 : null,
                      //     left: widget.isMine ? null : -10,
                      //     child: SizedBox(
                      //       width: 16,
                      //       height: 16,
                      //       child: CircularProgressIndicator(
                      //         strokeWidth: 2,
                      //         valueColor: AlwaysStoppedAnimation<Color>(
                      //           widget.isMine
                      //               ? Theme.of(context).primaryColor
                      //               : Colors.grey[600]!,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      if (isLiked)
                        Positioned(
                          bottom: 20,
                          right: widget.isMine ? 4 : null,
                          left: widget.isMine ? null : 4,
                          child: Assets.images.chatBubbleLike.image(width: 32),
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

  // Future<String?> getDownloadedVideoPath(String videoId) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('video_$videoId');
  // }

  // void playVideoFromUrlOrLocal() async {
  //   var localPath = await getDownloadedVideoPath(widget.messageId.toString());

  //   if (localPath != null && File(localPath).existsSync()) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => AppVideoPlayer(
  //           assets: localPath,
  //         ),
  //       ),
  //     );
  //   } else {
  //     // Download and save
  //     await controller.downloadVideo(
  //         id: widget.messageId.toString(), url: widget.videos!.first);
  //     localPath = await getDownloadedVideoPath(widget.messageId.toString());
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => AppVideoPlayer(
  //           assets: localPath,
  //         ),
  //       ),
  //     );
  //   }
  // }
}

class FullscreenImageView extends StatelessWidget {
  const FullscreenImageView({
    required this.imagePath,
    super.key,
    this.color = Colors.grey,
  });
  final String imagePath;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            itemCount: 1,
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(imagePath),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 3, // Zoom up to 3x
                heroAttributes: PhotoViewHeroAttributes(tag: imagePath),
              );
            },
            scrollPhysics: const BouncingScrollPhysics(),
            backgroundDecoration: const BoxDecoration(color: Colors.grey),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            right: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.close, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FullscreenVideoView extends StatefulWidget {
  const FullscreenVideoView({required this.videoPath, super.key});
  final String videoPath;

  @override
  State<FullscreenVideoView> createState() => _FullscreenVideoViewState();
}

class _FullscreenVideoViewState extends State<FullscreenVideoView> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      _videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(widget.videoPath));
      await _videoPlayerController.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        aspectRatio: _videoPlayerController.value.aspectRatio,
      );

      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      debugPrint('Error initializing fullscreen video: $e');
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: _isInitialized && _chewieController != null
              ? Chewie(controller: _chewieController!)
              : const LoadingWidget(),
        ),
      ),
    );
  }
}
