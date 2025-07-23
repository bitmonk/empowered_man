import 'dart:io';

import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';
import 'package:empowered/features/tribe/presentation/controller/tribe_group_controller.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/about_tab.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/create_post_screen.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/feed_post.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/media_tab.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/tribe_widget/customise_group.dart';

class FeedPageScreen extends StatefulWidget {
  const FeedPageScreen({
    required this.groupId,
    required this.isAdmin,
    required this.accessType,
    super.key,
  });
  final String groupId;
  final bool isAdmin;
  final String accessType;

  @override
  State<FeedPageScreen> createState() => _FeedPageScreenState();
}

class _FeedPageScreenState extends State<FeedPageScreen> {
  final FeedPageController controller = Get.find<FeedPageController>();
  final TribeGroupController tribeController = Get.find<TribeGroupController>();

  @override
  void initState() {
    super.initState();
    controller.currentTabIndex.value = 0; // Always reset to posts tab on entry
    tribeController
      ..loadPostDetails(widget.groupId).then((_) {
        // Fetch comments for all posts after loading post details
        final posts = tribeController.groupPostModel.value.data?.posts ?? [];
        for (final post in posts) {
          controller.getPostComments(postId: post.id?.toString() ?? '');
        }
      })
      ..loadGroupDetails(widget.groupId);
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
          title: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Obx(() {
              final groupDetails =
                  tribeController.groupDetailModel.value.data?.about;
              return Row(
                children: [
                  if (groupDetails?.image != null)
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(groupDetails!.image!),
                      onBackgroundImageError: (_, __) => null,
                    )
                  else
                    const CircleAvatar(
                      // radius: 18,
                      backgroundColor: Colors.white24,
                      child: Icon(
                        Icons.group,
                        color: Colors.white54,
                        size: 28,
                      ),
                    ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          groupDetails?.name ?? 'Group',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          '${groupDetails?.accessType} Group',
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  // const Spacer(),
                  if (controller.isUserCoach)
                    PopupMenuButton<String>(
                      color: const Color(0xFF1E293B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onSelected: (value) async {
                        if (value == 'Customize Group') {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) =>
                                CustomiseGroup(groupId: widget.groupId),
                          );
                        } else if (value == 'Delete Group') {
                          // Dummy function: show a snackbar
                          var success =
                              await tribeController.deleteGroup(widget.groupId);
                          if (success) Navigator.pop(context);
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'Customize Group',
                          child: Row(
                            children: [
                              Text(
                                'Customize Group',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'Delete Group', // Fixed value here
                          child: Row(
                            children: [
                              Text(
                                'Delete Group',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              );
            }),
          ),
          centerTitle: false,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          _buildTabs(controller),
          const SizedBox(height: 12),
          Expanded(child: _buildTabContent(controller)),
          VerticalSpacing(
            Platform.isAndroid ? context.devicePaddingBottom : 0,
          ),
        ],
      ),
    );
  }

  Widget _buildTabs(FeedPageController controller) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(controller.tabs.length, (index) {
          return GestureDetector(
            onTap: () async {
              controller.changeTab(index);
              // Refresh posts when Post tab is pressed
              if (index == 0) {
                await tribeController.loadPostDetails(widget.groupId);
                final posts =
                    tribeController.groupPostModel.value.data?.posts ?? [];
                for (final post in posts) {
                  await controller.getPostComments(
                    postId: post.id?.toString() ?? '',
                  );
                }
                setState(() {}); // Force widget rebuild to reflect updated data
              }
              // Fetch saved posts and their comments when Saved tab is pressed
              if (index == 3) {
                tribeController.getSavedPosts(widget.groupId).then((_) {
                  final savedPosts =
                      tribeController.savedPostsModel.value.data?.savedPosts ??
                          [];
                  for (final post in savedPosts) {
                    controller.getPostComments(
                      postId: post.id?.toString() ?? '',
                    );
                  }
                });
              }
            },
            child: _tabChip(
              controller.tabs[index],
              controller.currentTabIndex.value == index,
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
      final isPostLoading =
          tribeController.postDetailState.value == TheStates.loading &&
              controller.currentTabIndex.value == 0;
      final isSavedLoading =
          tribeController.savedPostState.value == TheStates.loading &&
              controller.currentTabIndex.value == 3;
      final isLoading = isPostLoading || isSavedLoading;
      return Stack(
        children: [
          // Main tab content
          Builder(
            builder: (_) {
              switch (controller.currentTabIndex.value) {
                case 0:
                  return _buildPostTab();
                case 1:
                  return AboutTab(groupId: widget.groupId);
                case 2:
                  return MediaTab(groupId: widget.groupId);
                case 3:
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
      final posts = tribeController.groupPostModel.value.data?.posts ?? [];
      final state = tribeController.postDetailState.value;
      final isLoadingMore = tribeController.isLoadingMoreGroupPosts.value;
      final hasMore = tribeController.currentGroupFeedPage.value <
          tribeController.lastGroupFeedPage.value;

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
              const Text(
                'Failed to load posts',
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () =>
                    tribeController.loadPostDetails(widget.groupId),
                child:
                    const Text('Retry', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        );
      }

      if (posts.isEmpty) {
        return Column(
          children: [
            if (widget.accessType == 'Open Discussion')
              Padding(
                padding: const EdgeInsets.all(16),
                child: _createPostInput(),
              ),
            VerticalSpacing(Get.height * 0.25),
            const Text(
              'No posts yet',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        );
      }

      return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!isLoadingMore &&
              hasMore &&
              scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent - 200) {
            tribeController.fetchNextGroupFeedPostsPage(widget.groupId);
          }
          return false;
        },
        child: RefreshIndicator(
          onRefresh: () async {
            await tribeController.loadPostDetails(widget.groupId);
            final posts =
                tribeController.groupPostModel.value.data?.posts ?? [];
            for (final post in posts) {
              await controller.getPostComments(
                postId: post.id?.toString() ?? '',
              );
            }
            setState(() {}); // Force widget rebuild to reflect updated likes
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: posts.length + 1 + (isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == 0) {
                return widget.accessType == 'Open Discussion'
                    ? Column(
                        children: [
                          _createPostInput(),
                          const SizedBox(height: 12),
                        ],
                      )
                    : const SizedBox.shrink();
              }
              if (index == posts.length + 1 && isLoadingMore) {
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
              if (postIndex < 0 || postIndex >= posts.length) {
                return const SizedBox.shrink();
              }
              final post = posts[postIndex];
              return FeedPost(
                post: post,
                groupId: widget.groupId,
              );
            },
          ),
        ),
      );
    });
  }

  Widget _createPostInput() {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => CreatePostScreen(
            groupId: widget.groupId,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.feedContainer,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            ClipOval(
              child: controller.userProfile != null
                  ? Image.network(
                      controller.userProfile,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.account_circle,
                        size: 40,
                        color: Colors.white54,
                      ),
                    )
                  : const Icon(
                      Icons.account_circle,
                      size: 40,
                      color: Colors.white54,
                    ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Create a post...',
                style: TextStyle(color: Colors.white54),
              ),
            ),
            Assets.images.postImage.svg(
              width: 20,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedTab() {
    return Obx(() {
      final savedPosts =
          tribeController.savedPostsModel.value.data?.savedPosts ?? [];
      final state = tribeController.savedPostState.value;
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
                onPressed: () => tribeController.getSavedPosts(widget.groupId),
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

      return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!isLoadingMore &&
              hasMore &&
              scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent - 200) {
            tribeController.fetchNextGroupSavedPostsPage(widget.groupId);
          }
          return false;
        },
        child: RefreshIndicator(
          onRefresh: () async {
            await tribeController.getSavedPosts(widget.groupId);
            final savedPosts =
                tribeController.savedPostsModel.value.data?.savedPosts ?? [];
            for (final post in savedPosts) {
              await controller.getPostComments(
                postId: post.id?.toString() ?? '',
              );
            }
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: savedPosts.length + (isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == savedPosts.length && isLoadingMore) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                );
              }
              if (index < 0 || index >= savedPosts.length) {
                return const SizedBox.shrink();
              }
              final post = savedPosts[index];
              return FeedPost(
                post: post,
                groupId: widget.groupId,
              );
            },
          ),
        ),
      );
    });
  }
}
