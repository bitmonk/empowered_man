import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:empowered/features/tribe/data/source/feed_page_remote_source.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedPageController extends GetxController {
  FeedPageController({required this.remoteSource});

  final FeedPageRemoteSource remoteSource;

  final RxInt currentTabIndex = 0.obs;
  final RxList<Map<String, dynamic>> posts = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isSharing = false.obs;

  // Tab names
  final List<String> tabs = ['Post', 'About', 'Media', 'Saved'];

  @override
  void onInit() {
    super.onInit();
    _initializePosts();
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

  // Share post as deep link
  Future<void> sharePost(Map<String, dynamic> post) async {
    try {
      isSharing.value = true;

      // Create the share content
      final String postId = post['id'];
      final deepLink = 'https://yourapp.com/post/$postId';
      final shareText =
          '${post['userName']} shared:\n\n${post['content']}\n\nView post: $deepLink';

      // Share the link using system share sheet
      final uri = Uri.parse('text/plain?body=$shareText');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        _showSuccessMessage();
      } else {
        throw 'Could not launch share intent';
      }
    } catch (e) {
      print('Error sharing post: $e');
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
