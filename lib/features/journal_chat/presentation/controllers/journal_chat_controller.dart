import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/journal_chat/data/source/journal_chat_remote_source.dart';

class JournalChatController extends GetxController {
  JournalChatController({required this.remoteSource});
  final JournalChatRemoteSource remoteSource;
  RxList<String> filterList = ['All', 'Threads', 'Squads'].obs;
  RxInt selectedFilterindex = 0.obs;
  late TextEditingController chatController;
  late ScrollController scrollController;
  RxString title = 'Rage'.obs;

  RxList<ChatConversationModel> chatConversationList = [
    ChatConversationModel(
      isMine: false,
      timeStamp: '10:30 AM',
      profileImageUrl: '',
      name: '',
      message: 'How are you feeling Today?',
      dateTime: '2024-02-10 10:30:00',
    ),
    ChatConversationModel(
      isMine: true,
      timeStamp: '11:00 AM',
      profileImageUrl: '',
      name: '',
      message: 'Angry!',
      dateTime: '2024-02-10 11:00:00',
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    chatController = TextEditingController();
    scrollController = ScrollController();
  }

  @override
  void onClose() {
    chatController.dispose();
    scrollController.dispose();
  }

  void sendMessage() {
    if (chatController.text.trim().isNotEmpty) {
      chatConversationList.add(
        ChatConversationModel(
          message: chatController.text.trim(),
          isMine: true,
          timeStamp: getCurrentTime(),
          profileImageUrl: '',
          name: '',
          dateTime: '',
        ),
      );
      chatController.clear();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollToBottom();
      });
    }
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  String getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour < 12 ? 'AM' : 'PM'}";
  }
}
