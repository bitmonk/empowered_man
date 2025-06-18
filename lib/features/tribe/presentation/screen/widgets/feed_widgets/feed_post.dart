import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/comment_screen.dart';

class FeedPost extends StatefulWidget {
  const FeedPost({
    required this.post,
    required this.postIndex,
    super.key,
  });

  final Map<String, dynamic> post;
  final int postIndex;

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

  @override
  Widget build(BuildContext context) {
    final content = widget.post['content'] ?? '';
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
                child: Assets.images.leaderProfile.image(
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
                      widget.post['userName'] ?? '',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      widget.post['timeAgo'] ?? '',
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
                onSelected: (value) => _handleMenuAction(value),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'save',
                    child: Row(
                      children: [
                        Icon(
                          widget.post['isSaved'] == true
                              ? Icons.bookmark
                              : Icons.bookmark_outline,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.post['isSaved'] == true
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
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'report',
                    child: Row(
                      children: [
                        Icon(Icons.report_outlined, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Report Post',
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

          // Content
          Text(textToShow, style: const TextStyle(color: Colors.white)),
          if (content.length > 100)
            TextButton(
              onPressed: () {
                setState(() => _expanded = !_expanded);
              },
              child: Text(
                _expanded ? 'See Less' : 'See More',
                style: const TextStyle(color: Colors.blue),
              ),
            ),

          // Images
          if (widget.post['imageUrls'] != null &&
              (widget.post['imageUrls'] as List).isNotEmpty)
            const SizedBox(height: 8),
          _buildImages(List<String>.from(widget.post['imageUrls'] ?? [])),

          const VerticalSpacing(12),
          const GreyDivider(),
          const VerticalSpacing(12),

          // Action bar
          Row(
            children: [
              // Like button
              GestureDetector(
                onTap: () => controller.toggleLike(widget.postIndex),
                child: Icon(
                  widget.post['isLiked'] == true
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: widget.post['isLiked'] == true
                      ? Colors.red
                      : Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                _formatCount(widget.post['likesCount'] ?? 0),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 16),

              // Comment button
              GestureDetector(
                onTap: () => _navigateToComments(),
                child: Row(
                  children: [
                    Assets.images.comment.svg(
                      height: 20,
                      width: 20,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatCount(widget.post['commentsCount'] ?? 0),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
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
                onTap: () => controller.toggleSave(widget.postIndex),
                child: Icon(
                  widget.post['isSaved'] == true
                      ? Icons.bookmark
                      : Icons.bookmark_outline,
                  color: widget.post['isSaved'] == true
                      ? Colors.orange
                      : Colors.white,
                  size: 20,
                ),
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
        child: Image.asset(
          urls.first,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: urls
            .map(
              (url) => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  url,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
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
        controller.toggleSave(widget.postIndex);
      case 'hide':
        _showHideConfirmation();

      case 'report':
        controller.reportPost(widget.post['id'] ?? '');
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
              controller.hidePost(widget.post['id'] ?? '');
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
        userName: widget.post['userName'] ?? '',
        timeAgo: widget.post['timeAgo'] ?? '',
        content: widget.post['content'] ?? '',
        imageUrls: List<String>.from(widget.post['imageUrls'] ?? []),
        isLiked: widget.post['isLiked'] ?? false,
      ),
    );
  }
}
