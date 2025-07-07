import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/main/presentation/screens/widgets/main_drawer.dart';
import 'package:empowered/features/tribe/presentation/controller/tribe_group_controller.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/tribe_widget/create_tribe_group.dart';

class TribeScreen extends StatefulWidget {
  const TribeScreen({super.key});

  @override
  State<TribeScreen> createState() => _TribeScreenState();
}

class _TribeScreenState extends State<TribeScreen> {
  late TribeGroupController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    controller = Get.find<TribeGroupController>();
  }

  bool get isUserCoach => controller.isUserCoach;

  List<Widget> _getPinnedGroups() {
    return controller.pinnedGroups.map((group) {
      return _groupTile(
        groupId: group.id.toString(),
        name: group.name ?? '',
        image: group.image ?? '',
        memberCount: group.memberCount ?? 0,
        lastActivity: 'Recent',
        pinned: true,
        locked: _isGroupLocked(group),
        createdByYou: _isCreatedByCurrentUser(group),
      );
    }).toList();
  }

  List<Widget> _getGroups() {
    return controller.unpinnedGroups.map((group) {
      return _groupTile(
        groupId: group.id.toString(),
        name: group.name ?? '',
        image: group.image ?? '',
        memberCount: group.memberCount ?? 0,
        lastActivity: 'Recent',
        locked: _isGroupLocked(group),
        createdByYou: _isCreatedByCurrentUser(group),
      );
    }).toList();
  }

  bool _isCreatedByCurrentUser(dynamic group) {
    final currentUserId = controller.userId;
    return group.members?.any(
          (member) =>
              member.role == 'Admin' &&
              member.user?.id.toString() == currentUserId,
        ) ??
        false;
  }

  bool _isGroupLocked(dynamic group) {
    final accessType = group.accessType?.toLowerCase();

    // Check for admin-only access types
    return accessType == 'admin_only' ;
  }

  String _getCurrentFilter() {
    return controller.selectedFilters.value.toLowerCase();
  }

  bool _isFilterSelected(String filter) {
    return controller.selectedFilters.value.toLowerCase() ==
        filter.toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xFF0F172A),
        drawer: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          color: AppColors.bgMedium,
          child: const MainDrawer(),
        ),
        body: _isCurrentFilterLoading()
            ? const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Tribe',
                            style: AppTextStyles.textHeadingH3,
                          ),
                          InkWell(
                            onTap: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                            child: Assets.images.menu.svg(width: 32),
                          ),
                        ],
                      ),
                    ),
                    const VerticalSpacing(24),
                    // Search Field
                    Row(
                      mainAxisAlignment: isUserCoach
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF121E29),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: TextField(
                              controller: controller.searchController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                icon: Assets.images.search
                                    .svg(width: 24, height: 24),
                              ),
                              onChanged: (value) {
                                controller.search(value);
                              },
                            ),
                          ),
                        ),
                        if (isUserCoach) ...[
                          const SizedBox(width: 8),
                          Container(
                            width: 40,
                            height: 40,
                            margin: const EdgeInsets.only(left: 8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary500,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {
                                showCreateGroupSheet(context);
                              },
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Filter Tabs
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _filterChip('All', _isFilterSelected('All'), () {
                            controller.changeFilter('All');
                          }),
                          const SizedBox(width: 8),
                          if (isUserCoach) ...[
                            _filterChip('Created by You',
                                _isFilterSelected('Created_by_you'), () {
                              controller.changeFilter('Created_by_you');
                            }),
                            const SizedBox(width: 8),
                          ],
                          _filterChip(
                              'Admin Only', _isFilterSelected('Admin_only'),
                              () {
                            controller.changeFilter('Admin_only');
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Assets.images.file.svg(width: 30, height: 30),
                        const SizedBox(width: 8),
                        const Text(
                          'Posts',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Pinned Groups Section
                    const Row(
                      children: [
                        Text(
                          'Pinned Groups',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Pinned Groups List
                    if (controller.pinnedGroups.isEmpty) ...[
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E293B).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3)),
                        ),
                        child: const Center(
                          child: Text(
                            'No pinned groups found',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                      ),
                    ] else ...[
                      ..._getPinnedGroups(),
                    ],
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        controller.showManagePinGroupSheet(context);
                      },
                      child: Row(
                        children: [
                          Assets.images.addIconWithBackground.svg(
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Add pinned group',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Row(
                      children: [
                        Text(
                          'Groups',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Other Groups
                    if (_hasCurrentFilterError()) ...[
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E293B).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Colors.red.withOpacity(0.3)),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 24,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                controller.currentFilterError ??
                                    'Something went wrong',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  controller.refreshGroups();
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ] else if (controller.unpinnedGroups.isEmpty) ...[
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E293B).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3)),
                        ),
                        child: Center(
                          child: Text(
                            controller.hasSearchQuery
                                ? 'No groups found matching "${controller.queryText.value}"'
                                : _getEmptyStateMessage(),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ] else ...[
                      ..._getGroups(),
                    ],
                  ],
                ),
              ),
      ),
    );
  }

  bool _isCurrentFilterLoading() {
    return controller.currentFilterState == TheStates.loading;
  }

  bool _hasCurrentFilterError() {
    return controller.currentFilterState == TheStates.error;
  }

  void showCreateGroupSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CreateTribeGroup(),
    );
  }

  String _getEmptyStateMessage() {
    switch (controller.selectedFilters.value.toLowerCase()) {
      case 'admin_only':
        return 'No admin groups found';
      case 'created_by_you':
        return "You haven't created any groups yet";
      case 'all':
      default:
        return 'No groups found';
    }
  }

  Widget _filterChip(String label, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.black : Colors.white,
            fontSize: 12,
            fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _groupTile({
    required String groupId,
    required String name,
    required String image,
    required int memberCount,
    required String lastActivity,
    bool pinned = false,
    bool locked = false,
    bool createdByYou = false,
  }) {
    return GestureDetector(
      onTap: () {
        controller.navigateToFeedPage(groupId);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Stack(
              children: [
                ClipOval(
                  child: image.isNotEmpty
                      ? Image.network(
                          image,
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 40,
                              width: 40,
                              color: Colors.grey,
                              child:
                                  const Icon(Icons.group, color: Colors.white),
                            );
                          },
                        )
                      : Container(
                          height: 40,
                          width: 40,
                          color: Colors.grey,
                          child: const Icon(Icons.group, color: Colors.white),
                        ),
                ),
                if (createdByYou)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF0F172A),
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 10,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (locked) ...[
                        const SizedBox(width: 6),
                        Assets.images.lock.svg(
                          width: 16,
                          height: 16,
                        ),
                      ],
                      if (createdByYou && !locked) ...[
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.purple.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Created',
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  Text(
                    'Members: $memberCount',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            if (pinned)
              Assets.images.pin.svg(
                width: 14,
                height: 14,
              ),
            const SizedBox(width: 8),
            Text(
              lastActivity,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
