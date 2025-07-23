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
  final ScrollController _feedScrollController = ScrollController();
  final ScrollController _savedScrollController = ScrollController();

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
    _feedScrollController.addListener(_onFeedScroll);
    _savedScrollController.addListener(_onSavedScroll);
  }

  @override
  void dispose() {
    _feedScrollController.dispose();
    _savedScrollController.dispose();
    super.dispose();
  }

  void _onFeedScroll() {
    if (!_feedScrollController.hasClients) return;
    const threshold = 200.0;
    if (_feedScrollController.position.extentAfter < threshold) {
      controller.fetchNextFeedPostsPage();
    }
  }

  void _onSavedScroll() {
    if (!_savedScrollController.hasClients) return;
    const threshold = 200.0;
    if (_savedScrollController.position.extentAfter < threshold) {
      tribeController.fetchNextSavedPostsPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgMedium,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          surfaceTintColor: AppColors.bgMedium,
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
                      postId: post.id?.toString() ?? '',
                    );
                  }
                } else if (index == 1) {
                  // Handle 'Media' tab (index 1)
                  await controller
                      .getFeedMedia(); // Always reset and load first page
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
      final isPostLoading = controller.feedState.value == TheStates.loading &&
          controller.currentTabIndex.value == 0;
      final isMediaLoading =
          controller.feedMediaState.value == TheStates.loading &&
              controller.currentTabIndex.value == 1;
      final isSavedLoading =
          tribeController.getFeedSavedPostState.value == TheStates.loading &&
              controller.currentTabIndex.value == 2;
      final isLoading = isPostLoading || isMediaLoading || isSavedLoading;
      return Stack(
        children: [
          // Main tab content
          Builder(
            builder: (_) {
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
            },
          ),
          if (isLoading)
            ColoredBox(
              color: Colors.black.withOpacity(0.3),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
        ],
      );
    });
  }

  Widget _buildPostTab() {
    return Obx(() {
      final posts = controller.posts.value;
      final state = controller.feedState.value;
      final isLoadingMore = controller.isLoadingMorePosts.value;
      final hasMore =
          controller.currentFeedPage.value < controller.lastFeedPage.value;

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
          controller: _feedScrollController,
          padding: const EdgeInsets.all(16),
          itemCount: posts.length + (hasMore || isLoadingMore ? 2 : 1),
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Column(
                children: [
                  SizedBox(height: 12),
                ],
              );
            }
            if (index == posts.length + 1 && (hasMore || isLoadingMore)) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              );
            }
            final postIndex = index - 1;
            if (postIndex >= posts.length) return const SizedBox.shrink();
            final post = posts[postIndex];
            return FeedPost(
              groupId: post.groupId.toString(),
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
      final isLoadingMore = controller.isLoadingMoreFeedMedia.value ?? false;
      final hasMore = (controller.currentFeedMediaPage.value ?? 1) <
          (controller.lastFeedMediaPage.value ?? 1);

      if (state == TheStates.loading &&
          (mediaModel.data?.medias?.isEmpty ?? true)) {
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
      final totalMedia = mediaModel.data?.meta?.total ?? 0;
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

      final formattedMediaList = mediaItems
          .map(
            (item) => {
              'url': item.url,
              'type': item.type,
            },
          )
          .toList();

      return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!isLoadingMore &&
              hasMore &&
              scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent - 200) {
            controller.fetchNextFeedMediaPage();
          }
          return false;
        },
        child: RefreshIndicator(
          onRefresh: () async {
            await controller.getFeedMedia();
          },
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                'Media ( $totalMedia )',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 items per row
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: formattedMediaList.length + (isLoadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == formattedMediaList.length && isLoadingMore) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    );
                  }
                  if (index < 0 || index >= formattedMediaList.length) {
                    return const SizedBox.shrink();
                  }
                  final media = formattedMediaList[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => MediaViewer(
                          mediaList: formattedMediaList,
                          initialIndex: index,
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(
                            media['url'] ?? '',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildSavedTab() {
    return Obx(() {
      final savedPosts =
          tribeController.feedSavedPostsModel.value.data?.savedPosts ?? [];
      final state = tribeController.getFeedSavedPostState.value;
      final isLoadingMore = tribeController.isLoadingMoreSaved.value;
      final hasMore = tribeController.currentSavedPage.value <
          tribeController.lastSavedPage.value;

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
          controller: _savedScrollController,
          padding: const EdgeInsets.all(16),
          itemCount: savedPosts.length + (hasMore || isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == savedPosts.length && (hasMore || isLoadingMore)) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              );
            }
            if (index >= savedPosts.length) return const SizedBox.shrink();
            final post = savedPosts[index];
            return FeedPost(
              groupId: post.groupId.toString(),
              post: post,
            );
          },
        ),
      );
    });
  }
}
