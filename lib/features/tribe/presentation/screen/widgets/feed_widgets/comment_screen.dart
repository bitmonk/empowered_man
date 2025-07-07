import 'package:empowered/core/extension/extensions.dart';

import 'package:empowered/features/tribe/data/model/comment_section_model.dart';
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';

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

  List<Comment> comments = [
    Comment(
      id: '1',
      userName: 'Luke Willis',
      timeAgo: '10:30 AM',
      content:
          'This is placeholder text only, intended for visual demonstration purposes only.',
      isLiked: true,
      likeCount: 10,
      replies: [
        Reply(
          id: '1-1',
          userName: 'Jane Doe',
          timeAgo: '10:35 AM',
          content: 'Great point! I totally agree with you.',
          isLiked: false,
          likeCount: 2,
        ),
      ],
    ),
    Comment(
      id: '2',
      userName: 'Luke Willis',
      timeAgo: '10:30 AM',
      content:
          'This is placeholder text only, intended for visual demonstration purposes only.',
      isLiked: false,
      likeCount: 10,
      replies: [],
    ),
    Comment(
      id: '3',
      userName: 'Luke Willis',
      timeAgo: '9:30 AM',
      content:
          'This is placeholder text only, intended for visual demonstration purposes only.',
      isLiked: false,
      likeCount: 10,
      replies: [
        Reply(
          id: '3-1',
          userName: 'Alex Smith',
          timeAgo: '9:35 AM',
          content: 'Interesting perspective!',
          isLiked: true,
          likeCount: 5,
        ),
        Reply(
          id: '3-2',
          userName: 'Sarah Johnson',
          timeAgo: '9:40 AM',
          content: 'Thanks for sharing this!',
          isLiked: false,
          likeCount: 1,
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    isPostLiked = widget.isLiked;
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

  // void _sendMessage() {
  //   if (_inputController.text.trim().isEmpty) return;

  //   if (replyingToCommentId != null) {
  //     // Send reply
  //     final newReply = Reply(
  //       id: '$replyingToCommentId-${DateTime.now().millisecondsSinceEpoch}',
  //       userName: 'You', // Replace with actual user name
  //       timeAgo: 'now',
  //       content: _inputController.text.trim(),
  //       isLiked: false,
  //       likeCount: 0,
  //     );

  //     setState(() {
  //       final commentIndex =
  //           comments.indexWhere((c) => c.id == replyingToCommentId);
  //       if (commentIndex != -1) {
  //         comments[commentIndex].replies.add(newReply);
  //       }
  //     });

  //     _cancelReply();
  //   } else {
  //     // Send comment
  //     final newComment = Comment(
  //       id: DateTime.now().millisecondsSinceEpoch.toString(),
  //       userName: 'You', // Replace with actual user name
  //       timeAgo: 'now',
  //       content: _inputController.text.trim(),
  //       isLiked: false,
  //       likeCount: 0,
  //       replies: [],
  //     );

  //     setState(() {
  //       comments.add(newComment);
  //     });

  //     _inputController.clear();
  //   }
  // }
  void _sendMessage() {
    if (_inputController.text.trim().isEmpty) return;

    if (replyingToCommentId != null) {
      // Send reply via controller
      controller.replyToComment(
        replyingToCommentId!,
        customReply: _inputController.text.trim(),
      );
      _cancelReply();
    } else {
      // Send comment via controller
      controller.commentOnPost(
        widget.postId,
        customComment: _inputController.text.trim(),
      );
      _inputController.clear();
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
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildOriginalPost(),
                const SizedBox(height: 16),
                ...comments.map((comment) => _buildCommentWithReplies(comment)),
              ],
            ),
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
                        Text('Save Post',
                            style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'hide',
                    child: Row(
                      children: [
                        Icon(Icons.visibility_off_outlined,
                            color: Colors.white,),
                        SizedBox(width: 8),
                        Text('Hide Post',
                            style: TextStyle(color: Colors.white),),
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
          // Action bar
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPostLiked = !isPostLiked;
                  });
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
                  const Text('425', style: TextStyle(color: Colors.white)),
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
          if (comment.replies.isNotEmpty) ...[
            const SizedBox(height: 8),
            ...comment.replies.map((reply) => _buildReply(
                reply, comment.id, comment.userName, comment.content,),),
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
          child: Assets.images.leaderProfile.image(
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
                    comment.userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    comment.timeAgo,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                comment.content,
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
                      setState(() {
                        comment.isLiked = !comment.isLiked;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          comment.isLiked
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: comment.isLiked ? Colors.red : Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${comment.likeCount}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12,),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () => _startReply(
                        comment.id, comment.userName, comment.content,),
                    child: const Text(
                      'Reply',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  if (comment.replies.isNotEmpty) ...[
                    const SizedBox(width: 16),
                    Text(
                      '${comment.replies.length} ${comment.replies.length == 1 ? 'reply' : 'replies'}',
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

  Widget _buildReply(Reply reply, String parentCommentId, String parentUserName,
      String parentContent,) {
    return Container(
      margin: const EdgeInsets.only(left: 40, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Assets.images.leaderProfile.image(
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
                      reply.userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      reply.timeAgo,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  reply.content,
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
                        setState(() {
                          reply.isLiked = !reply.isLiked;
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            reply.isLiked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: reply.isLiked ? Colors.red : Colors.white,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${reply.likeCount}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 11,),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () => _startReply(
                          parentCommentId, reply.userName, reply.content,),
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
          // Reply context (only show when replying)
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
          // Input field
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

