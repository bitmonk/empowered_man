import 'package:cached_network_image/cached_network_image.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tribe/data/model/feed_posts_model.dart';
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/comment_screen.dart';
import 'package:intl/intl.dart';

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
  late bool _isLiked; // Local state for like status
  late int _likesCount; // Local state for likes count

  @override
  void initState() {
    super.initState();
    controller = Get.find<FeedPageController>();
    _syncStateWithWidget();
  }

  @override
  void didUpdateWidget(covariant FeedPost oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the post id or like count changes, update local state
    if (widget.post.id != oldWidget.post.id ||
        widget.post.likesCount != oldWidget.post.likesCount ||
        widget.post.likedByCurrentUser != oldWidget.post.likedByCurrentUser) {
      _syncStateWithWidget();
    }
  }

  void _syncStateWithWidget() {
    _isLiked = widget.post.likedByCurrentUser ?? false;
    _likesCount = widget.post.likesCount ?? 0;
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
    final content = widget.post.text ?? '';
    final textToShow = _expanded || content.length < 100
        ? content
        : '${content.substring(0, 100)}...';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.feedContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info
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
                        if (widget.post.isBookmarked ?? false)
                          Assets.images.savedPost.svg(width: 28, height: 28)
                        else
                          Assets.images.savePost.svg(width: 28, height: 28),
                        const SizedBox(width: 8),
                        Text(
                          widget.post.isBookmarked ?? false
                              ? 'Unsave Post'
                              : 'Save Post',
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

          // Media
          _buildMedia(widget.post.media),
          const VerticalSpacing(12),

          // Content
          Text(textToShow, style: const TextStyle(color: Colors.white)),
          if (content.length > 100)
            TextButton(
              onPressed: () => setState(() => _expanded = !_expanded),
              child: Text(
                _expanded ? 'See Less' : 'See More',
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          const VerticalSpacing(12),
          const GreyDivider(),
          const VerticalSpacing(12),

          // Action bar
          Row(
            children: [
              // Like button
              GestureDetector(
                onTap: _handleLikeToggle,
                child: Icon(
                  _isLiked ? Icons.favorite : Icons.favorite_border,
                  color: _isLiked ? Colors.red : Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                _formatCount(_likesCount),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 16),

              // Comment button
              Obx(
                () => GestureDetector(
                  onTap: _navigateToComments,
                  child: Row(
                    children: [
                      Assets.images.comment
                          .svg(height: 20, width: 20, fit: BoxFit.cover),
                      const SizedBox(width: 4),
                      Text(
                        _formatCount(
                          controller.commentsModel[widget.post.id?.toString()]
                                  ?.data?.comments?.length ??
                              0,
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Share button
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

              // Save button
              GestureDetector(
                onTap: () =>
                    controller.toggleSave(widget.post.id?.toString() ?? ''),
                child: widget.post.isBookmarked ?? false
                    ? Assets.images.savedPost.svg(width: 22, height: 22)
                    : Assets.images.savePost.svg(width: 22, height: 22),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Handle like toggle with optimistic update
  Future<void> _handleLikeToggle() async {
    // Store current state for potential rollback
    final previousIsLiked = _isLiked;
    final previousLikesCount = _likesCount;

    // Optimistically update local state
    setState(() {
      _isLiked = !_isLiked;
      _likesCount = _isLiked ? _likesCount + 1 : _likesCount - 1;
    });

    try {
      // Call controller to toggle like on the backend
      await controller.toggleLike(widget.post.id?.toString() ?? '');
      // Update widget.post if necessary (assuming controller updates the posts list)
      // If controller updates the posts list reactively, this may not be needed
    } catch (e) {
      // Revert on failure
      setState(() {
        _isLiked = previousIsLiked;
        _likesCount = previousLikesCount;
      });
      // Optionally show error message
      Get.snackbar(
        'Error',
        'Failed to toggle like: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Widget _buildMedia(dynamic media) {
    // Handle null case
    if (media == null) {
      return const SizedBox.shrink();
    }

    // Handle new Media class
    if (media is Media) {
      final allMedia = [
        ...(media.images?.map((url) => {'url': url, 'type': 'image'}) ?? []),
        ...(media.documents?.map((url) => {'url': url, 'type': 'document'}) ??
            []),
        ...(media.videos?.map((url) => {'url': url, 'type': 'video'}) ?? []),
      ];

      if (allMedia.isEmpty) return const SizedBox.shrink();

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
          itemCount: allMedia.length,
          itemBuilder: (context, index) {
            return _buildSingleMedia(allMedia[index]);
          },
        ),
      );
    }

    // Handle old List<String> case (for groupPostModel or backward compatibility)
    if (media is List) {
      final allMedia = media
          .whereType<String>()
          .map((url) => {'url': url, 'type': 'image'})
          .toList();

      if (allMedia.isEmpty) return const SizedBox.shrink();

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
          itemCount: allMedia.length,
          itemBuilder: (context, index) {
            return _buildSingleMedia(allMedia[index]);
          },
        ),
      );
    }

    // Fallback for unexpected types
    return const SizedBox.shrink();
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
          ),
        );
      case 'document':
        return GestureDetector(
          onTap: () {
            // Implement document viewer or open URL
            // Example: launchUrl(Uri.parse(url));
          },
          child: ClipRRect(
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
          ),
        );
      case 'video':
        return GestureDetector(
          onTap: () {
            // Implement video player or open URL
            // Example: launchUrl(Uri.parse(url));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: Colors.grey[800],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.play_circle, color: Colors.white, size: 40),
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
        controller.toggleSave(widget.post.id?.toString() ?? '');
      case 'hide':
        _showHideConfirmation();
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
    Get.to(
      () => CommentScreen(
        userName: widget.post.createdBy?.fullName ?? 'Unknown',
        timeAgo: formatDateTime(widget.post.createdAt),
        content: widget.post.text ?? '',
        imageUrls: widget.post.media is Media
            ? widget.post.media.images ?? []
            : widget.post.media is List
                ? List<String>.from(widget.post.media)
                : [],
        isLiked: _isLiked, // Use local state
        postId: widget.post.id?.toString() ?? '',
        likesCount: _likesCount, // Use local state
      ),
    );
  }
}
