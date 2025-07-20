import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:empowered/features/tribe/data/model/add_members_model.dart';
import 'package:empowered/features/tribe/data/model/feed_posts_model.dart';
import 'package:empowered/features/tribe/data/model/feed_saved_posts_model.dart';
import 'package:empowered/features/tribe/data/model/group_about_model.dart';
import 'package:empowered/features/tribe/data/model/group_list_model.dart';
import 'package:empowered/features/tribe/data/model/group_media_model.dart';
import 'package:empowered/features/tribe/data/model/saved_posts_model.dart';
import 'package:empowered/features/tribe/data/source/tribe_group_remote_source.dart';
import 'package:empowered/features/tribe/presentation/screen/feed_page_screen.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/tribe_widget/manage_pin_group_sheet.dart';
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';

class TribeGroupController extends GetxController {
  TribeGroupController({required this.remoteSource});

  final TribeGroupRemoteSource remoteSource;
  final List<String> filters = ['All', 'Created_by_you', 'Admin_only'];
  RxString selectedFilters = 'All'.obs;
  CancelToken? _cancelToken;

  final RxBool isLoading = false.obs;
  final RxBool isPinUnpinLoading = false.obs;
  final RxList<String> accessTypes = <String>[].obs; // Added for access types
  final Rx<TheStates> accessTypesState =
      TheStates.initial.obs; // Added for access types state
  final RxDouble uploadProgress = 0.0.obs;

  Map<String, List<GroupModel>> filteredGroups = {
    'all': [],
    'created_by_you': [],
    'admin_only': [],
  };

  final Map<String, Rx<TheStates>> filterStates = {
    'all': TheStates.initial.obs,
    'created_by_you': TheStates.initial.obs,
    'admin_only': TheStates.initial.obs,
  };

  final Map<String, String?> errorMessages = {
    'all': null,
    'created_by_you': null,
    'admin_only': null,
  };

  Rx<FeedPostsModel> groupPostModel = const FeedPostsModel().obs;
  Rx<GroupMediaModel> groupMediaModel = const GroupMediaModel().obs;
  Rx<SavedPostsModel> savedPostsModel = const SavedPostsModel().obs;
  Rx<FeedSavedPostsModel> feedSavedPostsModel = const FeedSavedPostsModel().obs;

  Rx<GroupAboutModel> groupDetailModel = const GroupAboutModel().obs;
  Rx<String?> queryText = Rx<String?>(null);

  final RxList<String> pinnedGroupIds = <String>[].obs;
  late String groupImagePath;
  final Rx<TheStates> createGroupState = TheStates.initial.obs;
  final Rx<TheStates> editGroupState = TheStates.initial.obs;
  final Rx<TheStates> groupDetailsState = TheStates.initial.obs;
  Rx<TheStates> loadGroupState = TheStates.initial.obs;
  Rx<TheStates> savedPostState = TheStates.initial.obs;

  late TextEditingController groupNameController;
  late TextEditingController groupDescriptionController;
  late TextEditingController accessTypeController;
  final TextEditingController searchController = TextEditingController();
  @override
  void refresh() {
    groupImagePath = '';
    _setupSearchListener();
    fetchAllGroups();
    fetchAccessTypes();
  }

  @override
  void onInit() {
    super.onInit();
    groupNameController = TextEditingController();
    groupDescriptionController = TextEditingController();
    accessTypeController = TextEditingController();
    refresh();
  }

  @override
  void onClose() {
    searchController.dispose();
    groupNameController.dispose();
    groupDescriptionController.dispose();
    accessTypeController.dispose();
    _cancelToken?.cancel();
    super.onClose();
  }

  Future<void> fetchAccessTypes({CancelToken? cancelToken}) async {
    try {
      accessTypesState.value = TheStates.loading;
      _cancelToken?.cancel();
      _cancelToken = cancelToken ?? CancelToken();

      final result =
          await remoteSource.getAccessTypes(cancelToken: _cancelToken);

      result.fold(
        (error) {
          accessTypesState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (r) {
          accessTypesState.value = TheStates.success;
          accessTypes.assignAll(r); // Assuming r is List<String>
        },
      );
    } catch (e) {
      accessTypesState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to fetch access types: $e');
    }
  }

  Future<void> fetchAllGroups() async {
    for (final filter in filters) {
      await loadGroups(showPost: filter);
    }
  }

  void _setupSearchListener() {
    searchController.addListener(() {
      queryText.value = searchController.text;
      loadGroups(searchQuery: queryText.value);
    });
  }

  Future<void> loadGroups({
    CancelToken? cancelToken,
    String? searchQuery,
    String? showPost,
  }) async {
    final currentFilter = showPost ?? selectedFilters.value;

    filterStates.putIfAbsent(currentFilter, () => TheStates.initial.obs);
    errorMessages.putIfAbsent(currentFilter, () => null);
    filteredGroups.putIfAbsent(currentFilter, () => []);

    errorMessages[currentFilter] = null;
    filterStates[currentFilter]?.value = TheStates.loading;

    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    final result = await remoteSource.getGroups(
      search: searchQuery,
      showPost: currentFilter,
      cancelToken: _cancelToken,
    );

    return result.fold(
      (l) {
        filterStates[currentFilter]?.value = TheStates.error;
        errorMessages[currentFilter] = l.message;
        return false;
      },
      (r) async {
        final groups = r.data?.groups ?? [];

        filteredGroups[currentFilter] = groups;
        _updatePinnedGroupIds(groups);

        filterStates[currentFilter]?.value = TheStates.success;
      },
    );
  }

  void _updatePinnedGroupIds(List<GroupModel> groups) {
    final pinnedIds = groups
        .where((group) => group.isPinned == true)
        .map((group) => group.id.toString())
        .toList();
    pinnedGroupIds.value = pinnedIds;
  }

  List<GroupModel> get currentGroups {
    final currentFilter = selectedFilters.value;
    return filteredGroups[currentFilter] ?? [];
  }

  List<GroupModel> get pinnedGroups {
    if (selectedFilters.value == 'Admin_only') {
      return currentGroups
          .where((group) =>
              group.isPinned == true &&
              (group.accessType?.toLowerCase() == 'admin_only'))
          .toList();
    }
    return currentGroups.where((group) => group.isPinned == true).toList();
  }

  List<GroupModel> get unpinnedGroups {
    if (selectedFilters.value == 'Admin_only') {
      return currentGroups
          .where((group) =>
              group.isPinned != true &&
              (group.accessType?.toLowerCase() == 'admin_only'))
          .toList();
    }
    return currentGroups.where((group) => group.isPinned != true).toList();
  }

  Future<void> createGroup({
    required String groupName,
    required String about,
    required String accessType,
    String? imagePath,
    List<String>? membersId,
  }) async {
    final nameError = validateGroupName(groupName);
    final descError = validateGroupDescription(about);
    final accessTypeError = validateAccessType(accessType);
    if (nameError != null || descError != null || accessTypeError != null) {
      createGroupState.value = TheStates.error;
      AppUtils.showErrorSnackbar(
        message: nameError ?? descError ?? accessTypeError ?? 'Invalid input',
      );
      return;
    }

    try {
      createGroupState.value = TheStates.loading;
      final result = await remoteSource.createGroup(
        groupName: groupName,
        about: about,
        accessType: accessType,
        imagePath: imagePath,
        membersId: membersId,
      );
      result.fold(
        (error) {
          createGroupState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (response) async {
          createGroupState.value = TheStates.success;
          AppUtils.showSnackbar(
            message: response.message ?? 'Group created successfully',
          );
          await refreshGroups();
          clearGroupForm();
        },
      );
    } catch (e) {
      createGroupState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to create group: $e');
    } finally {
      createGroupState.value = TheStates.initial;
    }
  }

  Future<void> editGroup({
    String? groupId,
    String? groupName,
    String? about,
    String? accessType,
    String? imagePath,
    List<String>? membersId,
  }) async {
    final nameError = validateGroupName(groupName);
    final descError = validateGroupDescription(about);
    final accessTypeError = validateAccessType(accessType);
    if (nameError != null || descError != null || accessTypeError != null) {
      editGroupState.value = TheStates.error;
      AppUtils.showErrorSnackbar(
        message: nameError ?? descError ?? 'Invalid input',
      );
      return;
    }

    try {
      editGroupState.value = TheStates.loading;
      final result = await remoteSource.editGroup(
        groupId: groupId,
        groupName: groupName,
        about: about,
        accessType: accessType,
        imagePath: imagePath,
        membersId: membersId,
      );
      result.fold(
        (error) {
          editGroupState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (response) async {
          editGroupState.value = TheStates.success;
          AppUtils.showSnackbar(
            message: response.message ?? 'Group edited successfully',
          );
          await refreshGroups();
          clearGroupForm();
        },
      );
    } catch (e) {
      editGroupState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to update group: $e');
    } finally {
      editGroupState.value = TheStates.initial;
    }
  }

  Rx<TheStates> postDetailState = TheStates.initial.obs;
  Future<void> loadPostDetails(String groupId) async {
    try {
      postDetailState.value = TheStates.loading;
      final result = await remoteSource.getGroupPostById(groupId: groupId);

      result.fold(
        (error) {
          postDetailState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (r) {
          postDetailState.value = TheStates.success;
          groupPostModel.value = FeedPostsModel(
            data: r.data,
            message: r.message,
            status: r.status,
          ); // Always assign a new instance
        },
      );
    } catch (e) {
      postDetailState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to load group posts: $e');
    }
  }

  Rx<TheStates> userPostState = TheStates.initial.obs;
  RxnString userPostError = RxnString();
  Rx<FeedPostsModel> userPostModel = const FeedPostsModel().obs;
  Future<void> loadUserPost(String groupId, String userId) async {
    try {
      userPostError.value = null;
      userPostState.value = TheStates.loading;
      final result =
          await remoteSource.getPostByUserId(groupId: groupId, userId: userId);

      result.fold(
        (error) {
          userPostState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (r) {
          userPostState.value = TheStates.success;
          userPostModel.value = r;
        },
      );
    } catch (e) {
      userPostState.value = TheStates.error;
      userPostError.value = 'Failed to load group posts: $e';
      AppUtils.showErrorSnackbar(message: 'Failed to load group posts: $e');
    }
  }

  Rx<TheStates> groupMediaState = TheStates.initial.obs;
  Future<void> loadGroupMedia(String groupId) async {
    try {
      groupMediaState.value = TheStates.loading;
      final result = await remoteSource.getGroupMedia(groupId: groupId);

      result.fold(
        (error) {
          groupMediaState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (r) {
          groupMediaState.value = TheStates.success;
          groupMediaModel.value = r;
        },
      );
    } catch (e) {
      groupMediaState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to load group posts: $e');
    }
  }

  Future<void> getSavedPosts(String groupId, {CancelToken? cancelToken}) async {
    try {
      savedPostState.value = TheStates.loading;

      _cancelToken?.cancel();
      _cancelToken = cancelToken ?? CancelToken();

      final result = await remoteSource.getSavedPosts(
        groupId: groupId,
        cancelToken: _cancelToken,
      );

      result.fold(
        (error) {
          savedPostState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (r) {
          savedPostState.value = TheStates.success;
          savedPostsModel.value = r ?? const SavedPostsModel();
        },
      );
    } catch (e) {
      savedPostState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to load saved posts: $e');
    }
  }

  Rx<TheStates> getFeedSavedPostState = TheStates.initial.obs;
  Future<void> getFeedSavedPost({CancelToken? cancelToken}) async {
    try {
      getFeedSavedPostState.value = TheStates.loading;

      _cancelToken?.cancel();
      _cancelToken = cancelToken ?? CancelToken();

      final result = await remoteSource.getFeedSavedPosts(
        cancelToken: _cancelToken,
      );

      result.fold(
        (error) {
          getFeedSavedPostState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (r) {
          getFeedSavedPostState.value = TheStates.success;
          feedSavedPostsModel.value = r;
        },
      );
    } catch (e) {
      getFeedSavedPostState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to load saved posts: $e');
    }
  }

  Future<void> loadGroupDetails(String groupId) async {
    try {
      groupDetailsState.value = TheStates.loading;
      final result = await remoteSource.getGroupDetailsById(groupId: groupId);

      result.fold(
        (error) {
          groupDetailsState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (r) {
          groupDetailsState.value = TheStates.success;
          groupDetailModel.value = r;
        },
      );
    } catch (e) {
      groupDetailsState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to load group details: $e');
    }
  }

  String? validateGroupName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Group name is required';
    }
    if (value.length < 3) {
      return 'Group name must be at least 3 characters';
    }
    return null;
  }

  String? validateGroupDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Group description is required';
    }
    if (value.length < 10) {
      return 'Group description must be at least 10 characters';
    }
    return null;
  }

  String? validateAccessType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Access type is required';
    }
    if (!accessTypes.contains(value)) {
      return 'Invalid access type selected';
    }
    return null;
  }

  void clearGroupForm() {
    groupNameController.clear();
    groupDescriptionController.clear();
    accessTypeController.clear();
    groupImagePath = '';
  }

  void setGroupImage(String imagePath) {
    groupImagePath = imagePath;
  }

  void clearGroupImage() {
    groupImagePath = '';
  }

  Future<void> removeMember({
    required String groupId,
    required String? memberId,
  }) async {
    try {
      final result = await remoteSource.removeMembers(
        groupId: groupId,
        membersId: memberId,
      );
      result.fold(
        (error) {
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (response) async {
          AppUtils.showSnackbar(message: response);
          await loadGroupDetails(groupId); // Refresh group details
        },
      );
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to remove member: $e');
    }
  }

  Future<void> toggleGroupPin(String groupId) async {
    if (isPinUnpinLoading.value) return;

    try {
      isPinUnpinLoading.value = true;
      final result = await remoteSource.pinUnpinGroup(groupId: groupId);

      result.fold(
        (error) {
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (success) {
          AppUtils.showSnackbar(
            message: success.message ?? 'Pin status updated',
          );
          refreshGroups();
        },
      );
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to update pin status: $e');
    } finally {
      isPinUnpinLoading.value = false;
    }
  }

  Rx<TheStates> getGroupMemberState = TheStates.initial.obs;
  Rx<GroupMembersModel> groupMembersModel = const GroupMembersModel().obs;
  Future<void> getGroupMembers({CancelToken? cancelToken}) async {
    try {
      getGroupMemberState.value = TheStates.loading;

      _cancelToken?.cancel();
      _cancelToken = cancelToken ?? CancelToken();

      final result = await remoteSource.getMembers(
        cancelToken: _cancelToken,
      );

      result.fold(
        (error) {
          getGroupMemberState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (r) {
          getGroupMemberState.value = TheStates.success;
          groupMembersModel.value = r;
        },
      );
    } catch (e) {
      getGroupMemberState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to load saved posts: $e');
    }
  }

  void navigateToFeedPage(String groupId, bool isAdmin, String accessType) {
    final FeedPageController feedPageController =
        Get.find<FeedPageController>();
    feedPageController.currentTabIndex.value = 0; // Reset to posts tab
    Get.to(
      () => FeedPageScreen(
        groupId: groupId,
        isAdmin: isAdmin,
        accessType: accessType,
      ),
    );
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

  Future<void> refreshGroups() async {
    await loadGroups(
      showPost: selectedFilters.value,
      searchQuery: queryText.value,
    );
  }

  void clearSearch() {
    searchController.clear();
    queryText.value = '';
    loadGroups(showPost: selectedFilters.value);
  }

  void search(String query) {
    queryText.value = query;
    loadGroups(
      showPost: selectedFilters.value,
      searchQuery: query,
    );
  }

  void changeFilter(String filter) {
    selectedFilters.value = filter;
    loadGroups(showPost: filter);
  }

  bool get hasSearchQuery => queryText.value?.isNotEmpty == true;

  bool get isUserCoach {
    return Get.find<ProfileController>().userProfile.value.isCoach ?? false;
  }

  String get userId {
    return Get.find<ProfileController>().userProfile.value.id.toString();
  }

  TheStates get currentFilterState {
    final currentFilter = selectedFilters.value;
    return filterStates[currentFilter]?.value ?? TheStates.initial;
  }

  String? get currentFilterError {
    final currentFilter = selectedFilters.value;
    return errorMessages[currentFilter];
  }
}
