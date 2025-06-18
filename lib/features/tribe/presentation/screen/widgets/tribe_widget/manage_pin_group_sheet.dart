import 'package:empowered/common/app_spacing.dart';
import 'package:empowered/features/tribe/presentation/controller/tribe_group_controller.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagePinGroupSheet extends StatefulWidget {
  const ManagePinGroupSheet({super.key});

  @override
  State<ManagePinGroupSheet> createState() => _ManagePinGroupSheetState();
}

class _ManagePinGroupSheetState extends State<ManagePinGroupSheet> {
  final TextEditingController _searchController = TextEditingController();
  late TribeGroupController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<TribeGroupController>();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    controller.search(_searchController.text);
  }

  void _saveChanges() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pin group settings saved successfully'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Color(0xFF0F172A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Fixed Header Section
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Manage Pin Group',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Search bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.search, color: Colors.white54),
                      border: InputBorder.none,
                      hintText: 'Search Tribe...',
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // Scrollable Content Section
          Expanded(
            child: Obx(() {
              final pinnedGroups = controller.pinnedGroups;
              final unpinnedGroups = controller.unpinnedGroups;

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Pinned Groups Section
                    if (pinnedGroups.isNotEmpty) ...[
                      const Text(
                        'Pinned Groups',
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...pinnedGroups.map(
                        (group) => _buildGroupTile(group, pinned: true),
                      ),
                      const SizedBox(height: 16),
                    ],

                    // Groups Section
                    if (unpinnedGroups.isNotEmpty) ...[
                      const Text(
                        'Groups',
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...unpinnedGroups.map(
                        (group) => _buildGroupTile(group),
                      ),
                    ],

                    // Empty state
                    if (pinnedGroups.isEmpty && unpinnedGroups.isEmpty)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(32),
                          child: Column(
                            children: [
                              Icon(
                                Icons.search_off,
                                size: 48,
                                color: Colors.white54,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'No tribes found',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Try adjusting your search terms',
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    // Bottom padding to ensure content doesn't get hidden behind buttons
                    const SizedBox(height: 100),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Color(0xFF0F172A),
                        // border: Border(
                        //   top: BorderSide(color: Color(0xFF1E293B), width: 1),
                        // ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _saveChanges,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Save',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalSpacing(40),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildGroupTile(Map<String, dynamic> group, {bool pinned = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ClipOval(
          child: Image.asset(
            Assets.images.chatUserPic.path,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFF1E293B),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.group,
                  color: Colors.white54,
                  size: 20,
                ),
              );
            },
          ),
        ),
        title: Text(
          group['name'],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            "Members: ${group['memberCount']}",
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 12,
            ),
          ),
        ),
        trailing: TextButton.icon(
          onPressed: () => controller.toggleGroupPin(group['id']),
          icon: Icon(
            pinned ? Icons.push_pin : Icons.push_pin_outlined,
            size: 16,
            color: Colors.blue,
          ),
          label: Text(
            pinned ? 'Unpin Group' : 'Pin Group',
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 13,
            ),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ),
    );
  }
}
