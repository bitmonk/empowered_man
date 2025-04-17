import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/data/model/journal_emotion_names_model.dart';
import 'package:empowered/features/journal_chat/data/source/journal_emotion_names_remote_source.dart';

class JournalEmotionNameController extends GetxController {
  JournalEmotionNameController({required this.remoteSource});
  final JournalEmotionNamesRemoteSource remoteSource;

  Rx<JournalEmotionNamesModel> journalEmotionName =
      const JournalEmotionNamesModel().obs;
  Rx<TheStates> journalEmotionNameState = TheStates.initial.obs;
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

        // Access emotions like this:

        return true;
      },
    );
    return res;
  }
}
