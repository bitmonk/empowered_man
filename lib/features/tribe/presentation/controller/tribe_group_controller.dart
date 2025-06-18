import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:empowered/features/tribe/data/source/tribe_group_remote_source.dart';
import 'package:empowered/features/tribe/presentation/screen/feed_page_screen.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/tribe_widget/manage_pin_group_sheet.dart';

enum GroupFilter { all, adminOnly, createdByYou }

class TribeGroupController extends GetxController {
  TribeGroupController({required this.remoteSource});

  final TribeGroupRemoteSource remoteSource;

  // Reactive variables
  final Rx<GroupFilter> currentFilter = GroupFilter.all.obs;
  final RxBool isLoading = false.obs;
  final RxString searchQuery = ''.obs;
  final RxList<Map<String, dynamic>> allGroups = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> adminGroups = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> createdByYouGroups =
      <Map<String, dynamic>>[].obs;
  final RxList<String> pinnedGroupIds = <String>[].obs;
  late TextEditingController groupNameController;
  late TextEditingController groupDescriptionController;
  late TextEditingController accessTypeController;
  // Text editing controller for search
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _initializeData();
    _setupSearchListener();
    groupNameController = TextEditingController();
    groupDescriptionController = TextEditingController();
    accessTypeController = TextEditingController();
  }

  @override
  void onClose() {
    searchController.dispose();
    groupNameController.dispose();
    groupDescriptionController.dispose();
    accessTypeController.dispose();
    super.onClose();
  }

  void _initializeData() {
    // Initialize with sample data - replace with API calls
    allGroups.value = [
      {
        'id': '1',
        'name': 'All Group 1',
        'image': Assets.images.chatUserPic,
        'memberCount': 220,
        'lastActivity': '2 min',
        'isAdmin': false,
        'createdByCurrentUser': false,
      },
      {
        'id': '2',
        'name': 'All Group 2',
        'image': Assets.images.chatUserPicOne,
        'memberCount': 150,
        'lastActivity': '5 min',
        'isAdmin': false,
        'createdByCurrentUser': false,
      },
      {
        'id': '3',
        'name': 'Admin Group 1',
        'image': Assets.images.chatUserPicTwo,
        'memberCount': 45,
        'lastActivity': '1 min',
        'isAdmin': true,
        'createdByCurrentUser': false,
      },
      {
        'id': '4',
        'name': 'Admin Group 2',
        'image': Assets.images.leaderProfile,
        'memberCount': 32,
        'lastActivity': '10 min',
        'isAdmin': true,
        'createdByCurrentUser': true,
      },
      {
        'id': '5',
        'name': 'My Created Group 1',
        'image': Assets.images.chatUserPic,
        'memberCount': 88,
        'lastActivity': '3 min',
        'isAdmin': false,
        'createdByCurrentUser': true,
      },
      {
        'id': '6',
        'name': 'My Created Group 2',
        'image': Assets.images.chatUserPicOne,
        'memberCount': 76,
        'lastActivity': '7 min',
        'isAdmin': false,
        'createdByCurrentUser': true,
      },
    ];

    adminGroups.value =
        allGroups.where((group) => group['isAdmin'] == true).toList();
    createdByYouGroups.value = allGroups
        .where((group) => group['createdByCurrentUser'] == true)
        .toList();

    // Initialize with some dummy pinned groups for demo
    pinnedGroupIds.value = ['1', '3', '5'];
  }

  void _setupSearchListener() {
    searchController.addListener(() {
      searchQuery.value = searchController.text;
    });
  }

  // Filter methods
  void setFilter(GroupFilter filter) {
    currentFilter.value = filter;
  }

  // Backward compatibility methods
  bool get isAdminOnly => currentFilter.value == GroupFilter.adminOnly;
  bool get isCreatedByYou => currentFilter.value == GroupFilter.createdByYou;
  bool get isAll => currentFilter.value == GroupFilter.all;

  void setAdminOnly(bool value) {
    if (value) {
      currentFilter.value = GroupFilter.adminOnly;
    } else {
      currentFilter.value = GroupFilter.all;
    }
  }

  void setCreatedByYou(bool value) {
    if (value) {
      currentFilter.value = GroupFilter.createdByYou;
    } else {
      currentFilter.value = GroupFilter.all;
    }
  }

  void clearGroupImage() {
    groupImagePath.value = '';
  }

  final RxString groupImagePath = ''.obs;

  // Method to set the selected image
  void setGroupImage(String imagePath) {
    groupImagePath.value = imagePath;
  }

  // Get filtered groups based on current filter and search
  List<Map<String, dynamic>> get filteredGroups {
    List<Map<String, dynamic>> groups;

    switch (currentFilter.value) {
      case GroupFilter.adminOnly:
        groups = adminGroups;
      case GroupFilter.createdByYou:
        groups = createdByYouGroups;
      case GroupFilter.all:
      default:
        groups = allGroups;
    }

    if (searchQuery.value.isNotEmpty) {
      groups = groups
          .where((group) => group['name']
              .toString()
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()),)
          .toList();
    }

    return groups;
  }

  // Get pinned groups
  List<Map<String, dynamic>> get pinnedGroups {
    return filteredGroups
        .where((group) => pinnedGroupIds.contains(group['id']))
        .toList();
  }

  // Get unpinned groups
  List<Map<String, dynamic>> get unpinnedGroups {
    return filteredGroups
        .where((group) => !pinnedGroupIds.contains(group['id']))
        .toList();
  }

  // Pin/Unpin methods - Enhanced with success feedback
  void toggleGroupPin(String groupId) {
    if (pinnedGroupIds.contains(groupId)) {
      unpinGroup(groupId);
    } else {
      pinGroup(groupId);
    }
  }

  void pinGroup(String groupId) {
    if (!pinnedGroupIds.contains(groupId)) {
      pinnedGroupIds.add(groupId);

      // Find group name for feedback
      final group = allGroups.firstWhereOrNull((g) => g['id'] == groupId);
      final groupName = group?['name'] ?? 'Group';

      // Show success message
      Get.snackbar(
        'Success',
        '$groupName has been pinned',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
      );
    }
  }

  void unpinGroup(String groupId) {
    if (pinnedGroupIds.contains(groupId)) {
      pinnedGroupIds.remove(groupId);

      // Find group name for feedback
      final group = allGroups.firstWhereOrNull((g) => g['id'] == groupId);
      final groupName = group?['name'] ?? 'Group';

      // Show success message
      Get.snackbar(
        'Success',
        '$groupName has been unpinned',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange.withOpacity(0.8),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
      );
    }
  }

  // Bulk pin/unpin operations
  void pinMultipleGroups(List<String> groupIds) {
    for (final groupId in groupIds) {
      if (!pinnedGroupIds.contains(groupId)) {
        pinnedGroupIds.add(groupId);
      }
    }

    Get.snackbar(
      'Success',
      '${groupIds.length} groups have been pinned',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  void unpinMultipleGroups(List<String> groupIds) {
    for (final groupId in groupIds) {
      pinnedGroupIds.remove(groupId);
    }

    Get.snackbar(
      'Success',
      '${groupIds.length} groups have been unpinned',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange.withOpacity(0.8),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  void clearAllPinnedGroups() {
    final count = pinnedGroupIds.length;
    pinnedGroupIds.clear();

    Get.snackbar(
      'Success',
      'All $count pinned groups have been cleared',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.8),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  // Navigation methods
  void navigateToFeedPage() {
    Get.to(() => const FeedPageScreen());
  }

  void showManagePinGroupSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const ManagePinGroupSheet(),
    );
  }

  // Data loading methods (to be implemented with actual API calls)
  Future<void> loadGroups() async {
    try {
      isLoading.value = true;

      // TODO: Replace with actual API calls
      // final response = await remoteSource.getAllGroups();
      // allGroups.value = response.data;

      // final adminResponse = await remoteSource.getAdminGroups();
      // adminGroups.value = adminResponse.data;

      // final createdByYouResponse = await remoteSource.getCreatedByYouGroups();
      // createdByYouGroups.value = createdByYouResponse.data;

      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
    } catch (e) {
      // Handle error
      Get.snackbar(
        'Error',
        'Failed to load groups: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshGroups() async {
    await loadGroups();
  }

  // Search methods
  void clearSearch() {
    searchController.clear();
    searchQuery.value = '';
  }

  void search(String query) {
    searchQuery.value = query;
  }

  // Utility methods
  bool isGroupPinned(String groupId) {
    return pinnedGroupIds.contains(groupId);
  }

  bool get hasSearchQuery => searchQuery.value.isNotEmpty;

  int get totalGroupCount => filteredGroups.length;
  int get pinnedGroupCount => pinnedGroups.length;
  int get unpinnedGroupCount => unpinnedGroups.length;

  // Get group by ID
  Map<String, dynamic>? getGroupById(String groupId) {
    return allGroups.firstWhereOrNull((group) => group['id'] == groupId);
  }

  // Pin status checking
  String getPinStatusText(String groupId) {
    return isGroupPinned(groupId) ? 'Unpin Group' : 'Pin Group';
  }

  IconData getPinStatusIcon(String groupId) {
    return isGroupPinned(groupId) ? Icons.push_pin : Icons.push_pin_outlined;
  }

  Color getPinStatusColor(String groupId) {
    return isGroupPinned(groupId) ? Colors.orange : Colors.blue;
  }

  // Helper method to check if user is coach
  bool get isUserCoach {
    return Get.find<ProfileController>().userProfile.value.isCoach ?? false;
  }
}
