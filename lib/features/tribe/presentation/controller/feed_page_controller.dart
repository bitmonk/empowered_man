import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:empowered/features/tribe/data/model/comment_replies_model.dart';
import 'package:empowered/features/tribe/data/model/feed_media_model.dart';
import 'package:empowered/features/tribe/data/model/feed_posts_model.dart';
import 'package:empowered/features/tribe/data/model/post_comments_model.dart';
import 'package:empowered/features/tribe/data/source/feed_page_remote_source.dart';
import 'package:empowered/features/tribe/presentation/controller/tribe_group_controller.dart';
import 'package:share_plus/share_plus.dart';

class FeedPageController extends GetxController {
  // Pagination state for replies and nested replies
  final RxMap<String, int> replyCurrentPage = <String, int>{}.obs;
  final RxMap<String, bool> isLoadingMoreReplies = <String, bool>{}.obs;
  final RxMap<String, bool> hasMoreReplies = <String, bool>{}.obs;
  final int repliesPerPage = 5;
  FeedPageController({required this.remoteSource});

  final FeedPageRemoteSource remoteSource;

  final RxInt currentTabIndex = 0.obs;
  final RxList<Post> posts = <Post>[].obs;
  final RxList<Post> savedPosts = <Post>[].obs;
  Rx<FeedMediaModel> feedMediaModel = const FeedMediaModel().obs;
  final RxBool isLoading = false.obs;
  final RxBool isSharing = false.obs;
  StreamSubscription? _linkSubscription;
  final Rx<TheStates> feedState = TheStates.initial.obs;
  final Rx<TheStates> feedMediaState = TheStates.initial.obs;
  final Rx<TheStates> createPostState = TheStates.initial.obs;
  final Rx<TheStates> commentState = TheStates.initial.obs;
  final Rx<TheStates> getRepliesState = TheStates.initial.obs;

  // Data
  final Rx<FeedPostsModel> feedPosts = const FeedPostsModel().obs;
  final RxList<String> selectedMedia = <String>[].obs;
  final RxMap<String, String> selectedMediaTypes = <String, String>{}.obs;
  Rx<XFile?> selectedImage = Rx<XFile?>(null);

  // Comment and reply data
  final RxMap<String, PostCommentsModel> commentsModel =
      <String, PostCommentsModel>{}.obs;
  final RxMap<String, CommentRepliesModel> repliesModel =
      <String, CommentRepliesModel>{}.obs;

  // Expanded and loading states
  final RxSet<String> expandedComments = <String>{}.obs;
  final RxSet<String> expandedReplies = <String>{}.obs;
  final RxSet<String> expandedNestedReplies = <String>{}.obs;
  final RxSet<String> loadingReplies = <String>{}.obs;

  // Form controllers
  final TextEditingController postTextController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final TextEditingController replyController = TextEditingController();

  // Error messages
  String? feedError;
  String? createPostError;

  // Deep linking instance
  late AppLinks _appLinks;

  // Tab names
  final List<String> tabs = ['Post', 'About', 'Media', 'Saved'];
  final RxString currentGroupId = ''.obs;

  // Pagination state for comments per post
  final RxMap<String, int> commentCurrentPage = <String, int>{}.obs;
  final RxMap<String, bool> isLoadingMoreComments = <String, bool>{}.obs;
  final RxMap<String, bool> hasMoreComments = <String, bool>{}.obs;
  final int commentsPerPage = 10;

  // Pagination state for feed posts
  final RxInt currentFeedPage = 1.obs;
  final RxInt lastFeedPage = 1.obs;
  final RxBool isLoadingMorePosts = false.obs;
  final int feedPostsPerPage = 10;

  // Pagination state for feed media
  final RxInt currentFeedMediaPage = 1.obs;
  final RxInt lastFeedMediaPage = 1.obs;
  final RxBool isLoadingMoreFeedMedia = false.obs;
  // final int feedMediaPerPage = 15;

  @override
  void onInit() {
    super.onInit();
    _initializeDeepLinks();
    loadFeedPosts();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    postTextController.dispose();
    commentController.dispose();
    replyController.dispose();
    super.dispose();
  }

  void initializeWithGroupId(String groupId) {
    currentGroupId.value = groupId;
    loadFeedPosts();
  }

  // Add media with type
  void addMedia(String path, String type) {
    selectedMedia.add(path);
    selectedMediaTypes[path] = type;
  }

  // Clear post form
  void clearPostForm() {
    postTextController.clear();
    selectedMedia.clear();
    selectedMediaTypes.clear();
  }

  Future<void> loadFeedPosts({
    int page = 1,
    bool append = false,
  }) async {
    try {
      if (!append) feedState.value = TheStates.loading;
      if (!append) feedError = null;
      if (!append) currentFeedPage.value = 1;
      if (!append) lastFeedPage.value = 1;
      if (append) isLoadingMorePosts.value = true;

      final result =
          await remoteSource.getFeedPosts(page: page, limit: feedPostsPerPage);

      result.fold(
        (error) {
          if (!append) feedState.value = TheStates.error;
          feedError = error.message;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (postsModel) {
          if (!append) feedState.value = TheStates.success;
          feedPosts.value = postsModel;
          final newPosts = postsModel.data?.posts ?? [];
          if (append) {
            // Ensure posts is always mutable before adding
            posts.value = List<Post>.from(posts);
            posts.addAll(newPosts);
          } else {
            posts.value = List<Post>.from(newPosts);
          }
          // Update pagination
          final meta = postsModel.data?.meta;
          if (meta != null) {
            currentFeedPage.value = meta.currentPage ?? page;
            lastFeedPage.value = meta.lastPage ?? page;
          } else {
            currentFeedPage.value = page;
            lastFeedPage.value = page;
          }
        },
      );
    } catch (e) {
      if (!append) feedState.value = TheStates.error;
      feedError = 'Failed to load feed posts: $e';
      AppUtils.showErrorSnackbar(message: feedError!);
    } finally {
      if (append) isLoadingMorePosts.value = false;
    }
  }

  Future<void> fetchNextFeedPostsPage() async {
    if (isLoadingMorePosts.value) return;
    if (currentFeedPage.value >= lastFeedPage.value) return;
    await loadFeedPosts(page: currentFeedPage.value + 1, append: true);
  }

  // Add this method to toggle comment expansion
  void toggleCommentExpansion(String commentId) {
    if (expandedComments.contains(commentId)) {
      expandedComments.remove(commentId);
    } else {
      expandedComments.add(commentId);
    }
    expandedComments.refresh();
  }

  void updateCommentLike(String commentId, bool isLiked, int likeCount) {
    final comments = commentsModel.values
        .expand((model) => model.data?.comments ?? [])
        .toList();
    final comment =
        comments.firstWhereOrNull((c) => c.id.toString() == commentId);
    if (comment != null) {
      comment.likesCount = likeCount;
      // Optionally, set a flag if you track liked state separately
      // comment.isLiked = isLiked;
    }
    commentsModel.refresh();
  }

  Future<void> loadSavedPosts() async {
    try {
      feedState.value = TheStates.loading;
      feedError = null;

      final result = await remoteSource.getFeedPosts();

      result.fold(
        (error) {
          feedState.value = TheStates.error;
          feedError = error.message;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (postsModel) {
          feedState.value = TheStates.success;
          savedPosts.value = postsModel.data?.posts ?? [];
          print('Fetched saved posts: ${savedPosts.length}');
        },
      );
    } catch (e) {
      feedState.value = TheStates.error;
      feedError = 'Failed to load saved posts: $e';
      AppUtils.showErrorSnackbar(message: feedError!);
    }
  }

  Future<void> getFeedMedia({int page = 1, bool append = false}) async {
    print('[DEBUG] getFeedMedia called: page=$page, append=$append');
    try {
      if (!append) feedMediaState.value = TheStates.loading;
      if (!append) feedError = null;
      if (!append) currentFeedMediaPage.value = 1;
      if (!append) lastFeedMediaPage.value = 1;
      if (append) isLoadingMoreFeedMedia.value = true;

      final result = await remoteSource.getFeedMedia(page: page);

      result.fold(
        (l) {
          if (!append) feedMediaState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) {
          if (!append) feedMediaState.value = TheStates.success;
          if (append) {
            // Append new media to existing list
            final existing = feedMediaModel.value.data?.medias ?? [];
            final newMedia = r.data?.medias ?? [];
            print(
                '[DEBUG] Appending media: existing=${existing.length}, new=${newMedia.length}');
            final allMedia = [...existing, ...newMedia];
            final updatedModel = r.copyWith(
              data: r.data?.copyWith(medias: allMedia),
            );
            feedMediaModel.value = updatedModel;
          } else {
            print('[DEBUG] Setting media: new=${r.data?.medias?.length ?? 0}');
            feedMediaModel.value = r;
          }
          // Update pagination
          final meta = r.data?.meta;
          if (meta != null) {
            int _parseInt(dynamic v, int fallback) {
              if (v is int) return v;
              if (v is String) return int.tryParse(v) ?? fallback;
              return fallback;
            }

            currentFeedMediaPage.value = _parseInt(meta.currentPage, page);
            lastFeedMediaPage.value = _parseInt(meta.lastPage, page);
            print(
                '[DEBUG] meta: currentPage=${meta.currentPage}, lastPage=${meta.lastPage}');
          } else {
            currentFeedMediaPage.value = page;
            lastFeedMediaPage.value = page;
          }
        },
      );
    } catch (e) {
      if (!append) feedMediaState.value = TheStates.error;
      feedError = 'Failed to load feed media: $e';
      AppUtils.showErrorSnackbar(message: feedError!);
    } finally {
      if (append) isLoadingMoreFeedMedia.value = false;
    }
  }

  Future<void> fetchNextFeedMediaPage() async {
    print(
        '[DEBUG] fetchNextFeedMediaPage: current=${currentFeedMediaPage.value}, last=${lastFeedMediaPage.value}, isLoadingMore=${isLoadingMoreFeedMedia.value}');
    if (isLoadingMoreFeedMedia.value) return;
    if (currentFeedMediaPage.value >= lastFeedMediaPage.value) return;
    await getFeedMedia(page: currentFeedMediaPage.value + 1, append: true);
  }

  // Reset pagination for a post
  void resetCommentPagination(String postId) {
    commentCurrentPage[postId] = 1;
    hasMoreComments[postId] = true;
  }

  // Fetch comments for a post, with pagination and append option
  Future<void> getPostComments({
    required String postId,
    bool append = false,
  }) async {
    try {
      if (!append) {
        commentState.value = TheStates.loading;
        resetCommentPagination(postId);
      }
      final page = commentCurrentPage[postId] ?? 1;
      final result = await remoteSource.getComments(
        postId: postId,
        page: page,
        limit: commentsPerPage,
      );
      result.fold(
        (l) {
          if (!append) commentState.value = TheStates.error;
          feedError = l.message;
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) {
          if (!append) {
            commentState.value = TheStates.success;
            commentsModel[postId] = r;
          } else {
            // Append new comments to existing list
            final existing = commentsModel[postId]?.data?.comments ?? [];
            final newComments = r.data?.comments ?? [];
            final allComments = [...existing, ...newComments];
            final updatedModel = r.copyWith(
              data: r.data?.copyWith(comments: allComments),
            );
            commentsModel[postId] = updatedModel;
          }
          commentsModel.refresh();
          // Update pagination state
          final total = r.data?.meta?.total ?? 0;
          final loaded = commentsModel[postId]?.data?.comments?.length ?? 0;
          if (loaded >= total) {
            hasMoreComments[postId] = false;
          } else {
            hasMoreComments[postId] = true;
            commentCurrentPage[postId] = page + 1;
          }
        },
      );
    } catch (e) {
      if (!append) commentState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: feedError ?? 'An error occurred');
    } finally {
      if (append) isLoadingMoreComments[postId] = false;
    }
  }

  // Fetch next page of comments for a post
  Future<void> fetchNextCommentsPage(String postId) async {
    if (isLoadingMoreComments[postId] == true ||
        hasMoreComments[postId] == false) return;
    isLoadingMoreComments[postId] = true;
    await getPostComments(postId: postId, append: true);
  }

  Future<void> getCommentReplies({required String commentId}) async {
    await getCommentRepliesPaginated(
        commentId: commentId, page: 1, append: false);
  }

  Future<void> getCommentRepliesPaginated({
    required String commentId,
    int page = 1,
    bool append = false,
  }) async {
    try {
      loadingReplies.add(commentId);
      getRepliesState.value = TheStates.loading;

      final result = await remoteSource.getCommentReplies(
        commentId: commentId,
        page: page,
        limit: repliesPerPage,
      );

      result.fold(
        (l) {
          getRepliesState.value = TheStates.error;
          loadingReplies.remove(commentId);
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) {
          getRepliesState.value = TheStates.success;
          if (append && repliesModel.containsKey(commentId)) {
            // Merge new replies with existing
            final existing = repliesModel[commentId];
            final existingList = existing?.repliesData?.comments ?? [];
            final newList = r.repliesData?.comments ?? [];
            final merged = [...existingList, ...newList];
            final updatedRepliesData =
                r.repliesData?.copyWith(comments: merged);
            repliesModel[commentId] =
                r.copyWith(repliesData: updatedRepliesData);
          } else {
            repliesModel[commentId] = r;
          }
          // Update pagination state
          replyCurrentPage[commentId] = page;
          final total = r.repliesData?.meta?.total ?? 0;
          final loaded = r.repliesData?.comments?.length ?? 0;
          hasMoreReplies[commentId] = loaded < total;
          loadingReplies.remove(commentId);
          repliesModel.refresh();
        },
      );
    } catch (e) {
      getRepliesState.value = TheStates.error;
      loadingReplies.remove(commentId);
      AppUtils.showErrorSnackbar(message: feedError ?? 'An error occurred');
    } finally {
      loadingReplies.refresh();
    }
  }

  void toggleReplies(String commentId) {
    if (expandedReplies.contains(commentId)) {
      expandedReplies.remove(commentId);
      expandedReplies.refresh();
    } else {
      Future.microtask(() async {
        expandedReplies.add(commentId);
        await getCommentReplies(commentId: commentId);
        expandedReplies.refresh();
      });
    }
  }

  void toggleNestedReplies(String replyId) {
    if (expandedNestedReplies.contains(replyId)) {
      expandedNestedReplies.remove(replyId);
      expandedNestedReplies.refresh();
    } else {
      Future.microtask(() async {
        expandedNestedReplies.add(replyId);
        await getCommentReplies(commentId: replyId);
        expandedNestedReplies.refresh();
      });
    }
  }

  Future<void> createPost({
    required String text,
    required List<String> media,
    required String groupId,
    BuildContext? context,
  }) async {
    if (text.isEmpty && media.isEmpty) {
      AppUtils.showErrorSnackbar(message: 'Please add some content or media');
      return;
    }

    try {
      createPostState.value = TheStates.loading;
      createPostError = null;

      final mediaWithTypes = media.map((path) {
        return {
          'path': path,
          'type': selectedMediaTypes[path] ?? 'image',
        };
      }).toList();

      final result = await remoteSource.createPost(
        groupId: groupId,
        text: text.isNotEmpty ? text : null,
        media: media.isNotEmpty ? mediaWithTypes : null,
      );

      result.fold(
        (l) {
          createPostState.value = TheStates.error;
          createPostError = l.message;
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) async {
          createPostState.value = TheStates.success;
          AppUtils.showSnackbar(
            message: r.message ?? 'Post created successfully',
          );
          clearPostForm();
          final tribeController = Get.find<TribeGroupController>();
          await tribeController.loadPostDetails(groupId);
          final newPost = tribeController.groupPostModel.value.data?.posts
              ?.firstWhereOrNull((post) => post.id == r.data?.post?.id);
          if (newPost != null) {
            await getPostComments(postId: newPost.id?.toString() ?? '');
          }
          if (context != null) {
            Navigator.pop(context);
          } else {
            print('Warning: Context is null, cannot pop screen');
            Get.back();
          }
        },
      );
    } catch (e) {
      createPostState.value = TheStates.error;
      createPostError = 'Failed to create post: $e';
      AppUtils.showErrorSnackbar(message: createPostError!);
    } finally {
      createPostState.value = TheStates.initial;
    }
  }

  Future<void> toggleLike(String postId) async {
    try {
      posts.refresh();

      final result = await remoteSource.likePost(postId: postId);

      result.fold(
        (error) {
          posts.refresh();
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (message) {
          // AppUtils.showSnackbar(message: message);
          loadFeedPosts();
        },
      );
    } catch (e) {
      posts.refresh();
      AppUtils.showErrorSnackbar(message: 'Failed to like post: $e');
    }
  }

  Future<void> toggleCommentLike(String commentId, String postId) async {
    try {
      final result = await remoteSource.likeComment(commentId: commentId);

      result.fold(
        (error) {
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (message) {
          AppUtils.showSnackbar(message: message);
          // Defer the refresh to avoid build conflicts
          // Future.microtask(() => getPostComments(postId: postId));
        },
      );
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to like comment: $e');
    }
  }

  Future<void> toggleReplyLike(String commentId) async {
    try {
      final result = await remoteSource.likeComment(commentId: commentId);

      result.fold(
        (error) {
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (message) {
          // AppUtils.showSnackbar(message: message);
          // Defer the refresh to avoid build conflicts
          Future.microtask(() => getCommentReplies(commentId: commentId));
        },
      );
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to like reply: $e');
    }
  }

  Future<void> toggleSave(String postId) async {
    try {
      final result = await remoteSource.savePost(postId: postId);

      result.fold(
        (error) {
          posts.refresh();
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (message) {
          AppUtils.showSnackbar(message: message);
          // loadFeedPosts();
          loadSavedPosts();
        },
      );
    } catch (e) {
      posts.refresh();
      AppUtils.showErrorSnackbar(message: 'Failed to save post: $e');
    }
  }

  Future<void> hidePost(String postId) async {
    try {
      final result = await remoteSource.hidePost(postId: postId);

      result.fold(
        (error) {
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (message) {
          AppUtils.showSnackbar(message: message);
          loadFeedPosts();
        },
      );
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to hide post: $e');
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      final result = await remoteSource.deletePost(postId: postId);
      result.fold(
        (error) {
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (message) {
          AppUtils.showSnackbar(message: message);
          loadFeedPosts();
        },
      );
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to delete post: $e');
    }
  }

  Rx<TheStates> deleteCommentState = TheStates.initial.obs;
  Rx<TheStates> deleteReplyState = TheStates.initial.obs;
  Rx<TheStates> deleteNestedReplyState = TheStates.initial.obs;
  Rx<TheStates> editCommentState = TheStates.initial.obs;
  Rx<TheStates> editReplyState = TheStates.initial.obs;
  Rx<TheStates> editNestedReplyState = TheStates.initial.obs;

  Future<void> deleteComment(String commentId) async {
    try {
      deleteCommentState.value = TheStates.loading;
      final result = await remoteSource.deleteComment(commentId: commentId);
      result.fold(
        (l) {
          deleteCommentState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) {
          deleteCommentState.value = TheStates.success;
          AppUtils.showSnackbar(message: r);
          loadFeedPosts();
        },
      );
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to delete post: $e');
    }
  }

  Future<void> deleteReply(String replyId, String parentCommentId) async {
    try {
      deleteReplyState.value = TheStates.loading;
      final result = await remoteSource.deleteComment(commentId: replyId);
      result.fold(
        (l) {
          deleteReplyState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) async {
          deleteReplyState.value = TheStates.success;
          AppUtils.showSnackbar(message: r);
          // Refresh replies for the parent comment
          await getCommentReplies(commentId: parentCommentId);
        },
      );
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to delete reply: $e');
    }
  }

  Future<void> deleteNestedReply(
      String nestedReplyId, String parentReplyId) async {
    try {
      deleteNestedReplyState.value = TheStates.loading;
      final result = await remoteSource.deleteComment(commentId: nestedReplyId);
      result.fold(
        (l) {
          deleteNestedReplyState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) async {
          deleteNestedReplyState.value = TheStates.success;
          AppUtils.showSnackbar(message: r);
          // Refresh nested replies for the parent reply
          await getCommentReplies(commentId: parentReplyId);
        },
      );
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to delete nested reply: $e');
    }
  }

  Future<void> editComment({
    required String commentId,
    required String text,
    required String postId,
  }) async {
    try {
      editCommentState.value = TheStates.loading;
      final result =
          await remoteSource.editCommet(commentId: commentId, text: text);
      result.fold(
        (l) {
          editCommentState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) async {
          editCommentState.value = TheStates.success;
          AppUtils.showSnackbar(message: r);
          await getPostComments(postId: postId);
        },
      );
    } catch (e) {
      editCommentState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to edit comment: $e');
    }
  }

  Future<void> editReply({
    required String replyId,
    required String text,
    required String parentCommentId,
  }) async {
    try {
      editReplyState.value = TheStates.loading;
      final result =
          await remoteSource.editCommet(commentId: replyId, text: text);
      result.fold(
        (l) {
          editReplyState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) async {
          editReplyState.value = TheStates.success;
          AppUtils.showSnackbar(message: r);
          await getCommentReplies(commentId: parentCommentId);
        },
      );
    } catch (e) {
      editReplyState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to edit reply: $e');
    }
  }

  Future<void> editNestedReply({
    required String nestedReplyId,
    required String text,
    required String parentReplyId,
  }) async {
    try {
      editNestedReplyState.value = TheStates.loading;
      final result =
          await remoteSource.editCommet(commentId: nestedReplyId, text: text);
      result.fold(
        (l) {
          editNestedReplyState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) async {
          editNestedReplyState.value = TheStates.success;
          AppUtils.showSnackbar(message: r);
          await getCommentReplies(commentId: parentReplyId);
        },
      );
    } catch (e) {
      editNestedReplyState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to edit nested reply: $e');
    }
  }

  Future<void> commentOnPost(String postId, {String? customComment}) async {
    final comment = customComment ?? commentController.text.trim();

    if (comment.isEmpty) {
      AppUtils.showErrorSnackbar(message: 'Please enter a comment');
      return;
    }

    try {
      final result = await remoteSource.commentPost(
        postId: postId,
        comment: comment,
      );

      result.fold(
        (error) {
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (message) {
          AppUtils.showSnackbar(message: message);
          if (customComment == null) {
            commentController.clear();
          }
          getPostComments(postId: postId);
        },
      );
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to comment: $e');
    }
  }

  Future<void> replyToComment(
    String commentId, {
    String? customReply,
    String? refreshRepliesFor,
  }) async {
    final reply = customReply ?? replyController.text.trim();

    if (reply.isEmpty) {
      AppUtils.showErrorSnackbar(message: 'Please enter a reply');
      return;
    }

    try {
      final result = await remoteSource.replyComment(
        postId: commentId,
        comment: reply,
      );

      result.fold(
        (error) {
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (message) async {
          AppUtils.showSnackbar(message: message);
          if (customReply == null) {
            replyController.clear();
          }
          // Refresh the parent comment's replies or the specified thread
          if (refreshRepliesFor != null) {
            await getCommentReplies(commentId: refreshRepliesFor);
            // Ensure nested replies are also refreshed if expanded
            if (expandedNestedReplies.contains(commentId)) {
              await getCommentReplies(commentId: commentId);
            }
          } else {
            await getCommentReplies(commentId: commentId);
          }
        },
      );
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to reply: $e');
    }
  }

  void _initializeDeepLinks() {
    _appLinks = AppLinks();
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (Uri uri) {
        _handleDeepLink(uri.toString());
      },
      onError: (err) {
        print('Deep link error: $err');
      },
    );
    _handleInitialLink();
  }

  Future<void> _handleInitialLink() async {
    try {
      final initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        _handleDeepLink(initialUri.toString());
      }
    } catch (e) {
      print('Failed to get initial link: $e');
    }
  }

  void _handleDeepLink(String link) {
    print('Received deep link: $link');
    final uri = Uri.parse(link);
    if (uri.pathSegments.length >= 2 && uri.pathSegments[0] == 'post-detail') {
      final postId = uri.pathSegments[1];
      _navigateToPost(postId);
    }
  }

  void _navigateToPost(String postId) {
    final postIndex = posts.indexWhere((post) => post.id?.toString() == postId);
    if (postIndex != -1) {
      _showPostDetails(posts[postIndex]);
    } else {
      AppUtils.showErrorSnackbar(message: 'Post not found in current feed');
    }
  }

  void _showPostDetails(Post post) {
    Get.dialog(
      AlertDialog(
        title: Text('Post by ${post.createdBy?.fullName ?? 'Unknown'}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.text ?? ''),
            const SizedBox(height: 8),
            Text(
              '${post.likesCount ?? 0} likes • ${post.commentsCount ?? 0} comments',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void changeTab(int index) {
    currentTabIndex.value = index;
    if (index == 0) {
      loadFeedPosts();
    } else if (index == 3) {
      loadSavedPosts();
    }
  }

  Future<void> sharePost(dynamic post) async {
    try {
      isSharing.value = true;
      final postId = post.id?.toString();
      if (postId == null) {
        AppUtils.showErrorSnackbar(message: 'Invalid post ID');
        return;
      }

      final deepLink = 'https://empoweredman/post-detail/$postId';
      final shareContent = _buildShareContent(
        userName: post.createdBy?.fullName ?? 'Unknown',
        content: post.text ?? '',
        likesCount: post.likesCount ?? 0,
        commentsCount: post.commentsCount ?? 0,
        deepLink: deepLink,
      );

      await Share.share(
        shareContent,
        subject: "${post.createdBy?.fullName ?? 'User'}'s Post on EmpoweredMan",
      );

      AppUtils.showSnackbar(message: 'Post shared successfully!');
    } catch (e) {
      print('Error sharing post: $e');
      AppUtils.showErrorSnackbar(message: 'Failed to share post: $e');
    } finally {
      isSharing.value = false;
    }
  }

  String _buildShareContent({
    required String userName,
    required String content,
    required int likesCount,
    required int commentsCount,
    required String deepLink,
  }) {
    final buffer = StringBuffer()
      ..writeln('📱 Check out this post from $userName on EmpoweredMan!')
      ..writeln()
      ..writeln(
        '"${content.length > 200 ? '${content.substring(0, 200)}...' : content}"',
      )
      ..writeln()
      ..writeln('👍 $likesCount likes • 💬 $commentsCount comments')
      ..writeln()
      ..writeln('📱 Open in EmpoweredMan app:')
      ..writeln(deepLink)
      ..writeln()
      ..writeln('Download EmpoweredMan app for the best experience!');

    return buffer.toString();
  }

  bool get isUserCoach {
    return Get.find<ProfileController>().userProfile.value.isCoach ?? false;
  }

  String get userFullName {
    return Get.find<ProfileController>().userProfile.value.fullName ?? '';
  }

  String get userProfile {
    return Get.find<ProfileController>().userProfile.value.image ?? '';
  }
}
