import 'package:empowered/features/home/data/source/reflection_journal_chat_remote_source.dart';
import 'package:empowered/features/home/presentation/controllers/reflection_journal_chat_controller.dart';
import 'package:get/get.dart';

class ReflectionJournalChatBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => ReflectionJournalChatRemoteSource(Get.find()))
      ..put(
        ReflectionJournalChatController(
          remoteSource: Get.find<ReflectionJournalChatRemoteSource>(),
        ),
      );
  }
}

class ReflectionJournalChatInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => ReflectionJournalChatRemoteSource(Get.find()))
      ..put(
        ReflectionJournalChatController(
          remoteSource: Get.find<ReflectionJournalChatRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<ReflectionJournalChatRemoteSource>()
      ..delete<ReflectionJournalChatController>();
  }
}
