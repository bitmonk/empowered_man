import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/courses/data/model/chapter_model.dart'
    as chap;
import 'package:empowered/features/courses/data/model/course_model.dart';
import 'package:empowered/features/courses/data/source/course_remote_source.dart';

class CourseController extends GetxController {
  CourseController({required this.remoteSource});
  final CourseRemoteSource remoteSource;

  final List<String> filters = ['All', 'Ongoing', 'Completed'];
  RxString selectedFilters = 'All'.obs;
  RxInt chapterProgress = 0.obs;
  TextEditingController searchController = TextEditingController();
  Map<String, List<Course>> filteredCourses = {
    'all': [],
    'ongoing': [],
    'completed': [],
  };
  final Map<String, Rx<TheStates>> filterStates = {
    'all': TheStates.initial.obs,
    'ongoing': TheStates.initial.obs,
    'completed': TheStates.initial.obs,
  };

  final Map<String, String?> errorMessages = {
    'all': null,
    'ongoing': null,
    'completed': null,
  };

  Rx<TheStates> getChapterState = TheStates.initial.obs;
  Rx<TheStates> getCoursesState = TheStates.initial.obs;
  Rx<TheStates> markChapterCompletedState = TheStates.initial.obs;
  Rx<TheStates> changeCourseStatusState = TheStates.initial.obs;

  CancelToken? _cancelToken;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx<String?> chapterError = Rx<String?>(null);
  Rx<chap.ChapterData?> selectedChapter = Rx<chap.ChapterData?>(null);
  Rx<Course?> selectedCourse = Rx<Course?>(null);
  Rx<String?> queryText = Rx<String?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchAllCourses();
  }

  @override
  void onClose() {
    _cancelToken?.cancel();
    super.onClose();
  }

  Future<void> fetchAllCourses() async {
    for (final filter in filters) {
      await getCourses(tag: filter.toLowerCase());
    }
  }

  Future<bool> getCourses({
    CancelToken? cancelToken,
    String? tag,
    String? query,
  }) async {
    final currentFilter = tag ?? selectedFilters.value.toLowerCase();
    // Ensure keys exist before setting/loading
    filterStates.putIfAbsent(currentFilter, () => TheStates.initial.obs);
    errorMessages.putIfAbsent(currentFilter, () => null);
    filteredCourses.putIfAbsent(currentFilter, () => []);
    errorMessages[currentFilter] = null; // ✅ THIS resets the error

    filterStates[currentFilter]?.value = TheStates.loading;
    _cancelToken = CancelToken();

    final result = await remoteSource.getCourses(
      query: query ?? queryText.value,
      tag: currentFilter,
      cancelToken: _cancelToken,
    );

    return result.fold(
      (l) {
        filterStates[currentFilter]?.value = TheStates.error;
        errorMessages[currentFilter] = l.message;
        // AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) async {
        filteredCourses[currentFilter] = r.data ?? [];

        filterStates[currentFilter]?.value = TheStates.success;
        return true;
      },
    );
  }

  Future<void> getChapters({
    CancelToken? cancelToken,
  }) async {
    getChapterState.value = TheStates.loading;
    _cancelToken = CancelToken();
    chapterError.value = null;
    final result = await remoteSource.getChapters(
      courseId: selectedCourse.value!.id.toString(),
      cancelToken: _cancelToken,
    );

    result.fold(
      (l) {
        getChapterState.value = TheStates.error;
        chapterError.value = l.message;
      },
      (r) async {
        selectedChapter.value = r.data;
        getChapterState.value = TheStates.success;
      },
    );
  }

  Future<bool> markChapterCompleted({
    required String courseId,
    required String chapterId,
    CancelToken? cancelToken,
  }) async {
    markChapterCompletedState.value = TheStates.loading;
    _cancelToken = CancelToken();

    final result = await remoteSource.markChapterCompleted(
      chapterId: chapterId,
      courseId: courseId,
      cancelToken: _cancelToken,
    );

    return result.fold(
      (l) {
        markChapterCompletedState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) async {
        getChapters();
        Get.back();
        AppUtils.showSnackbar(message: r);
        markChapterCompletedState.value = TheStates.success;
        return true;
      },
    );
  }

  Future<bool> changeCourseStatus({
    required String courseId,
    required String chapterId,
    CancelToken? cancelToken,
  }) async {
    changeCourseStatusState.value = TheStates.loading;
    _cancelToken = CancelToken();

    final result = await remoteSource.changeCourseStatus(
      chapterId: chapterId,
      courseId: courseId,
      cancelToken: _cancelToken,
    );

    return result.fold(
      (l) {
        changeCourseStatusState.value = TheStates.error;
        // AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) async {
        getChapters();
        // Get.back();
        // AppUtils.showSnackbar(message: r);
        changeCourseStatusState.value = TheStates.success;
        return true;
      },
    );
  }

  void cancelRequest({
    bool cancelChapterToken = false,
    bool cancelCourseToken = false,
    bool cancelMakChapterCompleteToken = false,
  }) {
    _cancelToken?.cancel();
  }
}
