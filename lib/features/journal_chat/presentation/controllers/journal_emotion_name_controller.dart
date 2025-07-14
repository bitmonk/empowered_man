import 'package:dartz/dartz.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/data/model/journal_emotion_names_model.dart';
import 'package:empowered/features/journal_chat/data/model/journal_library_index_model.dart';
import 'package:empowered/features/journal_chat/data/model/user_journals_model.dart';
import 'package:empowered/features/journal_chat/data/source/journal_emotion_names_remote_source.dart';

enum JournalPagination {
  library,
  search,
}

class JournalPaginationPageController extends GetxController {
  RxInt currentPage = 1.obs;
  RxInt lastPage = 100.obs;
  RxBool isLoadingMore = false.obs;
  RxBool isInitialLoading = false.obs;
}

class JournalEmotionNameController extends GetxController {
  JournalEmotionNameController({required this.remoteSource});
  final JournalEmotionNamesRemoteSource remoteSource;

  Rx<JournalEmotionNamesModel> journalEmotionName =
      const JournalEmotionNamesModel().obs;
  Rx<JournalLibraryIndexModel> journalLibraryIndexModel =
      const JournalLibraryIndexModel().obs;

  Rx<SeeUserJournalResponseModel> userJournalResponse =
      const SeeUserJournalResponseModel().obs;
  Rx<TheStates> journalEmotionNameState = TheStates.initial.obs;
  Rx<TheStates> deleteJournalState = TheStates.initial.obs;
  Rx<TheStates> seeBulkJournalState = TheStates.initial.obs;

  final Rx<String?> selectedEmotionId = Rx<String?>(null);

  Rx<JournalPagination> seletedJournalPagination =
      JournalPagination.library.obs;

  Rx<TheStates> getJournalLibraryState = TheStates.initial.obs;
  Rx<TheStates> getJournalLibrarySearchState = TheStates.initial.obs;

  RxMap<JournalPagination, JournalPaginationPageController>
      journalPaginationPageController =
      <JournalPagination, JournalPaginationPageController>{}.obs;

  bool hasMorePages(JournalPagination tab) =>
      journalPaginationPageController[tab]!.currentPage.value <
      journalPaginationPageController[tab]!.lastPage.value;

  Map<JournalPagination, ScrollController> scrollControllers =
      {}; // Keep separate scroll controllers for each tab
  RxMap<JournalPagination, bool> tabDataLoaded =
      <JournalPagination, bool>{}.obs;

  RxList<UserJournal> journalLibraryList = <UserJournal>[].obs;
  RxList<UserJournal> journalSearchList = <UserJournal>[].obs;
  RxList<bool> selectBulk = <bool>[].obs;
  RxList<bool> selectSeaarchBulk = <bool>[].obs;
  Rx<String?> searchError = Rx<String?>(null);
  Rx<String?> libraryError = Rx<String?>(null);
  Rx<String?> selectedEmotion = Rx<String?>(null);
  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      for (final e in JournalPagination.values) {
        if (!journalPaginationPageController.containsKey(e)) {
          journalPaginationPageController[e] =
              JournalPaginationPageController();
        }
      }
    });
    for (final controller in JournalPagination.values) {
      getScrollController(controller);
    }
  }

  @override
  void onClose() {
    for (final controller in scrollControllers.values) {
      controller.dispose();
    }
    super.onClose();
  }

  void refreshData() {
    if (!journalPaginationPageController
        .containsKey(seletedJournalPagination.value)) {
      journalPaginationPageController[seletedJournalPagination.value] =
          JournalPaginationPageController();
    }

    switch (seletedJournalPagination.value) {
      case JournalPagination.library:
        if (!tabDataLoaded.containsKey(JournalPagination.library) ||
            !tabDataLoaded[JournalPagination.library]!) {
          getJournalLibrary(isInitialLoad: true);
        }
      case JournalPagination.search:
        if (!tabDataLoaded.containsKey(JournalPagination.search) ||
            !tabDataLoaded[JournalPagination.search]!) {
          getJournalLibrary(isInitialLoad: true, searchJournal: true);
        }
    }
  }

  ScrollController getScrollController(JournalPagination index) {
    if (!scrollControllers.containsKey(index)) {
      scrollControllers[index] = ScrollController();
    }
    return scrollControllers[index]!;
  }

  Future<bool?> getJournalEmotionName() async {
    journalEmotionNameState.value = TheStates.loading;

    final result = await remoteSource.getEmotionName();
    var res = result.fold(
      (l) {
        journalEmotionNameState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        journalEmotionNameState.value = TheStates.success;
        journalEmotionName.value = r;
        return true;
      },
    );
    return res;
  }

  Future<void> getJournalLibrary({
    String? emotionName,
    String? mainQuestion,
    String? sortBy,
    String? sortOrder,
    bool searchJournal = false,
    bool isInitialLoad = false,
  }) async {
    await getPaginatedData(
      state:
          searchJournal ? getJournalLibrarySearchState : getJournalLibraryState,
      groupsPaginationName:
          searchJournal ? JournalPagination.search : JournalPagination.library,
      apiCall: (pageKey, search) => remoteSource.getJournalLibrary(
        page: pageKey,
        emotionName: emotionName,
        mainQuestion: mainQuestion,
        sortBy: sortBy,
        sortOrder: sortOrder,
        perPage: 20,
      ),
      dataToClear: () {
        if (searchJournal) {
          journalLibraryList.clear();
          selectSeaarchBulk.clear();
        } else {
          journalLibraryList.clear();
          selectBulk.clear();
        }
      },
      onError: (r) {
        if (searchJournal) {
          searchError.value = r.message;
        } else {
          libraryError.value = r.message;
        }
      },
      dataToAdd: (res) {
        if (searchJournal) {
          journalSearchList
            ..clear()
            ..addAll(res.data?.userJournals ?? []);
          selectSeaarchBulk.value = List.generate(
            journalSearchList.length,
            (index) => false,
          );
        } else {
          journalLibraryList
            ..clear()
            ..addAll(res.data?.userJournals ?? []);
          selectBulk.value = List.generate(
            journalLibraryList.length,
            (index) => false,
          );
        }
      },
      isInitialLoad: isInitialLoad,
      currentPageValue: (res) => res.data?.meta?.currentPage ?? 1,
      lastPageValue: (res) => res.data?.meta?.lastPage ?? 100,
    );
  }

  Future<bool?> getSeeJournal(
    String? journalId,
  ) async {
    journalEmotionNameState.value = TheStates.loading;

    final result = await remoteSource.getSeeJournal(
      journalId: journalId,
    );
    var res = result.fold(
      (l) {
        journalEmotionNameState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);

        return false;
      },
      (r) {
        journalEmotionNameState.value = TheStates.success;
        userJournalResponse.value = r;

        return true;
      },
    );
    return res;
  }

  Future<bool?> getBulkSeeJournal(
    List<String>? journalId,
  ) async {
    seeBulkJournalState.value = TheStates.loading;

    final result = await remoteSource.getBulkSeeJournal(
      journalId: journalId,
    );
    var res = result.fold(
      (l) {
        seeBulkJournalState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);

        return false;
      },
      (r) {
        userJournalResponse.value = r;
        seeBulkJournalState.value = TheStates.success;

        // Access emotions like this:

        return true;
      },
    );
    return res;
  }

  Future<bool?> deleteJournal(
    String? journalId,
  ) async {
    deleteJournalState.value = TheStates.loading;

    final result = await remoteSource.deleteJournal(
      journalId: journalId,
    );
    var res = result.fold(
      (l) {
        deleteJournalState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);

        return false;
      },
      (r) {
        deleteJournalState.value = TheStates.success;

        AppUtils.showSnackbar(message: r);
        return true;
      },
    );
    return res;
  }

  Future<bool?> deleteBulkJournal(
    List<String>? journalId,
  ) async {
    deleteJournalState.value = TheStates.loading;

    final result = await remoteSource.deleteBulkJournal(
      journalId: journalId,
    );
    var res = result.fold(
      (l) {
        deleteJournalState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);

        return false;
      },
      (r) {
        deleteJournalState.value = TheStates.success;

        AppUtils.showSnackbar(message: r);
        return true;
      },
    );
    return res;
  }

  void setTabDataLoaded(JournalPagination index, bool loaded) {
    tabDataLoaded[index] = loaded;
  }

  // Reset pagination data when switching between tabs
  void resetPaginationData() {
    journalPaginationPageController[seletedJournalPagination.value]
        ?.currentPage
        .value = 1;
    journalPaginationPageController[seletedJournalPagination.value]
        ?.lastPage
        .value = 100;
    journalPaginationPageController[seletedJournalPagination.value]
        ?.isLoadingMore
        .value = false;
    journalPaginationPageController[seletedJournalPagination.value]
        ?.isInitialLoading
        .value = true;
    setTabDataLoaded(seletedJournalPagination.value, false);
  }

  Future<void> getPaginatedData<T>({
    required Rx<TheStates> state,
    required Future<Either<AppError, T>> Function(int? pageKey, String? search)
        apiCall,
    required JournalPagination groupsPaginationName,
    required int Function(T) currentPageValue,
    required int Function(T) lastPageValue,
    required Function(T) dataToAdd,
    required Function() dataToClear,
    required Function(AppError) onError,
    bool isInitialLoad = false,
    String? search,
  }) async {
    final paginationController =
        journalPaginationPageController[groupsPaginationName];

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

  void loadMoreData(JournalPagination tab) {
    if (journalPaginationPageController[tab]!.currentPage.value <
        journalPaginationPageController[tab]!.lastPage.value) {
      journalPaginationPageController[tab]?.currentPage.value++;

      if (tab == JournalPagination.library) {
        getJournalLibrary();
      } else if (tab == JournalPagination.search) {
        getJournalLibrary(isInitialLoad: true, searchJournal: true);
      } else {}
    }
  }
}
