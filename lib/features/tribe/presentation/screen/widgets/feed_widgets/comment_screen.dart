import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tribe/data/model/post_comments_model.dart';
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';
import 'package:intl/intl.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({
    required this.userName,
    required this.timeAgo,
    required this.content,
    required this.imageUrls,
    required this.isLiked,
    required this.postId,
    super.key,
  });

  final String userName;
  final String timeAgo;
  final String content;
  final List<String> imageUrls;
  final bool isLiked;
  final String postId;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final FeedPageController controller = Get.find<FeedPageController>();
  final TextEditingController _inputController = TextEditingController();
  final FocusNode _inputFocusNode = FocusNode();
  late bool isPostLiked;
  String? replyingToCommentId;
  String? replyingToUserName;
  String? replyingToContent;

  @override
  void initState() {
    super.initState();
    isPostLiked = widget.isLiked;
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
      controller.replyToComment(
        replyingToCommentId!,
        customReply: _inputController.text.trim(),
      );
      _cancelReply();
    } else {
      controller.commentOnPost(
        widget.postId,
        customComment: _inputController.text.trim(),
      );
      _inputController.clear();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              } else if (controller
                      .commentsModel[widget.postId]?.data?.comments?.isEmpty ??
                  true) {
                return const Center(
                  child: Text(
                    'No comments yet',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              final comments =
                  controller.commentsModel[widget.postId]?.data?.comments ?? [];
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildOriginalPost(),
                  const SizedBox(height: 16),
                  ...comments
                      .map((comment) => _buildCommentWithReplies(comment)),
                ],
              );
            }),
          ),
          _buildInputSection(),
        ],
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
                      widget.userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.timeAgo,
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
                    const Text('7.5K', style: TextStyle(color: Colors.white)),
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
                      controller.commentsModel[widget.postId]?.data?.meta?.total
                              .toString() ??
                          '0',
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

  Widget _buildCommentWithReplies(Comment comment) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          _buildComment(comment),
          if (comment.replys?.isNotEmpty ?? false) ...[
            const SizedBox(height: 8),
            ...comment.replys!.map((reply) => _buildReply(
                  reply as Comment,
                  comment.id.toString(),
                  comment.user?.fullName ?? 'Unknown',
                  comment.text ?? '',
                )),
          ],
        ],
      ),
    );
  }

  Widget _buildComment(Comment comment) {
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
                  Text(
                    comment.user?.fullName ?? 'Unknown',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _formatDateTime(comment.createdAt),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                comment.text ?? '',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.toggleLike(comment.id.toString());
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
                          '${comment.likesCount ?? 0}',
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
                      comment.id.toString(),
                      comment.user?.fullName ?? 'Unknown',
                      comment.text ?? '',
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
                  if (comment.replys?.isNotEmpty ?? false) ...[
                    const SizedBox(width: 16),
                    Text(
                      '${comment.replys!.length} ${comment.replys!.length == 1 ? 'reply' : 'replies'}',
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReply(Comment reply, String parentCommentId,
      String parentUserName, String parentContent) {
    return Container(
      margin: const EdgeInsets.only(left: 40, bottom: 8),
      child: Row(
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
                    Text(
                      reply.user?.fullName ?? 'Unknown',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _formatDateTime(reply.createdAt),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
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
                        controller.toggleLike(reply.id.toString());
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
                            '${reply.likesCount ?? 0}',
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
                        parentCommentId,
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
                child: Assets.images.chatUserPicOne.image(
                  height: 32,
                  width: 32,
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
