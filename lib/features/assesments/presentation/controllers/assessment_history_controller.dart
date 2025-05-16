import 'package:dartz/dartz.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/data/model/assessment_history_model.dart';
import 'package:empowered/features/assesments/data/source/assessment_history_remote_source.dart';
import 'package:empowered/features/assesments/presentation/controllers/user_assessment_bindings.dart';

enum AssessmentHistoryPagination {
  history,
  search,
}

class AssessmentHistoryPaginationPageController extends GetxController {
  RxInt currentPage = 1.obs;
  RxInt lastPage = 100.obs;
  RxBool isLoadingMore = false.obs;
  RxBool isInitialLoading = false.obs;
}

class AssessmentHistoryController extends GetxController {
  AssessmentHistoryController({required this.remoteSource});
  final AssessmentHistoryRemoteSource remoteSource;

  Rx<TheStates> getAssessmentHistoryState = TheStates.initial.obs;
  Rx<TheStates> getAssessmentHistorySearchState = TheStates.initial.obs;

  RxMap<AssessmentHistoryPagination, AssessmentHistoryPaginationPageController>
      assessmentHistoryPaginationPageController =
      <AssessmentHistoryPagination, AssessmentHistoryPaginationPageController>{}
          .obs;

  Rx<AssessmentHistoryPagination> seletedAssessmentHistoryPagination =
      AssessmentHistoryPagination.history.obs;

  bool hasMorePages(AssessmentHistoryPagination tab) =>
      assessmentHistoryPaginationPageController[tab]!.currentPage.value <
      assessmentHistoryPaginationPageController[tab]!.lastPage.value;

  Map<AssessmentHistoryPagination, ScrollController> scrollControllers = {};
  RxMap<AssessmentHistoryPagination, bool> tabDataLoaded =
      <AssessmentHistoryPagination, bool>{}.obs;

  RxList<UserAssessment> userAssessmentHistoryList = <UserAssessment>[].obs;
  RxList<UserAssessment> userAssessmentSearchList = <UserAssessment>[].obs;

  // Selection state management
  RxList<bool> selectBulk = <bool>[].obs;
  RxList<bool> selectSeaarchBulk = <bool>[].obs;
  RxBool selectAllFlag = false.obs;
  RxList<String> selectedIds = <String>[].obs;

  Rx<String?> searchError = Rx<String?>(null);
  Rx<String?> historyError = Rx<String?>(null);
  Rx<String?> selectedAssessment = Rx<String?>(null);
  final Rx<String?> selectedAssessmentIds = Rx<String?>(null);
  Rx<String?> queryText = Rx<String?>(null);

  @override
  void onInit() {
    super.onInit();
    UserAssessmentInitializer.destroy();
    UserAssessmentInitializer.initialize();
    // Initialize pagination controllers for both tabs
    assessmentHistoryPaginationPageController[AssessmentHistoryPagination
        .history] = AssessmentHistoryPaginationPageController();

    assessmentHistoryPaginationPageController[AssessmentHistoryPagination
        .search] = AssessmentHistoryPaginationPageController();
  }

  // Initialize selection data
  void initializeSelectionData() {
    final isSearchActive =
        queryText.value != null && queryText.value!.isNotEmpty;
    final assessmentList =
        isSearchActive ? userAssessmentSearchList : userAssessmentHistoryList;

    if (isSearchActive) {
      selectSeaarchBulk.value = List.generate(
        assessmentList.length,
        (_) => false,
      );
    } else {
      selectBulk.value = List.generate(
        assessmentList.length,
        (_) => false,
      );
    }

    // Reset selected IDs when initializing
    selectedIds.clear();
    selectAllFlag.value = false;
  }

  // Toggle individual selection
  void toggleSelection(int index, bool isSelected) {
    final isSearchActive =
        queryText.value != null && queryText.value!.isNotEmpty;
    final assessmentList =
        isSearchActive ? userAssessmentSearchList : userAssessmentHistoryList;

    if (index >= assessmentList.length) return;

    if (isSearchActive) {
      // Ensure the search selection list is long enough
      if (selectSeaarchBulk.length <= index) {
        selectSeaarchBulk.value = List.generate(
          assessmentList.length,
          (i) => i < selectSeaarchBulk.length ? selectSeaarchBulk[i] : false,
        );
      }

      // Update the selection state
      final newList = List<bool>.from(selectSeaarchBulk);
      newList[index] = isSelected;
      selectSeaarchBulk.value = newList;
    } else {
      // Ensure the history selection list is long enough
      if (selectBulk.length <= index) {
        selectBulk.value = List.generate(
          assessmentList.length,
          (i) => i < selectBulk.length ? selectBulk[i] : false,
        );
      }

      // Update the selection state
      final newList = List<bool>.from(selectBulk);
      newList[index] = isSelected;
      selectBulk.value = newList;
    }

    // Update selected IDs
    final assessment = assessmentList[index];
    final id = assessment.id?.toString();

    if (id != null) {
      if (isSelected) {
        if (!selectedIds.contains(id)) {
          selectedIds.add(id);
        }
      } else {
        selectedIds.remove(id);
      }
    }

    // Update select all state
    updateSelectAllState();
  }

  // Toggle select all
  void toggleSelectAll(bool isSelected) {
    final isSearchActive =
        queryText.value != null && queryText.value!.isNotEmpty;
    final assessmentList =
        isSearchActive ? userAssessmentSearchList : userAssessmentHistoryList;

    // Update all selection states
    if (isSearchActive) {
      selectSeaarchBulk.value = List.generate(
        assessmentList.length,
        (_) => isSelected,
      );
    } else {
      selectBulk.value = List.generate(
        assessmentList.length,
        (_) => isSelected,
      );
    }

    // Update select all flag
    selectAllFlag.value = isSelected;

    // Update selected IDs
    selectedIds.clear();
    if (isSelected && assessmentList.isNotEmpty) {
      selectedIds.value = assessmentList
          .where((assessment) => assessment.id != null)
          .map((assessment) => assessment.id.toString())
          .toList();
    }
  }

  // Check if everything is selected and update selectAllFlag
  void updateSelectAllState() {
    final isSearchActive =
        queryText.value != null && queryText.value!.isNotEmpty;
    final selectionList = isSearchActive ? selectSeaarchBulk : selectBulk;

    if (selectionList.isEmpty) {
      selectAllFlag.value = false;
      return;
    }

    // Check if all items are selected
    selectAllFlag.value = selectionList.every((isSelected) => isSelected);
  }

  void clearSearch() {
    queryText.value = null;
    userAssessmentSearchList.clear();
    selectSeaarchBulk.clear();
    selectedIds.clear();
    selectAllFlag.value = false;
    searchError.value = null;
  }

  Future<void> getAssessmentHistory({
    CancelToken? cancelToken,
    bool searchAssessment = false,
    bool isInitialLoad = false,
    String? query,
  }) async {
    await getPaginatedData(
      state: searchAssessment
          ? getAssessmentHistorySearchState
          : getAssessmentHistoryState,
      groupsPaginationName: searchAssessment
          ? AssessmentHistoryPagination.search
          : AssessmentHistoryPagination.history,
      apiCall: (pageKey, search) => remoteSource.getAssessmentHistory(
        page: pageKey,
        query: query ?? queryText.value,
        perPage: 20,
        cancelToken: cancelToken,
      ),
      dataToClear: () {
        if (searchAssessment) {
          userAssessmentHistoryList.clear();
          selectSeaarchBulk.clear();
        } else {
          userAssessmentHistoryList.clear();
          selectBulk.clear();
        }
      },
      onError: (r) {
        if (searchAssessment) {
          searchError.value = r.message;
        } else {
          historyError.value = r.message;
        }
      },
      dataToAdd: (res) {
        if (searchAssessment) {
          userAssessmentSearchList
            ..clear()
            ..addAll(res.data?.userAssessments ?? []);
          selectSeaarchBulk.value = List.generate(
            userAssessmentSearchList.length,
            (index) => false,
          );
        } else {
          userAssessmentHistoryList
            ..clear()
            ..addAll(res.data?.userAssessments ?? []);
          selectBulk.value = List.generate(
            userAssessmentHistoryList.length,
            (index) => false,
          );
        }
      },
      isInitialLoad: isInitialLoad,
      currentPageValue: (res) => res.data?.meta?.currentPage ?? 1,
      lastPageValue: (res) => res.data?.meta?.lastPage ?? 100,
    );
  }

  ScrollController getScrollController(AssessmentHistoryPagination index) {
    if (!scrollControllers.containsKey(index)) {
      scrollControllers[index] = ScrollController();
    }
    return scrollControllers[index]!;
  }

  Future<void> getPaginatedData<T>({
    required Rx<TheStates> state,
    required Future<Either<AppError, T>> Function(int? pageKey, String? search)
        apiCall,
    required AssessmentHistoryPagination groupsPaginationName,
    required int Function(T) currentPageValue,
    required int Function(T) lastPageValue,
    required Function(T) dataToAdd,
    required Function() dataToClear,
    required Function(AppError) onError,
    bool isInitialLoad = false,
    String? search,
  }) async {
    final paginationController =
        assessmentHistoryPaginationPageController[groupsPaginationName];

    if (paginationController?.isLoadingMore.value == true) return;

    // Handle initial load and reset pagination
    if (isInitialLoad || search != null) {
      paginationController?.currentPage.value = 1;
      paginationController?.lastPage.value = 100;
      dataToClear();
      paginationController?.isInitialLoading.value = true;
    } else {
      paginationController?.isLoadingMore.value = true;
    }

    await _handleApiCall<T>(
      state: state,
      apiCall: apiCall(paginationController?.currentPage.value ?? 1, search),
      onSuccess: (response) {
        // Add new data to the list
        dataToAdd(response);
        paginationController?.currentPage.value = currentPageValue(response);
        paginationController?.lastPage.value = lastPageValue(response);
        setTabDataLoaded(groupsPaginationName, true);
      },
      onError: onError,
    );

    paginationController?.isLoadingMore.value = false;
    paginationController?.isInitialLoading.value = false;
  }

  Future<void> _handleApiCall<T>({
    required Future<Either<AppError, T>> apiCall,
    required Rx<TheStates> state,
    required Function(T) onSuccess,
    required Function(AppError) onError,
    RxBool? isInitialLoading,
  }) async {
    if (state.value == TheStates.loading) return;

    state.value = TheStates.loading;
    isInitialLoading?.value = true;

    final response = await apiCall;
    response.fold(
      (error) {
        state.value = TheStates.error;
        onError(error);
      },
      (data) {
        state.value = TheStates.success;
        onSuccess(data);
      },
    );

    isInitialLoading?.value = false;
  }

  void resetPaginationData() {
    assessmentHistoryPaginationPageController[
            seletedAssessmentHistoryPagination.value]
        ?.currentPage
        .value = 1;
    assessmentHistoryPaginationPageController[
            seletedAssessmentHistoryPagination.value]
        ?.lastPage
        .value = 100;
    assessmentHistoryPaginationPageController[
            seletedAssessmentHistoryPagination.value]
        ?.isLoadingMore
        .value = false;
    assessmentHistoryPaginationPageController[
            seletedAssessmentHistoryPagination.value]
        ?.isInitialLoading
        .value = true;
    setTabDataLoaded(seletedAssessmentHistoryPagination.value, false);
  }

  void loadMoreData(AssessmentHistoryPagination tab) {
    if (assessmentHistoryPaginationPageController[tab]!.currentPage.value <
        assessmentHistoryPaginationPageController[tab]!.lastPage.value) {
      assessmentHistoryPaginationPageController[tab]?.currentPage.value++;

      if (tab == AssessmentHistoryPagination.history) {
        getAssessmentHistory();
      } else if (tab == AssessmentHistoryPagination.search) {
        getAssessmentHistory(isInitialLoad: true, searchAssessment: true);
      } else {}
    }
  }

  void setTabDataLoaded(AssessmentHistoryPagination index, bool loaded) {
    tabDataLoaded[index] = loaded;
  }

  Future<bool?> deleteAssessments(List<String>? assessmentIds) async {
    if (assessmentIds == null || assessmentIds.isEmpty) return false;

    getAssessmentHistoryState.value = TheStates.loading;

    final result = await remoteSource.deleteAssessments(
      assessmentId: assessmentIds,
    );

    var res = result.fold(
      (l) {
        getAssessmentHistoryState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        getAssessmentHistoryState.value = TheStates.success;
        AppUtils.showSnackbar(message: r);

        // Also refresh search results if there's an active search
        if (queryText.value != null && queryText.value!.isNotEmpty) {
          queryText.value = null;
          userAssessmentSearchList.clear();
          // getAssessmentHistory(
          //   isInitialLoad: true,
          //   searchAssessment: true,
          //   query: queryText.value,
          // );
        }
        getAssessmentHistory(isInitialLoad: true);
        return true;
      },
    );

    return res;
  }

  @override
  void onClose() {
    // Dispose of all scroll controllers
    for (final controller in scrollControllers.values) {
      controller.dispose();
    }
    super.onClose();
  }
}
