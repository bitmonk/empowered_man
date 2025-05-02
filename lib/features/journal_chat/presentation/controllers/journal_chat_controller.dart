import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/data/model/chat_conversation_model.dart';
import 'package:empowered/features/journal_chat/data/model/journal_emotion_names_model.dart';
import 'package:empowered/features/journal_chat/data/model/message_item.dart';
import 'package:empowered/features/journal_chat/data/source/journal_chat_remote_source.dart';

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
  Rx<TheStates> sendMessageState = TheStates.initial.obs;
  Rx<EmotionName?> selectedEmotion = Rx<EmotionName?>(null);
  RxList<MessageItem> chatConversationList = RxList<MessageItem>([]);
  RxBool autoScrollEnabled = true.obs;

  RxBool showBeginJournallButton = false.obs;
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

  Future<bool?> getJournalWithQuestionsAndAnswers() async {
    // journalChatConversationState.value = TheStates.loading;
    showBeginJournallButton.value = false;
    final result = await remoteSource.getJournalWithQuestionsAndAnswers(
      selectedEmotion.value!.id.toString(),
    );
    var res = result.fold(
      (l) {
        journalChatConversationState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        journalChatConversationState.value = TheStates.success;
        journalWithQuestionsAndAnswers.value = r;
        showBeginJournallButton.value = journalWithQuestionsAndAnswers
                .value.data?.journal?.mainQuestions?[0].answered ==
            false;
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
    sendMessageState.value = TheStates.loading;
    _cancelToken = CancelToken();
    autoScrollEnabled.value = true;

    try {
      final result = await remoteSource.sendMessage(
        journalId,
        mediaPath,
        _cancelToken,
        mainQuestionId,
        text ?? chatController.text.trim(),
        followupQuestionId,
      );
      await getJournalWithQuestionsAndAnswers();

      result.fold(
        (l) {
          sendMessageState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) async {
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
          await getJournalWithQuestionsAndAnswers();
          await Future.delayed(const Duration(milliseconds: 100));
          scrollToBottom();

          sendMessageState.value = TheStates.success;
        },
      );
    } catch (e) {
      journalChatConversationState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: e.toString());
    }
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        const extraPadding = 200.0;
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + extraPadding,
          duration: const Duration(milliseconds: 1),
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
