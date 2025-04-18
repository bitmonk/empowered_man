import 'package:empowered/features/journal_chat/data/source/journal_emotion_names_remote_source.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_emotion_name_controller.dart';
import 'package:get/get.dart';

class JournalEmotionNameBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => JournalEmotionNamesRemoteSource(Get.find()))
      ..put(
        JournalEmotionNameController(
          remoteSource: Get.find<JournalEmotionNamesRemoteSource>(),
        ),
      );
  }
}

class JournalEmotionNameInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => JournalEmotionNamesRemoteSource(Get.find()))
      ..put(
        JournalEmotionNameController(
          remoteSource: Get.find<JournalEmotionNamesRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<JournalEmotionNamesRemoteSource>()
      ..delete<JournalEmotionNameController>();
  }
}
