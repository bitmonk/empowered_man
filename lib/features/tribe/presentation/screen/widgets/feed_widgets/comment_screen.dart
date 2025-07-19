import 'dart:io';

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
import 'package:timeago/timeago.dart' as timeago;

class CommentScreen extends StatefulWidget {
  const CommentScreen({
    required this.userName,
    required this.createdAt,
    required this.content,
    required this.media,
    required this.isLiked,
    required this.postId,
    required this.likesCount,
    required this.commentsCount,
    required this.isBookmarked,
    super.key,
  });

  final String userName;
  final DateTime createdAt;
  final String content;
  final List<Map<String, dynamic>> media;
  final bool isLiked;
  final String postId;
  final int likesCount;
  final int commentsCount;
  final bool isBookmarked;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  // Pagination state for replies and nested replies
  final RxMap<String, int> replyCurrentPage = <String, int>{}.obs;
  final RxMap<String, bool> isLoadingMoreReplies = <String, bool>{}.obs;
  final RxMap<String, bool> hasMoreReplies = <String, bool>{}.obs;
  final RxMap<String, int> nestedReplyCurrentPage = <String, int>{}.obs;
  final RxMap<String, bool> isLoadingMoreNestedReplies = <String, bool>{}.obs;
  final RxMap<String, bool> hasMoreNestedReplies = <String, bool>{}.obs;
  final FeedPageController controller = Get.find<FeedPageController>();
  final TextEditingController _inputController = TextEditingController();
  final FocusNode _inputFocusNode = FocusNode();
  late bool isPostLiked;
  late int likesCount;
  late bool isPostBookmarked;
  String? replyingToCommentId;
  String? replyingToUserName;
  String? replyingToContent;
  String? parentReplyId;

  // Like state for optimistic UI
  final RxMap<String, bool> commentLikeStates = <String, bool>{}.obs;
  final RxMap<String, int> commentLikeCounts = <String, int>{}.obs;
  final RxSet<String> expandedComments = <String>{}.obs;
  // final RxMap<String, int> visibleReplyCounts = <String, int>{}.obs;
  // final RxMap<String, bool> showViewMoreForReplies = <String, bool>{}.obs;
  final RxMap<String, int> visibleNestedReplyCounts = <String, int>{}.obs;
  final RxMap<String, bool> showViewMoreForNestedReplies = <String, bool>{}.obs;

  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    // Collapse all comments and replies on init
    expandedComments.clear();
    controller.expandedReplies.clear();
    controller.expandedNestedReplies.clear();
    isPostLiked = widget.isLiked;
    likesCount = widget.likesCount;
    isPostBookmarked = widget.isBookmarked;
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _initializeCommentData();
  }

  Future<void> _initializeCommentData() async {
    await controller.getPostComments(postId: widget.postId);
    final comments =
        controller.commentsModel[widget.postId]?.data?.comments ?? [];

    for (var comment in comments) {
      final commentId = comment.id.toString();
      commentLikeCounts[commentId] = comment.likesCount ?? 0;
      commentLikeStates.remove(commentId); // Clear local like state on refresh

      if (controller.repliesModel.containsKey(commentId)) {
        final replies =
            controller.repliesModel[commentId]?.repliesData?.comments ?? [];
        for (var reply in replies) {
          final replyId = reply.id.toString();
          commentLikeCounts[replyId] = reply.likesCount ?? 0;
          commentLikeStates
              .remove(replyId); // Clear local like state on refresh
        }
      }
    }
  }

  void _updateLikeDataForComments(List<dynamic> comments) {
    for (var comment in comments) {
      final commentId = comment.id.toString();
      commentLikeCounts[commentId] = comment.likesCount ?? 0;
      commentLikeStates[commentId] = comment.likedByCurrentUser ?? false;
    }
  }

  @override
  void dispose() {
    _inputController.dispose();
    _inputFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final threshold = 200.0;
    if (_scrollController.position.extentAfter < threshold) {
      // Try to load more comments if available
      final hasMore = controller.hasMoreComments[widget.postId] ?? false;
      final isLoading =
          controller.isLoadingMoreComments[widget.postId] ?? false;
      if (hasMore && !isLoading) {
        controller.fetchNextCommentsPage(widget.postId);
      }
    }
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

  Future<void> _sendMessage() async {
    if (_inputController.text.trim().isEmpty) return;

    if (replyingToCommentId != null) {
      await controller.replyToComment(
        replyingToCommentId!,
        customReply: _inputController.text.trim(),
      );

      String targetId = parentReplyId ?? replyingToCommentId!;
      controller.repliesModel.remove(targetId);

      await controller.getPostComments(postId: widget.postId);
      await controller.getCommentReplies(commentId: targetId);

      // Update like data for fetched replies
      final replies =
          controller.repliesModel[targetId]?.repliesData?.comments ?? [];
      _updateLikeDataForComments(replies);

      if (parentReplyId != null) {
        controller.expandedNestedReplies.add(parentReplyId!);
      } else {
        controller.expandedReplies.add(replyingToCommentId!);
      }
      _cancelReply();
    } else {
      await controller.commentOnPost(
        widget.postId,
        customComment: _inputController.text.trim(),
      );
      await controller.getPostComments(postId: widget.postId);
      _inputController.clear();
    }
  }

  void _toggleCommentLike(String commentId, int currentLikes, bool isLiked) {
    commentLikeStates[commentId] = !isLiked;
    commentLikeCounts[commentId] =
        isLiked ? (currentLikes - 1) : (currentLikes + 1);
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
    controller.toggleReplyLike(replyId);
  }

  void _toggleReplies(String commentId, bool isExpanded) {
    if (isExpanded) {
      controller.expandedReplies.remove(commentId);
    } else {
      controller.loadingReplies.add(commentId);
      // Always fetch latest replies from backend when expanding
      controller.getCommentReplies(commentId: commentId).then((_) {
        controller.loadingReplies.remove(commentId);
        controller.expandedReplies.add(commentId);
        // Update like data for fetched replies
        final replies =
            controller.repliesModel[commentId]?.repliesData?.comments ?? [];
        _updateLikeDataForComments(replies);
      });
    }
  }

  void _toggleNestedReplies(String replyId, bool isExpanded) {
    if (isExpanded) {
      controller.expandedNestedReplies.remove(replyId);
    } else {
      controller.loadingReplies.add(replyId);
      // Always fetch latest nested replies from backend when expanding
      controller.getCommentReplies(commentId: replyId).then((_) {
        controller.loadingReplies.remove(replyId);
        controller.expandedNestedReplies.add(replyId);
        // Initialize pagination state for nested replies
        nestedReplyCurrentPage[replyId] = 1;
        final repliesModel = controller.repliesModel[replyId];
        final total = repliesModel?.repliesData?.meta?.total ?? 0;
        final loaded = repliesModel?.repliesData?.comments?.length ?? 0;
        hasMoreNestedReplies[replyId] = loaded < total;
        // Update like data for fetched nested replies
        final nestedReplies =
            controller.repliesModel[replyId]?.repliesData?.comments ?? [];
        _updateLikeDataForComments(nestedReplies);
      });
    }
  }

  Future<void> _fetchNextNestedRepliesPage(String replyId) async {
    final currentPage = nestedReplyCurrentPage[replyId] ?? 1;
    isLoadingMoreNestedReplies[replyId] = true;
    await controller.getCommentRepliesPaginated(
      commentId: replyId,
      page: currentPage + 1,
      append: true,
    );
    // Update page and hasMore
    final repliesModel = controller.repliesModel[replyId];
    final total = repliesModel?.repliesData?.meta?.total ?? 0;
    final loaded = repliesModel?.repliesData?.comments?.length ?? 0;
    nestedReplyCurrentPage[replyId] = currentPage + 1;
    hasMoreNestedReplies[replyId] = loaded < total;
    isLoadingMoreNestedReplies[replyId] = false;
  }

  String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
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
      padding: EdgeInsets.only(
        bottom: Platform.isAndroid ? context.devicePaddingBottom : 0,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFF132534),
        appBar: AppBar(
          surfaceTintColor: const Color(0xFF132534),
          backgroundColor: const Color(0xFF132534),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          title: Row(
            children: [
              ClipOval(
                child: controller.userProfile.isNotEmpty
                    ? Image.network(
                        controller.userProfile,
                        width: 32,
                        height: 32,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Assets.images.leaderProfile.image(
                          width: 32,
                          height: 32,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Assets.images.leaderProfile.image(
                        width: 32,
                        height: 32,
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
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      timeago.format(widget.createdAt),
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
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
                  onRefresh: () async {
                    expandedComments.clear();
                    controller.expandedReplies.clear();
                    controller.expandedNestedReplies.clear();
                    controller.resetCommentPagination(widget.postId);
                    await controller.getPostComments(postId: widget.postId);
                    // After refresh, update like state/count maps for comments and replies
                    final comments = controller
                            .commentsModel[widget.postId]?.data?.comments ??
                        [];
                    for (var comment in comments) {
                      final commentId = comment.id.toString();
                      commentLikeCounts[commentId] = comment.likesCount ?? 0;
                      commentLikeStates.remove(commentId);
                      if (controller.repliesModel.containsKey(commentId)) {
                        final replies = controller.repliesModel[commentId]
                                ?.repliesData?.comments ??
                            [];
                        for (var reply in replies) {
                          final replyId = reply.id.toString();
                          commentLikeCounts[replyId] = reply.likesCount ?? 0;
                          commentLikeStates.remove(replyId);
                        }
                      }
                    }
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: _getListItemCount(comments),
                    itemBuilder: (context, index) {
                      // First items: post content, media, actions, divider
                      int offset = 0;
                      if (widget.content.isNotEmpty) {
                        if (index == offset) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.content,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                maxLines: 10,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 16),
                              const GreyDivider(),
                              const SizedBox(height: 16),
                            ],
                          );
                        }
                        offset++;
                      }
                      if (widget.media.isNotEmpty) {
                        if (index == offset) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildMedia(widget.media),
                              const SizedBox(height: 16),
                              const GreyDivider(),
                              const SizedBox(height: 16),
                            ],
                          );
                        }
                        offset++;
                      }
                      if (index == offset) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildPostActions(),
                            const SizedBox(height: 16),
                            const GreyDivider(),
                            const SizedBox(height: 16),
                          ],
                        );
                      }
                      offset++;
                      // Comments
                      final commentIndex = index - offset;
                      if (commentIndex < comments.length) {
                        return _buildCommentWithReplies(comments[commentIndex]);
                      }
                      // Loading indicator at the end
                      final isLoadingMore =
                          controller.isLoadingMoreComments[widget.postId] ??
                              false;
                      if (isLoadingMore) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
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
                      timeago.format(widget.createdAt),
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
                onTap: () async {
                  setState(() {
                    isPostBookmarked = !isPostBookmarked;
                  });
                  await controller.toggleSave(widget.postId);
                },
                child: isPostBookmarked
                    ? Assets.images.savedPost.svg(
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                      )
                    : Assets.images.savePost.svg(
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
    final additionalCount = media.length > 3 ? media.length - 3 : 0;

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
        itemCount: media.length > 3 ? 3 : media.length,
        itemBuilder: (context, index) {
          final isLast = index == 2 && additionalCount > 0;
          return Stack(
            children: [
              GestureDetector(
                onTap: () => _openMediaViewer(media, index),
                child: _buildSingleMedia(media[index]),
              ),
              if (isLast)
                GestureDetector(
                  onTap: () => _openMediaViewer(media, 0),
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
    final commentId = comment.id.toString();
    final hasReplies =
        comment.commentsCount != null && comment.commentsCount! > 0;

    return Obx(() {
      final isRepliesExpanded = controller.expandedReplies.contains(commentId);
      final isLoadingReplies = controller.loadingReplies.contains(commentId);
      final replies =
          controller.repliesModel[commentId]?.repliesData?.comments ?? [];
      final hasMore = controller.hasMoreReplies[commentId] ?? false;
      final effectiveHasMore =
          hasMore && replies.length < (comment.commentsCount ?? 0);

      print(
          'Comment $commentId: hasReplies=$hasReplies, repliesCount=${replies.length}, hasMore=$hasMore, effectiveHasMore=$effectiveHasMore');

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
              if (effectiveHasMore)
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 8),
                  child: TextButton(
                    onPressed: () async {
                      final nextPage =
                          (controller.replyCurrentPage[commentId] ?? 1) + 1;
                      print(
                          'Loading more replies for comment $commentId, page $nextPage');
                      await controller.getCommentRepliesPaginated(
                        commentId: commentId,
                        page: nextPage,
                        append: true,
                      );
                      final newReplies = controller
                              .repliesModel[commentId]?.repliesData?.comments ??
                          [];
                      _updateLikeDataForComments(newReplies);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'View More Replies',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ],
          ],
        ),
      );
    });
  }

  Widget _buildComment(post_comments.Comment comment) {
    final commentId = comment.id.toString();
    final commentText = comment.text ?? '';

    return GestureDetector(
      onLongPress: () {
        // Show edit/delete popup for comment
        _showCommentOptions(context, comment);
      },
      child: Obx(() {
        final isExpanded = expandedComments.contains(commentId);
        final shouldShowMore = _shouldShowMoreButton(commentText);
        // Use local like state if present, else fallback to likedByCurrentUser
        final isLiked = commentLikeStates.containsKey(commentId)
            ? commentLikeStates[commentId]!
            : (comment.likedByCurrentUser ?? false);
        final likeCount =
            commentLikeCounts[commentId] ?? comment.likesCount ?? 0;

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
                        comment.createdAt != null
                            ? DateFormat.jm()
                                .format(comment.createdAt!.toLocal())
                            : '',
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF121E29),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(14),
                          bottomLeft: Radius.circular(14),
                          bottomRight: Radius.circular(14),
                          // topLeft is not rounded
                        ),
                        border: Border.all(
                          color: const Color(0xFF1A2A3A),
                          width: 1.1,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: Text(
                        isExpanded
                            ? commentText
                            : _getTruncatedText(commentText),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
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
      }),
    );
  }

  // void _loadMoreReplies(String commentId, int totalReplies) {
  //   visibleReplyCounts[commentId] = (visibleReplyCounts[commentId] ?? 2) + 2;
  //   if (visibleReplyCounts[commentId]! >= totalReplies) {
  //     showViewMoreForReplies[commentId] = false;
  //   }
  // }

  Widget _buildReply(comment_replies.Comment reply, String parentCommentId) {
    final replyId = reply.id.toString();
    final hasNestedReplies =
        reply.commentsCount != null && reply.commentsCount! > 0;

    return GestureDetector(
      onLongPress: () {
        _showReplyOptions(context, reply);
      },
      child: Obx(() {
        final nestedReplies =
            controller.repliesModel[replyId]?.repliesData?.comments ?? [];
        final isNestedRepliesExpanded =
            controller.expandedNestedReplies.contains(replyId);
        final isLoadingNestedReplies =
            controller.loadingReplies.contains(replyId);
        final hasMore = hasMoreNestedReplies[replyId] ?? false;
        // Use local like state if present, else fallback to likedByCurrentUser
        final isLiked = commentLikeStates.containsKey(replyId)
            ? commentLikeStates[replyId]!
            : (reply.likedByCurrentUser ?? false);
        final likeCount = commentLikeCounts[replyId] ?? reply.likesCount ?? 0;

        return Container(
          margin: const EdgeInsets.only(left: 40, bottom: 12),
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
                              reply.createdAt != null
                                  ? DateFormat.jm()
                                      .format(reply.createdAt!.toLocal())
                                  : '',
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
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFF121E29),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                            ),
                            border: Border.all(
                              color: const Color(0xFF1A2A3A),
                              width: 1.1,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 14,
                          ),
                          child: Text(
                            reply.text ?? '',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
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
                                    size: 16,
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
                if (hasMore)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 90,
                    ),
                    child: Obx(() {
                      final isLoading =
                          isLoadingMoreNestedReplies[replyId] ?? false;
                      return TextButton(
                        onPressed: isLoading
                            ? null
                            : () => _fetchNextNestedRepliesPage(replyId),
                        child: isLoading
                            ? const SizedBox(
                                height: 16,
                                width: 16,
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Text(
                                'View more replies',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                      );
                    }),
                  ),
              ],
            ],
          ),
        );
      }),
    );
  }

  Widget _buildNestedReply(
      comment_replies.Comment nestedReply, String parentReplyId) {
    final replyId = nestedReply.id.toString();

    return GestureDetector(
      onLongPress: () {
        _showNestedReplyOptions(context, nestedReply);
      },
      child: Obx(() {
        // Use local like state if present, else fallback to likedByCurrentUser
        final isLiked = commentLikeStates.containsKey(replyId)
            ? commentLikeStates[replyId]!
            : (nestedReply.likedByCurrentUser ?? false);
        final likeCount =
            commentLikeCounts[replyId] ?? nestedReply.likesCount ?? 0;
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
                          nestedReply.createdAt != null
                              ? DateFormat.jm()
                                  .format(nestedReply.createdAt!.toLocal())
                              : '',
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF121E29),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(14),
                          bottomLeft: Radius.circular(14),
                          bottomRight: Radius.circular(14),
                        ),
                        border: Border.all(
                          color: const Color(0xFF1A2A3A),
                          width: 1.1,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                      child: Text(
                        nestedReply.text ?? '',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
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
                                isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
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
      }),
    );
  }

  Widget _buildPostActions() {
    return Row(
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
            Text(
              _formatCount(widget.commentsCount),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            final post = controller.posts
                .firstWhereOrNull((p) => p.id?.toString() == widget.postId);
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
          onTap: () async {
            setState(() {
              isPostBookmarked = !isPostBookmarked;
            });
            await controller.toggleSave(widget.postId);
          },
          child: isPostBookmarked
              ? Assets.images.savedPost.svg(
                  height: 20,
                  width: 20,
                  fit: BoxFit.cover,
                )
              : Assets.images.savePost.svg(
                  height: 20,
                  width: 20,
                  fit: BoxFit.cover,
                ),
        ),
      ],
    );
  }

  // Helper to get total item count for ListView.builder
  int _getListItemCount(List comments) {
    int count = comments.length;
    int offset = 1; // post actions
    if (widget.content.isNotEmpty) offset++;
    if (widget.media.isNotEmpty) offset++;
    // Add 1 for loading indicator if needed
    final isLoadingMore =
        controller.isLoadingMoreComments[widget.postId] ?? false;
    if (isLoadingMore) count++;
    return count + offset;
  }

  // Add this method to show edit/delete popup for replies
  void _showReplyOptions(BuildContext context, comment_replies.Comment reply) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit'),
                onTap: () {
                  Navigator.pop(context);
                  _showEditReplyDialog(reply);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title:
                    const Text('Delete', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.pop(context);
                  _confirmDeleteReply(reply);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Stub methods for reply edit/delete (implement as needed)
  void _showEditReplyDialog(comment_replies.Comment reply) {
    final TextEditingController editController =
        TextEditingController(text: reply.text ?? '');
    showDialog(
      context: Get.context!, // Use Get.context! to access the current context
      builder: (context) {
        bool isLoading = false;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppColors.feedContainer,
              title: const Text('Edit Reply',
                  style: TextStyle(color: Colors.white)),
              content: TextField(
                controller: editController,
                maxLines: null,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Edit your reply...',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: AppColors.bgMedium,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isLoading ? null : () => Navigator.pop(context),
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.white70)),
                ),
                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          final newText = editController.text.trim();
                          if (newText.isEmpty || newText == reply.text) return;
                          setState(() => isLoading = true);
                          // TODO: Call update reply API here
                          await Future.delayed(
                              const Duration(seconds: 1)); // Simulate network
                          setState(() => isLoading = false);
                          Navigator.pop(context);
                          // TODO: Refresh replies after update
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('Save',
                          style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _confirmDeleteReply(comment_replies.Comment reply) {
    // TODO: Implement delete reply confirmation
  }

  // Add this method to show edit/delete popup for comments
  void _showCommentOptions(
      BuildContext context, post_comments.Comment comment) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit'),
                onTap: () {
                  Navigator.pop(context);
                  _showEditCommentDialog(comment);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title:
                    const Text('Delete', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.pop(context);
                  _confirmDeleteComment(comment);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Stub methods for comment edit/delete (implement as needed)
  void _showEditCommentDialog(post_comments.Comment comment) {
    final TextEditingController editController =
        TextEditingController(text: comment.text ?? '');
    showDialog(
      context: Get.context!, // Use Get.context! to access the current context
      builder: (context) {
        bool isLoading = false;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppColors.feedContainer,
              title: const Text('Edit Comment',
                  style: TextStyle(color: Colors.white)),
              content: TextField(
                controller: editController,
                maxLines: null,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Edit your comment...',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: AppColors.bgMedium,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isLoading ? null : () => Navigator.pop(context),
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.white70)),
                ),
                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          final newText = editController.text.trim();
                          if (newText.isEmpty || newText == comment.text)
                            return;
                          setState(() => isLoading = true);
                          // TODO: Call update comment API here
                          await Future.delayed(
                              const Duration(seconds: 1)); // Simulate network
                          setState(() => isLoading = false);
                          Navigator.pop(context);
                          // TODO: Refresh comments after update
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('Save',
                          style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _confirmDeleteComment(post_comments.Comment comment) {
    // TODO: Implement delete comment confirmation
  }

  void _showNestedReplyOptions(
      BuildContext context, comment_replies.Comment nestedReply) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit'),
                onTap: () {
                  Navigator.pop(context);
                  _showEditNestedReplyDialog(nestedReply);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title:
                    const Text('Delete', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.pop(context);
                  _confirmDeleteNestedReply(nestedReply);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEditNestedReplyDialog(comment_replies.Comment nestedReply) {
    final TextEditingController editController =
        TextEditingController(text: nestedReply.text ?? '');
    showDialog(
      context: Get.context!, // Use Get.context! to access the current context
      builder: (context) {
        bool isLoading = false;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppColors.feedContainer,
              title: const Text('Edit Reply',
                  style: TextStyle(color: Colors.white)),
              content: TextField(
                controller: editController,
                maxLines: null,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Edit your reply...',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: AppColors.bgMedium,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isLoading ? null : () => Navigator.pop(context),
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.white70)),
                ),
                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          final newText = editController.text.trim();
                          if (newText.isEmpty || newText == nestedReply.text)
                            return;
                          setState(() => isLoading = true);
                          // TODO: Call update nested reply API here
                          await Future.delayed(
                              const Duration(seconds: 1)); // Simulate network
                          setState(() => isLoading = false);
                          Navigator.pop(context);
                          // TODO: Refresh nested replies after update
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('Save',
                          style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _confirmDeleteNestedReply(comment_replies.Comment nestedReply) {
    // TODO: Implement delete nested reply confirmation
  }
}
