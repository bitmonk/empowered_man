import 'package:dartz/dartz.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/data/model/reflection_library_model.dart';
import 'package:empowered/features/home/data/model/see_user_reflection_response_model.dart';
import 'package:empowered/features/home/data/source/reflection_library_remote_source.dart';

enum ReflectionPagination {
  library,
  search,
}

class ReflectionPaginationPageController extends GetxController {
  RxInt currentPage = 1.obs;
  RxInt lastPage = 100.obs;
  RxBool isLoadingMore = false.obs;
  RxBool isInitialLoading = false.obs;
}

class ReflectionLibraryController extends GetxController {
  ReflectionLibraryController({required this.remoteSource});
  final ReflectionLibraryRemoteSource remoteSource;

  Rx<ReflectionLibraryModel> reflectionLibrary =
      const ReflectionLibraryModel().obs;

  Rx<ReflectionPagination> seletedReflectionPagination =
      ReflectionPagination.library.obs;
  Rx<TheStates> getReflectionLibraryState = TheStates.initial.obs;
  Rx<TheStates> getReflectionLibrarySearchState = TheStates.initial.obs;
  Map<ReflectionPagination, ScrollController> scrollControllers = {};
  RxMap<ReflectionPagination, ReflectionPaginationPageController>
      reflectionPaginationPageController =
      <ReflectionPagination, ReflectionPaginationPageController>{}.obs;

  Rx<TheStates> deleteReflectionState = TheStates.initial.obs;
  Rx<TheStates> seeBulkReflectionState = TheStates.initial.obs;

  RxList<UserReflection> reflectionLibraryList = <UserReflection>[].obs;
  RxList<UserReflection> reflectionSearchList = <UserReflection>[].obs;
  Rx<String?> searchError = Rx<String?>(null);
  Rx<String?> libraryError = Rx<String?>(null);

  RxList<bool> selectBulk = <bool>[].obs;
  RxList<bool> selectSeaarchBulk = <bool>[].obs;

  RxMap<ReflectionPagination, bool> tabDataLoaded =
      <ReflectionPagination, bool>{}.obs;
  Rx<String?> selectedReflectionType = Rx<String?>(null);

//library pop up
  Rx<SeeUserReflectionResponseModel> userReflectionResponse =
      const SeeUserReflectionResponseModel().obs;

  Future<void> getReflectionLibrary({
    String? reflectionType,
    String? mainQuestion,
    String? sortBy,
    String? sortOrder,
    bool searchReflection = false,
    bool isInitialLoad = false,
  }) async {
    await getPaginatedData(
      state: searchReflection
          ? getReflectionLibrarySearchState
          : getReflectionLibraryState,
      groupsPaginationName: searchReflection
          ? ReflectionPagination.search
          : ReflectionPagination.library,
      apiCall: (pageKey, search) => remoteSource.getReflectionLibrary(
        page: pageKey,
        reflectionType: reflectionType,
        mainQuestion: mainQuestion,
        sortBy: sortBy,
        sortOrder: sortOrder,
        perPage: 20,
      ),
      dataToClear: () {
        if (searchReflection) {
          reflectionLibraryList.clear();
          selectSeaarchBulk.clear();
        } else {
          reflectionLibraryList.clear();
          selectBulk.clear();
        }
      },
      onError: (r) {
        if (searchReflection) {
          searchError.value = r.message;
        } else {
          libraryError.value = r.message;
        }
      },
      dataToAdd: (res) {
        if (searchReflection) {
          reflectionSearchList
            ..clear()
            ..addAll(res.data?.userReflections ?? []);
          selectSeaarchBulk.value = List.generate(
            reflectionSearchList.length,
            (index) => false,
          );
        } else {
          reflectionLibraryList
            ..clear()
            ..addAll(res.data?.userReflections ?? []);
          selectBulk.value = List.generate(
            reflectionLibraryList.length,
            (index) => false,
          );
        }
      },
      isInitialLoad: isInitialLoad,
      currentPageValue: (res) => res.data?.meta?.currentPage ?? 1,
      lastPageValue: (res) => res.data?.meta?.lastPage ?? 100,
    );
  }

  void refreshData() {
    if (!reflectionPaginationPageController
        .containsKey(seletedReflectionPagination.value)) {
      reflectionPaginationPageController[seletedReflectionPagination.value] =
          ReflectionPaginationPageController();
    }

    switch (seletedReflectionPagination.value) {
      case ReflectionPagination.library:
        if (!tabDataLoaded.containsKey(ReflectionPagination.library) ||
            !tabDataLoaded[ReflectionPagination.library]!) {
          getReflectionLibrary(isInitialLoad: true);
        }
      case ReflectionPagination.search:
        if (!tabDataLoaded.containsKey(ReflectionPagination.search) ||
            !tabDataLoaded[ReflectionPagination.search]!) {
          getReflectionLibrary(isInitialLoad: true, searchReflection: true);
        }
    }
  }

  ScrollController getScrollController(ReflectionPagination index) {
    if (!scrollControllers.containsKey(index)) {
      scrollControllers[index] = ScrollController();
    }
    return scrollControllers[index]!;
  }

  void resetPaginationData() {
    reflectionPaginationPageController[seletedReflectionPagination.value]
        ?.currentPage
        .value = 1;
    reflectionPaginationPageController[seletedReflectionPagination.value]
        ?.lastPage
        .value = 100;
    reflectionPaginationPageController[seletedReflectionPagination.value]
        ?.isLoadingMore
        .value = false;
    reflectionPaginationPageController[seletedReflectionPagination.value]
        ?.isInitialLoading
        .value = true;
    setTabDataLoaded(seletedReflectionPagination.value, false);
  }

  Future<void> getPaginatedData<T>({
    required Rx<TheStates> state,
    required Future<Either<AppError, T>> Function(int? pageKey, String? search)
        apiCall,
    required ReflectionPagination groupsPaginationName,
    required int Function(T) currentPageValue,
    required int Function(T) lastPageValue,
    required Function(T) dataToAdd,
    required Function() dataToClear,
    required Function(AppError) onError,
    bool isInitialLoad = false,
    String? search,
  }) async {
    final paginationController =
        reflectionPaginationPageController[groupsPaginationName];

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

  void setTabDataLoaded(ReflectionPagination index, bool loaded) {
    tabDataLoaded[index] = loaded;
  }

  void loadMoreData(ReflectionPagination tab) {
    if (reflectionPaginationPageController[tab]!.currentPage.value <
        reflectionPaginationPageController[tab]!.lastPage.value) {
      reflectionPaginationPageController[tab]?.currentPage.value++;

      if (tab == ReflectionPagination.library) {
        getReflectionLibrary();
      } else if (tab == ReflectionPagination.search) {
        getReflectionLibrary(isInitialLoad: true, searchReflection: true);
      } else {}
    }
  }

  //Library popup
  Future<bool?> getBulkSeeReflection(
    List<String>? reflectionId,
  ) async {
    seeBulkReflectionState.value = TheStates.loading;

    final result = await remoteSource.getBulkSeeReflection(
      reflectionId: reflectionId,
    );
    var res = result.fold(
      (l) {
        seeBulkReflectionState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);

        return false;
      },
      (r) {
        userReflectionResponse.value = r;
        print('????????????????????????????$userReflectionResponse');
        seeBulkReflectionState.value = TheStates.success;

        // Access emotions like this:

        return true;
      },
    );
    return res;
  }
  Future<bool?> deleteBulkReflection(
    List<String>? reflectionId,
  ) async {
    deleteReflectionState.value = TheStates.loading;

    final result = await remoteSource.deleteBulkReflection(
      reflectionId: reflectionId,
    );
    var res = result.fold(
      (l) {
        deleteReflectionState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);

        return false;
      },
      (r) {
        deleteReflectionState.value = TheStates.success;

        AppUtils.showSnackbar(message: r);
        return true;
      },
    );
    return res;
  }
}
