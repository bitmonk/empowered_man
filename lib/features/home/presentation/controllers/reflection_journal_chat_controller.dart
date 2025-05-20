import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/data/model/reflection_question_answer_model.dart';
import 'package:empowered/features/home/data/source/reflection_journal_chat_remote_source.dart';
import 'package:empowered/features/journal_chat/data/model/message_item.dart';

class ReflectionJournalChatController extends GetxController {
  ReflectionJournalChatController({required this.remoteSource});
  ReflectionJournalChatRemoteSource remoteSource;

  Rx<ReflectionQuestionAnswerModel> reflectionQuestionAnswerResponse =
      const ReflectionQuestionAnswerModel().obs;
  Rx<TheStates> reflectionQuestionAnswerResponseState = TheStates.initial.obs;
  Rx<TheStates> sendMessageState = TheStates.initial.obs;
  Rx<TheStates> updateMessageState = TheStates.initial.obs;

  CancelToken? _cancelToken;
  RxBool autoScrollEnabled = true.obs;
  late TextEditingController chatController;
  late ScrollController scrollController;
  RxList<MessageItem> chatConversationList = RxList<MessageItem>([]);
  bool _isEditMode = false;
  String? _editingAnswerId;

  @override
  void onInit() {
    super.onInit();
    chatController = TextEditingController();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    reflectionQuestionAnswerResponseState.listen((state) {
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

  Future<bool?> getReflectionWithQuestionAnswers(String reflectionType) async {
    final result = await remoteSource.getReflectionWithQuestionAnswers(
      reflectionType: reflectionType,
    );
    var res = result.fold(
      (l) {
        reflectionQuestionAnswerResponseState.value = TheStates.error;
        AppUtils.showErrorSnackbar(message: l.message);
        return false;
      },
      (r) {
        reflectionQuestionAnswerResponseState.value = TheStates.success;
        reflectionQuestionAnswerResponse.value = r;
        scrollToBottom();
        return true;
      },
    );
    return res;
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
      String period = DateTime.now().hour < 12 ? "am" : "pm";
      await getReflectionWithQuestionAnswers(period);
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
          await getReflectionWithQuestionAnswers(period);
          await Future.delayed(const Duration(milliseconds: 100));
          scrollToBottom();

          sendMessageState.value = TheStates.success;
        },
      );
    } catch (e) {
      reflectionQuestionAnswerResponseState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: e.toString());
    }
  }

  void setEditMode(bool isEdit, String answerId) {
    _isEditMode = isEdit;
    _editingAnswerId = answerId;
  }

  bool get isEditMode => _isEditMode;
  String? get editingAnswerId => _editingAnswerId;

  void resetEditMode() {
    _isEditMode = false;
    _editingAnswerId = null;
    chatController.clear();
  }

  Future<void> updateMessage(
    String answerId,
    String? text,
  ) async {
    updateMessageState.value = TheStates.loading;
    _cancelToken = CancelToken();
    autoScrollEnabled.value = true;

    try {
      final result = await remoteSource.updateMessage(
        _cancelToken,
        _editingAnswerId ?? '',
        text ?? chatController.text.trim(),
      );
      String period = DateTime.now().hour < 12 ? "am" : "pm";
      await getReflectionWithQuestionAnswers(period);
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
          await getReflectionWithQuestionAnswers(period);
          await Future.delayed(const Duration(milliseconds: 100));
          scrollToBottom();

          updateMessageState.value = TheStates.success;
        },
      );
    } catch (e) {
      reflectionQuestionAnswerResponseState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: e.toString());
    }
  }

  String getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour < 12 ? 'AM' : 'PM'}";
  }
}
