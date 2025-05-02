import 'package:dartz/dartz.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/data/model/assessment_history_model.dart';
import 'package:empowered/features/assesments/data/source/assessment_history_remote_source.dart';

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

  Map<AssessmentHistoryPagination, ScrollController> scrollControllers =
      {}; // Keep separate scroll controllers for each tab
  RxMap<AssessmentHistoryPagination, bool> tabDataLoaded =
      <AssessmentHistoryPagination, bool>{}.obs;
  RxList<UserAssessment> userAssessmentHistoryList = <UserAssessment>[].obs;
  RxList<UserAssessment> userAssessmentSearchList = <UserAssessment>[].obs;
  RxList<bool> selectBulk = <bool>[].obs;
  RxList<bool> selectSeaarchBulk = <bool>[].obs;
  Rx<String?> searchError = Rx<String?>(null);
  Rx<String?> historyError = Rx<String?>(null);
  Rx<String?> selectedAssessment = Rx<String?>(null);
  final Rx<String?> selectedAssessmentIds = Rx<String?>(null);

  Future<void> getAssessmentHistory({
    bool searchAssessment = false,
    bool isInitialLoad = false,
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
        // emotionName: emotionName,
        // mainQuestion: mainQuestion,
        // sortBy: sortBy,
        // sortOrder: sortOrder,
        perPage: 20,
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
          userAssessmentSearchList.clear();
          userAssessmentSearchList.addAll(res.data?.userAssessments ?? []);
          selectSeaarchBulk.value = List.generate(
            userAssessmentSearchList.length,
            (index) => false,
          );
        } else {
          userAssessmentHistoryList.clear();
          userAssessmentHistoryList.addAll(res.data?.userAssessments ?? []);
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
// void toggleAssessmentSelection(String id, bool isSelected) {
//     if (isSelected) {
//       if (!selectedAssessmentIds.contains(id)) {
//         selectedAssessmentIds.add(id);
//       }
//     } else {
//       selectedAssessmentIds.remove(id);
//     }
//   }

//   void selectAllAssessments(bool selectAll) {
//     selectedAssessmentIds.clear();
//     if (selectAll) {
//       selectedAssessmentIds.addAll(
//         userAssessmentHistoryList
//             .where((assessment) => assessment.id != null)
//             .map((assessment) => assessment.id!.toString()),
//       );
//     }
//   }
  Future<bool?> deleteAssessments(
    List<String>? assessmentId,
  ) async {
    getAssessmentHistoryState.value = TheStates.loading;

    final result = await remoteSource.deleteAssessments(
      assessmentId: assessmentId,
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
        return true;
      },
    );
    return res;
  }
}
