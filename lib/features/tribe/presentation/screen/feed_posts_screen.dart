import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';
import 'package:empowered/features/tribe/presentation/controller/tribe_group_controller.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/feed_post.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/media_viewer.dart';

class FeedPostsScreen extends StatefulWidget {
  const FeedPostsScreen({super.key});

  @override
  State<FeedPostsScreen> createState() => _FeedPostsScreenState();
}

class _FeedPostsScreenState extends State<FeedPostsScreen> {
  final FeedPageController controller = Get.find<FeedPageController>();
  final TribeGroupController tribeController = Get.find<TribeGroupController>();

  @override
  void initState() {
    super.initState();
    controller.currentTabIndex.value = 0; // Always reset to posts tab on entry
    controller.loadFeedPosts().then((_) {
      // Fetch comments for all posts after loading
      final posts = controller.posts;
      for (final post in posts) {
        controller.getPostComments(postId: post.id?.toString() ?? '');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgMedium,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: AppColors.bgMedium,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          title: const Padding(
            padding:
                EdgeInsets.symmetric(vertical: 8), // Added vertical padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Feed',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4), // Space between title and subtitle
                Text(
                  'Discover posts from across your organisation',
                  style: TextStyle(
                    color: AppColors.textColor200,
                    fontSize: 12, // Slightly reduced font size for better fit
                  ),
                ),
              ],
            ),
          ),
          centerTitle: false,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          _buildTabs(controller),
          Expanded(child: _buildTabContent(controller)),
          VerticalSpacing(MediaQuery.of(context).viewPadding.bottom + 16),
        ],
      ),
    );
  }

  Widget _buildTabs(FeedPageController controller) {
    return Obx(
      () => Row(
        children: List.generate(3, (index) {
          final tabs = ['Posts', 'Media', 'Saved'];
          return Padding(
            padding: const EdgeInsets.only(left: 16), // Space between tabs
            child: GestureDetector(
              onTap: () async {
                controller.changeTab(index);
                if (index == 0) {
                  // Handle 'Posts' tab (index 0) - refresh posts and comments, like pull-to-refresh
                  await controller.loadFeedPosts();
                  final posts = controller.posts;
                  for (final post in posts) {
                    await controller.getPostComments(
                        postId: post.id?.toString() ?? '');
                  }
                } else if (index == 1) {
                  // Handle 'Media' tab (index 1)
                  controller.getFeedMedia(); // Call to fetch media
                } else if (index == 2) {
                  // Handle 'Saved' tab (index 2)
                  tribeController.getFeedSavedPost().then((_) async {
                    final savedPosts = tribeController
                            .feedSavedPostsModel.value.data?.savedPosts ??
                        [];
                    for (final post in savedPosts) {
                      await controller.getPostComments(
                        postId: post.id?.toString() ?? '',
                      );
                    }
                  });
                }
              },
              child: _tabChip(
                tabs[index],
                controller.currentTabIndex.value == index,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _tabChip(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? Colors.white : AppColors.feedContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected ? Colors.transparent : AppColors.textColor50,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.black : Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildTabContent(FeedPageController controller) {
    return Obx(() {
      switch (controller.currentTabIndex.value) {
        case 0:
          return _buildPostTab();
        case 1:
          return _buildMediaTab(); // Updated Media tab content
        case 2:
          return _buildSavedTab();
        default:
          return const Center(
            child: Text(
              'Coming Soon...',
              style: TextStyle(color: Colors.white70),
            ),
          );
      }
    });
  }

  Widget _buildPostTab() {
    return Obx(() {
      final posts = controller.posts.value;
      final state = controller.feedState.value;

      if (state == TheStates.loading && posts.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      }

      if (state == TheStates.error) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.feedError ?? 'Failed to load posts',
                style: const TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => controller.loadFeedPosts(),
                child:
                    const Text('Retry', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        );
      }

      if (posts.isEmpty) {
        return const Center(
          child: Text(
            'No posts yet',
            style: TextStyle(color: Colors.white70),
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: () async {
          await controller.loadFeedPosts();
          final posts = controller.posts.value;
          for (final post in posts) {
            await controller.getPostComments(postId: post.id?.toString() ?? '');
          }
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: posts.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Column(
                children: [
                  SizedBox(height: 12),
                ],
              );
            }

            final postIndex = index - 1;
            final post = posts[postIndex];

            return FeedPost(
              post: post,
            );
          },
        ),
      );
    });
  }

  Widget _buildMediaTab() {
    return Obx(() {
      final mediaModel = controller.feedMediaModel.value;
      final state = controller.feedMediaState.value;

      if (state == TheStates.loading) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      }

      if (state == TheStates.error) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.feedError ?? 'Failed to load media',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => controller.getFeedMedia(),
                child: const Text(
                  'Retry',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        );
      }

      final mediaItems = mediaModel.data?.medias ?? [];
      if (mediaItems.isEmpty) {
        return const Center(
          child: Text(
            'No media available',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: () => controller.getFeedMedia(),
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 items per row
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: mediaItems.length,
          itemBuilder: (context, index) {
            final media = mediaItems[index];
            return GestureDetector(
              onTap: () {
                // Open MediaViewer with the full media list and tapped index
                final mediaList = mediaItems
                    .map(
                      (item) => {
                        'url': item.url,
                        'type': item
                            .type, // Ensure your model has a 'type' field (e.g., 'image', 'video', etc.)
                      },
                    )
                    .toList();
                Get.to(
                  () => MediaViewer(
                    mediaList: mediaList,
                    initialIndex: index,
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                      media.url ?? '',
                    ), // Assuming media.url is the image URL
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }

  Widget _buildSavedTab() {
    return Obx(() {
      final savedPosts =
          tribeController.feedSavedPostsModel.value.data?.savedPosts ?? [];

      final state = tribeController.getFeedSavedPostState.value;

      if (state == TheStates.initial) {
        return const Center(
          child: Text(
            'Tap to load saved posts',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }

      if (state == TheStates.loading && savedPosts.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      }

      if (state == TheStates.error) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Failed to load saved posts',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => tribeController.getFeedSavedPost(),
                child: const Text(
                  'Retry',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        );
      }

      if (savedPosts.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.savePost.svg(width: 24, height: 24),
              const SizedBox(height: 16),
              const Text(
                'No saved posts yet',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Save posts to view them here',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: () async {
          await tribeController.getFeedSavedPost();
          final savedPosts =
              tribeController.feedSavedPostsModel.value.data?.savedPosts ?? [];
          for (final post in savedPosts) {
            await controller.getPostComments(postId: post.id?.toString() ?? '');
          }
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: savedPosts.length,
          itemBuilder: (context, index) {
            final post = savedPosts[index];
            return FeedPost(
              post: post,
            );
          },
        ),
      );
    });
  }
}
