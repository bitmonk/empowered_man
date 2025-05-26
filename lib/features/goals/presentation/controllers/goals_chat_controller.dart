import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/data/model/goals_chat_model.dart';
import 'package:empowered/features/goals/data/source/goals_chat_remote_source.dart';
import 'package:empowered/features/journal_chat/data/model/message_item.dart';
import 'package:flutter_quill/quill_delta.dart' as quill;

class GoalsChatController extends GetxController {
  GoalsChatController({required this.remoteSource});

  final GoalsChatRemoteSource remoteSource;
  late TextEditingController chatController;
  late ScrollController scrollController;

  // States
  Rx<TheStates> getGoalsChatState = TheStates.initial.obs;
  Rx<TheStates> sendMessageState = TheStates.initial.obs;
  Rx<TheStates> updateMessageState = TheStates.initial.obs;

  // Flags
  RxBool isEditMode = false.obs;
  RxBool autoScrollEnabled = true.obs;
  RxBool showBeginJournalButton = false.obs;
  RxBool isSendingMessage = false.obs;
  RxBool isShowingThinking = false.obs;
  RxBool showRichTextEditor = false.obs;

  // Data
  RxString goalId = RxString('');
  RxString goalDetailId = RxString('');
  RxString title = ''.obs;
  RxnString editingAnswerId = RxnString();

  // Cancel token for API calls
  CancelToken? _cancelToken;

  // Chat data
  Rx<GoalsChatModel> goalsChatModel = const GoalsChatModel().obs;
  RxList<MessageItem> chatConversationList = RxList<MessageItem>([]);
  RxList<MessageItem> pendingMessages = RxList<MessageItem>([]);
  Rx<MessageItem?> pendingAnswer = Rx<MessageItem?>(null);

  @override
  void onInit() {
    super.onInit();
    chatController = TextEditingController();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    chatController.dispose();
    scrollController.dispose();
    _cancelToken?.cancel();
    super.onClose();
  }

  void initializeWithIds(String goalId, String goalDetailId) {
    this.goalId.value = goalId;
    this.goalDetailId.value = goalDetailId;
    getGoalsChat();
  }

  void _scrollListener() {
    if (scrollController.hasClients) {
      final position = scrollController.position;
      final maxScroll = position.maxScrollExtent;
      final currentScroll = position.pixels;

      autoScrollEnabled.value = maxScroll - currentScroll <= 100;
    }
  }

  void scrollToBottom({bool animated = true}) {
    if (scrollController.hasClients) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (animated) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent + 200,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        } else {
          scrollController
              .jumpTo(scrollController.position.maxScrollExtent + 200);
        }
      });
    }
  }

  void toggleRichTextEditor() {
    showRichTextEditor.value = !showRichTextEditor.value;
  }

  void resetEditMode() {
    isEditMode.value = false;
    editingAnswerId.value = null;
    chatController.clear();
    showRichTextEditor.value = false;
  }

  void enableEditMode(String answerId, String currentText) {
    isEditMode.value = true;
    editingAnswerId.value = answerId;
    chatController.text = currentText;
    // Don't automatically enable rich text editor in edit mode
    // User can manually enable it if needed
  }

  Future<bool> getGoalsChat() async {
    if (goalId.isEmpty || goalDetailId.isEmpty) {
      getGoalsChatState.value = TheStates.error;
      AppUtils.showErrorSnackbar(
          message: 'Goal ID or Goal Detail ID is missing');
      return false;
    }

    getGoalsChatState.value = TheStates.loading;
    showBeginJournalButton.value = false;

    try {
      final result = await remoteSource.getGoalsChat(
        goalId: goalId.value,
        goalDetailId: goalDetailId.value,
      );

      return result.fold(
        (failure) {
          getGoalsChatState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: failure.message);
          return false;
        },
        (chatModel) {
          getGoalsChatState.value = TheStates.success;
          goalsChatModel.value = chatModel;

          // Update chat conversation list
          _updateChatConversationList();

          // Check if we should show begin journal button
          showBeginJournalButton.value = _shouldShowBeginButton();

          // Clear pending messages if not currently sending
          if (!isSendingMessage.value) {
            pendingMessages.clear();
          }

          // Update title
          title.value = chatModel.data?.userGoal?.goal?.title ?? 'Goals Chat';

          scrollToBottom();
          return true;
        },
      );
    } catch (e) {
      getGoalsChatState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to load chat: $e');
      return false;
    }
  }

  void _updateChatConversationList() {
    final goals = goalsChatModel.value.data;
    chatConversationList.value = buildCompleteMessageList(goals);
  }

  bool _shouldShowBeginButton() {
    final questions = goalsChatModel.value.data?.questions;
    if (questions == null || questions.isEmpty) return false;

    return questions.first.answered == false;
  }

  Future<void> sendGoalsMessage({
    String? text,
    String? mediaPath,
    String? questionId,
    String? followupQuestionId,
  }) async {
    final messageText = text ?? chatController.text.trim();
    if (messageText.isEmpty && mediaPath == null) {
      AppUtils.showErrorSnackbar(message: 'Please enter a message');
      return;
    }

    await _processSendMessage(
      messageText: messageText,
      mediaPath: mediaPath,
      questionId: questionId,
      followupQuestionId: followupQuestionId,
    );
  }

  Future<void> sendMessageWithFormatting({
    required String text,
    quill.Delta? delta,
    String? mediaPath,
    String? questionId,
    String? followupQuestionId,
  }) async {
    if (text.trim().isEmpty && mediaPath == null) {
      AppUtils.showErrorSnackbar(message: 'Please enter a message');
      return;
    }

    await _processSendMessage(
      messageText: text.trim(),
      mediaPath: mediaPath,
      questionId: questionId,
      followupQuestionId: followupQuestionId,
      delta: delta,
    );
  }

  // In your GoalsChatController class, update the _processSendMessage method:

  Future<void> _processSendMessage({
    required String messageText,
    String? mediaPath,
    String? questionId,
    String? followupQuestionId,
    quill.Delta? delta,
  }) async {
    // Add user message to pending list
    final userMessage = MessageItem(
      type: MessageType.answer,
      message: messageText,
      timestamp: DateTime.now().toString(),
      isMine: true,
    );

    pendingMessages.add(userMessage);
    _updateChatConversationList();

    // Clear input and show thinking
    chatController.clear();
    showRichTextEditor.value = false; // Reset rich text editor
    isShowingThinking.value = true;
    isSendingMessage.value = true;
    sendMessageState.value = TheStates.loading;
    _cancelToken = CancelToken();
    autoScrollEnabled.value = true;

    scrollToBottom();

    try {
      // Get the question ID - either from parameter or determine the current question
      String? effectiveQuestionId = questionId ?? _getCurrentQuestionId();

      final result = await remoteSource.sendGoalsMessage(
        goalsChatModel.value.data?.userGoal?.id.toString() ?? '',
        _cancelToken,
        effectiveQuestionId, // Use the effective question ID
        messageText,
      );

      result.fold(
        (failure) {
          sendMessageState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: failure.message);

          // Remove pending message on error
          pendingMessages.removeWhere(
              (msg) => msg.message == messageText && msg.isMine == true);
          _updateChatConversationList();
        },
        (success) {
          sendMessageState.value = TheStates.success;

          getGoalsChat();
        },
      );
    } catch (e) {
      sendMessageState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to send message: $e');

      pendingMessages.removeWhere(
          (msg) => msg.message == messageText && msg.isMine == true);
      _updateChatConversationList();
    } finally {
      isShowingThinking.value = false;
      isSendingMessage.value = false;
    }
  }

  String? _getCurrentQuestionId() {
    final questions = goalsChatModel.value.data?.questions;
    if (questions == null || questions.isEmpty) {
      return null;
    }

    // Find the first unanswered question
    for (final question in questions) {
      if (question.answered == false || question.answered == null) {
        return question.id?.toString();
      }
    }

    return questions.last.id?.toString();
  }

  Future<void> updateGoalsAnswer(String? text) async {
    final messageText = text ?? chatController.text.trim();
    if (messageText.isEmpty) {
      AppUtils.showErrorSnackbar(message: 'Please enter a message');
      return;
    }

    if (editingAnswerId.value == null) {
      AppUtils.showErrorSnackbar(message: 'No answer selected for editing');
      return;
    }

    updateMessageState.value = TheStates.loading;
    _cancelToken = CancelToken();
    autoScrollEnabled.value = true;

    try {
      final result = await remoteSource.updateGoalsAnswer(
        _cancelToken,
        editingAnswerId.value!,
        messageText,
      );

      result.fold(
        (failure) {
          updateMessageState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: failure.message);
        },
        (success) async {
          updateMessageState.value = TheStates.success;
          resetEditMode();

          // Refresh chat data
          await getGoalsChat();

          // Small delay to ensure UI updates
          await Future.delayed(const Duration(milliseconds: 100));
          scrollToBottom();
        },
      );
    } catch (e) {
      updateMessageState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to update answer: $e');
    }
  }

  List<MessageItem> buildCompleteMessageList(Data? goals) {
    if (goals == null || goals.questions == null) {
      return [];
    }

    final items = <MessageItem>[];
    bool foundUnansweredQuestion = false;

    // Process questions and answers
    for (int i = 0; i < goals.questions!.length; i++) {
      final question = goals.questions![i];

      // Add question
      items.add(
        MessageItem(
          type: MessageType.question,
          message: question.questionText ?? '',
          timestamp: DateTime.now().toString(),
          isMine: false,
        ),
      );

      // Add answers if they exist
      if (question.answered == true && question.answer != null) {
        for (final answer in question.answer!) {
          items.add(
            MessageItem(
              type: MessageType.answer,
              message: answer.text ?? '',
              timestamp: DateTime.now().toString(),
              isMine: true,
              answerId: answer.id.toString(),
            ),
          );
        }
      } else {
        foundUnansweredQuestion = true;
      }

      // Stop if we found an unanswered question
      if (foundUnansweredQuestion) {
        break;
      }
    }

    // Add pending messages
    if (pendingMessages.isNotEmpty) {
      items.addAll(pendingMessages);
    }

    // Add thinking indicator
    if (isShowingThinking.value) {
      items.add(
        MessageItem(
          type: MessageType.question,
          message: '',
          timestamp: DateTime.now().toString(),
          isMine: false,
          isThinking: true,
        ),
      );
    }

    return items;
  }

  void cancelCurrentOperation() {
    _cancelToken?.cancel();
    isShowingThinking.value = false;
    isSendingMessage.value = false;
    sendMessageState.value = TheStates.initial;
    updateMessageState.value = TheStates.initial;

    // Clear pending messages
    pendingMessages.clear();
    _updateChatConversationList();
  }

  bool get canSendMessage =>
      !isSendingMessage.value &&
      sendMessageState.value != TheStates.loading &&
      updateMessageState.value != TheStates.loading;

  // Helper method to validate input before sending
  bool validateInput({String? text, String? mediaPath}) {
    final messageText = text ?? chatController.text.trim();
    return messageText.isNotEmpty || mediaPath != null;
  }

  // Method to clear all input fields
  void clearAllInputs() {
    chatController.clear();
    showRichTextEditor.value = false;
  }

}
