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
  Rx<TheStates> getJournalLibraryState = TheStates.initial.obs;

  final Rx<String?> selectedEmotionId = Rx<String?>(null);

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

  Future<bool?> getJournalLibrary(
    int? page,
    String? emotionName,
    String? mainQuestion,
    String? sortBy,
    String? sortOrder,
    int? perPage,
  ) async {
    getJournalLibraryState.value = TheStates.loading;

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
        getJournalLibraryState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        getJournalLibraryState.value = TheStates.success;
        journalLibraryIndexModel.value = r;
        return true;
      },
    );
    return res;
  }
}
