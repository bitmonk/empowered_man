import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:empowered/features/tribe/data/model/post_comments_model.dart'
    as post_comments;
import 'package:empowered/features/tribe/data/model/comment_replies_model.dart'
    as comment_replies;
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({
    required this.userName,
    required this.timeAgo,
    required this.content,
    required this.imageUrls,
    required this.isLiked,
    required this.postId,
    required this.likesCount,
    super.key,
  });

  final String userName;
  final String timeAgo;
  final String content;
  final List<String> imageUrls;
  final bool isLiked;
  final String postId;
  final int likesCount;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final FeedPageController controller = Get.find<FeedPageController>();
  final TextEditingController _inputController = TextEditingController();
  final FocusNode _inputFocusNode = FocusNode();
  late bool isPostLiked;
  late int likesCount;
  String? replyingToCommentId;
  String? replyingToUserName;
  String? replyingToContent;

  // Track expanded states
  final RxSet<String> expandedComments =
      <String>{}.obs; // For comment text expansion
  final RxSet<String> expandedReplies = <String>{}.obs; // For reply visibility
  final RxSet<String> expandedNestedReplies =
      <String>{}.obs; // For nested reply visibility
  final RxSet<String> loadingReplies = <String>{}.obs; // For loading state

  String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    } else {
      return count.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    isPostLiked = widget.isLiked;
    likesCount = widget.likesCount;
    controller.getPostComments(postId: widget.postId);
  }

  @override
  void dispose() {
    _inputController.dispose();
    _inputFocusNode.dispose();
    super.dispose();
  }

  void _startReply(String commentId, String userName, String content) {
    setState(() {
      replyingToCommentId = commentId;
      replyingToUserName = userName;
      replyingToContent = content;
    });
    _inputController.clear();
    _inputFocusNode.requestFocus();
  }

  void _cancelReply() {
    setState(() {
      replyingToCommentId = null;
      replyingToUserName = null;
      replyingToContent = null;
    });
    _inputController.clear();
    _inputFocusNode.unfocus();
  }

  void _sendMessage() {
    if (_inputController.text.trim().isEmpty) return;

    if (replyingToCommentId != null) {
      print('Sending reply to comment ID: $replyingToCommentId');
      controller
          .replyToComment(
        replyingToCommentId!,
        customReply: _inputController.text.trim(),
      )
          .then((_) async {
        print('Refreshing comments for post ID: ${widget.postId}');
        await controller.getPostComments(postId: widget.postId);
        await controller.getCommentReplies(commentId: replyingToCommentId!);
        _cancelReply();
      });
    } else {
      controller
          .commentOnPost(
        widget.postId,
        customComment: _inputController.text.trim(),
      )
          .then((_) async {
        await controller.getPostComments(postId: widget.postId);
        _inputController.clear();
      });
    }
  }

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return 'N/A';
    try {
      return DateFormat.yMd().add_jm().format(dateTime.toLocal());
    } catch (e) {
      return 'N/A';
    }
  }

  bool _shouldShowMoreButton(String text, {int maxLines = 3}) {
    const avgCharsPerLine = 40;
    return text.length > (maxLines * avgCharsPerLine);
  }

  String _getTruncatedText(String text, {int maxLines = 3}) {
    const avgCharsPerLine = 40;
    final maxChars = maxLines * avgCharsPerLine;
    if (text.length <= maxChars) return text;
    return '${text.substring(0, maxChars)}...';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.devicePaddingBottom),
      child: Scaffold(
        backgroundColor: AppColors.bgMedium,
        appBar: AppBar(
          backgroundColor: AppColors.bgMedium,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          title: const Text(
            'Comments',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          centerTitle: false,
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (controller.commentState.value == TheStates.loading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  );
                } else if (controller.commentState.value == TheStates.error) {
                  return const Center(
                    child: Text(
                      'Error loading comments',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else if (controller.commentsModel[widget.postId]?.data
                        ?.comments?.isEmpty ??
                    true) {
                  return const Center(
                    child: Text(
                      'No comments yet',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                final comments =
                    controller.commentsModel[widget.postId]?.data?.comments ??
                        [];
                print('Comments loaded: ${comments.length}');
                return RefreshIndicator(
                  onRefresh: () =>
                      controller.getPostComments(postId: widget.postId),
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildOriginalPost(),
                      const SizedBox(height: 16),
                      ...comments
                          .map((comment) => _buildCommentWithReplies(comment)),
                    ],
                  ),
                );
              }),
            ),
            _buildInputSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildOriginalPost() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.feedContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: (widget.imageUrls.isNotEmpty &&
                        widget.imageUrls.first.isNotEmpty)
                    ? Image.network(
                        widget.imageUrls.first,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Assets.images.leaderProfile.image(
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Assets.images.leaderProfile.image(
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.timeAgo,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
                onSelected: (value) {
                  // Handle menu actions
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'save',
                    child: Row(
                      children: [
                        Icon(Icons.bookmark_outline, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Save Post',
                          style: TextStyle(color: Colors.white),
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
          const SizedBox(height: 12),
          const GreyDivider(),
          const SizedBox(height: 12),
          Text(
            widget.content,
            style: const TextStyle(color: Colors.white),
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
          ),
          if (widget.imageUrls.isNotEmpty) ...[
            const SizedBox(height: 12),
            _buildImages(widget.imageUrls),
          ],
          const SizedBox(height: 12),
          const GreyDivider(),
          const SizedBox(height: 12),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPostLiked = !isPostLiked;
                    likesCount = isPostLiked ? likesCount + 1 : likesCount - 1;
                  });
                  controller.toggleLike(widget.postId);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isPostLiked ? Icons.favorite : Icons.favorite_border,
                      color: isPostLiked ? Colors.red : Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatCount(likesCount),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.images.comment.svg(
                    height: 20,
                    width: 20,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 4),
                  Obx(
                    () => Text(
                      _formatCount(
                        controller.commentsModel[widget.postId]?.data?.meta
                                ?.total ??
                            0,
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Assets.images.sharePop.image(
                height: 20,
                width: 20,
                fit: BoxFit.cover,
                color: Colors.white,
              ),
              const Spacer(),
              Assets.images.savePost.svg(
                height: 20,
                width: 20,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImages(List<String> urls) {
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

  Widget _buildCommentWithReplies(post_comments.Comment comment) {
    return Obx(() {
      final commentId = comment.id.toString();
      final hasReplies =
          comment.commentsCount != null && comment.commentsCount! > 0;
      final isRepliesExpanded = expandedReplies.contains(commentId);
      final isLoadingReplies = loadingReplies.contains(commentId);

      // Get replies for this comment
      final replies =
          controller.repliesModel[commentId]?.repliesData?.comments ?? [];

      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildComment(comment),
            if (hasReplies) ...[
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: GestureDetector(
                  onTap: () async {
                    if (isRepliesExpanded) {
                      expandedReplies.remove(commentId);
                    } else {
                      loadingReplies.add(commentId);
                      await controller.getCommentReplies(commentId: commentId);
                      loadingReplies.remove(commentId);
                      expandedReplies.add(commentId);
                    }
                  },
                  child: isLoadingReplies
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white70),
                          ),
                        )
                      : Text(
                          isRepliesExpanded
                              ? 'Hide replies'
                              : 'View ${comment.commentsCount} ${comment.commentsCount == 1 ? 'reply' : 'replies'}',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
              ),
            ],
            if (isRepliesExpanded && replies.isNotEmpty) ...[
              const SizedBox(height: 8),
              ...replies.map((reply) => _buildReply(reply, commentId)),
            ],
          ],
        ),
      );
    });
  }

  Widget _buildComment(post_comments.Comment comment) {
    return Obx(() {
      final commentId = comment.id.toString();
      final isExpanded = expandedComments.contains(commentId);
      final commentText = comment.text ?? '';
      final shouldShowMore = _shouldShowMoreButton(commentText);

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: comment.user?.image != null
                ? Image.network(
                    comment.user!.image!,
                    height: 32,
                    width: 32,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Assets.images.leaderProfile.image(
                      height: 32,
                      width: 32,
                      fit: BoxFit.cover,
                    ),
                  )
                : Assets.images.leaderProfile.image(
                    height: 32,
                    width: 32,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        comment.user?.fullName ?? 'Unknown',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _formatDateTime(comment.createdAt),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  isExpanded ? commentText : _getTruncatedText(commentText),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                if (shouldShowMore) ...[
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      if (isExpanded) {
                        expandedComments.remove(commentId);
                      } else {
                        expandedComments.add(commentId);
                      }
                    },
                    child: Text(
                      isExpanded ? 'Show less' : 'Show more',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.toggleCommentLike(commentId);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            (comment.likesCount ?? 0) > 0
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: (comment.likesCount ?? 0) > 0
                                ? Colors.red
                                : Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _formatCount(comment.likesCount ?? 0),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () => _startReply(
                        commentId,
                        comment.user?.fullName ?? 'Unknown',
                        commentText,
                      ),
                      child: const Text(
                        'Reply',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _buildReply(comment_replies.Comment reply, String parentCommentId) {
    final replyId = reply.id.toString();
    final hasNestedReplies =
        reply.commentsCount != null && reply.commentsCount! > 0;
    final isNestedRepliesExpanded = expandedNestedReplies.contains(replyId);
    final isLoadingNestedReplies = loadingReplies.contains(replyId);

    return Obx(() {
      // Get nested replies for this reply
      final nestedReplies =
          controller.repliesModel[replyId]?.repliesData?.comments ?? [];

      return Container(
        margin: const EdgeInsets.only(left: 40.0, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: reply.user?.image != null
                      ? Image.network(
                          reply.user!.image!,
                          height: 28,
                          width: 28,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Assets.images.leaderProfile.image(
                            height: 28,
                            width: 28,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Assets.images.leaderProfile.image(
                          height: 28,
                          width: 28,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              reply.user?.fullName ?? 'Unknown',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _formatDateTime(reply.createdAt),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        reply.text ?? '',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.toggleReplyLike(reply.id.toString());
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  (reply.likesCount ?? 0) > 0
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: (reply.likesCount ?? 0) > 0
                                      ? Colors.red
                                      : Colors.white,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  _formatCount(reply.likesCount ?? 0),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          GestureDetector(
                            onTap: () => _startReply(
                              reply.id.toString(),
                              reply.user?.fullName ?? 'Unknown',
                              reply.text ?? '',
                            ),
                            child: const Text(
                              'Reply',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
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
            // Show nested replies button
            if (hasNestedReplies) ...[
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: GestureDetector(
                  onTap: () async {
                    if (isNestedRepliesExpanded) {
                      expandedNestedReplies.remove(replyId);
                    } else {
                      loadingReplies.add(replyId);
                      await controller.getCommentReplies(commentId: replyId);
                      loadingReplies.remove(replyId);
                      expandedNestedReplies.add(replyId);
                    }
                  },
                  child: isLoadingNestedReplies
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white70),
                          ),
                        )
                      : Text(
                          isNestedRepliesExpanded
                              ? 'Hide replies'
                              : 'View ${reply.commentsCount} ${reply.commentsCount == 1 ? 'reply' : 'replies'}',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
              ),
            ],
            // Show nested replies if expanded
            if (isNestedRepliesExpanded && nestedReplies.isNotEmpty) ...[
              const SizedBox(height: 8),
              ...nestedReplies.map(
                  (nestedReply) => _buildNestedReply(nestedReply, replyId)),
            ],
          ],
        ),
      );
    });
  }

  Widget _buildNestedReply(
      comment_replies.Comment nestedReply, String parentReplyId) {
    return Container(
      margin: const EdgeInsets.only(
          left: 80.0, bottom: 12), // Indent further for nested replies
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: nestedReply.user?.image != null
                ? Image.network(
                    nestedReply.user!.image!,
                    height: 24,
                    width: 24,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Assets.images.leaderProfile.image(
                      height: 24,
                      width: 24,
                      fit: BoxFit.cover,
                    ),
                  )
                : Assets.images.leaderProfile.image(
                    height: 24,
                    width: 24,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        nestedReply.user?.fullName ?? 'Unknown',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _formatDateTime(nestedReply.createdAt),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  nestedReply.text ?? '',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.toggleReplyLike(nestedReply.id.toString());
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            (nestedReply.likesCount ?? 0) > 0
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: (nestedReply.likesCount ?? 0) > 0
                                ? Colors.red
                                : Colors.white,
                            size: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _formatCount(nestedReply.likesCount ?? 0),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () => _startReply(
                        nestedReply.id.toString(),
                        nestedReply.user?.fullName ?? 'Unknown',
                        nestedReply.text ?? '',
                      ),
                      child: const Text(
                        'Reply',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
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

  Widget _buildInputSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.feedContainer,
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.3),
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (replyingToCommentId != null) ...[
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: AppColors.bgMedium.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
                border: const Border(
                  left: BorderSide(
                    color: Colors.blue,
                    width: 3,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Replying to $replyingToUserName',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          replyingToContent ?? '',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: _cancelReply,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white70,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          Row(
            children: [
              ClipOval(
                child: controller.userProfile.isNotEmpty
                    ? Image.network(
                        controller.userProfile,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Assets.images.leaderProfile.image(
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Assets.images.leaderProfile.image(
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _inputController,
                  focusNode: _inputFocusNode,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: replyingToCommentId != null
                        ? 'Write a reply...'
                        : 'Write a comment...',
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: AppColors.bgMedium,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  maxLines: null,
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: _sendMessage,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
