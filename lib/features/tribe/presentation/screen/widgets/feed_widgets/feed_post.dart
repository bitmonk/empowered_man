import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/comment_screen.dart';
import 'package:intl/intl.dart';

class FeedPost extends StatefulWidget {
  const FeedPost({
    required this.post,
    super.key,
  });

  final dynamic post; // Post from group_post_model.dart

  @override
  State<FeedPost> createState() => _FeedPostState();
}

class _FeedPostState extends State<FeedPost> {
  bool _expanded = false;
  late final FeedPageController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<FeedPageController>();
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
                    ? Image.network(
                        widget.post.createdBy!.image!,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
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
                        Icon(Icons.visibility_off_outlined,
                            color: Colors.white),
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

          // Images
          if (widget.post.media != null && widget.post.media!.isNotEmpty)
            const SizedBox(height: 8),
          _buildImages(widget.post.media ?? []),
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
                onTap: () =>
                    controller.toggleLike(widget.post.id?.toString() ?? ''),
                child: Icon(
                  widget.post.likedByCurrentUser ?? false
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: widget.post.likedByCurrentUser ?? false
                      ? Colors.red
                      : Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                _formatCount(widget.post.likesCount ?? 0),
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

  Widget _buildImages(List<String> urls) {
    if (urls.isEmpty) return const SizedBox.shrink();

    if (urls.length == 1) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          urls.first,
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
        ),
      );
    } else if (urls.length == 2) {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: urls
            .map(
              (url) => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  url,
                  width: MediaQuery.of(context).size.width / 2 - 35,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox.shrink(),
                ),
              ),
            )
            .toList(),
      );
    } else {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: urls
            .map(
              (url) => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  url,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox.shrink(),
                ),
              ),
            )
            .toList(),
      );
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
        imageUrls: widget.post.media ?? [],
        isLiked: widget.post.likedByCurrentUser ?? false,
        postId: widget.post.id?.toString() ?? '',
      ),
    );
  }
}
