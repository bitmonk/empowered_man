import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tribe/data/model/group_about_model.dart';
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';
import 'package:empowered/features/tribe/presentation/controller/tribe_group_controller.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/feed_post.dart';

class UserFeedPageScreen extends StatefulWidget {
  const UserFeedPageScreen(
      {required this.group, required this.member, super.key,});
  final GroupAboutModel group;
  final Member member;
  @override
  State<UserFeedPageScreen> createState() => _UserFeedPageScreenState();
}

class _UserFeedPageScreenState extends State<UserFeedPageScreen> {
  final FeedPageController controller = Get.find<FeedPageController>();
  final TribeGroupController tribeController = Get.find<TribeGroupController>();

  @override
  void initState() {
    super.initState();
    tribeController.loadUserPost(widget.group.data!.about!.id.toString(),
        widget.member.user!.id.toString(),);
  }

  @override
  Widget build(BuildContext context) {
    final groupDetails = widget.group.data!.about!;
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
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: groupDetails.image != null
                        ? NetworkImage(groupDetails.image!)
                        : Assets.images.chatUserPicOne.provider(),
                    onBackgroundImageError: groupDetails.image != null
                        ? (_, __) => Assets.images.chatUserPicOne.provider()
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.member.user?.fullName ?? 'User',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            groupDetails.name ?? 'Group',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            ' (${groupDetails.accessType ?? 'Open Discussion Group'})',
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),),
          centerTitle: false,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _tabChip(
            'Post',
            true,
          ),
          const SizedBox(height: 12),
          Expanded(child: _buildPostTab()),
          // VerticalSpacing(MediaQuery.of(context).viewPadding.bottom + 16),
        ],
      ),
    );
  }

  Widget _tabChip(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
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

  Widget _buildPostTab() {
    return Obx(() {
      final posts = tribeController.userPostModel.value.data?.posts ?? [];
      final state = tribeController.userPostState.value;

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
                onPressed: () => tribeController.loadUserPost(
                    widget.group.data!.about!.id.toString(),
                    widget.member.user!.id.toString(),),
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
            // Padding(
            //   padding: const EdgeInsets.all(16),
            //   child: _createPostInput(),
            // ),
            VerticalSpacing(Get.height * 0.25),
            const Center(
              child: Text(
                'No posts yet',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        );
      }

      return RefreshIndicator(
        onRefresh: () async {
          await tribeController.loadUserPost(
              widget.group.data!.about!.id.toString(),
              widget.member.user!.id.toString(),);
          final posts = tribeController.userPostModel.value.data?.posts ?? [];
          for (final post in posts) {
            await controller.getPostComments(postId: post.id?.toString() ?? '');
          }
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            // if (index == 0) {
            //   return Column(
            //     children: [
            //       _createPostInput(),
            //       const SizedBox(height: 12),
            //     ],
            //   );
            // }

            final postIndex = index;
            final post = posts[postIndex];

            return FeedPost(
              post: post,
            );
          },
        ),
      );
    });
  }
}
