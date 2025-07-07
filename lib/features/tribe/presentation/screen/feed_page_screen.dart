import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';
import 'package:empowered/features/tribe/presentation/controller/tribe_group_controller.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/about_tab.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/create_post_screen.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/feed_post.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/media_tab.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/tribe_widget/customise_group.dart';

class FeedPageScreen extends StatefulWidget {
  const FeedPageScreen({required this.groupId, super.key});
  final String groupId;

  @override
  State<FeedPageScreen> createState() => _FeedPageScreenState();
}

class _FeedPageScreenState extends State<FeedPageScreen> {
  final FeedPageController controller = Get.find<FeedPageController>();
  final TribeGroupController tribeController = Get.find<TribeGroupController>();

  @override
  void initState() {
    super.initState();
    controller.initializeWithGroupId(widget.groupId);
    tribeController.loadGroupDetails(widget.groupId);
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
          title: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Obx(() {
              final groupDetails = tribeController
                  .groupDetailsModel.value.data?.groupDetails?.about;
              return Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: groupDetails?.image != null
                        ? NetworkImage(groupDetails!.image!)
                        : Assets.images.chatUserPicOne.provider(),
                    onBackgroundImageError: groupDetails?.image != null
                        ? (_, __) => Assets.images.chatUserPicOne.provider()
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        groupDetails?.name ?? 'Group',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        groupDetails?.accessType ?? 'Open Discussion Group',
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  if (controller.isUserCoach)
                    PopupMenuButton<String>(
                      color: const Color(0xFF1E293B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onSelected: (value) => showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) =>
                            CustomiseGroup(groupId: widget.groupId),
                      ),
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
          VerticalSpacing(MediaQuery.of(context).viewPadding.bottom + 16),
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
            onTap: () => controller.changeTab(index),
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
      switch (controller.currentTabIndex.value) {
        case 0:
          return _buildPostTab(controller);
        case 1:
          return AboutTab(groupId: widget.groupId);
        case 2:
          return const MediaTab();
        case 3:
          return _buildSavedTab(controller);
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

  Widget _buildPostTab(FeedPageController controller) {
    return Obx(() {
      if (controller.feedState.value == TheStates.loading &&
          controller.posts.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      }

      if (controller.feedState.value == TheStates.error) {
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
                onPressed: controller.loadFeedPosts,
                child:
                    const Text('Retry', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        );
      }

      if (controller.posts.isEmpty) {
        return const Center(
          child: Text(
            'No posts yet',
            style: TextStyle(color: Colors.white70),
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: controller.loadFeedPosts,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.posts.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  _createPostInput(),
                  const SizedBox(height: 12),
                ],
              );
            }

            final postIndex = index - 1;
            final post = controller.posts[postIndex];

            return FeedPost(
              post: post,
            );
          },
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
                      controller.userProfile ,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Assets.images.leaderProfile.image(
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Assets.images.leaderProfile.image(
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
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

  Widget _buildSavedTab(FeedPageController controller) {
    return Obx(() {
      final savedPosts = controller.savedPosts;

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

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: savedPosts.length,
        itemBuilder: (context, index) {
          final post = savedPosts[index];

          return FeedPost(
            post: post,
          );
        },
      );
    });
  }
}
