import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/data/model/chat_conversation_model.dart';
import 'package:empowered/features/journal_chat/data/source/journal_chat_remote_source.dart';
import 'package:empowered/features/journal_chat/presentation/screens/journal_chat_screen.dart';

class JournalChatController extends GetxController {
  JournalChatController({required this.remoteSource});
  final JournalChatRemoteSource remoteSource;
  RxList<String> filterList = ['All', 'Threads', 'Squads'].obs;
  RxInt selectedFilterindex = 0.obs;
  late TextEditingController chatController;
  late ScrollController scrollController;
  RxString title = 'Rage'.obs;
  Rx<ChatConversationModel> journalWithQuestionsAndAnswers =
      const ChatConversationModel().obs;
  CancelToken? _cancelToken;
  Rx<TheStates> journalChatConversationState = TheStates.initial.obs;
  Rx<String?> selectedEmotionId = Rx<String?>(null);
  RxList<MessageItem> chatConversationList = RxList<MessageItem>([]);
  RxBool autoScrollEnabled = true.obs;
  RxBool isLoading = false.obs;

  // RxList<String> _selectedMediaPaths =  RxList<String>([]);

  @override
  void onInit() {
    super.onInit();
    chatController = TextEditingController();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    journalChatConversationState.listen((state) {
      if (state == TheStates.success && autoScrollEnabled.value) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollToBottom();
        });
      }
    });
  }

  @override
  void onClose() {
    chatController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  void _scrollListener() {
    // If we're close to the bottom (within 100 pixels), enable auto-scrolling
    if (scrollController.hasClients) {
      final position = scrollController.position;
      final maxScroll = position.maxScrollExtent;
      final currentScroll = position.pixels;

      // Enable auto-scroll if user is at or near bottom
      if (maxScroll - currentScroll <= 100) {
        autoScrollEnabled.value = true;
      } else {
        // Disable auto-scroll if user manually scrolled up
        autoScrollEnabled.value = false;
      }
    }
  }

  Future<bool?> getJournalWithQuestionsAndAnswers(String id) async {
    // journalChatConversationState.value = TheStates.loading;
    final result = await remoteSource.getJournalWithQuestionsAndAnswers(id);
    var res = result.fold(
      (l) {
        journalChatConversationState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        journalChatConversationState.value = TheStates.success;
        journalWithQuestionsAndAnswers.value = r;
        scrollToBottom();
        return true;
      },
    );
    return res;
  }

  Future<void> sendMessage(
    String journalId,
    String? mediaPath,
    String? text,
    String? mainQuestionId,
    String? followupQuestionId,
  ) async {
    _cancelToken = CancelToken();
    autoScrollEnabled.value = true;

    // journalChatConversationState.value = TheStates.loading;

    try {
      final result = await remoteSource.sendMessage(
        journalId,
        mediaPath,
        _cancelToken,
        mainQuestionId,
        text ?? chatController.text.trim(),
        followupQuestionId,
      );
      await getJournalWithQuestionsAndAnswers(journalId);

      result.fold(
        (l) {
          journalChatConversationState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) async {
          // if (_shouldAutoScroll) {
          //   scrollToBottom();
          // }
          journalChatConversationState.value = TheStates.success;

          chatConversationList
            ..clear()
            ..add(
              MessageItem(
                message: chatController.text.trim(),
                isMine: true,
                timestamp: getCurrentTime(),
                type: MessageType.answer,
              ),
            );

          chatController.clear();
          await getJournalWithQuestionsAndAnswers(journalId);
          await Future.delayed(const Duration(milliseconds: 100));
          scrollToBottom();
          isLoading.value = false;
        },
      );
    } catch (e) {
      journalChatConversationState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: e.toString());
      isLoading.value = false;
    }
  }
  

  void scrollToBottom() {
    if (scrollController.hasClients) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        const extraPadding = 200.0;
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + extraPadding,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  String getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour < 12 ? 'AM' : 'PM'}";
  }
}
