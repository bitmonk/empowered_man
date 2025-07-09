import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:empowered/features/tribe/data/model/feed_posts_model.dart';
import 'package:empowered/features/tribe/data/model/group_post_model.dart';
import 'package:empowered/features/tribe/data/model/post_comments_model.dart';
import 'package:empowered/features/tribe/data/source/feed_page_remote_source.dart';
import 'package:share_plus/share_plus.dart';
import 'package:get/get.dart';

class FeedPageController extends GetxController {
  FeedPageController({required this.remoteSource});

  final FeedPageRemoteSource remoteSource;

  final RxInt currentTabIndex = 0.obs;
  final RxList<Post> posts = <Post>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isSharing = false.obs;
  StreamSubscription? _linkSubscription;
  final Rx<TheStates> feedState = TheStates.initial.obs;
  final Rx<TheStates> createPostState = TheStates.initial.obs;

  // Data
  final Rx<FeedPostsModel> feedPosts = const FeedPostsModel().obs;
  final RxList<String> selectedMedia = <String>[].obs;
  Rx<XFile?> selectedImage = Rx<XFile?>(null);

  final RxString currentGroupId = ''.obs;

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

  @override
  void onInit() {
    super.onInit();
    _initializeDeepLinks();
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

  Future<void> loadFeedPosts() async {
    if (currentGroupId.value.isEmpty) {
      feedState.value = TheStates.error;
      feedError = 'Group ID is required';
      AppUtils.showErrorSnackbar(message: feedError!);
      return;
    }

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
          feedPosts.value = postsModel;
          posts.value = postsModel.data?.feedPosts?.posts ?? [];
          print('Fetched posts: ${posts.length}');
          print(
              'Fetched saved posts: ${postsModel.data?.feedPosts?.savedPosts?.length ?? 0}');
        },
      );
    } catch (e) {
      feedState.value = TheStates.error;
      feedError = 'Failed to load feed posts: $e';
      AppUtils.showErrorSnackbar(message: feedError!);
    }
  }

  Future<void> createPost({
    required String text,
    required List<String> media,
    required String groupId,
  }) async {
    if (text.isEmpty && media.isEmpty) {
      AppUtils.showErrorSnackbar(message: 'Please add some content or media');
      return;
    }

    if (currentGroupId.value.isEmpty) {
      AppUtils.showErrorSnackbar(message: 'Group ID is required');
      return;
    }

    try {
      createPostState.value = TheStates.loading;
      createPostError = null;

      final result = await remoteSource.createPost(
        groupId: groupId,
        text: text.isNotEmpty ? text : null,
        media: media.isNotEmpty ? media : null,
      );

      result.fold(
        (error) {
          createPostState.value = TheStates.error;
          createPostError = error.message;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (response) {
          createPostState.value = TheStates.success;
          AppUtils.showSnackbar(
            message: response.message ?? 'Post created successfully',
          );
          postTextController.clear();
          selectedMedia.clear();
          loadFeedPosts();
          Get.back(); // Navigate back after successful post
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
          AppUtils.showSnackbar(message: message);
        },
      );
    } catch (e) {
      posts.refresh();
      AppUtils.showErrorSnackbar(message: 'Failed to like post: $e');
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
          loadFeedPosts(); // Refresh to update savedPosts
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

  final RxMap<String, PostCommentsModel> commentsModel =
      <String, PostCommentsModel>{}.obs;
  Rx<TheStates> commentState = TheStates.initial.obs;

  Future<void> getPostComments({required String postId}) async {
    try {
      commentState.value = TheStates.loading;

      final result = await remoteSource.getComments(postId: postId);

      result.fold(
        (l) {
          commentState.value = TheStates.error;
          feedError = l.message;
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) {
          commentState.value = TheStates.success;
          commentsModel[postId] = r;
        },
      );
    } catch (e) {
      commentState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: feedError ?? 'An error occurred');
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
          loadFeedPosts();
        },
      );
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to comment: $e');
    }
  }

  Future<void> likeComment(String commentId) async {
    try {
      final result = await remoteSource.likeComment(postId: commentId);

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
      AppUtils.showErrorSnackbar(message: 'Failed to like comment: $e');
    }
  }

  Future<void> replyToComment(String commentId, {String? customReply}) async {
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
        (message) {
          AppUtils.showSnackbar(message: message);
          if (customReply == null) {
            replyController.clear();
          }
          loadFeedPosts();
        },
      );
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to reply: $e');
    }
  }

  void clearPostForm() {
    postTextController.clear();
    selectedMedia.clear();
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
  }

  Future<void> sharePost(GroupPost post) async {
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
          '"${content.length > 200 ? '${content.substring(0, 200)}...' : content}"')
      ..writeln()
      ..writeln('👍 $likesCount likes • 💬 $commentsCount comments')
      ..writeln()
      ..writeln('📱 Open in EmpoweredMan app:')
      ..writeln(deepLink)
      ..writeln()
      ..writeln('Download EmpoweredMan app for the best experience!');

    return buffer.toString();
  }

  List<Post> get savedPosts {
    final savedPostsList = feedPosts.value.data?.feedPosts?.savedPosts;
    print('Saved posts list: $savedPostsList'); // Debug log
    return savedPostsList ?? [];
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
