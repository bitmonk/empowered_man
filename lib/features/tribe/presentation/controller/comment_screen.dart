import 'package:video_thumbnail/video_thumbnail.dart';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:empowered/features/tribe/data/model/post_comments_model.dart'
    as post_comments;
import 'package:empowered/features/tribe/data/model/comment_replies_model.dart'
    as comment_replies;
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/media_viewer.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({
    required this.userName,
    required this.timeAgo,
    required this.content,
    required this.media,
    required this.isLiked,
    required this.postId,
    required this.likesCount,
    super.key,
  });

  final String userName;
  final String timeAgo;
  final String content;
  final List<Map<String, dynamic>> media;
  final bool isLiked;
  final String postId;
  final int likesCount;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final RxInt replyLikeUpdateTrigger = 0.obs;
  final FeedPageController controller = Get.find<FeedPageController>();
  final TextEditingController _inputController = TextEditingController();
  final FocusNode _inputFocusNode = FocusNode();
  late bool isPostLiked;
  late int likesCount;
  String? replyingToCommentId;
  String? replyingToUserName;
  String? replyingToContent;
  String? parentReplyId;

  final RxMap<String, bool> commentLikeStates = <String, bool>{}.obs;
  final RxMap<String, int> commentLikeCounts = <String, int>{}.obs;
  final RxSet<String> expandedComments = <String>{}.obs;

  @override
  void initState() {
    super.initState();
    isPostLiked = widget.isLiked;
    likesCount = widget.likesCount;
    controller.getPostComments(postId: widget.postId).then((_) {
      final comments =
          controller.commentsModel[widget.postId]?.data?.comments ?? [];
      for (var comment in comments) {
        final commentId = comment.id.toString();
        commentLikeCounts[commentId] = comment.likesCount ?? 0;
        commentLikeStates[commentId] = (comment.likesCount ?? 0) > 0;
      }
      commentLikeCounts.refresh();
      commentLikeStates.refresh();
    });
  }

  @override
  void dispose() {
    _inputController.dispose();
    _inputFocusNode.dispose();
    super.dispose();
  }

  void _startReply(String commentId, String userName, String content,
      {String? parentId}) {
    setState(() {
      replyingToCommentId = commentId;
      replyingToUserName = userName;
      replyingToContent = content;
      parentReplyId = parentId;
    });
    _inputController.clear();
    _inputFocusNode.requestFocus();
  }

  void _cancelReply() {
    setState(() {
      replyingToCommentId = null;
      replyingToUserName = null;
      replyingToContent = null;
      parentReplyId = null;
    });
    _inputController.clear();
    _inputFocusNode.unfocus();
  }

  void _sendMessage() {
    if (_inputController.text.trim().isEmpty) return;

    if (replyingToCommentId != null) {
      controller
          .replyToComment(
        replyingToCommentId!,
        customReply: _inputController.text.trim(),
      )
          .then((_) async {
        String targetId = parentReplyId ?? replyingToCommentId!;
        controller.repliesModel.remove(targetId);
        controller.repliesModel.refresh();
        await controller.getPostComments(postId: widget.postId);
        await controller.getCommentReplies(commentId: targetId);
        if (parentReplyId != null) {
          controller.expandedNestedReplies.add(parentReplyId!);
        } else {
          controller.expandedReplies.add(replyingToCommentId!);
        }
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
        controller.commentsModel.refresh();
        _inputController.clear();
      });
    }
  }

  void _toggleCommentLike(String commentId, int currentLikes, bool isLiked) {
    commentLikeStates[commentId] = !isLiked;
    commentLikeCounts[commentId] =
        isLiked ? (currentLikes - 1) : (currentLikes + 1);
    commentLikeStates.refresh();
    commentLikeCounts.refresh();
    replyLikeUpdateTrigger.value++;
    controller.toggleCommentLike(commentId, widget.postId);
  }

  void _toggleReplyLike(
    String replyId,
    int currentLikes,
    bool isLiked, {
    String? parentCommentId,
  }) {
    commentLikeStates[replyId] = !isLiked;
    commentLikeCounts[replyId] =
        isLiked ? (currentLikes - 1) : (currentLikes + 1);
    commentLikeStates.refresh();
    commentLikeCounts.refresh();
    replyLikeUpdateTrigger.value++;
    controller.toggleReplyLike(replyId);
  }

  void _toggleReplies(String commentId, bool isExpanded) {
    if (isExpanded) {
      controller.expandedReplies.remove(commentId);
    } else {
      controller.loadingReplies.add(commentId);
      controller.getCommentReplies(commentId: commentId).then((_) {
        controller.loadingReplies.remove(commentId);
        controller.expandedReplies.add(commentId);
      });
    }
  }

  void _toggleNestedReplies(String replyId, bool isExpanded) {
    if (isExpanded) {
      controller.expandedNestedReplies.remove(replyId);
    } else {
      controller.loadingReplies.add(replyId);
      controller.getCommentReplies(commentId: replyId).then((_) {
        controller.loadingReplies.remove(replyId);
        controller.expandedNestedReplies.add(replyId);
      });
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
                  if (value == 'save') {
                    controller.toggleSave(widget.postId);
                  } else if (value == 'hide') {
                    controller.hidePost(widget.postId);
                  }
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
          const SizedBox(height: 12),
          const GreyDivider(),
          const SizedBox(height: 12),
          Text(
            widget.content,
            style: const TextStyle(color: Colors.white),
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
          ),
          if (widget.media.isNotEmpty) ...[
            const SizedBox(height: 12),
            _buildMedia(widget.media),
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
              GestureDetector(
                onTap: () {
                  final post = controller.posts.firstWhereOrNull(
                      (p) => p.id?.toString() == widget.postId);
                  if (post != null) {
                    controller.sharePost(post);
                  }
                },
                child: Assets.images.sharePop.image(
                  height: 20,
                  width: 20,
                  fit: BoxFit.cover,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => controller.toggleSave(widget.postId),
                child: Assets.images.savePost.svg(
                  height: 20,
                  width: 20,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMedia(List<Map<String, dynamic>> media) {
    return SizedBox(
      height: media.length == 1 ? 200 : 120,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: media.length == 1 ? 1 : (media.length == 2 ? 2 : 3),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: media.length == 1 ? 16 / 9 : 1,
        ),
        itemCount: media.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _openMediaViewer(media, index),
            child: _buildSingleMedia(media[index]),
          );
        },
      ),
    );
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
      case 'gif':
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

  Widget _buildCommentWithReplies(post_comments.Comment comment) {
    return Obx(() {
      final commentId = comment.id.toString();
      final hasReplies =
          comment.commentsCount != null && comment.commentsCount! > 0;
      final isRepliesExpanded = controller.expandedReplies.contains(commentId);
      final isLoadingReplies = controller.loadingReplies.contains(commentId);
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
                  onTap: () => _toggleReplies(commentId, isRepliesExpanded),
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
      final isLiked = commentLikeStates[commentId] ?? false;
      final likeCount = commentLikeCounts[commentId] ?? 0;

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
                      onTap: () =>
                          _toggleCommentLike(commentId, likeCount, isLiked),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? Colors.red : Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _formatCount(likeCount),
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
    if (!commentLikeCounts.containsKey(replyId)) {
      commentLikeCounts[replyId] = reply.likesCount ?? 0;
      commentLikeStates[replyId] = (reply.likesCount ?? 0) > 0;
    }
    return Obx(() {
      replyLikeUpdateTrigger.value;
      final nestedReplies =
          controller.repliesModel[replyId]?.repliesData?.comments ?? [];
      final isLiked = commentLikeStates[replyId] ?? false;
      final likeCount = commentLikeCounts[replyId] ?? 0;
      final isNestedRepliesExpanded =
          controller.expandedNestedReplies.contains(replyId);
      final isLoadingNestedReplies =
          controller.loadingReplies.contains(replyId);
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
                            onTap: () => _toggleReplyLike(
                              replyId,
                              likeCount,
                              isLiked,
                              parentCommentId: parentCommentId,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isLiked ? Colors.red : Colors.white,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  _formatCount(likeCount),
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
                              parentId: parentCommentId,
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
            if (hasNestedReplies) ...[
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: GestureDetector(
                  onTap: () =>
                      _toggleNestedReplies(replyId, isNestedRepliesExpanded),
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
    final replyId = nestedReply.id.toString();
    if (!commentLikeCounts.containsKey(replyId)) {
      commentLikeCounts[replyId] = nestedReply.likesCount ?? 0;
      commentLikeStates[replyId] = (nestedReply.likesCount ?? 0) > 0;
    }
    return Obx(() {
      replyLikeUpdateTrigger.value;
      final isLiked = commentLikeStates[replyId] ?? false;
      final likeCount = commentLikeCounts[replyId] ?? 0;
      return Container(
        margin: const EdgeInsets.only(left: 80.0, bottom: 12),
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
                        onTap: () => _toggleReplyLike(
                          nestedReply.id.toString(),
                          likeCount,
                          isLiked,
                          parentCommentId: parentReplyId,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              color: isLiked ? Colors.red : Colors.white,
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _formatCount(likeCount),
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
                          parentId: parentReplyId,
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
    });
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
