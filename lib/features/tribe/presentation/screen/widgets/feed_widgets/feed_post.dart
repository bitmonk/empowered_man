import 'package:cached_network_image/cached_network_image.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tribe/data/model/feed_posts_model.dart';
import 'package:empowered/features/tribe/data/model/media.dart';
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/comment_screen.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/media_viewer.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'dart:typed_data';

class FeedPost extends StatefulWidget {
  const FeedPost({
    required this.post,
    super.key,
  });

  final dynamic
      post; // Post from feed_posts_model.dart or saved_posts_model.dart

  @override
  State<FeedPost> createState() => _FeedPostState();
}

class _FeedPostState extends State<FeedPost> {
  bool _expanded = false;
  late final FeedPageController controller;
  late bool _isLiked;
  late int _likesCount;
  late bool _isBookmarked;

  @override
  void initState() {
    super.initState();
    controller = Get.find<FeedPageController>();
    _syncStateWithWidget();
  }

  @override
  void didUpdateWidget(covariant FeedPost oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.post.id != oldWidget.post.id ||
        widget.post.likesCount != oldWidget.post.likesCount ||
        widget.post.likedByCurrentUser != oldWidget.post.likedByCurrentUser ||
        widget.post.isBookmarked != oldWidget.post.isBookmarked) {
      _syncStateWithWidget();
    }
  }

  void _syncStateWithWidget() {
    _isLiked = widget.post.likedByCurrentUser ?? false;
    _likesCount = widget.post.likesCount ?? 0;
    _isBookmarked = widget.post.isBookmarked ?? false;
  }

  String formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return 'N/A';
    try {
      return DateFormat.yMd().format(dateTime.toLocal());
    } catch (e) {
      return 'N/A';
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
        'SavedPost media:  >>>>>>>>>>>>>>>>>>>>> ${widget.post.media?.toJson()}');
    print(
        'SavedPost images: >>>>>>>>>>>>>>>>>>>>>${widget.post.media?.images}');
    print(
        'SavedPost videos: >>>>>>>>>>>>>>>>>>>>>${widget.post.media?.videos}');
    final content = widget.post.text ?? '';
    final textToShow = _expanded || content.length < 100
        ? content
        : '${content.substring(0, 100)}...';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.feedContainer,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: widget.post.createdBy?.image != null
                    ? CachedNetworkImage(
                        imageUrl: widget.post.createdBy!.image!,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                        errorWidget: (context, url, error) =>
                            Assets.images.leaderProfile.image(
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Assets.images.leaderProfile.image(
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.createdBy?.fullName ?? 'Unknown',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      formatDateTime(widget.post.createdAt),
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              PopupMenuButton<String>(
                color: const Color(0xFF1E293B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                icon: Assets.images.more.svg(
                  height: 20,
                  width: 20,
                  fit: BoxFit.cover,
                ),
                onSelected: _handleMenuAction,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'save',
                    child: Row(
                      children: [
                        if (_isBookmarked)
                          Assets.images.savedPost.svg(width: 28, height: 28)
                        else
                          Assets.images.savePost.svg(width: 28, height: 28),
                        const SizedBox(width: 8),
                        Text(
                          _isBookmarked ? 'Unsave Post' : 'Save Post',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'hide',
                    child: Row(
                      children: [
                        Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Hide Post',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const VerticalSpacing(12),
          const GreyDivider(),
          const VerticalSpacing(12),
          _buildMedia(widget.post.media),
          const VerticalSpacing(12),
          Text(textToShow, style: const TextStyle(color: Colors.white)),
          if (content.length > 100)
            TextButton(
              onPressed: () => setState(() => _expanded = !_expanded),
              child: Text(
                _expanded ? ' -   See Less' : ' +   See More',
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          const VerticalSpacing(12),
          const GreyDivider(),
          const VerticalSpacing(12),
          Row(
            children: [
              GestureDetector(
                onTap: _handleLikeToggle,
                child: _isLiked
                    ? Assets.images.heartFilledPng.image(width: 24, height: 24)
                    : Assets.images.heartPng.image(width: 24, height: 24),
              ),
              const SizedBox(width: 4),
              Text(
                _formatCount(_likesCount),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: _navigateToComments,
                child: Row(
                  children: [
                    Assets.images.comment
                        .svg(height: 24, width: 24, fit: BoxFit.cover),
                    const SizedBox(width: 4),
                    Text(
                      _formatCount(widget.post.commentsCount
                          // controller
                          //     .commentsModel[widget.post.id?.toString()]
                          //     ?.data
                          //     ?.comments
                          //     ?.length ??
                          // 0,
                          ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Obx(
                () => GestureDetector(
                  onTap: controller.isSharing.value
                      ? null
                      : () => controller.sharePost(widget.post),
                  child: controller.isSharing.value
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Assets.images.sharePop.image(
                          height: 20,
                          width: 20,
                          fit: BoxFit.cover,
                          color: Colors.white,
                        ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: _handleSaveToggle,
                child: _isBookmarked
                    ? Assets.images.savedPost.svg(width: 22, height: 22)
                    : Assets.images.savePost.svg(width: 22, height: 22),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _handleLikeToggle() async {
    final previousIsLiked = _isLiked;
    final previousLikesCount = _likesCount;

    setState(() {
      _isLiked = !_isLiked;
      _likesCount = _isLiked ? _likesCount + 1 : _likesCount - 1;
    });

    try {
      await controller.toggleLike(widget.post.id?.toString() ?? '');
    } catch (e) {
      setState(() {
        _isLiked = previousIsLiked;
        _likesCount = previousLikesCount;
      });
      Get.snackbar(
        'Error',
        'Failed to toggle like: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> _handleSaveToggle() async {
    final previousIsBookmarked = _isBookmarked;

    setState(() {
      _isBookmarked = !_isBookmarked;
    });

    try {
      await controller.toggleSave(widget.post.id?.toString() ?? '');
    } catch (e) {
      setState(() {
        _isBookmarked = previousIsBookmarked;
      });
      Get.snackbar(
        'Error',
        'Failed to toggle save: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Widget _buildMedia(dynamic media) {
    if (media == null) {
      return const SizedBox.shrink();
    }

    List<Map<String, dynamic>> allMedia = [];
    if (media is Media) {
      allMedia = [
        ...(media.images?.map((url) => {
                  'url': url,
                  'type': url.toLowerCase().endsWith('.gif') ? 'gif' : 'image'
                }) ??
            []),
        ...(media.documents?.map((url) => {'url': url, 'type': 'document'}) ??
            []),
        ...(media.videos?.map((url) => {'url': url, 'type': 'video'}) ?? []),
      ];
    } else if (media is List) {
      allMedia = media
          .whereType<String>()
          .map((url) => {
                'url': url,
                'type': _getMediaType(url),
              })
          .toList();
    }

    if (allMedia.isEmpty) return const SizedBox.shrink();

    // If only one media and it's an image or gif, center and expand it
    if (allMedia.length == 1 &&
        (allMedia[0]['type'] == 'image' || allMedia[0]['type'] == 'gif')) {
      return Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: _buildSingleMedia(allMedia[0]),
          ),
        ),
      );
    }

    final additionalCount = allMedia.length > 3 ? allMedia.length - 3 : 0;

    return SizedBox(
      height: allMedia.length == 1 ? 200 : 120,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              allMedia.length == 1 ? 1 : (allMedia.length == 2 ? 2 : 3),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: allMedia.length == 1 ? 16 / 9 : 1,
        ),
        itemCount: allMedia.length > 3 ? 3 : allMedia.length,
        itemBuilder: (context, index) {
          final isLast = index == 2 && additionalCount > 0;
          return Stack(
            children: [
              GestureDetector(
                onTap: () => _openMediaViewer(allMedia, index),
                child: _buildSingleMedia(allMedia[index]),
              ),
              if (isLast)
                GestureDetector(
                  onTap: () => _openMediaViewer(allMedia, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '+ $additionalCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  String _getMediaType(String url) {
    final extension = url.split('.').last.toLowerCase();
    switch (extension) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'webp':
        return 'image';
      case 'gif':
        return 'gif';
      case 'mp4':
      case 'mov':
      case 'avi':
      case 'mkv':
        return 'video';
      case 'pdf':
        return 'document';
      default:
        return 'image';
    }
  }

  void _openMediaViewer(
      List<Map<String, dynamic>> mediaList, int initialIndex) {
    Get.to(() => MediaViewer(mediaList: mediaList, initialIndex: initialIndex));
  }

  Widget _buildSingleMedia(Map<String, dynamic> item) {
    final url = item['url'] as String;
    final type = item['type'] as String;

    switch (type) {
      case 'image':
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.cover,
            // Remove maxWidthDiskCache and maxHeightDiskCache to allow full quality
            placeholder: (context, url) => Container(
              color: Colors.grey[800],
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey[800],
              child: const Center(
                child: Icon(
                  Icons.broken_image,
                  color: Colors.white54,
                  size: 40,
                ),
              ),
            ),
            // Use high quality for images
            memCacheHeight: null,
            memCacheWidth: null,
          ),
        );
      case 'gif':
        // Debug print to check the GIF URL
        print('GIF URL: ' + url);
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            url,
            fit: BoxFit.cover,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded || frame != null) {
                return child;
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, color: Colors.white54, size: 40),
          ),
        );
      case 'document':
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: Colors.grey[800],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.picture_as_pdf,
                  color: Colors.white,
                  size: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    url.split('/').last,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      case 'video':
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            alignment: Alignment.center,
            children: [
              FutureBuilder<Uint8List?>(
                future: VideoThumbnail.thumbnailData(
                  video: url,
                  imageFormat: ImageFormat.PNG,
                  maxWidth: 400,
                  quality: 60,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      color: Colors.black,
                      child: const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    );
                  } else if (snapshot.hasData && snapshot.data != null) {
                    return Image.memory(
                      snapshot.data!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    );
                  } else {
                    return Container(
                      color: Colors.black,
                      child: const Center(
                        child: Icon(Icons.videocam,
                            color: Colors.white38, size: 48),
                      ),
                    );
                  }
                },
              ),
              const Icon(Icons.play_circle_fill, color: Colors.white, size: 48),
              Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: Text(
                  url.split('/').last,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    } else {
      return count.toString();
    }
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'save':
        _handleSaveToggle();
        break;
      case 'hide':
        _showHideConfirmation();
        break;
    }
  }

  void _showHideConfirmation() {
    Get.dialog(
      AlertDialog(
        title: const Text('Hide Post'),
        content: const Text('Are you sure you want to hide this post?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              controller.hidePost(widget.post.id?.toString() ?? '');
            },
            child: const Text('Hide'),
          ),
        ],
      ),
    );
  }

  void _navigateToComments() {
    List<Map<String, dynamic>> allMedia = [];
    final media = widget.post.media;
    if (media is Media) {
      allMedia = [
        ...(media.images?.map((url) => {
                  'url': url,
                  'type': url.toLowerCase().endsWith('.gif') ? 'gif' : 'image'
                }) ??
            []),
        ...(media.documents?.map((url) => {'url': url, 'type': 'document'}) ??
            []),
        ...(media.videos?.map((url) => {'url': url, 'type': 'video'}) ?? []),
      ];
    } else if (media is List) {
      allMedia = media
          .whereType<String>()
          .map((url) => {
                'url': url,
                'type': _getMediaType(url),
              })
          .toList();
    }

    Get.to(
      () => CommentScreen(
        userName: widget.post.createdBy?.fullName ?? 'Unknown',
        timeAgo: formatDateTime(widget.post.createdAt),
        content: widget.post.text ?? '',
        media: allMedia,
        isLiked: _isLiked,
        postId: widget.post.id?.toString() ?? '',
        likesCount: _likesCount,
      ),
    );
  }
}
