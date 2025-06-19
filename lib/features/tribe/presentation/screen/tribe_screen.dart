import 'package:empowered/core/extension/extensions.dart';
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
        name: group['name'],
        image: group['image'],
        memberCount: group['memberCount'],
        lastActivity: group['lastActivity'],
        pinned: true,
        locked: controller.isAdminOnly,
        createdByYou: group['createdByCurrentUser'] ?? false,
      );
    }).toList();
  }

  List<Widget> _getGroups() {
    return controller.unpinnedGroups.map((group) {
      return _groupTile(
        name: group['name'],
        image: group['image'],
        memberCount: group['memberCount'],
        lastActivity: group['lastActivity'],
        locked: controller.isAdminOnly,
        createdByYou: group['createdByCurrentUser'] ?? false,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppScaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xFF0F172A),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Text(
                      'Tribe',
                      style: AppTextStyles.textHeadingH3,
                    ),
                    InkWell(
                      onTap: () {
                        AppWidgetKey.mainScaffold.currentState!.openDrawer();
                      },
                      child: Assets.images.menu.svg(width: 32),
                    ),
                  ],
                ),
              ),
              const VerticalSpacing(24),
              // Search Field
              // Search Field
              Row(
                mainAxisAlignment: isUserCoach
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                children: [
                  Expanded(
                    // Add Expanded widget here
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextField(
                        controller: controller.searchController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Search..',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          icon: Icon(Icons.search, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  if (isUserCoach) ...[
                    const SizedBox(width: 8),
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
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
                    _filterChip('All', controller.isAll, () {
                      controller.setFilter(GroupFilter.all);
                    }),
                    const SizedBox(width: 8),
                    if (isUserCoach) ...[
                      _filterChip('Created by You', controller.isCreatedByYou,
                          () {
                        controller.setFilter(GroupFilter.createdByYou);
                      }),
                      const SizedBox(width: 8),
                    ],
                    _filterChip('Admin Only', controller.isAdminOnly, () {
                      controller.setFilter(GroupFilter.adminOnly);
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Icon(Icons.article, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Posts', style: TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 24),
              // Show group count based on current filter
              const Row(
                children: [
                  Text(
                    'Pinned Groups',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  // const SizedBox(width: 8),
                  // if (controller.pinnedGroupCount > 0)
                  //   Container(
                  //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  //     decoration: BoxDecoration(
                  //       color: Colors.blue.withOpacity(0.2),
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //     child: Text(
                  //       '${controller.pinnedGroupCount}',
                  //       style: const TextStyle(color: Colors.blue, fontSize: 12),
                  //     ),
                  //   ),
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
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
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
                child: const Row(
                  children: [
                    Icon(Icons.add_circle, color: Colors.blue),
                    SizedBox(width: 8),
                    Text(
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
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  //const SizedBox(width: 8),
                  // if (controller.unpinnedGroupCount > 0)
                  //   Container(
                  //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  //     decoration: BoxDecoration(
                  //       color: Colors.green.withOpacity(0.2),
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //     child: Text(
                  //       '${controller.unpinnedGroupCount}',
                  //       style: const TextStyle(color: Colors.green, fontSize: 12),
                  //     ),
                  //   ),
                ],
              ),
              const SizedBox(height: 12),
              // Other Groups
              if (controller.unpinnedGroups.isEmpty) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  ),
                  child: Center(
                    child: Text(
                      controller.hasSearchQuery
                          ? 'No groups found matching "${controller.searchQuery.value}"'
                          : _getEmptyStateMessage(),
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
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

  void showCreateGroupSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CreateTribeGroup(),
    );
  }

  String _getEmptyStateMessage() {
    switch (controller.currentFilter.value) {
      case GroupFilter.adminOnly:
        return 'No admin groups found';
      case GroupFilter.createdByYou:
        return "You haven't created any groups yet";
      case GroupFilter.all:
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
    required String name,
    required AssetGenImage image,
    required int memberCount,
    required String lastActivity,
    bool pinned = false,
    bool locked = false,
    bool createdByYou = false,
  }) {
    return GestureDetector(
      onTap: () {
        controller.navigateToFeedPage();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Stack(
              children: [
                ClipOval(
                  child: image.image(
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
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
                          style: const TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (locked) ...[
                        const SizedBox(width: 4),
                        const Icon(Icons.lock, color: Colors.white, size: 16),
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
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            if (pinned)
              const Icon(Icons.push_pin, color: Colors.white, size: 16),
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
