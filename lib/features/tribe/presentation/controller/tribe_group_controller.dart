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

  final RxInt currentSavedPage = 1.obs;
  final RxInt lastSavedPage = 1.obs;
  final RxBool isLoadingMoreSaved = false.obs;
  final int savedPostsPerPage = 10;

  // Pagination state for group feed posts
  final RxInt currentGroupFeedPage = 1.obs;
  final RxInt lastGroupFeedPage = 1.obs;
  final RxBool isLoadingMoreGroupPosts = false.obs;
  final int groupFeedPostsPerPage = 10;

  // Pagination state for group media
  final RxInt currentGroupMediaPage = 1.obs;
  final RxInt lastGroupMediaPage = 1.obs;
  final RxBool isLoadingMoreGroupMedia = false.obs;
  final int groupMediaPerPage = 12;

  Rx<TheStates> groupMediaState = TheStates.initial.obs;
  Future<void> loadGroupMedia(String groupId,
      {int page = 1, bool append = false,}) async {
    try {
      if (!append) groupMediaState.value = TheStates.loading;
      if (!append) currentGroupMediaPage.value = 1;
      if (!append) lastGroupMediaPage.value = 1;
      if (append) isLoadingMoreGroupMedia.value = true;
      final result = await remoteSource.getGroupMedia(
        groupId: groupId,
        page: page,
        limit: groupMediaPerPage,
      );

      result.fold(
        (error) {
          if (!append) groupMediaState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (r) {
          if (!append) groupMediaState.value = TheStates.success;
          final newMedia = r.data?.medias ?? [];
          if (append) {
            final currentMedia = groupMediaModel.value.data?.medias ?? [];
            groupMediaModel.value = groupMediaModel.value.copyWith(
              data: groupMediaModel.value.data?.copyWith(
                medias: List.of(currentMedia)..addAll(newMedia),
                meta: r.data?.meta,
              ),
            );
          } else {
            groupMediaModel.value = r;
          }
          final meta = r.data?.meta;
          if (meta != null) {
            final parsedCurrent =
                int.tryParse(meta.currentPage?.toString() ?? '');
            currentGroupMediaPage.value = parsedCurrent ?? page;
            lastGroupMediaPage.value =
                int.tryParse(meta.lastPage?.toString() ?? '') ?? page;
          } else {
            currentGroupMediaPage.value = page;
            lastGroupMediaPage.value = page;
          }
        },
      );
    } catch (e) {
      if (!append) groupMediaState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to load group media: $e');
    } finally {
      if (append) isLoadingMoreGroupMedia.value = false;
    }
  }

  Future<void> fetchNextGroupMediaPage(String groupId) async {
    if (isLoadingMoreGroupMedia.value) return;
    if (currentGroupMediaPage.value >= lastGroupMediaPage.value) return;
    await loadGroupMedia(groupId,
        page: currentGroupMediaPage.value + 1, append: true,);
  }

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
    return currentGroups.where((group) => group.isPinned == true).toList();
  }

  List<GroupModel> get unpinnedGroups {
    return currentGroups.where((group) => group.isPinned != true).toList();
  }

  Future<bool> createGroup({
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
      return false;
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
      return result.fold(
        (error) {
          createGroupState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: error.message);
          return false;
        },
        (response) async {
          createGroupState.value = TheStates.success;
          AppUtils.showSnackbar(
            message: response.message ?? 'Group created successfully',
          );
          await refreshGroups();
          clearGroupForm();
          return true;
        },
      );
    } catch (e) {
      createGroupState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to create group: $e');
      return false;
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

  Rx<TheStates> deleteGroupState = TheStates.initial.obs;
  Future<bool> deleteGroup(String groupId) async {
    deleteGroupState.value = TheStates.loading;
    final result = await remoteSource.deleteGroup(groupId: groupId);
    return result.fold(
      (l) {
        deleteGroupState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        deleteGroupState.value = TheStates.success;
        AppUtils.showSnackbar(message: r);
        return true;
      },
    );
  }

  Rx<TheStates> postDetailState = TheStates.initial.obs;
  Future<void> loadPostDetails(String groupId,
      {int page = 1, bool append = false,}) async {
    try {
      if (!append) postDetailState.value = TheStates.loading;
      if (!append) currentGroupFeedPage.value = 1;
      if (!append) lastGroupFeedPage.value = 1;
      if (append) isLoadingMoreGroupPosts.value = true;
      final result = await remoteSource.getGroupPostById(
        groupId: groupId,
        page: page,
        limit: groupFeedPostsPerPage,
      );

      result.fold(
        (error) {
          if (!append) postDetailState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (r) {
          if (!append) postDetailState.value = TheStates.success;
          final newPosts = r.data?.posts ?? [];
          if (append) {
            final currentPosts = groupPostModel.value.data?.posts ?? [];
            groupPostModel.value = groupPostModel.value.copyWith(
              data: groupPostModel.value.data?.copyWith(
                posts: List.of(currentPosts)..addAll(newPosts),
                meta: r.data?.meta,
              ),
            );
          } else {
            groupPostModel.value = FeedPostsModel(
              data: r.data,
              message: r.message,
              status: r.status,
            );
          }
          final meta = r.data?.meta;
          if (meta != null) {
            currentGroupFeedPage.value = meta.currentPage ?? page;
            lastGroupFeedPage.value = meta.lastPage ?? page;
          } else {
            currentGroupFeedPage.value = page;
            lastGroupFeedPage.value = page;
          }
        },
      );
    } catch (e) {
      if (!append) postDetailState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to load group posts: $e');
    } finally {
      if (append) isLoadingMoreGroupPosts.value = false;
    }
  }

  Future<void> fetchNextGroupFeedPostsPage(String groupId) async {
    if (isLoadingMoreGroupPosts.value) return;
    if (currentGroupFeedPage.value >= lastGroupFeedPage.value) return;
    await loadPostDetails(groupId,
        page: currentGroupFeedPage.value + 1, append: true,);
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

  Future<void> getSavedPosts(String groupId,
      {int page = 1, bool append = false, CancelToken? cancelToken,}) async {
    try {
      if (!append) savedPostState.value = TheStates.loading;
      if (!append) currentSavedPage.value = 1;
      if (!append) lastSavedPage.value = 1;
      if (append) isLoadingMoreSaved.value = true;

      _cancelToken?.cancel();
      _cancelToken = cancelToken ?? CancelToken();

      final result = await remoteSource.getSavedPosts(
        groupId: groupId,
        page: page,
        limit: savedPostsPerPage,
        cancelToken: _cancelToken,
      );

      result.fold(
        (error) {
          if (!append) savedPostState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (r) {
          if (!append) savedPostState.value = TheStates.success;
          final newPosts = r.data?.savedPosts ?? [];
          if (append) {
            final currentPosts = savedPostsModel.value.data?.savedPosts ?? [];
            savedPostsModel.value = savedPostsModel.value.copyWith(
              data: savedPostsModel.value.data?.copyWith(
                savedPosts: List.of(currentPosts)..addAll(newPosts),
                meta: r.data?.meta,
              ),
            );
          } else {
            savedPostsModel.value = r;
          }
          final meta = r.data?.meta;
          if (meta != null) {
            currentSavedPage.value = meta.currentPage ?? page;
            lastSavedPage.value = meta.lastPage ?? page;
          } else {
            currentSavedPage.value = page;
            lastSavedPage.value = page;
          }
        },
      );
    } catch (e) {
      if (!append) savedPostState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to load saved posts: $e');
    } finally {
      if (append) isLoadingMoreSaved.value = false;
    }
  }

  Future<void> fetchNextGroupSavedPostsPage(String groupId) async {
    if (isLoadingMoreSaved.value) return;
    if (currentSavedPage.value >= lastSavedPage.value) return;
    await getSavedPosts(groupId,
        page: currentSavedPage.value + 1, append: true,);
  }

  Rx<TheStates> getFeedSavedPostState = TheStates.initial.obs;
  Future<void> getFeedSavedPost(
      {int page = 1, bool append = false, CancelToken? cancelToken,}) async {
    if (isLoadingMoreSaved.value) return;
    if (append) isLoadingMoreSaved.value = true;
    try {
      getFeedSavedPostState.value = TheStates.loading;
      final result = await remoteSource.getFeedSavedPosts(
        page: page,
        limit: savedPostsPerPage,
        cancelToken: cancelToken,
      );
      result.fold(
        (error) {
          getFeedSavedPostState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: error.message);
        },
        (r) {
          getFeedSavedPostState.value = TheStates.success;
          final newPosts = r.data?.savedPosts ?? [];
          if (append) {
            feedSavedPostsModel.value = feedSavedPostsModel.value.copyWith(
              data: feedSavedPostsModel.value.data?.copyWith(
                savedPosts: [
                  ...(feedSavedPostsModel.value.data?.savedPosts ?? []),
                  ...newPosts,
                ],
              ),
            );
          } else {
            feedSavedPostsModel.value = r;
          }
          // Update pagination
          final meta = r.data?.meta;
          if (meta != null) {
            currentSavedPage.value = meta.currentPage ?? page;
            lastSavedPage.value = meta.lastPage ?? page;
          } else {
            currentSavedPage.value = page;
            lastSavedPage.value = page;
          }
        },
      );
    } catch (e) {
      getFeedSavedPostState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to load saved posts: $e');
    } finally {
      if (append) isLoadingMoreSaved.value = false;
    }
  }

  Future<void> fetchNextSavedPostsPage() async {
    if (isLoadingMoreSaved.value) return;
    if (currentSavedPage.value >= lastSavedPage.value) return;
    await getFeedSavedPost(page: currentSavedPage.value + 1, append: true);
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
    Get.to(
      () => FeedPageScreen(
        groupId: groupId,
        isAdmin: isAdmin,
        accessType: accessType,
      ),
    )?.then((_) {
      refreshGroups();
    });
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
