import 'package:empowered/features/journal_chat/data/source/journal_chat_remote_source.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
import 'package:get/get.dart';

class JournalChatBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => JournalChatRemoteSource(Get.find()))
      ..put(
        JournalChatController(
          remoteSource: Get.find<JournalChatRemoteSource>(),
        ),
      );
  }
}

class JournalChatInitializer {
  static void initialize() {
    Get
      ..lazyPut(() => JournalChatRemoteSource(Get.find()))
      ..put(
        JournalChatController(
          remoteSource: Get.find<JournalChatRemoteSource>(),
        ),
      );
  }

  static void destroy() {
    Get
      ..delete<JournalChatRemoteSource>()
      ..delete<JournalChatController>();
  }
}
