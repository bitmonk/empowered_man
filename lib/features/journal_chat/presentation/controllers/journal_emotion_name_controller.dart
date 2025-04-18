import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/data/model/journal_emotion_names_model.dart';
import 'package:empowered/features/journal_chat/data/model/journal_library_index_model.dart';
import 'package:empowered/features/journal_chat/data/source/journal_emotion_names_remote_source.dart';

class JournalEmotionNameController extends GetxController {
  JournalEmotionNameController({required this.remoteSource});
  final JournalEmotionNamesRemoteSource remoteSource;

  Rx<JournalEmotionNamesModel> journalEmotionName =
      const JournalEmotionNamesModel().obs;
  Rx<JournalLibraryIndexModel> journalLibraryIndexModel =
      const JournalLibraryIndexModel().obs;
  Rx<TheStates> journalEmotionNameState = TheStates.initial.obs;
  final Rx<String?> selectedEmotionId = Rx<String?>(null);
  RxBool isLoading = false.obs;
  Future<bool?> getJournalEmotionName() async {
    isLoading.value = true;
    journalEmotionNameState.value = TheStates.loading;

    final result = await remoteSource.getEmotionName();
    var res = result.fold(
      (l) {
        journalEmotionNameState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        isLoading.value = false;
        return false;
      },
      (r) {
        journalEmotionNameState.value = TheStates.success;

        journalEmotionName.value = r;
        isLoading.value = false;
        // Access emotions like this:

        return true;
      },
    );
    return res;
  }

  Future<bool?> getJournalLibrary(
    int? page,
    String? emotionName,
    String? mainQuestion,
    String? sortBy,
    String? sortOrder,
    int? perPage,
  ) async {
    isLoading.value = true;
    journalEmotionNameState.value = TheStates.loading;

    final result = await remoteSource.getJournalLibrary(
      page: page,
      emotionName: emotionName,
      mainQuestion: mainQuestion,
      sortBy: sortBy,
      sortOrder: sortOrder,
      perPage: perPage,
    );
    var res = result.fold(
      (l) {
        journalEmotionNameState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        isLoading.value = false;
        return false;
      },
      (r) {
        journalEmotionNameState.value = TheStates.success;

        journalLibraryIndexModel.value = r;
 isLoading.value = false; 
        // Access emotions like this:

        return true;
      },
    );
    return res;
  }
}
