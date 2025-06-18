import 'dart:async';

import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/data/model/goals_chat_model.dart';
import 'package:empowered/features/goals/data/source/goals_chat_remote_source.dart';
import 'package:empowered/features/journal_chat/data/model/message_item.dart';

class GoalsChatController extends GetxController {
  GoalsChatController({required this.remoteSource});
  final GoalsChatRemoteSource remoteSource;

  late TextEditingController chatController;
  late ScrollController scrollController;

  RxString title = 'Goals Chat'.obs;
  CancelToken? _cancelToken;
  // States
  Rx<TheStates> getGoalsChatState = TheStates.initial.obs;
  Rx<TheStates> sendMessageState = TheStates.initial.obs;
  Rx<TheStates> updateMessageState = TheStates.initial.obs;
  // Chat data
  Rx<GoalsChatModel> goalsChatModel = const GoalsChatModel().obs;
  RxList<MessageItem> chatConversationList = RxList<MessageItem>([]);
  RxList<MessageItem> pendingMessages = RxList<MessageItem>([]);
  Rx<MessageItem?> pendingAnswer = Rx<MessageItem?>(null);

  RxBool autoScrollEnabled = true.obs;
  RxBool showBeginJournallButton = false.obs;
  Timer? _scrollTimer;
  // Thinking indicator states
  RxBool isShowingThinking = false.obs;
  RxBool isSendingMessage = false.obs;
  RxBool isEditMode = false.obs;
  RxnString editingAnswerId = RxnString();
  RxBool isJustCompleted = false.obs;
  RxBool wasAlreadyCompleted = false.obs;
  RxnString initialEditText = RxnString();

  RxString goalId = RxString('');
  RxString goalDetailId = RxString('');

  @override
  void onInit() {
    super.onInit();
    chatController = TextEditingController();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    ever(goalsChatModel, (GoalsChatModel conversation) {
      if (conversation.data?.userGoal?.goalDetail?.isCompleted == true &&
          !isJustCompleted.value) {
        wasAlreadyCompleted.value = true;
      }
    });

    // getGoalsChatState.listen((state) {
    //   if (state == TheStates.success && autoScrollEnabled.value) {
    //     WidgetsBinding.instance.addPostFrameCallback((_) {
    //       scrollToBottom();
    //     });
    //   }
    // });
  }

  @override
  void onClose() {
    chatController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  void _debouncedScrollToBottom({int delay = 100}) {
    _scrollTimer?.cancel();
    _scrollTimer = Timer(Duration(milliseconds: delay), () {
      scrollToBottom();
    });
  }

  void _scrollListener() {
    if (scrollController.hasClients) {
      final position = scrollController.position;
      final maxScroll = position.maxScrollExtent;
      final currentScroll = position.pixels;

      if (maxScroll - currentScroll <= 100) {
        autoScrollEnabled.value = true;
      } else {
        autoScrollEnabled.value = false;
      }
    }
  }

  void setEditMode(bool isEdit, String answerId, {String? initialText}) {
    isEditMode.value = isEdit;
    editingAnswerId.value = answerId;
    initialEditText.value = initialText; // Store the initial text

    if (initialText != null && initialText.isNotEmpty) {
      chatController.text = initialText;
    }
  }

  void resetEditMode() {
    isEditMode.value = false;
    editingAnswerId.value = null;
    initialEditText.value = null;
    chatController.clear();
  }

  void _showThinking({String? message}) {
    isShowingThinking.value = true;
    isSendingMessage.value = true;

    if (message != null) {
      // Add the user's message to pending messages
      pendingMessages.add(
        MessageItem(
          type: MessageType.answer,
          message: message,
          timestamp: DateTime.now().toString(),
          isMine: true,
        ),
      );

      update();
    }

    _debouncedScrollToBottom();
  }

  void _hideThinking() {
    isShowingThinking.value = false;
    isSendingMessage.value = false;
    pendingAnswer.value = null;
  }

  List<MessageItem> buildCompleteMessageList(Data? goals) {
    if (goals == null || goals.questions == null) {
      return [];
    }

    var items = <MessageItem>[];
    var foundUnansweredQuestion = false;

    // Process main questions and their follow-ups
    for (var i = 0; i < goals.questions!.length; i++) {
      final question = goals.questions![i];
      var questionTimestamp = '';

      if (i > 0) {
        final previousQuestion = goals.questions![i - 1];
        if (previousQuestion.answer?.first.createdAt != null) {
          questionTimestamp =
              previousQuestion.answer?.first.createdAt.toString() ?? '';
        }
      }

      // Add main question
      items.add(
        MessageItem(
          type: MessageType.question,
          message: question.questionText ?? '',
          timestamp: i == 0 ? DateTime.now().toString() : questionTimestamp,
          isMine: false,
          questionId: question.id?.toString(),
        ),
      );

      // Add the answer if it exists
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
        // Found an unanswered main question
        foundUnansweredQuestion = true;
      }

      // Stop processing if we found an unanswered question
      if (foundUnansweredQuestion) {
        break;
      }
    }

    if (pendingMessages.isNotEmpty) {
      items.addAll(pendingMessages);
    }

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

  void initializeWithIds(String goalId, String goalDetailId) {
    this.goalId.value = goalId;
    this.goalDetailId.value = goalDetailId;
    getGoalsChat();
  }

  Future<bool> getGoalsChat() async {
    // if (goalId.isEmpty || goalDetailId.isEmpty) {
    //   getGoalsChatState.value = TheStates.error;
    //   AppUtils.showErrorSnackbar(
    //       message: 'Goal ID or Goal Detail ID is missing',);
    //   return false;
    // }

    // getGoalsChatState.value = TheStates.loading;
     showBeginJournallButton.value = false;

    try {
      final result = await remoteSource.getGoalsChat(
        goalId: goalId.value,
        goalDetailId: goalDetailId.value,
      );

      return result.fold(
        (l) {
          getGoalsChatState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
          return false;
        },
        (r) {
          getGoalsChatState.value = TheStates.success;
          final previouslyCompleted =
              goalsChatModel.value.data?.userGoal?.goalDetail?.isCompleted ??
                  false;
          goalsChatModel.value = r;
          final currentlyCompleted =
              r.data?.userGoal?.goalDetail?.isCompleted ?? false;
          if (currentlyCompleted && !previouslyCompleted) {
            // Journal just got completed
            isJustCompleted.value = true;
            wasAlreadyCompleted.value = false;
          } else if (currentlyCompleted && previouslyCompleted) {
            // Journal was already completed
            isJustCompleted.value = false;
            wasAlreadyCompleted.value = true;
          } else {
            // Journal is not completed
            isJustCompleted.value = false;
            wasAlreadyCompleted.value = false;
          }

          // if (!isSendingMessage.value) {
          //   pendingMessages.clear();
          // }

          // Update title
          title.value =
              goalsChatModel.value.data?.userGoal?.goal?.title ?? 'Goals Chat';

          if (autoScrollEnabled.value && !isSendingMessage.value) {
            _debouncedScrollToBottom();
          }
          return true;
        },
      );
    } catch (e) {
      getGoalsChatState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: 'Failed to load chat: $e');
      return false;
    }
  }

  Map<String, String?> getNextQuestionIds(Data? goals) {
    if (goals == null || goals.questions == null) {
      return {'id': null, 'goal_detail_id': null};
    }

    for (final question in goals.questions!) {
      if (question.answered != true) {
        return {
          'id': question.id?.toString(),
          'goal_detail_id': null,
        };
      }
    }

    return {'id': null, 'goal_detail_id': null};
  }

  String? _getCurrentQuestionId() {
    final questions = goalsChatModel.value.data?.questions;

    if (questions == null || questions.isEmpty) {
      print('No questions available');
      return null;
    }

    // Find the first unanswered question
    for (final question in questions) {
      if (question.answered == false || question.answered == null) {
        final questionId = question.id?.toString();
        print('Found unanswered question ID: $questionId');
        return questionId;
      }
    }

    final lastQuestionId = questions.last.id?.toString();
    print(
        'All questions answered, returning last question ID: $lastQuestionId',);
    return lastQuestionId;
  }

  Future<void> handleTextMessageSent() async {
    final messageText = chatController.text.trim();
    if (messageText.isEmpty) return;

    final goals = goalsChatModel.value.data;
    final userGoalId = goals?.userGoal?.id?.toString();
    final questionId = _getCurrentQuestionId();

    if (userGoalId == null || userGoalId.isEmpty) {
      AppUtils.showErrorSnackbar(message: 'User Goal ID is missing');
      return;
    }

    if (questionId == null || questionId.isEmpty) {
      AppUtils.showErrorSnackbar(message: 'Question ID is missing');
      return;
    }

    _showThinking(message: messageText);

    chatController.clear();

    try {
      _cancelToken = CancelToken();

      await sendMessage(userGoalId, _cancelToken!, messageText, questionId);
    } catch (e) {
      var errorMessage = 'Failed to send message';
      if (e.toString().contains('network')) {
        errorMessage = 'Network error. Please check your connection.';
      } else if (e.toString().contains('timeout')) {
        errorMessage = 'Request timeout. Please try again.';
      } else if (e.toString().contains('unauthorized')) {
        errorMessage = 'Unauthorized. Please login again.';
      }

      AppUtils.showErrorSnackbar(message: errorMessage);
      chatController.text = messageText;
    }
  }

  Future<void> sendMessage(
    String userGoalId,
    CancelToken cancelToken,
    String? text,
    String? mainQuestionId,
  ) async {
    sendMessageState.value = TheStates.loading;
    autoScrollEnabled.value = true;

    try {
      // Validate inputs
      if (userGoalId.isEmpty) {
        throw Exception('User Goal ID is required');
      }

      if (mainQuestionId == null || mainQuestionId.isEmpty) {
        throw Exception('Question ID is required');
      }

      final messageText = text ?? chatController.text.trim();
      if (messageText.isEmpty) {
        throw Exception('Message text is required');
      }

      final result = await remoteSource.sendGoalsMessage(
        userGoalId,
        cancelToken,
        mainQuestionId,
        messageText,
      );

      result.fold(
        (l) {
          sendMessageState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
          throw Exception(l.message);
        },
        (r) async {
          pendingMessages.clear();
          _hideThinking();
          await getGoalsChat();
          _debouncedScrollToBottom(delay: 300);
          sendMessageState.value = TheStates.success;
        },
      );
    } catch (e) {
      sendMessageState.value = TheStates.error;
      print('Error in sendMessage: $e');
      rethrow;
    }
  }

  void scrollToBottom() {
    if (scrollController.hasClients && autoScrollEnabled.value) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          final maxScroll = scrollController.position.maxScrollExtent;
          const extraPadding = 100.0; // Reduced padding

          scrollController.animateTo(
            maxScroll + extraPadding,
            duration: const Duration(milliseconds: 200), // Faster animation
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  String getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour < 12 ? 'AM' : 'PM'}";
  }

  Future<void> updateMessage(
    String? text,
  ) async {
    if (editingAnswerId.value == null) return;
    updateMessageState.value = TheStates.loading;
    _cancelToken = CancelToken();
    autoScrollEnabled.value = true;

    try {
      final result = await remoteSource.updateGoalsAnswer(
        _cancelToken,
        editingAnswerId.value!,
        text ?? chatController.text.trim(),
      );

      result.fold(
        (l) {
          updateMessageState.value = TheStates.error;
          AppUtils.showErrorSnackbar(message: l.message);
        },
        (r) async {
          chatController.clear();

          await getGoalsChat();
                    _debouncedScrollToBottom(delay: 200);

          updateMessageState.value = TheStates.success;
          resetEditMode();
        },
      );
    } catch (e) {
      updateMessageState.value = TheStates.error;
      AppUtils.showErrorSnackbar(message: e.toString());
    }
  }

  void navigateToJournalLibrary() {
    isJustCompleted.value = false;
    wasAlreadyCompleted.value = false;
    // Get.to(() => const ReflectionLibraryScreen());
  }
}
