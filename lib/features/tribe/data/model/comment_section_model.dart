class Comment {
  Comment({
    required this.id,
    required this.userName,
    required this.timeAgo,
    required this.content,
    required this.isLiked,
    required this.likeCount,
    required this.replies,
  });
  final String id;
  final String userName;
  final String timeAgo;
  final String content;
  bool isLiked;
  int likeCount;
  final List<Reply> replies;
}

class Reply {
  Reply({
    required this.id,
    required this.userName,
    required this.timeAgo,
    required this.content,
    required this.isLiked,
    required this.likeCount,
  });
  final String id;
  final String userName;
  final String timeAgo;
  final String content;
  bool isLiked;
  int likeCount;
}
