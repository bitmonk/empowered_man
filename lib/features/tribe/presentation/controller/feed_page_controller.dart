import 'dart:async';

import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:empowered/features/tribe/data/source/feed_page_remote_source.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:app_links/app_links.dart'; // Add this import
// Alternative: import 'package:uni_links/uni_links.dart' as uni_links;

class FeedPageController extends GetxController {
  FeedPageController({required this.remoteSource});

  final FeedPageRemoteSource remoteSource;

  final RxInt currentTabIndex = 0.obs;
  final RxList<Map<String, dynamic>> posts = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isSharing = false.obs;
  StreamSubscription? _linkSubscription;
  Rx<XFile?> selectedImage = Rx<XFile?>(null);

  // Deep linking instance
  late AppLinks _appLinks;

  // Tab names
  final List<String> tabs = ['Post', 'About', 'Media', 'Saved'];

  @override
  void onInit() {
    super.onInit();
    _initializePosts();
    _initializeDeepLinks();
  }

  @override
  void onClose() {
    _linkSubscription?.cancel();
    super.onClose();
  }

  void _initializeDeepLinks() {
    _appLinks = AppLinks();

    // Handle deep links when app is already running
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (Uri uri) {
        _handleDeepLink(uri.toString());
      },
      onError: (err) {
        print('Deep link error: $err');
      },
    );

    // Handle deep link when app is launched from a link
    _handleInitialLink();
  }

  Future<void> _handleInitialLink() async {
    try {
      final Uri? initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        _handleDeepLink(initialUri.toString());
      }
    } catch (e) {
      print('Failed to get initial link: $e');
    }
  }

  // Parse and handle deep links
  void _handleDeepLink(String link) {
    print('Received deep link: $link');

    // Parse the link to extract post ID
    final Uri uri = Uri.parse(link);

    // Expected format: https://empoweredman/post/{postId}
    if (uri.pathSegments.length >= 2 && uri.pathSegments[0] == 'post') {
      final String postId = uri.pathSegments[1];
      _navigateToPost(postId);
    }
  }

  // Navigate to specific post
  void _navigateToPost(String postId) {
    // Find the post in the current posts list
    final postIndex = posts.indexWhere((post) => post['id'] == postId);

    if (postIndex != -1) {
      // Post found in current feed, navigate to it
      _showPostDetails(posts[postIndex]);
    } else {
      // Post not in current feed, fetch it from API
      _fetchAndShowPost(postId);
    }
  }

  Future<void> _fetchAndShowPost(String postId) async {
    try {
      isLoading.value = true;

      // TODO: Implement API call to fetch specific post
      // final post = await remoteSource.getPostById(postId);

      // For now, show a placeholder
      Get.snackbar(
        'Post Loading',
        'Loading post with ID: $postId',
        snackPosition: SnackPosition.BOTTOM,
      );

      // You can navigate to a specific post detail page here
      // Get.toNamed('/post-detail', arguments: {'postId': postId});
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load post',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Show post details (you can customize this)
  void _showPostDetails(Map<String, dynamic> post) {
    Get.dialog(
      AlertDialog(
        title: Text('Post by ${post['userName']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post['content']),
            const SizedBox(height: 8),
            Text(
              '${post['likesCount']} likes • ${post['commentsCount']} comments',
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

  // Initialize with dummy data (replace with API call)
  void _initializePosts() {
    posts.assignAll([
      {
        'id': '1',
        'userName': 'Mark Williams',
        'timeAgo': '1 hour ago',
        'content':
            'This is placeholder text only, intended for visual demonstration purposes only. The content here is not meant to represent real information.',
        'imageUrls': <String>[],
        'isLiked': false,
        'isSaved': false,
        'likesCount': 7500,
        'commentsCount': 425,
      },
      {
        'id': '2',
        'userName': 'Mark Williams',
        'timeAgo': '1 hour ago',
        'content':
            'This is placeholder text only, intended for visual demonstration purposes only. The content here is not meant to represent real information.',
        'imageUrls': ['assets/images/feed_post_image1.jpg'],
        'isLiked': false,
        'isSaved': false,
        'likesCount': 7500,
        'commentsCount': 425,
      },
      {
        'id': '3',
        'userName': 'Mark Williams',
        'timeAgo': '1 hour ago',
        'content':
            'This is placeholder text only, intended for visual demonstration purposes only. The content here is not meant to represent real information.',
        'imageUrls': [
          'assets/images/feed_post_image1.jpg',
          'assets/images/feed_post_image2.jpg',
          'assets/images/feed_post_image3.jpg',
          'assets/images/feed_post_image4.jpg',
        ],
        'isLiked': true,
        'isSaved': false,
        'likesCount': 7500,
        'commentsCount': 425,
      },
    ]);
  }

  // Tab management
  void changeTab(int index) {
    currentTabIndex.value = index;
  }

  void toggleLike(int postIndex) {
    if (postIndex < posts.length) {
      posts[postIndex]['isLiked'] = !posts[postIndex]['isLiked'];
      posts[postIndex]['likesCount'] += posts[postIndex]['isLiked'] ? 1 : -1;
      posts.refresh();
    }
  }

  void toggleSave(int postIndex) {
    if (postIndex < posts.length) {
      posts[postIndex]['isSaved'] = !posts[postIndex]['isSaved'];
      posts.refresh();
    }
  }

  // Get saved posts
  List<Map<String, dynamic>> get savedPosts {
    return posts.where((post) => post['isSaved'] == true).toList();
  }

  // Post actions
  void hidePost(String postId) {
    posts.removeWhere((post) => post['id'] == postId);
    Get.snackbar(
      'Post Hidden',
      'Post has been hidden from your feed',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void reportPost(String postId) {
    Get.snackbar(
      'Post Reported',
      'Thank you for reporting. We will review this post.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> sharePost(Map<String, dynamic> post) async {
    try {
      isSharing.value = true;

      final String postId = post['id'];
      final String userName = post['userName'];
      final String content = post['content'];
      final int likesCount = post['likesCount'];
      final int commentsCount = post['commentsCount'];

      // Create the deep link
      final deepLink = 'https://empoweredman/post-detail/$postId';

      // Create rich sharing content
      final shareContent = _buildShareContent(
        userName: userName,
        content: content,
        likesCount: likesCount,
        commentsCount: commentsCount,
        deepLink: deepLink,
      );

      // Share with rich content
      await Share.share(
        shareContent,
        subject: '$userName\'s Post on EmpoweredMan',
      );

      _showSuccessMessage();
    } catch (e) {
      print('Error sharing post: $e');
      _showErrorMessage();
    } finally {
      isSharing.value = false;
    }
  }

  // Build rich sharing content
  String _buildShareContent({
    required String userName,
    required String content,
    required int likesCount,
    required int commentsCount,
    required String deepLink,
  }) {
    final buffer = StringBuffer();

    // Add post header
    buffer.writeln('📱 Check out this post from $userName on EmpoweredMan!');
    buffer.writeln();

    // Add post content (truncate if too long)
    String truncatedContent =
        content.length > 200 ? '${content.substring(0, 200)}...' : content;
    buffer.writeln('"$truncatedContent"');
    buffer.writeln();

    // Add engagement stats
    buffer.writeln('👍 $likesCount likes • 💬 $commentsCount comments');
    buffer.writeln();

    // Add call to action
    buffer.writeln('📱 Open in EmpoweredMan app:');
    buffer.writeln(deepLink);
    buffer.writeln();

    // Add app promotion
    buffer.writeln('Download EmpoweredMan app for the best experience!');

    return buffer.toString();
  }

  // Alternative: Share with custom message and separate link
  Future<void> sharePostWithCustomMessage(Map<String, dynamic> post) async {
    try {
      isSharing.value = true;

      final String postId = post['id'];
      final String userName = post['userName'];
      final String content = post['content'];

      // Create the deep link
      final deepLink = 'https://empoweredman/post-detail/$postId';

      // Custom message
      final message = 'Check out this amazing post by $userName: "$content"';

      // Share both message and link
      await Share.share(
        '$message\n\nOpen in app: $deepLink',
        subject: '$userName\'s Post',
      ).then((result) {
        if (result.status == ShareResultStatus.success) {
          _showSuccessMessage();
        }
      });
    } catch (e) {
      print('Error sharing post: $e');
      _showErrorMessage();
    } finally {
      isSharing.value = false;
    }
  }

  // Share with files (for posts with images)
  Future<void> sharePostWithMedia(Map<String, dynamic> post) async {
    try {
      isSharing.value = true;

      final String postId = post['id'];
      final String userName = post['userName'];
      final String content = post['content'];
      final List<String> imageUrls = List<String>.from(post['imageUrls'] ?? []);

      // Create the deep link
      final deepLink = 'https://empoweredman/post-detail/$postId';

      // Create sharing content
      final shareText = _buildShareContent(
        userName: userName,
        content: content,
        likesCount: post['likesCount'],
        commentsCount: post['commentsCount'],
        deepLink: deepLink,
      );

      if (imageUrls.isNotEmpty) {
        // TODO: Download images and share as files
        // This would require downloading the images first
        // For now, just share the text
        await Share.share(shareText);
      } else {
        await Share.share(shareText);
      }

      _showSuccessMessage();
    } catch (e) {
      print('Error sharing post with media: $e');
      _showErrorMessage();
    } finally {
      isSharing.value = false;
    }
  }

  // Helper methods for showing messages
  void _showSuccessMessage() {
    Get.snackbar(
      'Success',
      'Post shared successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.primary,
      colorText: Get.theme.colorScheme.onPrimary,
    );
  }

  void _showErrorMessage() {
    Get.snackbar(
      'Error',
      'Failed to share post. Please try again.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.error,
      colorText: Get.theme.colorScheme.onError,
    );
  }

  // API methods (implement these based on your API)
  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      // final response = await remoteSource.getPosts();
      // posts.assignAll(response);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch posts',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createPost(String content, List<String> imageUrls) async {
    try {
      isLoading.value = true;
      final newPost = {
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'userName': 'You',
        'timeAgo': 'Just now',
        'content': content,
        'imageUrls': imageUrls,
        'isLiked': false,
        'isSaved': false,
        'likesCount': 0,
        'commentsCount': 0,
      };
      posts.insert(0, newPost);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to create post',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  bool get isUserCoach {
    return Get.find<ProfileController>().userProfile.value.isCoach ?? false;
  }
}
