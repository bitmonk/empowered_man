import 'package:chewie/chewie.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:html/parser.dart' show parse;
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:video_player/video_player.dart';

class ChatBubbleContainer extends StatefulWidget {
  const ChatBubbleContainer({
    required this.isMine,
    required this.message,
    required this.timeStamp,
    required this.onLike,
    super.key,
    this.isLiked = false,
    this.isJournal = false,
    this.isAnotherUser = false,
    this.images,
    this.videos,
  });

  final bool isMine;
  final bool isJournal;
  final bool isLiked;
  final bool isAnotherUser;
  final String message;
  final String timeStamp;
  final List<String>? images;
  final List<String>? videos;

  final VoidCallback onLike;

  @override
  State<ChatBubbleContainer> createState() => _ChatBubbleContainerState();
}

class _ChatBubbleContainerState extends State<ChatBubbleContainer> {
  bool isLiked = false; // Internal state for like
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  bool _isVideoInitialized = false;
  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    if (widget.videos == null || widget.videos!.isEmpty) return;

    try {
      _videoController =
          VideoPlayerController.networkUrl(Uri.parse(widget.videos!.first));
      await _videoController?.initialize();

      if (mounted) {
        setState(() {
          _isVideoInitialized = true;
        });
      }
    } catch (e) {
      debugPrint('Error initializing video: $e');
      if (mounted) {
        setState(() {
          _isVideoInitialized = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _chewieController?.dispose();

    super.dispose();
  }

  String _extractTextFromHtml(String htmlContent) {
    try {
      final document = parse(htmlContent);
      return document.body?.text ?? '';
    } catch (e) {
      return htmlContent;
    }
  }

  String _formatTimestamp(String timestamp) {
    try {
      // Parse the ISO 8601 timestamp
      final dateTime = DateTime.parse(timestamp);

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
                          widget.onLike.call();
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
                      const HorizontalSpacing(16),
                      InkWell(
                        onTap: () {
                          Get.find<ChatController>().chatController.text =
                              widget.message;
                          Navigator.pop(context);
                        },
                        child: Assets.images.chatEdit.svg(width: 20),
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
    final displayMessage = _extractTextFromHtml(widget.message);
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
                      child: widget.isAnotherUser
                          ? Assets.images.chatUserPic
                              .image(height: 25, width: 25)
                          : widget.isJournal
                              ? Assets.images.appIcon
                                  .image(height: 25, width: 25)
                              : Assets.images.chatUserPicTwo
                                  .image(height: 25, width: 25),
                    ),
                  ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        clipBehavior: Clip.none,
                        children: [
                          if (displayMessage.isNotEmpty)
                            Container(
                              margin: const EdgeInsets.all(4),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: !widget.isMine
                                      ? AppColors.bgBorder
                                      : Colors.transparent,
                                ),
                                color: widget.isMine
                                    ? AppColors.primary500
                                    : AppColors.bgMedium,
                                borderRadius: BorderRadius.only(
                                  bottomRight: const Radius.circular(14),
                                  topLeft: !widget.isMine
                                      ? Radius.zero
                                      : const Radius.circular(14),
                                  bottomLeft: const Radius.circular(14),
                                  topRight: widget.isMine
                                      ? Radius.zero
                                      : const Radius.circular(14),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    displayMessage,
                                    style: AppTextStyles.textBodyB2,
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                          Column(
                            children: [
                              if (widget.images != null &&
                                  widget.images!.isNotEmpty)
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            FullscreenImageView(
                                          imagePath: widget.images!.first,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: widget.images!.map((url) {
                                      return Container(
                                        width: 150,
                                        height: 150,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        loadingProgress
                                                            .expectedTotalBytes!
                                                    : null,
                                              ),
                                            );
                                          },
                                          errorBuilder:
                                              (context, error, stackTrace) =>
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
                                ),
                              if (widget.videos != null &&
                                  widget.videos!.isNotEmpty)
                                _buildVideoPreview(),
                              const SizedBox(height: 8),
                            ],
                          ),
                          if (isLiked)
                            Positioned(
                              right: -10,
                              bottom: -10,
                              child:
                                  Assets.images.chatBubbleLike.image(width: 32),
                            ),
                        ],
                      ),
                      Text(
                        formattedTimestamp,
                        style: AppTextStyles.textCaptionC2,
                      ),
                    ],
                  ),
                ),
                if (widget.isMine)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ClipOval(
                      child: Assets.images.chatUserPicOne
                          .image(height: 25, width: 25),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPreview() {
    if (widget.videos == null || widget.videos!.isEmpty) {
      return const SizedBox();
    }

    if (!_isVideoInitialized || _videoController == null) {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black12,
            ),
            child: const Center(child: CircularProgressIndicator()),
          ),
        ],
      );
    }
    return InkWell(
      onTap: () {
        if (widget.videos!.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FullscreenVideoView(
                videoPath: widget.videos!.first,
              ),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: _videoController!.value.aspectRatio,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(_videoController!),
                  if (!_videoController!.value.isPlaying)
                    const Icon(
                      Icons.play_circle_fill,
                      color: Colors.white,
                      size: 48,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
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
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
